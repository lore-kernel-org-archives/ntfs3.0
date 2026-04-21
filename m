Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217B01632DD
	for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776771359; cv=pass; b=of9HyeBmf49rONCMy5cuOvKwReYcrfjcHZMHKEg+izuyClIKDUlq3TSb/xyEhRPG7rE4nbBtx6CVJo8a86or+O8RHIHDhHqaknlFaDrkYOYK79HASL2S/wcFcpOzqgNRE53nOVeqpT0laUdAcu8aioAFuwgkke50Nm81zh1P5kA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776771359; c=relaxed/simple;
	bh=QKRrJZh6FGomMu0xBOPH5gwKTo43cXykRakBBOeXpyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eqw7abRZvVC2ZBr+lbYe8Aq0RkfezgLk7IaTMnhI3dAOIP4c+NzcMzDRmFjjQYy4aShomJhWcb0TVJQ1SPaPRfFEBWknJdvgtcIe9LxwKIlpBOrIZsorGbAHnwjGXXTLwyuqmwogkU7wuQ5C9c2jJZlT5V+5QR3HR9MvMokG+CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vSLCbS8l; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vSLCbS8l"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2303239eec.1
        for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 04:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776771357; cv=none;
        d=google.com; s=arc-20240605;
        b=NTlQHfhRegmJwOlZvMt+jtPuCt5y+fFVrNhHxooBM6wtjYFXbEql8DCvW19BlWZwxz
         3JtGnaMV9KhvI/1AnccpVdWoKJoiW4dIEnd1UXCDBxn8LMF1hwKv477/3cG0SJcOCOkW
         JQ0+2Qo3TPEjtgudIkve/eJsAadryz+wy54xgaQz7lu/dcc1n1wzABsZXFJo7Aq2TjBt
         pr/NvabkDCff0vVDL/Jqczw4CTstm34wN9HZ9TiYc9j6HDnFrbBa9tBNKYbGZ/KuBiJL
         82gucEX3XB135lKh/DeTkcoEK9r6wA+cXQ7uwiXk8pXHbcPVeACUgiiwPvtSlGFMD4L7
         VaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QKRrJZh6FGomMu0xBOPH5gwKTo43cXykRakBBOeXpyM=;
        fh=Lg/IWo9RUXaz45zbqBpZ3Oeer/o7zduGs/uVFm/E4dQ=;
        b=S/kzBLave+eENl2kaS9RvmMK0ZRgFmMB8d22ZBBA9w7nMXJdLDFUyIF2KiKJs8+Qq7
         iwSkEl9HfazmoEoj1kNQM+fJ/cfr52e4InKKr/pHiTYWnReMkUmUv4PXkD9X2hooKiqs
         JfTTxesNF0GlOgqGrcobVIgUabJuFoeFcytw6UsdtXHv6q/bQrh1aTc6lQd/zoAjNAHS
         8ZGA/zhvYr6uPDCZzGyFu7/dcbtYsS+b+l6Z7NTEwX+wNGsnTIZD/pKLf7fJh7rDhaGs
         N1yqFXKgZfiOhpyu8s/hYGZpAP1FaBbh0sZrjwTH8oOIubtuRcDiZZs8uPLOuVsFid11
         B0Sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776771357; x=1777376157; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QKRrJZh6FGomMu0xBOPH5gwKTo43cXykRakBBOeXpyM=;
        b=vSLCbS8lcarkige5smTJbuJoYP1TOPriIRWMDSMvKtNhlwwdINW6veGcfgSelZKpE5
         UxTeyIrFvYQyRrIvS6yBCJWIq9EL3QiHGxIdlw0igJaxQaUlVfB+Haqz+J3TpJgZoCkU
         DoxGyjBYgBm0/Q2b7Qs10Qwi70cXIP1Ml2KCHakX4rWE0zDTidLbC5za8nzyh1Pv11es
         hXsx3OXW5oKMzgfgnMYcoH3T9UWYW6a+gwWW2kpzsHnMLDxU9SKiHDRfQKGJs8VZjfcL
         0ty+C7DdAe9MvPu9hvo4ADfVROwae+DvDfrgC4NJ6tl7VuVb+47QRbXdoDDlr/C5+EX2
         Bk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776771357; x=1777376157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKRrJZh6FGomMu0xBOPH5gwKTo43cXykRakBBOeXpyM=;
        b=bRmO/jtyXBCxcyk1daTjILTstrbNdm9SsHgRY/WLn5+jhu+s6pl4hsMbTcw+D+8CnJ
         ngUhkG2fGBw1B5Q+pkK8QTb8qNmMWfF7PpBz6lqTK+1UX8D9lTg4ykuJOmVfoU4wOBlE
         TXLrPG6b04bNimnfMfvGZ7YXqaPcshFOE8VkFp/g5+xhF8NW4fdaTFwF2oSr9lw+ohbs
         mdd5MfRQj0sh1NW0e8/6AkbfnwA+RKzfHjCi5Lm+Kqbd1FLmFZKN0tNi1FsltO7YBgxC
         11l7Chw5MTWnypM1h+ApX/C5bmw2Juxvv9vszxeDihP+MCPiJlrsatxDXUCgwkVCwLGW
         DNCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VsHvS/Ab9wOn3e+oMpzAf8Au3LAZQBI7+hbaMghQ3nayafv8LvQIDYZDh49pdWpQvJga2/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YydJ/IdvY5S3yjMcecinRZ+TYyWYG8Xf2+9/MutqJR8j8lOt712
	VPgU42Pp7IMUn9qlgyE97YEkNg5v0p+eaqFlWuqntnnIA4cRiTImwiEmz0izdKMwlCu0tqyiMZX
	MR5KFFRKwvA0S9z9/pfJX55bNfWA3uQH+nSR74Bvt
X-Gm-Gg: AeBDieuhGscPAQyp+B1Zl/ZVb7UqVjh7EVOykGdJzoyTR8MpH8UNgj/yWtryguXOOFw
	X5CCgMPYtT4M697vJpf56K/LWLykMQqJimknXcGkh0VUBV0q1MXiIMs8VZmkbOoPTloNjS+EXHd
	Cnb8CnbCKLdLWbpUF4W3pa4Nx/PNOlmVzh7oN84jbjT6TQNFZDt/tQfI0MTnTotze7y5iz7GjsN
	63N8VUZeAI/1Ru3ybRpt7NoYyGrJ+1HkxdWmqDuhQjwJXloja2B6bBM4jG9GQCXNt3ove7R/+um
	+33HVF/rti+2WyPyynl38bmCF7J6LZr/mgU95/rruyD3Ym/T1CjalPBkcv4X
X-Received: by 2002:a05:7022:383:b0:12b:ebb9:1c18 with SMTP id
 a92af1059eb24-12c73fa739fmr10465923c88.31.1776771356649; Tue, 21 Apr 2026
 04:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
 <CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com> <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com>
In-Reply-To: <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 21 Apr 2026 13:35:19 +0200
X-Gm-Features: AQROBzARlJcRM7c87wqZhcOPoSoOdOMtbf2bDhC09Qv7V0NZ2Se7RQ9gD33TNws
Message-ID: <CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
To: Arnd Bergmann <arnd@arndb.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 12:21, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Apr 21, 2026, at 11:33, Marco Elver wrote:
> > On Tue, 21 Apr 2026 at 09:54, Arnd Bergmann <arnd@arndb.de> wrote:
> >> What happens here is that copy_from_user() is used in a very
> >> normal way to copy a user space structure into a previously
> >> uninitialized on-stack buffer. With KCSAN enabled, this passes
> >> the pointer to that buffer into __kcsan_check_access(), which
> >> takes a 'const volatile void *' pointer. Gcc correctly notices
> >> that there is no way to access the data behind this pointer
> >> when it hasn't been initialized yet, as both read and write
> >> would cause undefined behavior.
> >>
> >> I'm not sure what a good solution would be to avoid this,
> >> but I assume this should be fixed in the kcsan instrumentation.
> >> I tried changing that code to pass non-const pointers for
> >> any instrument_write variant, which does avoid the warning,
> >> but also adds a bit of complexity, see below.
> >>
> >> Any other ideas?
> >
> > Indeed, the below is rather complex, and seems unnecessary to me just
> > to suppress this warning which not even the whole kernel enables.
> >
> > How can I reproduce this? GCC version? .config? I can't seem to with
> > an x86 defconfig + CONFIG_NTFS3_FS + KCSAN config + GCC on linux-next
> > (20260420).
>
> I ran into this during randconfig testing, I have attached a
> reproducer .config here, but have not tried to narrow down the
> configuration options that are required for triggering it.

The attached .config is a KASAN config, still can't reproduce.
