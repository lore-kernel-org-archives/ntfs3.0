Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2407383B2
	for <ntfs3@lists.linux.dev>; Sat, 27 Jul 2024 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722112479; cv=none; b=WiZk1cQDzkAywXkR4kdqNCUOU0S49vYMJbrzUaX/R4ITw6UE6uWdi9C1CSciH95ptWnYq+JDsLUoebbVXnJL7Gxi+Cv2AFB9FzbCPeF69cC4gDWQmhf/zYjX2Jdyt4LkaHZ6YRbafJl3m7ifmDJuYH+mzbP4aopXwLkQ4AlTEeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722112479; c=relaxed/simple;
	bh=25ubHhOC8c8qpaTjt26BLzLWCaS1HbXOnlZsVoW4H7c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=I0MlQHuoR58nsDo2ap62Ap86beGT/xCRfD7JVOo+1OcQyg37hD8nn6ZPrURA2CdmP24++F36Fu8TdBoozcDaKLxSVTpNSgn6OJwPiq8P3XN8FF/J0/U6r4Dl1pcQ9D2Uonc9vgVMgsbxNSnvCXsJrZnha95PH1uZ2ADemSPWJ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCmeq9gd; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCmeq9gd"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a8553db90so361353766b.2
        for <ntfs3@lists.linux.dev>; Sat, 27 Jul 2024 13:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722112476; x=1722717276; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4G5wnasEtIttFpmH7HbVuUbGXd2GNiiVVlvdmiWYHmg=;
        b=YCmeq9gdqdVSot+DF/Lf+30Mi/MTFDRtb+m1rsg54AtNkeuMZ9LCy4Ktjo8GyJWe/I
         MHjclw97aByaWLZrz6gxh9fVIRf8MQhMrzQqmEIUVTwPd4Wu0ptk9GKQuKH75tn8N7cO
         AsXAi3CvajNIX0O+h/WFHE6n62SySsriwQFLdXv5HKQOzrLE0notsGoyta4pc8nItRij
         OK6cUrzMnMgneVONNyqAHKyEkvv/baWRAWjG1r62qESmdatq0Aw4Ds0Brx/RS/CNSCZc
         eIFvZEmt5IXbHrhF1hC/gvsEPD0lntzJUPQSVPmrZ6ylvsxJo6eJE1ALpa2vWgZuOj98
         40Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722112476; x=1722717276;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4G5wnasEtIttFpmH7HbVuUbGXd2GNiiVVlvdmiWYHmg=;
        b=rjJZ5/k+vStH4+7BrpvivPSJ8lgMKKKZDxYFh2bP+mnGB/7PlTy5bpayDTGRZ+WWNm
         LRg6FAJ3uOOPu8SzFufCfk1kTqHMc9J7P53HWzZUUeMFWzQsuUe6UeO/zShw03r8/85g
         TwG5A5X37RI76tFFal089QbGnyudEm8NCI+e8Edw1rrc0Sux1WhvPYG01I3ptGzpGmN5
         c4P+PzW9EwW2l86ur+5fV4oHsNSow/NGQsWz+l3usaJNaUM+jXt2Jx6CmrFc2VQFlJzZ
         chDKhWgBc3c1d7CqLqpgL1UWGoQZRxlj74s59+W1xetQxtTsvbPUX2kZ5je5+OeCQBKW
         HSzA==
X-Gm-Message-State: AOJu0YwwbRAvZaFlOBEu5gZghelrhsBzrMz7sMYsybCwSaLm+0tWL2dR
	bmRGtMAr5ieb2iNvarNuP6tju+uWZB6ifIEL7xbchjNF1FT1xpT3yhs0Kw==
X-Google-Smtp-Source: AGHT+IGRJuEOGFcmmTPivCVKHg17zUttPzr65nZnNGvGIdzJINP4oskDQXRi2l+gbfA5t1z2jGZRSg==
X-Received: by 2002:a17:907:6d06:b0:a7a:acae:3415 with SMTP id a640c23a62f3a-a7d3ff57354mr242131466b.10.1722112475487;
        Sat, 27 Jul 2024 13:34:35 -0700 (PDT)
Received: from ?IPV6:2a02:908:1980:aac0::ecb0? ([2a02:908:1980:aac0::ecb0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad4acd7sm319316266b.140.2024.07.27.13.34.34
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jul 2024 13:34:34 -0700 (PDT)
Message-ID: <05b8cdbf-6ca7-40b8-9292-f332e1ad3a84@gmail.com>
Date: Sat, 27 Jul 2024 22:34:34 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ntfs3: Folders mounted with 555 permissions?
From: Julian Sikorski <belegdol@gmail.com>
To: ntfs3@lists.linux.dev
References: <edcd6eb8-8682-6552-a5f6-584ac103d0e9@gmail.com>
Content-Language: en-US
In-Reply-To: <edcd6eb8-8682-6552-a5f6-584ac103d0e9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 11.07.23 um 10:04 schrieb Julian Sikorski:
> Hello,
> 
> with linux-6.4, now that noacsrules option is gone, an old issue has 
> become problematic. When I mount my windows drive, some of the folders 
> in Users are mounted with 555 permissions, including the ones I would 
> like to edit:
> 
> $ ls -l /mnt/windows/ | grep Users
> lrwxrwxrwx. 1 julas julas          8  1. Dez 2018  Documents and 
> Settings -> ./Users
> lrwxrwxrwx. 1 julas julas          8  9. Okt 2022  Dokumente und 
> Einstellungen -> ./Users
> dr-xr-xr-x. 1 julas julas       4096  9. Okt 2022  Users
> 
> $ ls -l /mnt/windows/Users/beleg/ | grep Documents
> dr-xr-xr-x. 1 julas julas    8192  7. Jul 15:28 Documents
> lrwxrwxrwx. 1 julas julas      24  9. Okt 2022  Eigene Dateien -> 
> ./../../Users/beleg/Documents
> lrwxrwxrwx. 1 julas julas      24  1. Nov 2021  Moje dokumenty -> 
> ./../../Users/beleg/Documents
> 
> Is this intended behaviour? It appears to be quite an old issue [1]. If 
> so, is there any other fix than running a recursive chmod?
> 
> Best regards,
> Julian
> 
> [1] 
> https://www.reddit.com/r/archlinux/comments/r325t3/permissions_problems_with_the_new_ntfs3_driver/

One year later the issue is still there with kernel 6.9.11:

$ ls -lh /mnt/windows/Users/beleg/
insgesamt 18M
dr-xr-xr-x. 1 julas julas    0 19. Jul 2020  '3D Objects'
-rwxr-xr-x. 1 julas julas  77K 20. Nov 2022   AMDRM_Install.log
-rwxr-xr-x. 1 julas julas 2,7M 20. Nov 2022   AMD_RyzenMaster.log
drwxr-xr-x. 1 julas julas    0  2. Dez 2018   ansel
lrwxrwxrwx. 1 julas julas   30  9. Okt 2022   Anwendungsdaten -> 
./../../Users/beleg/AppData/Roaming
drwxr-xr-x. 1 julas julas    0  9. Okt 2022   AppData
-rwxr-xr-x. 1 julas julas 1,4K 18. Feb 15:30  aqtinstall.log
dr-xr-xr-x. 1 julas julas    0  9. Okt 2022   Contacts
lrwxrwxrwx. 1 julas julas   58  9. Okt 2022   Cookies -> 
./../../Users/beleg/AppData/Local/Microsoft/Windows/INetCookies
lrwxrwxrwx. 1 julas julas   30  1. Nov 2021  'Dane aplikacji' -> 
./../../Users/beleg/AppData/Roaming
dr-xr-xr-x. 1 julas julas 4,0K 15. Mai 20:41  Desktop
dr-xr-xr-x. 1 julas julas 8,0K  5. Jul 22:43  Documents

Here are the mount options:
/dev/nvme0n1p4 on /mnt/windows type ntfs3 
(rw,relatime,uid=1000,gid=1000,iocharset=utf8)

It is the main issue preventing me from switching away from ntfs-3g. Can 
I somehow investigate this further to help fixing this?

Best regards,
Julian

