Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664435;
	b=dVeY9D/2n23ZMLSvgeYw2jWCG/KeQQNO0FWm/II8Xdv6GZTnZFTKGWvGAparHfX4/Pe4
	 cWTZJbsHo1VfylicspA/jgLVGcSe61SumJcj2t7uKL2BEpUlPbDwNR/iv0Z548iYe0RC8
	 3I1tUves96E5eKqzfsZh8bCQCdpASxfLr+JivpBcDpG1SO8ZWRISbuFQHzlaCTG1IeUe6
	 sAKQuqgeJuBZl9e5Pl3FOWQHn9HJhMJ2HARQoOGGqZ0ogI5oejougUli7UchxBlJLcJVM
	 gdQPktdaaa5YqVSeQ4xCfr8OqOvK1879eG4nJqIRznoJ+Kq+DGpf7caQ5RoqkrjlwYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664435;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=zCl4XACFfxLoFxR7/97+DR7w+83N8h8sXqXdDNDJGZ0=;
	b=sqIMhuBZThexrpBczjDaqGmOAXJcT//VXvxaYPRR8KCoPouAbetxt37Ql9ycpx9hcCUl
	 p5015LP+iUKDbSAsVvmxMp3xrFu0uII95zXylyeZJXJhXQ2jmnozQX0uTaWB5jXiVA0MP
	 Qp4wAYfAuumHNZNSteA1PdX7RKiDViJbm8KssiP2SPc8xS62javN8uZJCyP8ctv1+CcaV
	 l6SW60M60Qa4t5/UvvceFF+qZ4rTAmWs1j8h6LTcoiXTlwZZhLkqPUF2byeAxNX2+OZey
	 gMphdcec86zSj2+kNYEcYOwNv/etajg15dwm7tADAr6DjuHIkA5Kl28hfqBh99l/gHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EyQJamoQ;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAEF606A33C
	for <ntfs3@lists.linux.dev>; Thu, 26 Nov 2026 03:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEAEF606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EyQJamoQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=zCl4XACFfxLoFxR
	7/97+DR7w+83N8h8sXqXdDNDJGZ0=; b=EyQJamoQ/ozvNwlA+xA6aO227a66nU2
	fQK5LDdd84mg3nME7undIgr/zCvtkKmlq+ALBW4yZ6zYW04zyWUX3qWur9GxMpGR
	Scz2jnEl8dp2W8me6H24taVlTXLDl140eBLeNkW+ifOVF5jK8oLXTwOrKhpqUsqy
	LDuPFXNW3zCI=
From: shaos <shawnq1@163.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: preserve hole marker when trimming a run
Date: Thu, 26 Nov 2026 03:40:27 GMT
Message-ID: <179566442733.1993761.672618205872204854@163.com>
X-CM-TRANSID:PygvCgCH74QrqgdrvLbtIA--.60447S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFWUtF18GF13KrWfXr1xuFg_yoW5tr48pF
	s7AF45Krn0y3W3AwsFqF18Xr909rZ7ta1jka4DJw18uanxJ3WIyFy0k34Yga18Zrs5CrWF
	vrnYq347uryDZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UvjgsUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8QxSYGsHqiyuJAAA3v
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list

Hello,

When run_unpack() starts decoding at a VCN inside a mapping-pairs run,
it trims the already-consumed clusters from that run. For a sparse run,
the LCN is SPARSE_LCN64. Adding the skipped cluster count to that
sentinel changes it into a non-sparse value, and run_add_entry() then
maps the remaining hole to physical cluster zero.

On a crafted NTFS volume, an unprivileged writer can trigger this by
writing across a split $DATA attribute. A subsequent read returns
NTFS boot-sector bytes where the file contains a sparse hole. The
reproducer demonstrates disclosure of volume data; it does not
demonstrate arbitrary memory disclosure or privilege escalation.

HEAD commit:    8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
Git tree:       fe970b05333fb8e41da21e9e289f652abcc7cba7
Source version: Linux 7.4.0-rc4
Compiler:       gcc 11.4.0, GNU ld 2.38
Test runtime:   QEMU 6.2.0, x86-64 TCG

The evidence and reproduction helpers are in this unlisted Gist:

https://gist.github.com/shaos26/d1f7fc9e3398d728f104867ea1880df6

Console output:
https://gist.githubusercontent.com/shaos26/d1f7fc9e3398d728f104867ea1880df6/raw/5b1ad414981bb3f8f2ab77862441dc81db6c2b50/console-output.txt
Exact console bytes (base64):
https://gist.githubusercontent.com/shaos26/d1f7fc9e3398d728f104867ea1880df6/raw/5b1ad414981bb3f8f2ab77862441dc81db6c2b50/console-output.raw.b64
Kernel config:
https://gist.githubusercontent.com/shaos26/d1f7fc9e3398d728f104867ea1880df6/raw/5b1ad414981bb3f8f2ab77862441dc81db6c2b50/kernel-config.txt
PoC source:
https://gist.githubusercontent.com/shaos26/d1f7fc9e3398d728f104867ea1880df6/raw/5b1ad414981bb3f8f2ab77862441dc81db6c2b50/poc.c

The readable console file escapes the non-UTF-8 bytes printed from the
boot sector; the base64 file preserves the original console bytes.

Clone the fixed Gist revision and run the vulnerable positives and
boundary control with:

    git clone https://gist.github.com/d1f7fc9e3398d728f104867ea1880df6.git repro
    git -C repro checkout 5b1ad414981bb3f8f2ab77862441dc81db6c2b50
    chmod +x repro/*.sh
    ./repro/reproduce.sh

This runs two fresh vulnerable positives and the split-boundary
control. The patched-kernel trigger and boundary controls are included
in the console log. The vulnerable runs each returned
3935/4096 zero bytes and identified the remaining 353-cluster hole as
physical LCN 0. The boundary control returned 4096/4096 zero bytes.
With this patch, the same trigger image returned 4096/4096 zero bytes,
and MFT inspection showed the run remained sparse.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Cc: stable@vger.kernel.org
Signed-off-by: shaos <shawnq1@163.com>

---
 fs/ntfs3/run.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/run.c b/fs/ntfs3/run.c
index 6e3ef89fc6660..d51d953f65c4a 100644
--- a/fs/ntfs3/run.c
+++ b/fs/ntfs3/run.c
@@ -1151,8 +1151,9 @@ int run_unpack(struct runs_tree *run, struct ntfs_sb_info *sbi, CLST ino,
 		} else if (next_vcn > vcn) {
 			u64 dlen = vcn - vcn64;
 
-			if (!run_add_entry(run, vcn, lcn + dlen, len - dlen,
-					   is_mft))
+			if (lcn != SPARSE_LCN64)
+				lcn += dlen;
+			if (!run_add_entry(run, vcn, lcn, len - dlen, is_mft))
 				return -ENOMEM;
 		}
 
-- 
2.34.1

