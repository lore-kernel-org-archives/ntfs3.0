Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18E82589
	for <ntfs3@lists.linux.dev>; Tue, 23 Aug 2022 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661265993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u6WCJy76wyGRQ/+mlD3iaHvNl3EBMPU7sOD/gN0Mivg=;
	b=YRh1UlgyvIV2sixt9XzLh02PB7+bxen4MJZqhpfSGvdVDZ3Yc5AipH5Jyl7Cd3abdWNDBe
	MeOA0EYSSWtpbUA3WV2GAcKKVxNYjaBNTe18IKw2YjS1zfXAgdYiqiysUb2tthRAGyinI8
	HB0n0oj/7hi3wLkj9lzryB+Wzep4F8o=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-303-EHIiMQTJMJ6ouzqes7D_Xw-1; Tue, 23 Aug 2022 10:46:32 -0400
X-MC-Unique: EHIiMQTJMJ6ouzqes7D_Xw-1
Received: by mail-pj1-f72.google.com with SMTP id n30-20020a17090a5aa100b001fb0c492d5eso4124128pji.3
        for <ntfs3@lists.linux.dev>; Tue, 23 Aug 2022 07:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=u6WCJy76wyGRQ/+mlD3iaHvNl3EBMPU7sOD/gN0Mivg=;
        b=wJSKcwvOpthNsC6Y54Yr/FDti99sUOPpHk40mm5tN9cIlxhPp/MQf/Jp+kw7RccmsT
         st1JqQN4RoNLAfpo4FfbOCpITvtMgckUYAnVKtWwg6o++euxrG0Ujd3BjVbktYGny5St
         zY87Rk2wMaRYMZ8RZFOjcHstUX22k6A1/3bub2r2syI5Qfeu8iw2BM9HD7VVDyjauaqT
         qZPQsEdQSLKde2Le3BpCKacQ0SD2+ql4Hpp6bBSrx7rbdE0Fb7miYw0r8hb3CTdUJoA1
         BrS3MBxx+/5nhlBpAD2jx0Jzz2CIVtmYeZGPsDf1a8zHaFMCMq20rOFHr4okWHsv3rAz
         RHWA==
X-Gm-Message-State: ACgBeo0WxxKDCJhSb8abVE7PRg/83rarLiN8Pv0RpnPMCtVJuZKFJ4ai
	yDhbRiJYey0ZNU1Fx0TYAv/+149wUsF5Z19pyJZtEpKYED8v3Hnz4oz8irc4SJKDn2E7nHBZRDF
	SDALL/9/xtsfGLzM=
X-Received: by 2002:a17:90a:bc47:b0:1fa:e634:739c with SMTP id t7-20020a17090abc4700b001fae634739cmr3595507pjv.120.1661265991320;
        Tue, 23 Aug 2022 07:46:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7EcORGG0DtriXJLrLj+1Vy8+kFi8dMSE0nWfTxuMefbW3Yi+Gt9GSVqnoMs/8V8/1cNZVjPA==
X-Received: by 2002:a17:90a:bc47:b0:1fa:e634:739c with SMTP id t7-20020a17090abc4700b001fae634739cmr3595488pjv.120.1661265991087;
        Tue, 23 Aug 2022 07:46:31 -0700 (PDT)
Received: from xps13.. ([240d:1a:c0d:9f00:4f2f:926a:23dd:8588])
        by smtp.gmail.com with ESMTPSA id l63-20020a622542000000b00535e49245d6sm10519824pfl.12.2022.08.23.07.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 07:46:30 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shigeru Yoshida <syoshida@redhat.com>,
	"Author : Randy Dunlap" <rdunlap@infradead.org>,
	syzbot+35b87c668935bb55e666@syzkaller.appspotmail.com
Subject: [PATCH] fs/ntfs3: Avoid UBSAN error on true_sectors_per_clst()
Date: Tue, 23 Aug 2022 23:46:25 +0900
Message-Id: <20220823144625.1627736-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

syzbot reported UBSAN error as below:

[   76.901829][ T6677] ================================================================================
[   76.903908][ T6677] UBSAN: shift-out-of-bounds in fs/ntfs3/super.c:675:13
[   76.905363][ T6677] shift exponent -247 is negative

This patch avoid this error.

Link: https://syzkaller.appspot.com/bug?id=b0299c09a14aababf0f1c862dd4ebc8ab9eb0179
Fixes: a3b774342fa7 (fs/ntfs3: validate BOOT sectors_per_clusters)
Cc: Author: Randy Dunlap <rdunlap@infradead.org>
Reported-by: syzbot+35b87c668935bb55e666@syzkaller.appspotmail.com
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 47012c9bf505..adc4f73722b7 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -672,7 +672,7 @@ static u32 true_sectors_per_clst(const struct NTFS_BOOT *boot)
 	if (boot->sectors_per_clusters <= 0x80)
 		return boot->sectors_per_clusters;
 	if (boot->sectors_per_clusters >= 0xf4) /* limit shift to 2MB max */
-		return 1U << (0 - boot->sectors_per_clusters);
+		return 1U << -(s8)boot->sectors_per_clusters;
 	return -EINVAL;
 }
 
-- 
2.37.2

