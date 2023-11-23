Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20DB1388
	for <ntfs3@lists.linux.dev>; Thu, 23 Nov 2023 01:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Stgsm0Iq"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28039ee1587so309502a91.2
        for <ntfs3@lists.linux.dev>; Wed, 22 Nov 2023 17:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700701543; x=1701306343; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VoW55hPC6Xaj+bXoBqE+2ZC1QXRhQxU8y7azqOcOlv4=;
        b=Stgsm0Iq3TKttCFbQJ8JgjOLbUnnP3UrtvWRFcCyEfbH3Ew9z1dRf+BOMAo5ziQquW
         rhl2HE8kVOjV5VvkKl6zp+sAren5+q9fvgWCzpAnla12Fbna7scRyjdEwSiB1lIY15n4
         q7IBi0ekS1spmriVhzKzpft4s7H840CJrcE2l4D/Nc/FE5FiUmdkwCnhmiJhwvsesF6i
         x9Z8NqUh2YI6mB7xCVE2lXVLFdYgjyQblbeY9vOyupSiSQFzO2BmuV92/+XDVbx/9ZXq
         O7rwd/9b0/PxOZGF5Z3+eenU8amvh2imkrWxiD6FdN/N4F/D7YaPgVkyx9zaw0nNswgG
         vQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700701543; x=1701306343;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VoW55hPC6Xaj+bXoBqE+2ZC1QXRhQxU8y7azqOcOlv4=;
        b=INs4k2EPFAYLJcQqHvkgy+/KPF4rv+A9p7QX2TaikVyVGD2ZYiZoJWtZGf6kUO8iTO
         FV7cHMOPQMoAk74oII6Rs7DD07u7WQq7+NsRi8N9z1W9FVn7vBybLFzdy4BztW99Vi76
         5MH2XuZhuRBh1Halu87G2ncPS+6oveqS+EYprpHXA0qW/GKLLT/7W3fBws0etCt/MOIC
         jyEaY18vmMnswC+yugu3N0b8o4R2/HBcVKn3d8N4eg94jrZCXGB30I8sREpjTHD92bNl
         H/N+eot97ctCmbihjBO/wmHRUvshG7nPnnDPoMLBSfobAYbch6UH52KGQxB2UmVCLVgC
         ZUPg==
X-Gm-Message-State: AOJu0YxXT5XPOuKdlFwAQptk0XYZKZOowJQwJ9SeKezQyzlXkfNMLJ2h
	7CJmIIWOBbf3YFIM7pwMna1nhEMCk7tM9sn/Ca7TMt+cdtI=
X-Google-Smtp-Source: AGHT+IEpv/JCL4LpneYjN8bB6/vvy+2rePoh9BmwZRyZrFnTv3tms0veVJKfAYbbMz8I3Uuhihcyw0Q2HOHAsgLRiRw=
X-Received: by 2002:a17:90b:2245:b0:285:3482:5cb8 with SMTP id
 hk5-20020a17090b224500b0028534825cb8mr3785592pjb.4.1700701542021; Wed, 22 Nov
 2023 17:05:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gabriel Marcano <gem5597@gmail.com>
Date: Wed, 22 Nov 2023 17:05:31 -0800
Message-ID: <CANVH8qL=r2H_26EjLvrbBj=TBqG_M6yXBerrpWY=dPcjLSKnNA@mail.gmail.com>
Subject: [BUG] ntfs3: Multiple ntfs_readdir calls with unlinks in between fail
 to list all elements in directory
To: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I think I've stumbled upon the bug described here:
   https://bugzilla.kernel.org/show_bug.cgi?id=217035

I've also added my own findings to it. I'll include them here as well.

When using `opendir` and `readdir` from userland, when a folder has more than
1024 entries it looks like glibc only asks for 1024 entries from the kernel at
a time via `getdents64` on my machine. It then makes a second call upon the
second `readdir` userland call to fetch the remaining files. This works fine if
nothing happens to the directory between calls. However, if all files returned
by the first `readdir` call are deleted/unlinked before the second `readdir`
call is made, the second `readdir` call returns nothing, which is wrong as
there are still files in the directory!

Specifically, if I make a directory with 1024 files, the first readdir call
returns 1024 entries including '.' and '..'. If I delete the 1022 actual files,
then call `readdir` again to fetch the last two files to delete them, the
kernel returns nothing.

I was able to build a VM and debug the kernel. On the second call to
`ntfs_readdir`, in the `ntfs_read_hdr` helper function, I noticed that we never
got past this check in fs/ntfs3/dir.c:346 :

       /* Skip already enumerated. */
       if (vbo + off < pos)
               continue;


On the final iteration of the containing loop, the loop is broken by
fs/ntfs3/dir.c:343 :

       if (de_is_last(e))
               return 0;

Which is checking if the entry is the last one in the header (I think?).

My interpretation of what's going on is as follows:

1. first ntfs_readdir call returns 1024 elements (including . and ..), with
   ctx->pos == 199328
2. we delete all 1022 actual files from userland (and not . and ..)
3. when ntfs_readdir is called again, ctx->pos is still 199328 as expected,
   but due to all of the deletions, it looks like the position of the last 2
   files in the header have moved somehow? I haven't been able to figure out
   how unlinking changes the inodes. This causes the ntfs_read_hdr code to
   skip all entries as the check hits the end flag before getting to the
   "current" position.

If this is actually the problem, I'm not sure how to go about fixing it yet as
I'm not at all versed in NTFS. EXT4 does a check to see if the underlying
directory structure has changed between readdir calls, but they check the inode
version to confirm if there's been a change. I don't yet know if there's a
similar thing we can do in NTFS. The way btrfs seems to do it is that the
entries are strictly assigned increasing offsets values (doesn't seem to be a
physical position). The issue with NTFS seems to be that they're tied to a
physical location in some NTFS structure. ntfs-3g dances around the issue by
letting FUSE deal with the ctx->pos aspect at the kernel level. I'm not sure how
vfat gets around the issue, but they don't have this bug.

The steps to reproduce the problem are pretty easy-- this comment in the kernel
bugzilla makes it trivial:
https://bugzilla.kernel.org/show_bug.cgi?id=217035#c4

And I'm also including the source code for my crappy C++ program that gets the
directory info from the kernel (through glibc), and reports "count: 1022" on
ntfs3, while if I reproduce the test setup from the comment above on my btrfs
root, or in a vfat filesystem, I get "count: 1024" and all files are deleted
properly.

Gabriel Marcano

--

#include <stdio.h>
#include <sys/types.h>
#include <dirent.h>

#include <vector>
#include <iostream>
#include <filesystem>

int main()
{
   DIR *dp;
   struct dirent *ep;
   dp = opendir("/mnt/foo/bar/");
   std::vector<std::string> names;
   while ((ep = readdir(dp)) != NULL)
   {
       if (ep->d_name[0] != '.')
       {
           names.emplace_back(ep->d_name);
           //if (names.size() < 10000)
           {
               std::filesystem::remove(
                   std::filesystem::path("/mnt/foo/bar") / ep->d_name);
           }
       }
   }
   std::cout << "count: " << names.size() << std::endl;
   return 0;
}

--
