Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795023477;
	b=5H91PwxBoCHg6aQHHMMqwqvGWIoiSjMo+fPKDMvTF0FIvmuK6lXoV33C/AOymUgq86Tx
	 9WMqpAfnMI1vCitS/96fE/HQ8vWRU50Hi7x/tt9ryzAB8iwOsGT+R+6AZXEvcUxqzPnj9
	 SR+2vaPL94IQKbJ63GMzvhj60m51WQ8+75Bf3ubTFwq9C+f/u9KTL41nedSuKNFcvVJ//
	 rPG5qpAiIvdkHZOcwY6vOTGrVgxVRwcrdOaumiDMYuPsyiwBrIxDZXtyT4qBv6jzn8God
	 X0+M8akXKu5J+FSa421mULsOKEu0j/k9QRPjw//kWJ177LgGLrKV2zFL8szqXQnXrTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
	b=mQmOoV2It4Z5ZqBrAgxsgosU2bVkwe+Ul/HCaKUAEcsWswfALMIT5muTGZ9AWkQv6Ogc
	 vL23WIKkAZgsCB6arz+xhPDIOBshDqUt9NlhzsPtvDn4vT2+G1sDl6n2ptV/18ZPLeWhp
	 Ujeoi7u6kyuZqeC+S7vq42fTV062N21eRIG58bnVxuS6QynHHV+qTLumvFT7OvvjGQcW9
	 g0Rg5LQXVKniYTtbO48RU/KP0WzX43QDasrwxeUVNn35wHYMMe8eYjQ/gjqeX3OC0L+2z
	 tc3p2Dx+wJkzkFE3FDZzlGjaDpI521fyI6uFCYSSOxnygQUzWMC6osE8bdmb5rqGDyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IeiD46f/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C2C606A337
	for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 17:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3C2C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IeiD46f/
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c40e30c26a4so14887666b.0
        for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 09:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795023475; cv=none;
        d=google.com; s=arc-20260327;
        b=Lfog8bgAgqsZaJY8MrbZjX/N5SnPxx7jE9yB6LYWJc4HJ+LKCME9gVAM2CjU5VVeSd
         0ATo4zbLPHWyV0gmN42xVc/iusKnvRJMiLVF/5giYXBXgU87UZ+YF2M6JVVjFbwnBoEa
         X5wnhy6O20Vls05ivU5z8I+DpG+YRFRCJFS6sVVCNFwvcNMaNTF+cmk76GGU225F49bf
         rZ2KK6JdWEypnpLb4rnHUPOAr/e3P036NscosbZ0vHzZl1+NAQqexpHd/N2zs6V4I608
         XoLSwIvvd6hz33/WVsCP2u8+DBcvz8fHFdBY/S1PzXbiUY6+2EXZxtJBuMZeGU4ZfRK+
         20tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
        fh=FtxpYxpaf/ooKSjISvUCQ9g5U4K4KsSWT2Ahpbo6GqQ=;
        b=pvxtLVTlTWmH+dEbWgxdJ8rhDlRL0aHuiVW6ClsAJTI/FjgPk1rNRSkEYUEbmmxUyd
         TAzy/X4jrutqXRQ4yjDNHaduA3C3D+Z4vJUWw7TL5pSDvQcTiACAm3E27IrAI5FLdPX7
         w2ywxOjjCULzpiScIXUogE8TKX93oo5iahW8rJmnP9zh3wF9tG6PeG8yzNZe+WQQ+J+a
         yzHqfuG8xkUK+EZ1BqWs1Qg4beLx99/Z1Em4sMABsLMAw19O2X7/s/lnu7JkWkLxQIOS
         cCx3L/HYO78dHnGQhoiahrDwz1EMEW/oXWQHTplPk9RLKrPOxkHqVMw1zYMN+Q11bQoG
         MBTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795023475; x=1795628275; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
        b=IeiD46f/ZOCzpenVG13OU+DVKBP4yR5hi9X6nHp8VH0lhDE97LpihaRufh8JcJbapA
         8kyliTGIg4+7ANxQlCqgUmWxh0ovV8uT5DPVjEIF0VCuCXYP5vGOiDaWO33/xrFdmrG0
         qdGW5kWBWFBDlI6JfX2tBdcnFfvRiTexV+i85A4GX6I9zWwqg8eHlB+kIM9HVKS7FnK8
         k6RwMIjpLdYKFrkRdTAzj6VH+ZMDZUGmdzOzoQylz/3c4xb+l9obH8OCEx9A9L6hW/eb
         sJKO1/ZFQIIkdotbpCAtbosCz/6sCleJGaOLdc7ie4vUkY2zW8hhq+91GZJZXgSYptM9
         ESXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023475; x=1795628275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
        b=O5wji1enN0nXaDSO0AoSFb3xmJXxMN+VWWgodBVNGtvwR5cN2Te6lECc4vDx9/XdPw
         Xy2KhsNS5T4lLuzFFiANkApprA6T1y6aq2f4bk0nDI2Vu7V1luPNMjcUi2QNQyuXaOEB
         3MdVsFRXsFJX9D0Zfgk4x+eeq1eXGJxpdlEcFdKpWuaNcfKE8gffxNT+uja3gLAmN4+f
         eEcwDBDrIK2n9XIA2qu5jLH0+isJ/5m2P0sbRpVDNBy3zLj5ZIaxXnXyczXpTe5soPmy
         ZSWv0v+M3hSlyq7r2OCxslUf1jHS2JVjfipTXF4kOCxe3avtY/XVY0s8oA5WWu33VzXe
         rNXA==
X-Forwarded-Encrypted: i=1; AL+hErFJWM5OeEGDUfH/0EmfdpKQCbx0jOzmjsINx4NojE84brcQrNJGJRf9ofaxVMCnuKNIJwkAiQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z82TvEXVyW1NSipE4f9aSPOj5OEiSXrUwtUWfa3GnabuiVxiIGD
	CBano054HthXLsoAej/kSSp4YXpe2VPZm8C6Ub3Kc3ttSPI8oHQXFt28pkOQyRpln6W9VXG+vBd
	/gWGXOVjxh3s++OQmbpo82LbEldc54LQ=
X-Gm-Gg: AYBFou3g7HSz9fgD1fiIt1fGU8aapxZ8wyqubjmScUmTzsCPbLqGN0fHfUgHQVDJ8wi
	BWE/PCJXKXPpY4hfJbwfPU8D9LKORyzRaw5vb38j92FCQY8+JyibpwO++rimwzN2gT55ozFM0M3
	pe2rCTZTnrmjbKm2fYwCd6EyjRoMhTRAZiFVQTMASiyF2syBgqqIgEE1n1fzmj4QGgikU828Syu
	pVKogq6yK5kwcNWedQ/08+4NKAMaFZMwzgGSBCVIBK/AmgjE5L8dEEHGbQIgS1g+kh3Dle0M84+
	AYl8EV9/mvt4dpo1UfFmpZCdi/v0MlxiNRx5K7CJKLKrUGlwu5surl7xlHvTYqa1OkUBukSs27Z
	brE6OxOniRC/4QhsxHiDWFltz+lkCX+2MqKVpDDUAtJAbYhiq/+7yQG63Zzutd4lOYjquXA==
X-Received: by 2002:a17:907:da1:b0:c49:b6db:1 with SMTP id a640c23a62f3a-c5126364307mr15604866b.12.1795023474965;
 Wed, 18 Nov 2026 09:37:54 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-8-koray.fra@gmail.com>
 <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com> <CAOQ4uxhpMARO_ZMJDeoa044BwufLVnS0o4Fv0abBF=tjaZmtWQ@mail.gmail.com>
 <cd49ce48-58d7-4341-b4fc-34e63daf3c52@app.fastmail.com> <CAOQ4uxjme9sJ5LGNDnP6rEKZLTJzX_ZdcMohgu2iLULK96GPOA@mail.gmail.com>
 <9c4a509c-b6af-4da1-8a64-9d5c26c74bff@app.fastmail.com>
In-Reply-To: <9c4a509c-b6af-4da1-8a64-9d5c26c74bff@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 18:37:42 +0100
X-Gm-Features: AclHuK9j8na9qQXXbOgij3n-j2Bo4JySgielhO0fgIJ-weX9anWXgtr5UxF7Q-Y
Message-ID: <CAOQ4uxguPD+PWEUZtAzSdA-15d_C5cn=34ZmCm0v_b0MWK_sfw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 07/10] nfsd: add provenance time (ptime) via FATTR4_TIME_CREATE
To: Chuck Lever <cel@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, David Sterba <dsterba@suse.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:14=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
>
>
> On Wed, Nov 18, 2026, at 11:36 AM, Amir Goldstein wrote:
> > Can't an NFS client be connected to another NFS server
> > implementation which does allow this?
> >
> > I can't wrap my head around the problem.
>
> You already named the problem in a previous email: What happens
> when the NFS server's kernel is upgraded from an NFSD that exposes
> only btime to one that picks either ptime or btime?
>
> Clients will see a file's btime before the server restart, and
> afterwards, they will see a changed TIME_CREATE but the file's
> NFSv4 change attribute will be unchanged.
>
>

Indeed I have.

My newish proposal (on cover letter thread) is that we
abolish the ptime/btime duality and make mutability of btime
a pre-fs decision which is advertised via the get_fileattr() API.
So from the user POV or nfsd POV the values will never diverge.

Thanks,
Amir.
