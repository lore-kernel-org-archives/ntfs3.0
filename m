Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4418A3FD3
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 14:03:21 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-90-tzR3TaFjMtSaC8iSrW3zwg-1; Thu, 02 Sep 2021 15:03:18 +0100
X-MC-Unique: tzR3TaFjMtSaC8iSrW3zwg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 2 Sep 2021 15:03:17 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 2 Sep 2021 15:03:17 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Joe Perches' <joe@perches.com>, Kari Argillander
	<kari.argillander@gmail.com>, Konstantin Komarov
	<almaz.alexandrovich@paragon-software.com>, "ntfs3@lists.linux.dev"
	<ntfs3@lists.linux.dev>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/5] fs/ntfs3: Use kmalloc_array over kmalloc with
 multiply
Thread-Topic: [PATCH 1/5] fs/ntfs3: Use kmalloc_array over kmalloc with
 multiply
Thread-Index: AQHXntrPdHiUovXUwEmoBRmrkk5W9KuQyAlw
Date: Thu, 2 Sep 2021 14:03:17 +0000
Message-ID: <6c078835254b43ec82bf45db3b241510@AcuMS.aculab.com>
References: <20210831181505.1074767-1-kari.argillander@gmail.com>
         <20210831181505.1074767-2-kari.argillander@gmail.com>
 <5197939870d1867dd2131a8fdff8842b777c6016.camel@perches.com>
In-Reply-To: <5197939870d1867dd2131a8fdff8842b777c6016.camel@perches.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Joe Perches
> Sent: 01 September 2021 03:41
>=20
> On Tue, 2021-08-31 at 21:15 +0300, Kari Argillander wrote:
> > If we do not use kmalloc_array we get checkpatch warning. It is also
> > little safer if something goes wrong with coding.
> []
> > diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> []
> > @@ -707,7 +707,7 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs=
_index *indx,
> > =C2=A0=09=09u16 *ptr;
> > =C2=A0=09=09int new_slots =3D ALIGN(2 * nslots, 8);
> >
> >
> > -=09=09ptr =3D kmalloc(sizeof(u16) * new_slots, GFP_NOFS);
> > +=09=09ptr =3D kmalloc_array(new_slots, sizeof(u16), GFP_NOFS);
> > =C2=A0=09=09if (ptr)
> > =C2=A0=09=09=09memcpy(ptr, offs, sizeof(u16) * max_idx);
>=20
> This multiplication could also overflow.

Not if kmalloc_array() has suceeded.
OTOH the ALIGN(2 * nslots, 8) can also go wrong.
(But probably not if the previous kmalloc() for 1/2 the size worked.)

But there really ought to be some kind of bound check earlier.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

