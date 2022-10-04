Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BF57B
	for <ntfs3@lists.linux.dev>; Tue,  4 Oct 2022 03:16:45 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 129so11551237pgc.5
        for <ntfs3@lists.linux.dev>; Mon, 03 Oct 2022 20:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Flg3/SpxZ4nlW0rldGn9nsAn/YMX4bI0O25ZeoXC7Ig=;
        b=ctblUqYuosqB1quvT3Bznf0Bk3tuq0qXvibeg4/bptRlCh2Y3wcYoeB8YaviOCSfrX
         mHLBG4QygPS4VQ3GVdIIF19qv62BE320QvDB6QMzmNZsGCqRN3/apITFrxWSANT9Lrum
         hFoM9n5NnCm9XgZB2AUZIAelG6AX4MPvKsdD/2Z/v3bs1DdZSexsi3HExGMqu/6HqEvF
         b3It2bOzeW8Pzjp6kHEldbRIkrRE1rL6l16DixN/daHAdZo8Px0RP6au1IkL54l/3Cv/
         czKo9QmRkjh7cakDPAts4TkKKuSHAjoCSlp7DyjlTxNfEt4c3xx5wz/QvxEbzfhxj7a7
         3KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Flg3/SpxZ4nlW0rldGn9nsAn/YMX4bI0O25ZeoXC7Ig=;
        b=M2vXNvLVWfyGuh8ANAIhoTIC61wRYftM3ANbXIw2vHhYxLNVRU0VTp3uIW3IVdqdzU
         xI5LRcduZK1e1UV8VjV64+LHncqBLgFjMo7Gspzo4DOCM6BkfZIUsXvMamPGhal78LlY
         YUGj7uNlnyR+HQIwV0Bj9PZahXQome7vWQwtQYJ2fp0KAlMSXr2NRhIvV0R2XVQqzxF/
         GeOJprpI3NwSZ6u0GmQT3n4rjzDG+LPQHEDto+MRxf1fJtOqfQyah3BmC3igQF/UsXOK
         xWg/6v+umyGMYK80yJW4oR/JixJrSwozW3K4mVaSyvfIHwzTc10BjUaI0zsSp7CoXIj3
         EBeQ==
X-Gm-Message-State: ACrzQf0I8jEobWDHbdlT+x857UBZ+iqXb1LjqMd+bfhiVWdgkTvwbjvg
	KRrz5TPk5c0vy9cGaIs+8Hc=
X-Google-Smtp-Source: AMsMyM6ihKXmuoIzYH2AKcrJ/ujeBN/lJxh6ggAJBg3SJOS718b0OtaKU0DMRJLYCNDSxjMdEl6uwg==
X-Received: by 2002:a65:6a12:0:b0:445:84f6:676a with SMTP id m18-20020a656a12000000b0044584f6676amr12807775pgu.40.1664853404600;
        Mon, 03 Oct 2022 20:16:44 -0700 (PDT)
Received: from localhost.localdomain ([171.78.165.127])
        by smtp.googlemail.com with ESMTPSA id w8-20020a63f508000000b0043b565cb57csm7609408pgh.73.2022.10.03.20.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 20:16:44 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abdun Nihaal <abdun.nihaal@gmail.com>,
	syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com
Subject: [PATCH] fs/ntfs3: Validate attribute data and valid sizes
Date: Tue,  4 Oct 2022 08:45:02 +0530
Message-Id: <20221004031502.20007-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <000000000000c2333105e9cc7b1c@google.com>
References: <000000000000c2333105e9cc7b1c@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The data_size and valid_size fields of non resident attributes should be
less than the its alloc_size field, but this is not checked in
ntfs_read_mft function.

Syzbot reports a allocation order warning due to a large unchecked value
of data_size getting assigned to inode->i_size which is then passed to
kcalloc.

Add sanity check for ensuring that the data_size and valid_size fields
are not larger than alloc_size field.

Link: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963
Reported-and-tested-by: syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com
Fixes: (82cae269cfa95) fs/ntfs3: Add initialization of super block
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 fs/ntfs3/inode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index e9cf00d14733..9c244029be75 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -132,6 +132,13 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 	if (le16_to_cpu(attr->name_off) + attr->name_len > asize)
 		goto out;
 
+	if (attr->non_res) {
+		t64 = le64_to_cpu(attr->nres.alloc_size);
+		if (le64_to_cpu(attr->nres.data_size) > t64 ||
+		    le64_to_cpu(attr->nres.valid_size) > t64)
+			goto out;
+	}
+
 	switch (attr->type) {
 	case ATTR_STD:
 		if (attr->non_res ||
-- 
2.37.3

