Received: from sonic301-22.consmr.mail.gq1.yahoo.com (sonic301-22.consmr.mail.gq1.yahoo.com [98.137.64.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C2924505
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 19:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1691608457; bh=wZTIIyno/nSp3AajUuy9PWlQ2MXxwAovxs1b2GEt9ik=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=glNCgQ0WuAUrCOpl/FrjOyhwYFr4dmIiof6dZvwfv76VfOWEMpU63R52eP3HNT+CIbe1yIxNWAYjVAkBKssILR6v5EIUv15yQnnrdOduCr790QZ51fqQwdroiiinDA1Ng8FpIIiLuvCER9BxEM+2CDqeWNM88Z8I461bKA406+LCuGkcHA3GgiKUNzrwPsiDdCugHGGnD/qrAE0fqcrEEk/tXCKrTwj0551GZsTyz+MvPxgPM7ilSyMt80LqFfWS5Cx1MvDLEO1h55JNsmWYT7T3uEND+JUp24mtkAoYGogK4U43xsAyIfBVt43tC9eTpOfj9kP2UFe1XLAyjfVyww==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1691608457; bh=UTTpC63XH+WsjjzgHGCYPNJF39cC7anF7p4ijmCVu+s=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=sWsVQNCtZQ5u3Kz7blMhg+M+ntpn85nKDVbhSyZI8EGWGETF5RQP2NhFlOFSEsyI+xYOWWUrf79FDVT0BhCdD7GpreZKH/9MO0/sPKlN8kTKRPk2o/7D20iY4G3bI5rAnwREzmYAZLtObl1i9WK3aBUEcy9TYlYxUcPPbsmGx+Z61nUDLew+9xW+JK+3YWjPWjLuSG4tefgNcHzU2j6FNR5jOEaLhwjvfaniBedIQoB4XOpJEPOfeh6L4VggKgWy3MHyGelf9aWpE7SgMylRaNuUoO3BTnwOZP2nY7PwvkYNu3xh2lU69UDEGqChNeM+YShEcpBzF6WmbaVoTX0TLg==
X-YMail-OSG: ss9.NiwVM1maYPZ_cg36FbUypy2a4uS0_hgIx203vHg4.6DPtwjmAGBNoRwn0Jf
 gH2lWVJPkXiabZx1SvRkg.nZtj0zCt_xPGejXEIUyW9tOmI2u.jWPcAN2YLS7rBi73xf0OJ5qW7a
 XCGJmGreugdMdYae6hpwHEVN83hhV2Nbg2q7FcfDZ.WtV9o11d0LORa0k4PGodZ7IYl2rgpiFXD3
 fRo23QFHSYypX3DKwAE7YyjQftyOewwnGh5UO99R573e3ueONbg_aH7xneysoAszkfFXuEPNNZeR
 WySJ8NgHyZPjgoVi7TrjNwwxFC.CyH2CIU6jXN_fdfbhNLOGbhxxelq2Uv4paVGU7U_bgy__27KR
 t8xLVqx9lTJ.R2rgjNm7wi7Rr1SSpuhKdrfccuWFkadfPFGe_5U8lAdn4ewAMqBqDNGXxCTJRdLm
 rLdiYLIHGy8OdQQQCuj2nefvlC10uiyhOpjBPQHglHqljbTb3MTybXYrPu1DHKOjR6ISUDLl9Kdo
 ay00SMCXCL9447JZ2YX2SYHABEkHakq9as4DzwYsDVZdWeZIlaf0FXVIB2hahy7jMdjD2Jqz1F1G
 TXbqleskEevX_w4B8uieFD6WUldikZELFryyKkhzmgUIdSy3VkuKLCd0LpiK3tMVZUpFWBaeiyF.
 LqSrJ0uWBMdxDQIAq0IR39QqIAiGn_m2aRQth_QfxS3EctOlbtnrvifNyOl994TUcyL2Et8KzSEE
 vAVW344YN23E0sesVF9U.x9Ww4e86Jso0WpL.0KKgh1sl8EuYtolZwxuD.J_Yqgka5zpZue_.vlu
 Deh9WL4WSws2Wn1cDtp0CZluvJNiN1cel8.j4Fv5zEWQiehk4IpLHVN7.BBuCfHDaq2jkZgedknB
 tBgjhAhkucl8baZwd123Nyj04GWWRlmbMzlgjL557H.J44Rh0WjB0bmhmnHpmLEAabI.91OL4gg5
 5yvVabWzkaEQXxZ.lo_LKUyBJpejl30u9NzXwqKZNhLt8V44ByOYIia7BS9TGSE.kqKDHnEibElY
 pEEgWkXTK2qT9vkFbr25KYOzg9eczCxIGmpcg3UdQXZthJl_ft85JuN30gwmzEDJ_PbvQJmoI7ot
 g2b4sHaDAudg3C5T2tVyYkUPGHyDcYvJEHXflhkBrRQy1RJ.B0qaB6bxQPYz_LwKZi1Zm9bZ1oBo
 P2WLo5u.sAxDB2L5Cla_LdTZe4u_4yUNUWOqvoHLOjKOYalgVR7MlpY7VSZEX6FakQFpkDyhkkLa
 k1zyCf.4kCv59lJSLoxPftHa1zCNVvAFOrniRc7sOhAXCTX8xWPvph5W3sH_1hDYxoonMp4IBNh0
 go7Uz45RO9cYcOCEqiPBujvHdA.FwLwnRKT5Jw937knv0TsGdJug7VmNJXWOywJno7NoLedou1ku
 xJLJcXJWdcFddEgpmYM_OdzVAWmnAo3hKpAcP_H0Xa27iQvSfoBWvglwUmT8VhyW9m4JbSks2G9b
 WdLAG1ZRUxu9p5P1QvmeTGmGBKKlNTB.ue4xKg2A6DmgrkDlHpJbOOZY6KtQCdL8G06_eeNg8D3p
 coumV27AeqhA6l3eoSD1fQ3LIYwQlT1pNTCuf5IiZYDxb3TYdp2lwkgs6BjbqsbDTIOwVjbRsIfZ
 JS0KYKCJYTlpy3xWdZPIJxT9OpKn9Nvqu1GggExtH4sw31eCoptmV5A0GbzaRE5G66Y4cXqsveRP
 11lcGK.bg41Ht_ctbaSsi1pEq1mth7BwMviipalEX1VQ__3xacPEUCV8chxuZ8v5_24sGmV38jmn
 hOuY52DY1BEAg_1xrJPdJCqIWBhyBB4dz5jUvPmJybs5jm_Y.AstTE5yngs47lr6paOXOXQQiODP
 oshDZHLMe6PwcN7kUfmB.uT_A4VsLhUMdBHz1fuBPRhk.C0ZlbfmwkLHLn8.88cxjxcn4jathid_
 D1ls7YfCkqEkjluj0sqW51EpWbrjgLu4BY3P9IghppwyIGOty3zN5Z1d2hGh92Mxm6dGqeMfGs.A
 E7nSN6e7E0toLmZg7L4CCHsYJxdF7jtywwOaRflGuGktQIuT.wviWjbECOzlttIHGaaNoR9S8Ow4
 RdYz0lTmzqw_tXkR9LEI4g9KPB6Av.3j30kC8nlAfWwrrVs688ADVDKvCwXbALywRW1IUlRRzGol
 0Hk3KgGAgsCKeK0ccIWgDjNFKcn6OnfBPXz4ql.gjfmbgIkkifWMSo0Iwy7AMyBWzy3XqmmpqEau
 yAnmgKLVu.9gmynpM_f.IlC.FIM1TXB9vw_k..G5tWB6QN9E8S5pGZwQjonTgXJ6U64IHM_g-
X-Sonic-MF: <astrajoan@yahoo.com>
X-Sonic-ID: 03f87f64-b920-4223-a27f-c3a0ef2a769d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.gq1.yahoo.com with HTTP; Wed, 9 Aug 2023 19:14:17 +0000
Received: by hermes--production-gq1-6b7c87dcf5-dscqf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2d0df630be64f0cc1f0621d6c82a1ba3;
          Wed, 09 Aug 2023 19:14:12 +0000 (UTC)
From: Ziqi Zhao <astrajoan@yahoo.com>
To: syzbot+60cf892fc31d1f4358fc@syzkaller.appspotmail.com,
	almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev,
	skhan@linuxfoundation.org,
	ivan.orlov0322@gmail.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Ziqi Zhao <astrajoan@yahoo.com>
Subject: [PATCH] fs/ntfs3: Fix possible null-pointer dereference in hdr_find_e()
Date: Wed,  9 Aug 2023 12:14:09 -0700
Message-Id: <20230809191409.30786-1-astrajoan@yahoo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0000000000009531dc0602016bb0@google.com>
References: <0000000000009531dc0602016bb0@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upon investigation of the C reproducer provided by Syzbot, it seemed
the reproducer was trying to mount a corrupted NTFS filesystem, then
issue a rename syscall to some nodes in the filesystem. This can be
shown by modifying the reproducer to only include the mount syscall,
and investigating the filesystem by e.g. `ls` and `rm` commands. As a
result, during the problematic call to `hdr_fine_e`, the `inode` being
supplied did not go through `indx_init`, hence the `cmp` function
pointer was never set.

The fix is simply to check whether `cmp` is not set, and return NULL
if that's the case, in order to be consistent with other error
scenarios of the `hdr_find_e` method. The rationale behind this patch
is that:

- We should prevent crashing the kernel even if the mounted filesystem
  is corrupted. Any syscalls made on the filesystem could return
  invalid, but the kernel should be able to sustain these calls.

- Only very specific corruption would lead to this bug, so it would be
  a pretty rare case in actual usage anyways. Therefore, introducing a
  check to specifically protect against this bug seems appropriate.
  Because of its rarity, an `unlikely` clause is used to wrap around
  this nullity check.

Reported-by: syzbot+60cf892fc31d1f4358fc@syzkaller.appspotmail.com
Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
---
 fs/ntfs3/index.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 124c6e822623..cf92b2433f7a 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -729,6 +729,9 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 	u32 total = le32_to_cpu(hdr->total);
 	u16 offs[128];
 
+	if (unlikely(!cmp))
+		return NULL;
+
 fill_table:
 	if (end > total)
 		return NULL;
-- 
2.34.1

