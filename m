Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780152C86
	for <ntfs3@lists.linux.dev>; Wed,  6 Oct 2021 14:37:08 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id 32FCC820BB;
	Wed,  6 Oct 2021 17:37:06 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1633531026;
	bh=K4ZQchUzlnGR3B+6vfzh80aY4MDzOWiUIXba3jxV5lE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FuZrwLceF8iXbfAdRHwoINWlXtjGK4CO48rfKAPH/nDY7IO0cAgiuWQSj+EUYyPTH
	 0GkvF7w8MvSMNO6t6pubgTESfvv7odAqVcnJzPvFJRCgxbPsLUO6whJrHdDtLbBbX1
	 HGTn+PVGfKECwRPUXRGd2uLl3/Aoh/QemtwLatCU=
Received: from [192.168.211.53] (192.168.211.53) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 6 Oct 2021 17:37:05 +0300
Message-ID: <7590c4b0-7e44-ebed-9029-38fb59880c7b@paragon-software.com>
Date: Wed, 6 Oct 2021 17:37:05 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] fs/ntfs3: Fix logic in ntfs_cmp_names_cpu
Content-Language: en-US
To: Mark Harmstone <mark@harmstone.com>, Kari Argillander
	<kari.argillander@gmail.com>
CC: <ntfs3@lists.linux.dev>
References: <20210928183300.12946-1-mark@harmstone.com>
 <20210928220718.fk2g7itrgmyxooql@kari-VirtualBox>
 <261705dd-64b2-32e0-e8d6-3be9fa202f0b@harmstone.com>
 <95b14c81-05e8-63ac-5f1e-7dc0c66cdcd5@harmstone.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <95b14c81-05e8-63ac-5f1e-7dc0c66cdcd5@harmstone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.53]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 04.10.2021 21:25, Mark Harmstone wrote:
> Kari, Konstantin, what's your conclusion on this? Do you agree that
> case-insensitivity is broken at present, or is there something screwy
> going on with my set-up?
> 
> Mark


Hello.

Right now we can create two files "File" and "file" on ntfs3.
If we won't force case sensitivity, then it will become one and same file.
The same behavior you can see in
CreateFileA function with FILE_FLAG_POSIX_SEMANTICS [1]
or in NtSetInformationFile function with FileCaseSensitiveInformation [2].
So it's expected for `ls WINDOWS` to fail.

Should ntfs3 be the exact copy of windows api or not?
(ntfs.sys is case sensitive).
Should ntfs3 work with `ls WINDOWS`?
As I see, Microsoft makes steps towards case sensitivity.

There is indeed some dubious code with ntfs_cmp_names_cpu / ntfs_cmp_names.
We must always compare filenames with bothcase == true.
There will be patch to fix this situation.

Thanks for telling about this problem.

[1]: https://docs.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-createfilea
[2]: https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/ntifs/nf-ntifs-ntsetinformationfile
