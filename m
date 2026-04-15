Received: from outbound.mr.icloud.com (p-west2-cluster1-host12-snip4-3.eps.apple.com [57.103.68.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E6C30EF77
	for <ntfs3@lists.linux.dev>; Wed, 15 Apr 2026 04:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776226774; cv=none; b=Bn7Vx+O9cSl0QOm0w992/78BP08LgyF2WDeaS6hSmc3DXuVGVVSkKxP3dRF8OM9BN9avo/TadMzqQ8yZhRP37zgR/7O6udZgnSYcMden1fETYn5SBKB9Uoz9xpjc/nxZ6Gy7sOteJvg0mUz9s5vsnhyjHFIg+Uuajj0XJiVH2uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776226774; c=relaxed/simple;
	bh=yBfDJg4Je8fhZI+cFGFISTAHj+UGEnNOeDrf0TjXHk8=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=lWjYZLNNmcHVliHda7TfoExj4rfhwEETegCyJScjRmhW7Hdier4f3xNoZfsICWnkx2IOSaE52hl8DwqBsrAHfZsjWwYx49hPcrsbJPmV9lZzJkwxAJyft/ab2xEE/3HA605+y8tAPCpK1ILjtIKpzGb2oyLzBuD3oL7jQXTfVt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=MqwVyfEg; arc=none smtp.client-ip=57.103.68.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="MqwVyfEg"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPS id E36C418001BC;
	Wed, 15 Apr 2026 04:19:31 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1776226773; x=1778818773; bh=LiGwpFh+xaHAcQorriM2S7b5r7H/pgOR0wZTAK5jIPY=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=MqwVyfEgXGXQR0UzkENnX5FtpkXZ0nGh3hQ8E40Nh7ZMnGfR9pkqtDVfxXiuRPYr56r0ptYQQhSYhcgQSidx8dHdiDRvl+FFQA88TpSjQZ+AuA3zstxUX8uwkZetaLEifsukSJsOyQr+CpJ7BnibsXNWOiAqHe0TgPu6aaiTJhvq9kt1oQ6ffbPzSBU43GGbvNgB70xWRpL0jPRWyIYvbRPSeDvKyNDE4dcZRNXHcgOFnHmwgeJYRRH/Xcbvun8k0Hv3nCfAXGhsbW92ruZSPATBuxKVI3XSrF4NBIHIUyKCxcnZCVuLNZ+1oEb02Pd+FPHhvTDwxTY74ZEp4j24kg==
Received: from smtpclient.apple (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPSA id 5E08D1800094;
	Wed, 15 Apr 2026 04:19:31 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Tobias Gaertner <tob.gaertner@me.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/2] ntfs3: fix OOB read and integer overflow in run_unpack()
Date: Tue, 14 Apr 2026 21:19:15 -0700
Message-Id: <00E5BF40-413C-4E55-BD58-2CCFC455F96D@me.com>
References: <f888b1b3-9bf7-4174-beef-3f954bafa175@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, security@kernel.org, info@tiefgangsecuritylabs.com
In-Reply-To: <f888b1b3-9bf7-4174-beef-3f954bafa175@paragon-software.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
X-Mailer: iPhone Mail (23D8133)
X-Proofpoint-GUID: UcBCVj02WbUi5rhHV8wbDYd51-Oq1Rsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAzNyBTYWx0ZWRfXxeztlqzn2q5Y
 vbCgEH4ny4nIngS9rDIqVg8yH3YxZsAM0zlDSj6S4NOASDiFh4INNcUlEDBvIyRWARienppgtkr
 hXpCCCMKk3R/0i4V6fHqZVA6AfjAUYc34Sy1nPkMNDWZlscW7Z5awnW7D/Tsxsuv5jkgAuqr0We
 OiwZLvKoHDQFqbbp8r4u/D0ftsYuPG9eb2R4yUADKtHOiLQBU/n2tyWRwe4CbuDyclExHfRuH5P
 k0JkHCuzhXBl9j61Ob68igsEc9C8lZKkYr95NZNlWlErGdOx63UPRyLezcvOIo0nefs+4CrERD2
 YpuoIWILjfyRTXUoZtPUM7myvDUKUSnnKv7f5sg4sUDX6zmA/dAQieOvxg5XeI=
X-Proofpoint-ORIG-GUID: UcBCVj02WbUi5rhHV8wbDYd51-Oq1Rsq
X-Authority-Info-Out: v=2.4 cv=L9IQguT8 c=1 sm=1 tr=0 ts=69df11d4
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=x7bEGLp0ZPQA:10 a=C3-SEi6G3EkA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=_EeEMxcBAAAA:8 a=jqnDqIDVAAAA:8 a=GFCt93a2AAAA:8 a=HHGDD-5mAAAA:8
 a=cVXv3vqcopnhoFBAprYA:9 a=QEXdDO2ut3YA:10 a=czjwGCTIUPoA:10
 a=gUhktecex-mOjuHs2jr2:22 a=0UNspqPZPZo5crgNHNjb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 clxscore=1011 adultscore=0 mlxlogscore=999 suspectscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2604150037

Hi Konstantin,

Great news!=20

Will I get a CVE for that memory leak?=20

Can you credit the patch and CVE to =E2=80=9CTiefgang Security Labs=E2=80=9D=
?=20

info@tiefgangsecuritylabs.com

Cheers,

Tobias


> On Apr 7, 2026, at 10:19, Konstantin Komarov <almaz.alexandrovich@paragon-=
software.com> wrote:
>=20
> =EF=BB=BFOn 3/29/26 13:17, tobgaertner wrote:
>=20
>> [You don't often get email from tob.gaertner@me.com. Learn why this is im=
portant at https://aka.ms/LearnAboutSenderIdentification ]
>>=20
>> From: Tobias Gaertner <tob.gaertner@me.com>
>>=20
>> Two bugs in run_unpack() found by fuzzing with a source-patched harness
>> (LibAFL + QEMU ARM64 system-mode):
>>=20
>> Patch 1: run_unpack() checks `run_buf < run_last` at the loop top but
>> then reads size_size and offset_size bytes via run_unpack_s64() without
>> verifying they fit in the remaining buffer.  A crafted NTFS image with
>> truncated run data triggers a heap OOB read of up to 15 bytes on mount.
>>=20
>> Patch 2: The volume boundary check `lcn + len > sbi->used.bitmap.nbits`
>> uses raw addition that can wrap for large values, bypassing the
>> validation.  CVE-2025-40068 added check_add_overflow() for adjacent
>> arithmetic but missed this instance.
>>=20
>> Both bugs are present since NTFS3 was merged in 5.15.
>>=20
>> Could CVE IDs be assigned for these two issues?
>>=20
>> tobgaertner (2):
>>   ntfs3: add buffer boundary checks to run_unpack()
>>   ntfs3: fix integer overflow in run_unpack() volume boundary check
>>=20
>>  fs/ntfs3/run.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>=20
>> --
>> 2.43.0
>>=20
> Hello,
>=20
> Patches are queued for the next merge window, thanks.
>=20
> Regards,
> Konstantin
>=20
