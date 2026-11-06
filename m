Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972952;
	b=Eu9vy6ZJ28hSZ6Fykx+Gj+IlUiR8zpSVov5pd/Oaaq7tpbPHFKrWDv4gt4YzeY16ffQ0
	 vYneyCTd+6UDFDVGPwjDWaY9TyJstEwbalNVUR4EgYaVcohEPrNTEtwlLF55rPBYcx0um
	 Uu7RiOdRHQTv2xTL4VqSwxiYBx8vrVP+yb9oaf6jjIE0Hwud+tYydULrRce/SbNMwxSl/
	 lI/o+Z6GMF40UrTelUvQ4E2a3nJJPHu6TtVvD/coP9m8vCKon/Ob/NqLWnzpiCP3QGxvh
	 asA/7AshRGQajQRapSIXBFqyzQqDfEmm34E5qh/zmU6WCl+Aaf37NXEVY7mepz+0s5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=goEwqDn2eYKToeRxOVfZCjIr5NYHVGNIUeiTdWCM6aE=;
	b=3ibFu+6PH9gpo3Yc1qrUgmiAIKyT0wg5NittM767+tzTzh2JyF32lT8+lhenFI5cgc/1
	 A9yCcuw0ifXo/zgP8/1Ba+s136ntUtsn63ICdK1aZuf5IGo7DCaw35IaWEwTfxi6IbS+p
	 ghla/s/79k/NOG/czGJzXAi/EywqKiZAimCeYhGCMP/AOqXs0AU95WEJD+t1FW0X9vVej
	 mu8tTtemH8Y+vBnf3coWMKV8UTgaQMxYn52yVV1JcYmTIxrz0P/92ReewOmz8+5jll50q
	 b8liA6BBN6sW5LgnIvKvPAkFac2gCzDZbVdrvzcBRcduPmL0K1rZSQnSS1u1lUwaZ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Leehn/2h";
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EBF606A32F
	for <ntfs3@lists.linux.dev>; Fri,  6 Nov 2026 13:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33EBF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Leehn/2h
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06e79e152so297596b3a.0
        for <ntfs3@lists.linux.dev>; Fri, 06 Nov 2026 05:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793972951; x=1794577751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=goEwqDn2eYKToeRxOVfZCjIr5NYHVGNIUeiTdWCM6aE=;
        b=Leehn/2hMoZYlHra3CfG4Q6EbiBvOJ2tqlg2jCDBbdCAe9+IdT6VyTVt7UJy5BnXo+
         OQQscTzE4sJOguBX/DijJynPojZvAa6Y8WxpOjN5/EhaGkcq0jjnaQkrPlfy4a1d1mLU
         M8iXuq5/Amd36jAE+ylQ7saRxV/1z3G3jTy4MeG8g8Bhqc0S1+/oucw+/BFLOQoQCFDg
         hkonK7emYWCI9ZaxAIrfLGymhh9E5kjmjfBgjuYFT9q1faScmjfRdyVLh2QqnQIOpqnY
         fdtldrGZGlfIHHB6zrn0lg1y6+yGRKWZ4HfW6wmDWYZZl2ryHyqVxqrDleUvtmO5uo5s
         6iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972951; x=1794577751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goEwqDn2eYKToeRxOVfZCjIr5NYHVGNIUeiTdWCM6aE=;
        b=qItdxEE7wi4Nk+c5ghsWHgkWiK4U1QpVXf8EO1FA2kKdeLBiLZxjiNA6rZ/twS0y5t
         dktwpb3ngaP0G69Avw1Slubw6nicHPx3lC3hxZuTJQsXDGJlNmGJJnKo8cc7KEvgIXdK
         EzFF7agxaaqMrx2WJlRtChY+J8DHThmb8mcYegWDGbBe6Sbad/d368foeykEiOYwissY
         XEzr8w+Cts2sH1z2osyKTLRRvFXOAkBJFvAGIDWr1YuN0xoi/ODO/H26TIUJqDVRpURX
         RZoZTJ8zjqUb/TadBlzGUT4zYEhJZbz1HwdZEvjVDJW4y3q1rj5OBviUf+FmBmM/9OW0
         6uAA==
X-Gm-Message-State: APuU4Z8whe16RbSASzTCGRF9yCbPbrNMrwL7WUV9OP3MCHXwTFfw2QKv
	mz5J1dB5k0dwY/J4juL+kHXlnz7eyi3Ego2YuBH4+tXMyZ+fX4AH8fjF
X-Gm-Gg: AYBFou3e29l1dqHUXO4hVqPE01VbM/+AFL9lvqr/odCoS6Y7g6+jUT7XuWBhAd2Y9We
	c23MgDXCMkjYDRrafoMuA0OdMGPa4XrTwYieo5FqFEjg1nCDaaycHjoBgUZv8A9F6nX2RbUt/+e
	kPN+1K/Y/sux5Qdn9dSsev2hj6V71kbM7/WG66LfO3/mMphSWI44TXxxjPc+wQjzBGMyC9hSWqS
	md2/q5VyqAED91cUWT9BcF3+20OiWuvCK90+zf0H8sFA0to8DRzYys16il2ZWHzhZNeZp6tsdUi
	vG8ysKZLQMSVCa5eVbvlG0HOlcfadQ/Z4eTn5JJcQrECBV+7Qr3kPuPSrhpEk9ZVj3OKOEYJ70B
	66tdfVDGkuYYT56l/PjZZWjrTvSLYrK1bgSGhCKjx0XCE6IsQudusNHZFFsf93XPHXaGA3q+sQH
	+XpvyO+xC3+1wuDMG1J3YXYxuPEbUJ0cigbgOAgF/qfRZ/cDZOxLEdBLl1BcbUdqhFm5MJb2Pvu
	5aVyIqy1CcwpZFLK8zCQoe7xG6Z428w/wX1Cd0qqhxE6bi2QxTAf08fwTTZ3Po92Lbg9cg6oLjw
	JXm/K/fr7H2ssnJqiKsWbU8hp0CLtmAAgeAoNChc+qqcfA==
X-Received: by 2002:a05:6a00:3ccf:b0:898:efb4:ec4 with SMTP id d2e1a72fcca58-8b37c826278mr2349025b3a.55.1793972951123;
        Fri, 06 Nov 2026 05:49:11 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35a0c4431sm603114b3a.42.2026.11.06.05.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:49:10 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: don't write a compressed frame after a short copy
Date: Fri,  6 Nov 2026 21:49:05 +0800
Message-ID: <20261106134906.3139994-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_compress_write() skips ni_read_frame() when the write covers the
whole frame, or runs from the start of the frame to past i_size. If
the copy from user space then comes up short, the rest of the frame
is whatever the folios held; ni_write_frame() compresses it to disk
and the folios are marked uptodate.

The copy can come up short after fault_in_iov_iter_readable() has
succeeded if the source buffer is unmapped in between. On a volume
with 4K clusters, writing 64K at offset 0 of a compressed file while
another thread unmaps and remaps the last page of the buffer replaces
the last 4096 bytes of the frame with zeros. The write returns
-EFAULT.

Don't write the frame in that case; fail with -EFAULT as if nothing
had been copied.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in QEMU on v7.4-rc1 with KASAN, page cache dropped before each
write:

  before: 3 of 755 writes left zeros at bytes 61440-65535
  after:  0 of 821 writes changed the file on failure

 fs/ntfs3/file.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 1624f9b014e0..b1b925f95b8d 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -1099,7 +1099,8 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 
 	/* Copy user data [pos : pos + count). */
 	while (count) {
-		size_t copied, bytes;
+		size_t copied, bytes, want;
+		bool full_frame = false;
 
 		off = pos & (frame_size - 1);
 		bytes = frame_size - off;
@@ -1135,10 +1136,13 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 					}
 					goto out;
 				}
+			} else {
+				full_frame = true;
 			}
 		}
 
 		WARN_ON(!bytes);
+		want = bytes;
 		copied = 0;
 		ip = off >> PAGE_SHIFT;
 		off = offset_in_page(pos);
@@ -1165,6 +1169,23 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 			}
 		}
 
+		/*
+		 * A fully overwritten frame was not read in, so after a short
+		 * copy the rest of it holds whatever the folios contained.
+		 * Don't write that out.
+		 */
+		if (full_frame && copied < want) {
+			iov_iter_revert(from, copied);
+			for (ip = 0; ip < pages_per_frame; ip++) {
+				folio = page_folio(pages[ip]);
+				folio_clear_uptodate(folio);
+				folio_unlock(folio);
+				folio_put(folio);
+			}
+			err = -EFAULT;
+			goto out;
+		}
+
 		ni_lock(ni);
 		err = ni_write_frame(ni, pages, pages_per_frame);
 		ni_unlock(ni);

base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
-- 
2.43.0

