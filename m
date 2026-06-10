Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA6435A3A9
	for <ntfs3@lists.linux.dev>; Wed, 10 Jun 2026 11:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090337; cv=none; b=N+CBSWZ9DpVcQnxS3RZSw5MlJ1cgSUCaAnPTXB9p0JIH3L8rkQBxqdvsxMvdGlLJunPBh4CV5H5QjyuJlREA2fkB1v+2RR2Bcd50c9XpLd2+Q21n+MbCaNouVDt87BtVkOu9xS2kFt/wzsR0Kli1xvhHozoEz6CqOeoK3XNQyLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090337; c=relaxed/simple;
	bh=/xJAU+Vh44qtZKeEaAzE3XWLaRlhsMTeKzzUgjCMd5A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tfn6dBGmLaqQVdVlEHjJVci836dW1E8fJwR8By838ZgHPdLu4B4mgHZKnfF8r1QpOIWYUl5KPgZ2oMXg3fRRFZO3lV3kg8T1aSHVjzbGw7BZBG+ByZaDRM03E7kOjza7zB9ZAd+TBsmpexULPdVC5gEt2jARzGGNsVH9h/gJbAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=lTN0HxSQ; arc=none smtp.client-ip=178.154.239.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="lTN0HxSQ"
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:1199:0:640:2d84:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id 00358C16C7;
	Wed, 10 Jun 2026 14:13:32 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp) with ESMTPSA id TDI1H0McHSw0-8MyCV688;
	Wed, 10 Jun 2026 14:13:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1781090011; bh=sJEPv4dDqxTCwq4tGbEbaYF+Ira2gudaFsRz+ABSryo=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=lTN0HxSQPLlVd03Fp+QWnE2Q6WOJ4tl2ZoAXLqEmWEBJHDXLDKhoseTDkFoKPKZ1d
	 KHHjjEcKPtWR+TNJFA4zBAUrIDLz6ZsVYJSnppX7LneLaXHNFQAOGZObL4GX5mSwAb
	 PfEeGkVPJOniya0hVr4Ep6T0ylnHdd7OG9210GJE=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <8c04f27f7572b4a5d675286de4878bf5b1612bfa.camel@yandex.ru>
Subject: Re: [PATCH] ntfs3: fix info-leak in ntfs_rename()
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	ntfs3@lists.linux.dev, lvc-project@linuxtesting.org, 
	syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com
Date: Wed, 10 Jun 2026 14:12:59 +0300
In-Reply-To: <20260609230842.GA3766471@ZenIV>
References: <20260609123618.712961-1-dmantipov@yandex.ru>
	 <20260609201948.GK2636677@ZenIV> <20260609230842.GA3766471@ZenIV>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-06-10 at 00:08 +0100, Al Viro wrote:

> From the syzkaller spew it would appear that data (filename converted
> to unicode, AFAICS) somehow gets returned by read(2).=C2=A0 If that is
> accurate, I would suggest that the things are already FUBAR and zeroing
> is not going to fix whatever underlying bug you've got there (metadata
> bh left around after the corresponding on-disk block got freed and
> reused for regular file, perhaps?)

Hard to say about copy_to_user_iter(), but at least the first splat
looks correct. At the end of fill_name_de(), data layout is:

struct NTFS_DE *e =3D buf;
...

    |<- data_size + sizeof(struct NTFS_DE) ->|<- XXX ->|
buf |-----------------------------------------------------------
    |<- ALIGN(data_size, 8) + sizeof(struct NTFS_DE) ->|   ;; e->size

If 'buf' was allocated with kmalloc(), XXX remains uninitialized and
passed as such to memcpy() called from hdr_insert_de().

So using kzalloc() for all buffers passed to fill_name_de() looks
the simplest and most safe solution. OTOH if someone would have
said that an overhead of PAGE_SIZE'd memset() is too large, more
fine-granted solution is to memset() XXX only, i.e.:

diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index b2af8f695e60..21e4a2a34389 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -22,7 +22,7 @@ int fill_name_de(struct ntfs_sb_info *sbi, void *buf, con=
st struct qstr *name,
 {
        int err;
        struct NTFS_DE *e =3D buf;
-       u16 data_size;
+       u16 data_size, real_size, aligned_size;
        struct ATTR_FILE_NAME *fname =3D (struct ATTR_FILE_NAME *)(e + 1);
=20
 #ifndef CONFIG_NTFS3_64BIT_CLUSTER
@@ -53,7 +53,12 @@ int fill_name_de(struct ntfs_sb_info *sbi, void *buf, co=
nst struct qstr *name,
        fname->type =3D FILE_NAME_POSIX;
        data_size =3D fname_full_size(fname);
=20
-       e->size =3D cpu_to_le16(ALIGN(data_size, 8) + sizeof(struct NTFS_DE=
));
+       real_size =3D data_size + sizeof(struct NTFS_DE);
+       aligned_size =3D ALIGN(data_size, 8) + sizeof(struct NTFS_DE);
+       if (aligned_size > real_size)
+               memset((char *)buf + real_size, 0, aligned_size - real_size=
);
+
+       e->size =3D cpu_to_le16(aligned_size);
        e->key_size =3D cpu_to_le16(data_size);
        e->flags =3D 0;
        e->res =3D 0;

Dmitry
