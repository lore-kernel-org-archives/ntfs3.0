Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942C3FC2
	for <ntfs3@lists.linux.dev>; Fri, 27 Aug 2021 16:12:33 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 586ED1D45;
	Fri, 27 Aug 2021 19:12:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1630080751;
	bh=iNQdaFxj9PapAs2JkFepfUmmWDolt7ZtscncwVTKDhQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=mmwjc+/XaJNWLRE4v7qEd8whPHrgfdy4NIvTja+DAAuKxbR0KT5PsNOZYFML2NSR0
	 VrlmJFjbswWO0vg2y9nHEzXZeb16UCJgqX9TSFQjZM9qnejBiSiHuS00WLeaYqN/5p
	 xTOXtYheuWTJB3mbCcGe/0pwFeW31zyxbMKLVR7Q=
Received: from vdlg-exch-02.paragon-software.com (172.30.1.105) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 19:12:30 +0300
Received: from vdlg-exch-02.paragon-software.com ([fe80::586:6d72:3fe5:bd9b])
 by vdlg-exch-02.paragon-software.com ([fe80::586:6d72:3fe5:bd9b%12]) with
 mapi id 15.01.2176.009; Fri, 27 Aug 2021 19:12:30 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>
Subject: RE: [PATCH] fs/ntfs3: Remove unused variable cnt in
 ntfs_security_init()
Thread-Topic: [PATCH] fs/ntfs3: Remove unused variable cnt in
 ntfs_security_init()
Thread-Index: AQHXktVDRbExQDMRsEusl3oDXux+g6uHlt0g
Date: Fri, 27 Aug 2021 16:12:30 +0000
Message-ID: <0b948fca469a45f3b65804776f11b41c@paragon-software.com>
References: <20210816193041.1164125-1-nathan@kernel.org>
In-Reply-To: <20210816193041.1164125-1-nathan@kernel.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.30.0.26]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

> From: Nathan Chancellor <nathan@kernel.org>
> Sent: Monday, August 16, 2021 10:31 PM
> To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Cc: ntfs3@lists.linux.dev; linux-kernel@vger.kernel.org; clang-built-linu=
x@googlegroups.com; Nathan Chancellor
> <nathan@kernel.org>
> Subject: [PATCH] fs/ntfs3: Remove unused variable cnt in ntfs_security_in=
it()
>=20
> Clang warns:
>=20
> fs/ntfs3/fsntfs.c:1874:9: warning: variable 'cnt' set but not used
> [-Wunused-but-set-variable]
>         size_t cnt, off;
>                ^
> 1 warning generated.
>=20
> It is indeed unused so remove it.
>=20
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  fs/ntfs3/fsntfs.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index 92140050fb6c..c6599c514acf 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -1871,7 +1871,7 @@ int ntfs_security_init(struct ntfs_sb_info *sbi)
>  	struct ATTRIB *attr;
>  	struct ATTR_LIST_ENTRY *le;
>  	u64 sds_size;
> -	size_t cnt, off;
> +	size_t off;
>  	struct NTFS_DE *ne;
>  	struct NTFS_DE_SII *sii_e;
>  	struct ntfs_fnd *fnd_sii =3D NULL;
> @@ -1946,7 +1946,6 @@ int ntfs_security_init(struct ntfs_sb_info *sbi)
>  	sbi->security.next_off =3D
>  		Quad2Align(sds_size - SecurityDescriptorsBlockSize);
>=20
> -	cnt =3D 0;
>  	off =3D 0;
>  	ne =3D NULL;
>=20
> @@ -1964,8 +1963,6 @@ int ntfs_security_init(struct ntfs_sb_info *sbi)
>  		next_id =3D le32_to_cpu(sii_e->sec_id) + 1;
>  		if (next_id >=3D sbi->security.next_id)
>  			sbi->security.next_id =3D next_id;
> -
> -		cnt +=3D 1;
>  	}
>=20
>  	sbi->security.ni =3D ni;
>=20
> base-commit: 96b18047a7172037ff4206720f4e889670030b41
> --
> 2.33.0.rc2

Hi Nathan! Thanks for your contribution - applied.

Best regards.
