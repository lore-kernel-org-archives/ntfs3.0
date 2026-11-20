Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795154626;
	b=jKj4p4rq9AgF/aBTmZh8II1m5jmw69HaPvhZ95YjCsoVPd631vS5a0MfpafDH6aRO3Hr
	 D6xUkUtZXRFpTiBbCAUPPquToHY0vj2O4stGgVbqxnzRUaKQaOIPbsKQ6APLsE8pqPgi8
	 kE8Y3cQCN23Z2iqOCfhAnZxBPwb57ynxPwKZt0Bp6+OM3NlcUfh3dDeerPEWIVeDT/dWb
	 A+luHsOjyxrVw9I7w76S+TZW3BZxSZWFqbKauB2efCc8mTAnuagEZ7giknV3ZyceFEgtb
	 zT+40zYOV1DxBfC+bZMVK6Uy/QnbCB2yyF2kcq17jLFLGZAFaXm4KD9tBQKlNYwbLDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
	b=Q8+q6E/+DYq3fBPFFDZDhHW3VBba8uJRSjoEIlzCgfnS2McjnahABrTI4dqUs1+IJX2t
	 c7FDqWWEo3HlcuF/nqeUaqpqvGiXPVrK9djXSNCrxi8lza2m9KrRPzREo65ZHAfur6Y1Y
	 jWMCgBKnNiJI0x1IfNhMc45vb83dzOVPNjVeFPpTcfwZ3+GP0in/wbQSDq4cBqkirg7e8
	 W0hQEvNids6VAxCKB6c+Mxofq+h38U7G1HCxETWtTD1gLCbYlptDt1a97Kg2Bj33wFUa6
	 Kyydz0F8t5nLOkPrHtcWtJA9gH20i+zSt7MLVgVuUGsPInY7wAOoc+v8HRw886HOc6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVeX9UX+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6BC60A260A
	for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 06:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6BC60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVeX9UX+
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso620606a12.1
        for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 22:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795154624; cv=none;
        d=google.com; s=arc-20260327;
        b=hFM33MesXJO0Q6yHBrFJuEN92BETDpE0GhqETDHxm+P6WCJdk5cpogTkOi2V+BZ3gD
         Z/2jYMPWArA2bKjCgqmorlx1wXykEGipF4ySm1CxxWAkJ9mve2G0RsBHEOhuddDvSGEf
         ibbhfdo/zhHpeHB819U+CFvnR0sUXns4DFgYVjRpnb2iyXxq3730lT44Nkq0cDrrpczG
         Na66PpYc3nsOQCMf1NfHv8FNyRxxVI4T3f9WkOAe1kbtgTDZD80a9+7tYZJomPm0olej
         xzkDSLar4yXZe92r3ywFVcX3mVTNV272gZvQ75rHuc+2RGOGnkDh1zPQ13sH9x4Fwcbf
         FGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
        fh=BC068oG/2B2kC/NloBz1IsAIK6u44UQ0kPVKbGZTl1E=;
        b=sGzyRLxBEZ6tF3L8eeRfB8htEwZlEk4wBygKw/2/oclP3cN3wL8kFefU/VXdmIGbbX
         CzrrQaQJPWCy5a6PJS76zfsbRZHeJPXVDU41TURmJMdmH5H9QFo4v5YSWN9q4wkGGCeI
         Hq5W8sIwYyABn3YKs+QU5dvl1D1h+ncOh8ecBPTGhrEOT65MgWOi4/XQohImipvhoEWi
         aNb68y7KIWrlen6+5/OCBRZR8VPxoASL580lt3YqapV9Atcoz3XBqOT6JWI9AYNNApC6
         nK3VBEEbBjPppuxfesFTTZXIMWRCAlnPQlDMOHnNLtTuN56lEDvJoK8cba8T4Wk1+NaQ
         TrqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154624; x=1795759424; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
        b=hVeX9UX+rI6jwmkihmnDnZT3+LzNCvDlEb6RYKbY60O66wTdySvCCXyql82/+nW/jb
         7/Up0yAUL/qW9DQeBADpCl3D14RxTOZTHeln3SvWkte35f5WSUw4WgE1i++6+sY4asuN
         EtsxdThQ8I8DqWQK2VQNlIaGa4vlR91u17MstSsZysc/iAseLXxwWjRhbm/K2yFAckfV
         Qjr+B0bZGlNknr7Z16lnbSvmpa7IyaFLGvrQNaBQ4SMK9QVAerfZQWOKU3XR80ECJu19
         /UTK0bvKRQa63t1cDCSZ8roqkqPaTY5Kz+ZgEBhBTOaZuA7kmIhL2roTPHpFQ2moBeZ/
         ISjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154624; x=1795759424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
        b=J2x009LeJE9JRRpj5o1iM7lLQD0zp0o8O87fPjpMCVkep31QN/+OC0QYaAn71jxLU8
         RcvUaGs5cpoZAm++ZkiIMmSVNMWdk87wdUSv5gvCcsW/g1gelc1QT0hWzEdXg2pUMTBD
         WprS5XUBCawOEWemX7OzmqKQZ50zUfLco8A91vMqKHPw96SFPTVh/qTqhjcYaPnwGlO0
         53KSv3CjBA6M2ti+cwdq/6XA9GjJbW4r477fE8UGXvYpchxs7oViwOpLhv9akjhaMAiC
         LR9i/snqSUoLNlW/rnoDSZ3HrO2V14y6Dc78cv4ZBh8KVpuCvNmSgCf8l0ughZnSy9RF
         xUDw==
X-Forwarded-Encrypted: i=1; AL+hErGy2i5IgOsSH8ZkNp7nglDtbNkmuBK7cYHEYb1IohNcbqE5oKLKIkHo3tTMxRIJGsNv56Y8Kw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/sILVVIyjdZ+mJT04+8Ztl+Jo+ju3w6oxBjL3FJNt3MxsnzqAD
	eIy8+Ke6502vHQJzDfdeGtV8hMiFS4mUbNOTb7WeHI3ajTG4bkGxjaJjO6V7PRI06yIkMJNnaKP
	CxC039BQk1qINex3+Q2pEweaTEs0DNAs=
X-Gm-Gg: AZFdTZd83mG9jVcqJ3K/fuWlp6wRpnS7SjFvi7GlFJtRKuwGzViCrRiv9YR4A/4/kCy
	eegbCtepczN+5DuA4WOm4F7/2IX+RJkaKAv2VUEDvwL5YcechllpaS+SxWoiLFl4zErmwyhcUSX
	gQO4jh/3c+VlqAmztX7qiuto1/MW/uYH0EEBZnWZ6p9ToeEZseDXqzqh+5FeWkS31O4lZ741wu+
	BjhvKQ8QVoAQaKFPTOj81LqWQVQ0+IeJM6P2hy7ObDRRGBTR+nuEimzgw0mzKzGGj5AcsLBqAJi
	wTih8uRM2yQbV3Y5/aifpX4FwpeNUS1p6jV1WCfJI1mllmM1tmtbDZwN/Vi/1Dvd6P6BO1KTwEM
	wl978yL3M9dyDzCkjg3VTtfY+wS7qaoR/bpaAqn2ivoKiFcgfqs2R7GDzncdHMTmQXOAH5q74u0
	4R9U0KQpVTAt/Pvf8=
X-Received: by 2002:a05:6402:e06:b0:6b5:4f5c:cb2 with SMTP id
 4fb4d7f45d1cf-6ba37ec320fmr1108851a12.34.1795154623771; Thu, 19 Nov 2026
 22:03:43 -0800 (PST)
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
 <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>
 <DMZIQG4U1NTH.2IN0S2YIWEYTG@gmail.com> <20261119220936.mssmaixcorn2gzli@pali> <DMZJGB07CO56.IZ20OCGGH6C@gmail.com>
In-Reply-To: <DMZJGB07CO56.IZ20OCGGH6C@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 07:03:31 +0100
X-Gm-Features: Aa3M54rvTAbJYlhFUqobPAqFrpuIqbxGTrlnaPynQQoE0nz09X_6dT10Gv8Q47Y
Message-ID: <CAOQ4uxhqgsh9ahJsX7C4YyZH2n_r8VwOe9X9jZwsKALCoYvyag@mail.gmail.com>
Subject: Re: [RFC PATCH v4 09/10] ksmbd: add provenance time (ptime) and map
 it to CreationTime
To: koraynilay <koray.fra@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
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
	Pedro Falcato <pfalcato@suse.de>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	exfat@lists.linux.dev, ntfs3@lists.linux.dev, linux-cifs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 11:25=E2=80=AFPM koraynilay <koray.fra@gmail.com> w=
rote:
>
> On Thu Nov 19, 2026 at 11:09 PM CET, Pali Roh=C3=A1r wrote:
> > On Thursday 19 November 2026 22:51:26 koraynilay wrote:
> >> On Thu Nov 19, 2026 at 6:34 PM CET, Amir Goldstein wrote:
> >> > On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.=
com> wrote:
> >> >>
> >> >> Implement provenance time (ptime) in ksmbd, as introduced in a
> >> >> previous commit ("vfs: add provenance time (ptime)").
> >> >>
> >> >> Map it to SMB's CreationTime, making it settable by SMB clients. Wh=
en
> >> >> reporting CreationTime to clients, prioritize ptime over da.create_=
time
> >> >> memorized in the user.DOSATTRIB xattr.
> >> >
> >> > That doesn't sound like the right thing to do.
> >> >
> >> > If the server stored a CreationTime that client had set, you cannot
> >> > override this.
> >>
> >> Ah, yes, but how would we handle older files which get a custom
> >> CreationTime both before (in the xattr) and after (in ptime) a kernel
> >> upgrade?
> >
> > Just to note that this problem is already there. ksmbd can export for
> > example ntfs filesystem on removable disk. And this removable disk can
> > be connected to Windows machine which will always only touch
> > CreationTime and ignores xattr DOSATTRIB.
> >
> >> > When the client sets CreationTime, the server can decide if it can a=
nd wants
> >> > (may be a policy decision) to store CreationTime in PTIME and not st=
ore
> >> > it in user.DOSATTRIB.
> >>
> >> To fix the above problem we should probably keep storing it in both
> >> ptime and the xattr though.
> >
> > IMHO for a long term solution it is better to not have duplicated
> > information in xattr. Because duplicated information are going to be
> > out-of-sync. Windows NTFS driver will not update xattr DOSATTRIB.
>
> Yeah, to avoid out-of-sync issues is why I made ksmbd prefer ptime over
> the xattr's CreationTime.
>
> >
> > For me it looks like that this needs some policy / configuration
> > decision done by user. We do not know if the user will replug that disk
> > also to Windows NTFS driver (and then those xattr DOSATTRIB could cause
> > out-of-sync issues) or will only use it from Linux or Samba and then
> > xattr DOSATTRIB is probably fine.
>
> I'm not sure if this is the best solution, it doesn't feel too right
> to me, but maybe there isn't a better one.
>

If you ask me, this is not your problem and I agree with Pali that
this is a policy decision.

I would not include this patch at all in the series if I were you.
Maybe as a demo user, but you could just as well include a demo
user application.

The nfsd user is a simpler demo, so as long as the nfsd maintainers
are on the same page wrt the mutable btime plan, you could include
it in your series.

The problem you raise with DOSATTRIB xattr is similar to the problems
that Chuck raised for ptime vs. btime as the source of FATTR4_TIME_CREATE

Thanks,
Amir.
