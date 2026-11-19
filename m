Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109669;
	b=C80+jXeLq+ZUfon/lVbkb0oQzOsiXKHyV2sXPVtZavBs7ElLBE+UdDwAq+bATmv9iaZS
	 /fDUYPgP/DqrsFkGizsFsLcOSWR2DMHJcuYoVvxzL13KPhnUNmT/Ac2UgXK4uhTQieZDD
	 JbEE3ZQbBbq85j5VpPDYyBs9WXFlIb8Xieutlu56BT1cK7lTSlLl9CLEtQSBZtqHhnNoi
	 rkvenL3Y2I73aIPq1X/77NYnLqUaxA4bhBpLflEPFNdeERCFTl5OPwYPWqCsckE5qIpaD
	 IH/Ie9/jXVTuJgrNZp5ZwCvyMA2y/WbMj65Qj/H0kPEfymCRpzyS7v/Z8PGlU2Lgc4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
	b=RusQE7Pva+VTyRbC+AaVZNqZDrGtExEBQ4kgmyzCrkJZ/1Q5nEpCp2vrq2LNsC+6lebA
	 ivsC3M7neNh36HMJhfKIk9Qd19tJaIWbjXkKDxVxuAVIQgQAkDlTFnHJqToE5q9EOsFSl
	 TDrgElUkPzVN4BYUYnISRJeO2KEoNO5rlpRYwLZub1zRtlU9559Dw1fv5Sv87ZhoXrBmp
	 QJTjnulguPqg4wXvVM/8yFvGxKpjFwZlEkZoDfmaxhr8MOQFxUn2x3kjOVs8GupD4ENmm
	 7HcBbg633tngJ351048S5s1hSMOS8rLjXhj6TBk+0tc3LUaXRFWR/HO3kplTfQBQ+rQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8ebf+74;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ADB606A331
	for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 17:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7ADB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8ebf+74
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso2886936a12.2
        for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 09:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795109667; cv=none;
        d=google.com; s=arc-20260327;
        b=JrTpOJ8wzHkYVkCmck9PDpEJCU8t7/wH0TQ8xnA13T3jynsTy8cawZGDmmJkxZ+RUE
         v4wGHx4227I/uzxPVQW3Yz/WUmTP+FfbVUI5hPoKSXT42XMihy5eCWDlqGYtM6HinNgy
         aptQyjBvnfAprKkJCG7/96HhAf97E+wHecUKE3ffM9nn+IjSWhZBs99V1sMMDBs6ADD0
         LzkropHW06YCDJpgZBly5I7JEgEDhLGyPFvNro8cfr4jV78/FXzKgoIZ/VpGvegE4pUz
         /V8v+X73alB6LiA9AEbHPazu98vy+WB28Gw12IZDYvRow7Ga9/vT/nk9MBRZC2cC6uOo
         KQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
        fh=ijQzeMvVKLkp3ArVbT7yVq2kgBWGvA3cIET+wbH42pc=;
        b=kM0MBWBMGthwUWH2AV2e4Wwa2Czhe2HMvZfvqgAPk++6CxOn9Dsl5CCHYtC0mM2g0i
         F6qiHvBvVRzfgl+OUrY1c0bj3kHswxPxY04fzHp8RtMterx+b29s2eRU/J2tuLNxRoGl
         XBDqncUIkHPl9DXDN3LC+vTHfsv7gHNiZorrbW1t5jiQufIrqnKrSgFwZIs5LmEl8Nzk
         PJhQuLB5Js3wC8//vgbXap9wlSUhG27BZAHYrcR8D8R0DgTKK3j3MBBgtz9ZeTCJ7Z5J
         MABT4BqfcI3bznt6W7TR1q3n+c7/6yXuxJeyxxIIN4uVAl/ph3rDHl4hvUWK/O/3ASUb
         LyZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795109667; x=1795714467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
        b=I8ebf+74NWTXhV1uOxx+PK6uOE8+w4xF6Y+ajETKb6ZH6Oed3RVNpRcreUSBdPF+6s
         KJJ1OSZnI8tqZBuxTgiwreV4EZJYRsxB2MKaqaH9flB968rtPRKyl1xjguizs2dgpvBt
         3Jny2U0T2rIIEX/eaIZf9KAl6yE8PuBs6EZZehrmmnsJObkOPiMg+aGyefBjLXbmyGgi
         ni6EyUqV+wTK0VRLXBiYeFsEhr8gbU16L+ymYmuon8eF1aCwROKu05xiutx3Ji8ZQBLp
         YqFhZn3Fl70ldbDzwNDTQTECBvwcWAFskWYEteBxnR5wMFcKE3IKyC7N+B3IfcEcU1EW
         S6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795109667; x=1795714467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
        b=qpyxCghAy0XFWbxY9BhBGM/BK43Lu8fuATjzDbIiKfdmrgCoEdkZ8JjTHQ74/TqbFS
         r96xnNteXnjMWBCohdB31Ktuzje3mzDkN3OBrPk9xa7lCpZuERcBMYwwyLC11dyl3Prs
         zudw4/M9++qPB8eAfsHMr/8I9RzXDCksXh0zxeY2Fk+x/V8HEd/auvYupS6ChKJr2XYR
         N20+MJhjlbozRU9DlhBqCV4lLve5ikE8t+M9b8akB675M6OK9XXd2n23z/76vc+oS0St
         51+QlN07rIT6KIKxf5QfmAOxPABPU3pUdWx6KPpPVmd3GbvFL508dbNTKBDgKiAI0ydA
         Rw9Q==
X-Forwarded-Encrypted: i=1; AL+hErFb4b2bc10ai1fMW9PREjlQahye+b75jI6p/1/QoMzGurwaix3XA1NJS7Zg9kX1siBecaAALg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8oGBrDIR1ZheUX/64YSilEbThUEKPrh4/nPgkyWhqEda8jD1M9
	PiUwJsmkiT/a7+qCbt2yy2wAKI058cDMYEE4IleIzvOHEijjFWJ1xj7hivv5WmxnuAO81p8Fr2a
	cahCzsyu1aSFqbjqevb1G2F+FBx++pTM=
X-Gm-Gg: AYBFou02KARcdyEW6K4ybRAKWK+NAqQojVzcFG+elBIlG1x4eGUV+7GKS9fuyEYNCw9
	gj6L0/fiQNmYp/+zPBv8JK2f49UlLteKnufEdeOD6CubFtU2eHPBu/zT+aA3loGAtA+bbBYCfBt
	9Fhi+ASizxSpbM/3HQT/dEBBIgy4gK3XjX4fbU4UcgNax6RMZpb1ejlXvGKM8c9Fi1Uwk0lMohE
	7SoZWeQCk4jFA/GhZOK0cOz+UcMSl1L0j8EzUAzD1CiqOie8Bb5N0pAihokk5I78fGXx0FeGoyA
	Jvvdm4GYvDIa34ndobGDhH1AeOkzE3YEAVV7q+gdflL1hUOGVM4QGDbVbzfEqBc+Aox+18EFSFV
	vidpPB7vtSwhEcs57z5MR+lpraIyVFaaALrtejMsVKmndrMTlD4Vmr9TPggSGapRkYxOD0A==
X-Received: by 2002:a05:6402:70c:b0:6b8:7d98:4826 with SMTP id
 4fb4d7f45d1cf-6ba37d5bf0amr50117a12.11.1795109666761; Thu, 19 Nov 2026
 09:34:26 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-10-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-10-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 19 Nov 2026 18:34:14 +0100
X-Gm-Features: Aa3M54rix9St5Car4447U2IPLFR0HdY95bNJiBlGTi0-FAZstJdvxSGCP5IQDxw
Message-ID: <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 09/10] ksmbd: add provenance time (ptime) and map
 it to CreationTime
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Implement provenance time (ptime) in ksmbd, as introduced in a
> previous commit ("vfs: add provenance time (ptime)").
>
> Map it to SMB's CreationTime, making it settable by SMB clients. When
> reporting CreationTime to clients, prioritize ptime over da.create_time
> memorized in the user.DOSATTRIB xattr.

That doesn't sound like the right thing to do.

If the server stored a CreationTime that client had set, you cannot
override this.

When the client sets CreationTime, the server can decide if it can and want=
s
(may be a policy decision) to store CreationTime in PTIME and not store
it in user.DOSATTRIB.

Fun fact: the user.DOSATTRIB format also has a mask so storing the
creation time inside it is also optional.

Thanks,
Amir.
