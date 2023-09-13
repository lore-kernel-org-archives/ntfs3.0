Received: from sonic303-1.consmr.mail.bf2.yahoo.com (sonic303-1.consmr.mail.bf2.yahoo.com [74.6.131.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2419337F
	for <ntfs3@lists.linux.dev>; Wed, 13 Sep 2023 04:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1694580659; bh=mEVKzDxshUlu84k1kQ15m7ZzK49JWJBZtFxmTOyrrhg=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=ox6D7VI1adviSBRxjfryBZlAySlnLWfrtEOifuoYoIhvqhWr+Hdb0v5e2wu7SE4MJTdtivFpmzbUwysznPZMW1EeCeU9OgmDhIN5VAdQKYBt1Uyh/psTba74ykQAKm4RTQvoTJOE/oAO5L84E8po31OXAQqmy1qpJFgaCNsQfRo0v73+K4qhFwYTDnS4fvjwCC1Q8Ss5n+k/t3FRKsvt5bYLn/bgrh5jAq9s/LYSYD7mWZiXr3OfMj3QqQ/vfjuztY4o1GGEjw9kLtkGL0HDWdZpppcZPrCFE5szXCh4xopcSHt/3mJEuPzTgUuCqOzerCJ/Np0wZEpr7dgYox2ydA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1694580659; bh=8KUwJGa4ctAxDlmjR0YeBVMxZYbnEWXio9aVV0l82JH=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=LR/WdqUgs31CBF1NzUVPmTYTz1UkC3H9D3riHZ+C7GZixi/KYFqNRQhoaiFxfXchakLEJ2oqlea9rwZMERpPvvtZDlQaCStLO17DJqeSr6LXpOYjLBUlaDqRtjEjBRQXOWa1xTJDCzEffkRGsYOjXyl2+CGyUaMgtazXcIiXyc48sakOKySl/L32sH55dDOPjaH+ATYOeKKmw+nUFIlecCPSYZ/TUvXlnik+UsOcU65o2eCbMV8pCvuDKHZxuwlILYayhxSTzMGMJiEZMJmLhS38MixrUp6QE0OjZ8CpiAKDitmehtHl1fPPnJGXPoUDsF6pXSMWkuYRcI4DRIr1QQ==
X-YMail-OSG: 9ODFe_EVM1l51S7w0eTazYxCsmFRBtjXySspluIrWZOGgFHf7cSVc1UlGvf2O4p
 LfrnIET7oMVT8uc.0bPf_zFcoF0JsAyD88eyUa1PgoxMw9sTs3gK.an9h298RiDtYQP2MKf.fYOm
 zes2.2Ivc0BEkyVfuvoI.dNcuv5BL7iNI202EeWweZRzFo57PgzQOL7sGUzmoMe2jVmlxVzDskNq
 7NC4qRZGtCQMru1B2Kt7xpxnpdqKkSjQTSsUoqG1oAgmXEu37kb9n2keVzP75rA84rbtiz880VtZ
 hRrgEvGL0oIZV3.gFVL.XpmccjEXd6HAVmArR53o2rOc3bSc1GFDBCkUjJcAy2DzCHuBPsHDtN9x
 TMYh28eQxVvTAsZFN43sG.zNh5mVxECxOf7f878HwAB9nkxqhwM6dJPNFFXulJOcm6LdOT2mx.Qb
 WOj_.d1WIUxdHivUXN4IFjBkwAvPIpmTzFvp7PJ2a4E4SufswesR0N0G_FhWkN00fyubfbG_YOG9
 6JjbPC1KU3Zw.v_GQDVyepBy4zD41744dzdvRgCAeE4zU8pGhxJe60X1G9cl_1gFbli5lC_o5LGu
 aMpSUGhdWf5ylCpj.yB9AohJWxzrSAp1xU6NAwnvLLLZCj_OP6rfKuap0w5y2s5928PcF_b2G4Af
 bdpV4IIPjd4V4KBqb6kQl7mmqG1M7Cu0w.GrHeOuyHUwE_iSsVnC.g9mvaXdV4cf.HuG15TY7EGO
 jgrUF1hjZhS1b83qegOdLJIQGlAjz.zzX..KWk1JkPqUAh21GD2ROkCi1CwYQ399qdOAUfWzTc88
 RSR55jmuV5cXH2YMVCcfTE9zyby0Qa2C6F1cGgbIisfWu9RSZgU3pANg5BCo3spO0MLE..trfkKZ
 .yJep.m9vMEsHQtRWompe.S8t1aa4MYmPdTXW9J9jYKnDhQgldmrUDdiQEkApdSwPuaelSQ5fe46
 D1Ux1oJ9x055h7k8.WqYJmFsdtNjgDpLJoI.XcOOGo.5XHQplmu22MYisz7r9hD5RY2B4ghYE1EJ
 VV.mNayxFsYHS9inaGNYhoD4RQua.icKi1udthx7J3oi5L9fqvZAasQQh2Y0cT_Kk4BgMDOrMDHY
 qypoTJ1uhApMYiZbo7aOu8.sSFYfpsWRtZLik05jm._fMRDJ3PhVoCslORuyltUYu7IfgaxafHCk
 FxPD92gjPEqLf7M8CoNEzm5hmjC7Pqqrw9bxDcjEK7jEEWu00z2bJfuvnFwV0YJFl9fZGVsPfLyA
 MCESYlIEdU7_J5REzzGUboHPb7pZl8TLZ1nK6MqICM.1B1P._L130zpSVeDLxy5elWAjaewHBPhK
 2BwwW8ZKmF6nfHSBQM4jM5UlWpCjCKeoKvBGQAdP3gi1qHgwijNkMogzre6X4FGQXcP5gg89sydw
 9rtvQzYTj.R4aW4RK8IvPPtyEQA1.yVoDCqOBbOTzGz4T5Q8uZyo58ksDUG7vKVwWqRVTEIa.cvb
 bAdbV3lijKByVxaHb6LRtSJqw2.Z3l8h6RKRIi29RKqLFifU_qkNPSwa4XYXdi76ndrra55WJKtf
 9NhTkt94zKLcVrkgcmDzHvOu1i_G.dwVJWsKKawcc6wiYrskpRM_e9CAp7ayDpU7PMU3FQIMVRMd
 Tzj2_jP9xCIG6YuFiYSMDZJrTV45Qp9QgN1N6B0HY5ymYAbZlyZSw7VHl_G_kPaRA6XocnYBYbfc
 nvLRI6rQkKhl7VbZC7gsc8oGMIECa9l1zDdClkYMI0T9SjUoHkKquqUKhlWZnn9azkF3gFQLzqEF
 ILharg1pBWN0sEeikW8zGpGk9aHS.L_Nt2WP9tz.6VNskgRuqw02KP_KCkSnPn4m.gUe7oURvHbT
 _YEIN1taIKgWt0ozIbq9VoWQddrJEXnOYT5dBFnB72quQVm0oxwZj2h9aWBpk3yf9p6nKxheW7Rn
 zwq5zXsd4TJqqB8Wk4.oE6sUDIlRRw_7E.i0uLLj9nkBwnibkNk_acryETpVhQYyv0WPLRyrYnxc
 4KrbSt7S8bqYUFFVD29SKQiUN7nji3lrVYHu19QxBaErFOMiebWyoS2pSq1TD48IfTO8FbWS.CzR
 vt_ckgllDPx9G2l2PgnqwVlRc0IE33VUgpS9FoFJmK48ektDtiAH3oO0gxTgvJosyjzBC_jtg3X8
 hcxTCcis5eddJEYv47P6Gre1CUx55sl3EwAxXZ3ZRAmHDOORG82.ipy5kKpbORu5jb3tIxbqgQcS
 NCIk.Eftb8feTX8Z1r1F2uWaDud7p2fHKz6ZsvyLyghqAwtgEN0P7m5.t7cc7.N0ssJHqJZKM4ub
 GcV6Ph07tGG9AcoMBJFnM6S8-
X-Sonic-MF: <gabemarcano@yahoo.com>
X-Sonic-ID: e0f05108-b0e7-4627-b947-c8589f1075aa
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.bf2.yahoo.com with HTTP; Wed, 13 Sep 2023 04:50:59 +0000
Received: by hermes--production-ne1-7b767b77cc-q899j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5a3f1a9ca35f31bea436e0654e91c2d5;
          Wed, 13 Sep 2023 04:50:55 +0000 (UTC)
From: Gabriel Marcano <gabemarcano@yahoo.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Marcano <gabemarcano@yahoo.com>
Subject: [PATCH 0/1] fs/ntfs3: fix directory element type detection
Date: Tue, 12 Sep 2023 21:50:31 -0700
Message-ID: <20230913045032.19651-1-gabemarcano@yahoo.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20230913045032.19651-1-gabemarcano.ref@yahoo.com>

I ran into an interesting issue with plocate's updatedb when it was
iterating through a Windows NTFS partition. Specifically, it turns out
that in at least Windows 10, the directory (from Windows's POV):
 C:\Documents and Settings\Default User\Application Data
has a junction to itself. updatedb (in Linux) was segfaulting from what
looked to be a stack overflow due to what looked to be infinite
traversal of that junction loop. The cause is that while stat() (and
associated syscalls) correctly identify the junction as a symlink,
readdir() (and associated syscalls) did not, reporting that it was a
regular directory instead. I tried a similar setup in my root btrfs
partition, and both stat() and readdir() reported the symlinks there as
links, so it does look like an issue in ntfs3, or at least it's not
consistent with other filesystems.

This patch checks to see if the FILE_ATTRIBUTE_REPARSE_POINT attrinbute
is set, and if so, it sets the type of that file or directory to a link
while emitting data for getdents64 and related syscalls.

This patch does fix the updatedb issue I was encountering, as apparently
updatedb stops traversing once it hits a symlink.

Gabriel Marcano (1):
  fs/ntfs3: fix directory element type detection

 fs/ntfs3/dir.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)


base-commit: 44b4494d5c5971dc8f531c8783d90a637e862880
-- 
2.42.0

