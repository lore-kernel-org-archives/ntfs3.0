Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864022;
	b=utG6FKBxzLW3EGGQyBfqwWEnMI1PQ0vh+0ubB8AI0AmctNDXdQvHd/7anhLYeHhZwIO2
	 bxR2SdNKC3gfJrMnpIYzKVqwhQrKjz0BKrea1Af2/WYM0E4Th9uqlotSmNy8SzYqfGZJC
	 NS8qAiv/Da6fWQNXYB0qKhJidczbNfWx4I/XXRSiZxhTvJfrwskEzrPkZKs8fppcfRWim
	 pL3spExNpIbGEVBWj9GZ3LUoFcXaBwGdkw1B5HefkwBtI7i1qZpWaeYu5xMD6EJJDXKe4
	 Thi/wxjmuuP1XshTDSfGrvehxE+q8BsvWB6kkywxHgaynBXBwV1cjtCE+42mO1djKSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ig39vxia/SkOHoW5sojmWa+WpO2Um5cVLfArTWST+n4=;
	b=0MhCVmPUPLS3PcC7AKG8NIoGOKi+euDAFrggVt95VJ4VL4BP4BaegWIysIeX8R2FZyzO
	 +3sbaDz434IzZU8LyruZ8T2crzyxrANdtjz/zhECRfVaIy2Y3+KLfXYPjKmn4XRfNPX+U
	 yc1urouhz7QDINLgil8YY3ICYUvSXLNH5VWn6pHxm8J0qxWiWOc+vTsriCS9cCUiwq6Su
	 sYsj/gctc794tQQL0i0Lj3+GbY/LLnisxOQzECIQn6YnP9oOV8ZQUpF6JvC0pgEWjxIiF
	 11eE/Jfu/kagl30ruCCalmw+3KvuWIAFuRMXWaDGKmIV0W07qYgWT8aE7cY4dYbEqEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BdMRFtY4;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC04B606A322
	for <ntfs3@lists.linux.dev>; Mon, 16 Nov 2026 21:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC04B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BdMRFtY4
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a357b1c649so212493f8f.3
        for <ntfs3@lists.linux.dev>; Mon, 16 Nov 2026 13:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864019; x=1795468819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ig39vxia/SkOHoW5sojmWa+WpO2Um5cVLfArTWST+n4=;
        b=BdMRFtY4kHmg0pHbzqmGdtCenVR8WyD1d2eUc1ihToSBC56IRoBg5xptG/9oLpNcEN
         EGlDVKoEf142ydiqo+kL8rUyMBdL7eJlGC5r9paYyOKSGMJcbIkcycP+uDYzFLQkorG9
         IF/+Eda7EBClC6kMr6WLaHkk2A8BZ9zKTvJuPplmABpwqfFs93RK+byb2g1sWhPqMqDw
         dbIzbHFvoci05gPr1wAPeUj0bmKgRXmOIzpBJLMCNinttte46VnmSx8zlgxcZiL59nFl
         wsmvqKuGOFFytKmlQDt5GfnnmvI+XwUDYbeZJ4LD21z48Ij2N778+EEYglsSq7vyRVfs
         r+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864019; x=1795468819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ig39vxia/SkOHoW5sojmWa+WpO2Um5cVLfArTWST+n4=;
        b=MBYp/C5RlBfv59yl2BM8ycykkaH3qJJBEPbgtf2zIkDlPvExd8sGIKrYMaIUlZe1if
         NLfArs4nGqYv5Fe1YLP50KnMxQRG81Caymz/BhwljRGr6fXXPK56hIngNOMO9+ehBjuJ
         IUgvElw5mukCE19fE1n6NRYlVw27rEeFtK8O51e1qnjioJXzc6naciq5SyEslMWXSXKp
         C/YJeqxYkr1KWEP8BFJaZKMXBohPSBE0PsYKL2p5pFZLLOtT72h4RTNCaMiSGtAVHNWi
         p+uYUaM85jL4mOGMqAlXGyWRzHzb4KbWHAJI8RQ2ZMRfOhCre/U9RzmyFQ/nwtoSccQj
         MOPw==
X-Forwarded-Encrypted: i=1; AL+hErFqbDZ2nta+uGHwwSYkvDgec5sjcJoWykFrW0iSMQSnCTCZf441BfT3aB+ZJKEoMVG5kGhhyA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/jMxrPM0+PLNK1TWRwHBMf36Gw2sVIsgN3EHonkKt187chwISr
	bZ4ZGvExsnjOJxXhT12Zb13c9G+1f1lP+dtPaTcizbs7gEzxY6YLQcjj
X-Gm-Gg: AZFdTZfjyeoKBWC9OCpypQ/qRcJbh3/ZspcmQOx5t+LInuHG4mfEBxEyWX3K4VN45im
	qJ448fc3WxASiqEueCV32ZGQtJzQB45sw+vEbojDyqnPOhuXjUoG/z5r67qcWvKmHCzu0yViCV4
	+WyhoC5KO8Tqh5dO2jT0BHefQ4vCN7NmZyCD5rciQsMPKb2hw+SqmPEWxgyrIx1aJ/E1eEP+gW2
	QkVnlge/HA9lwlN3Ti5tKnKIRKi77yUjkIYEu8+yvDml/e4ngFDEQjRixcIsYeQsC6g8AQmE22v
	AM34nGffqPyMugkWQOTLSL+/UxedpVooGO1m8jkTr98HTCPEEBQcTfDuu1Bx03zBelvOhajJ1Rv
	GVZMv0saax7oAYRBk6nw4Jcc5eRqRV7AuR/FxvbGESCAIkIH6IFMpSuRI7YfqOrtqChOMjzhbAV
	+NloFqe5fRadceHDmEwCTRCAsmEguLUvYbGgWuPSb1Kwj2HpPlFNez1vrEAQCZdmpXLww2NoSN2
	3jRH9liYf2TY0tJx/YqEH/y9m3CETZ2uZaGK37t4XMYrZIfJwxqDlXK1CoGaixb4ZpnxBKWWMVX
	ROFLdBxBRkhngFfYmBBHmvHa
X-Received: by 2002:adf:e014:0:10b0:490:9fe2:6a2d with SMTP id ffacd0b85a97d-49c73631487mr18978149f8f.26.1794864019114;
        Mon, 16 Nov 2026 13:20:19 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm27208354f8f.1.2026.11.16.13.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:20:17 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH] ntfs3: fix negative timestamps corrupting stat output
Date: Mon, 16 Nov 2026 22:20:06 +0100
Message-ID: <20261116212006.837097-1-koray.fra@gmail.com>
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

When reading a timestamp before epoch with sub-second precision, ntfs3
converts it from on-disk NT format to Unix format without normalizing
it, leading to the nanoseconds field being used as a negative number.
This leads to a garbled stat command output and violates a struct
timespec64 invariant, as documented in the set_normalized_timespec64()
kernel-doc:
[...]
 * Note: The tv_nsec part is always in the range of 0 <= tv_nsec < NSEC_PER_SEC.
 * For negative values only the tv_sec field is negative !
 */

Reproducer, with /dev/loop0 formatted as NTFS and mounted at /mnt:

  mount -t ntfs3 /dev/loop0 /mnt
  touch -d "1969-07-20 20:17:40.123456789" /mnt/test.txt
  stat -c %y /mnt/test.txt
  # remount to evict caches
  umount /mnt
  mount -t ntfs3 /dev/loop0 /mnt
  stat -c %y /mnt/test.txt

which prints (stat output is garbled because of negative value):

  1969-07-20 20:17:40.123456700 +0000 (from cache)
  1969-07-20 20:17:41.()*+,--00 +0000 (from disk, after remount)

Fix this by using set_normalized_timespec64() in nt2kernel().

Fixes: 518013860432 ("fs/ntfs3: Support timestamps prior to epoch")
Cc: stable@vger.kernel.org
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
Small bug found by sashiko[1] while implementing ptime[2].

Thanks.

[1]: https://sashiko.dev/#/message/20261115180343.576773-4-koray.fra%40gmail.com
[2]: https://lore.kernel.org/all/20261115180343.576773-1-koray.fra@gmail.com/T/#u

 fs/ntfs3/ntfs_fs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index f400cf94d05b..1f3e5d201767 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -1083,8 +1083,8 @@ static inline void nt2kernel(const __le64 tm, struct timespec64 *ts)
 	/* use signed 64 bit to support timestamps prior to epoch. xfstest 258. */
 	s64 t = le64_to_cpu(tm) - _100ns2seconds * SecondsToStartOf1970;
 
-	ts->tv_sec = div_s64_rem(t, _100ns2seconds, &t32);
-	ts->tv_nsec = t32 * 100;
+	set_normalized_timespec64(ts, div_s64_rem(t, _100ns2seconds, &t32),
+				  (s64)t32 * 100);
 }
 
 static inline struct ntfs_sb_info *ntfs_sb(struct super_block *sb)

base-commit: 0c895b1f6ab37a7c72a437818f307ef6e629051c
-- 
2.56.0

