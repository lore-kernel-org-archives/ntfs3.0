Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945427;
	b=VUaC4tzVBIRp9E60BP6KFhiWtUrF4iO6r5O80JgfySz7K09dZCmnEdr66Itxm6Vf0dtk
	 3lKBCkSP1FSYMigNATcsBtvr7wwqEA2jlSQJiXdQ6tnAQ1fBile91ffLkkxelFK+CStZH
	 qhFeGz2wnbvD81boxC4xpByrtCf7ReH9SzXfdXB1LRjxnrEgczesqqJWWFyZk9RI6MuGz
	 KR91oT75MeLHCEKFC8bFuo1+KwEWbCyn5A6uOaAzujj/SpfeLr6WgIWPqd7eIMcBLBwvF
	 Ai1ExWTIdx2KCJkYYXTADj7WaMIEwosopoMB5bfh2F4oALk61WGiR3++cvZTT7+KwCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=d+AcYVf8reTWXFlWM/d+zw4B23JCw+ulbjBtfDhJI3w=;
	b=xG6bJlp09PM+otr1DkkjYQiQKt8Av/jHGlrVfDCyz2RUnf9KrBdDkKLrb9c1itD5S+zB
	 hE4bFZMs5GDBVQ4urx99z8IKLwqt3kF3gRC3g4ZejTGuqX1N5erqwIyGbvyLrzrtGTByf
	 fX2xeKdXOzMyHWkgnGWjvK9mlLj1sHCNcvv9hyIHV4uRmPqMhX5zZbSadrz5VYGulCRSZ
	 E5DD79C3hKn8V05Cmrixc8ZUstNJf2F1JeHwd4V4jvuK80kTWsbVkVW6HkSkv1NUghHGg
	 jvZSCyunXn3HcrUO5ffruaZ2BvhZjudtRNRlaYNPHu+k0sryjMWEsxkRk73iIxMfwoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tpTttJMc;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5099A606A32C
	for <ntfs3@lists.linux.dev>; Fri,  6 Nov 2026 06:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5099A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tpTttJMc
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36ff9c9da34so150186eec.1
        for <ntfs3@lists.linux.dev>; Thu, 05 Nov 2026 22:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945426; x=1794550226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+AcYVf8reTWXFlWM/d+zw4B23JCw+ulbjBtfDhJI3w=;
        b=tpTttJMcNeD0ecNwxZjcXJtOj13pAZSbAw3U4SK2pW57adau9byyiIEp6Y+wdHN9FJ
         ZiiVSMFtAzzJXpf8nBd2b60XX5vWynp1krXxmq4qDCW2vLKqx87aA4x/DxyZUiKJHXQK
         Mi0XfrXr5GvP2snPYMxAP76LAPFdfxruCTCfCmHIMSSbUh50kZRs1ddK/WhU8Znj/SfQ
         g08LkGoHfmWj/Gd42rMV73m2+lQexn0rh5vlUIvLuHlt2HlhSXnUfF2ZYZS5eGBhq4in
         pzx8I5dyAp7jjVBZ1nX0fGTEcdJrlEO3RPAP2npjLDNK0qHUSQrEf6OIKDB8priQXBmR
         EBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945426; x=1794550226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+AcYVf8reTWXFlWM/d+zw4B23JCw+ulbjBtfDhJI3w=;
        b=z4MO+jEdmqvNGQ2R+DE7ClEFBtJ/wCGiZrQ8VYIcoDKUyjOuaz1j0Mqb2LckeMWTUI
         GzJsSzpdroFP+8PGfk4kTTiMXgmYDp+/74ON68vn5oSV3wKy4zfEJr61dW4sUDzIcO6t
         7UHqxM+tydtwEj4+Jfd1w13aPJRhjTTXlFa/SCz6w0LKkg2tysIca0s8/b/4a8gjX9ns
         WK5bmC5Desa7ALdK6scA4obi+VdeuHC+aPurs+R0zZQPQD7oxwS/Co26LALWp6iFp06p
         hgFfmdcuNgP1yPjY3Rtf1ndMyVRYAgeo0itCdQiuVIJ5yq0UDcsdDzXIsiXpodhvvOLJ
         Dpvw==
X-Gm-Message-State: APuU4Z+m+wXywx/GhhelpufSieZHWiZpWkMzuMpVbQUJXVOW6kEkoOUs
	mP55VkGFhXwfV0GutR2Cs9P5TPCLiSYGYsPM4tpLkIb3V3bN5eMUp6qcBZc0/22EdKXztg==
X-Gm-Gg: AYBFou1yTQK6ayDM4xf0GcJeVT1OUp4zFkwB4zJ1hYMQ6xzXHhEPrbRa2mFj1Iwmneh
	3Ejx0IDuM6lRAPB5foT6jZhWO0SSgHEk200c/agwiIWbs4Sf21HtBwUxKbjqbjggSL+Il3Bl6TB
	xOg9HlC6LTcuNavjZSDMxZMUHzKEck65tSLPIOPY4jLVdnH/qgJTdvRN6Vn6dWD8KYPFybkSmZ6
	N73NtD+1oZT+G59hc+P04jtamxMbQ4KwT17/I5AoI+BaSeoXN4LfI4hao4tavnsbSX6UQgluqP+
	CADewNbjxtsq7YbPkxoYxFxhIaa/TNQAAVy1Il7V6q7dgBA5DfXg3Wsh2er358WrtVpKErp//Ni
	SWgnZStnPZ/gMrumoHWKnC/aQG8ssWYEmSHJrGMokA/3/f7T7VCpCWIbB6i2y08Mf/mcvLKNhKC
	fkBZOtghccWO/WUN5zf33H1kc9Ptv6jNcZMHdj7/699zyIDRJ8lUTKPbz2L29rPBO7aTPZGP1W6
	V8ulGp3aiZRj2G4T44Jzpa82aGxNvfv77Z/cAzc5lmbxFcZXHP/x/WpbWaEePZNyNttHt5TN5vb
	LZxLqyD0bGQAcLUPtYrfah8o4As49Yu6wDWxB7CAtkvhQoKF/Ef2AA9GPcYE5bagVg==
X-Received: by 2002:a05:7300:c8c2:b0:36e:b3e6:ebe7 with SMTP id 5a478bee46e88-36f76326a0emr1961423eec.26.1793945426214;
        Thu, 05 Nov 2026 22:10:26 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm3160531eec.1.2026.11.05.22.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:10:24 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix endless readdir loop on a directory without a $BITMAP
Date: Fri,  6 Nov 2026 11:40:04 +0530
Message-ID: <20261106061004.2338569-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_readdir() saves ctx->pos in "pos" before it emits "." and "..".
If indx_used_bit() returns -ENOENT, the exit path puts that stale value
back into ctx->pos and returns 0, although the dot entries were already
copied to user space. The next getdents64() call starts at the same
position and emits them again, so a reader of the directory never sees
the end of it. ls, find and rm -r spin forever.

indx_used_bit() returns -ENOENT when the directory has no $BITMAP
attribute named $I30. That is a damaged directory, but it simply means
that no index block is in use, and indx_find_sort() already treats it
that way. Do the same in ntfs_readdir() and end the enumeration.

Reproduced under KASAN with a crafted image: changing the first
character of the $I30 name of the $BITMAP attribute in the root
directory's MFT record is enough.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs3/dir.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index 7ee1a5d4189e..dafd309e136d 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -584,6 +584,11 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 	for (; bit < max_bit; bit += 1) {
 		/* Get the next used index. */
 		err = indx_used_bit(&ni->dir, ni, &bit);
+		if (err == -ENOENT) {
+			/* No $BITMAP, so no used indexes. End of dir. */
+			err = 0;
+			break;
+		}
 		if (err)
 			goto out;
 
-- 
2.56.0

