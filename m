Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF83FC4
	for <ntfs3@lists.linux.dev>; Thu, 26 Aug 2021 22:06:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0CDA60FD8;
	Thu, 26 Aug 2021 22:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630015569;
	bh=VBa/teRBr1EjEHOGDgemDtGoBFFDgIjQWza+BjNZgBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sy2FUSfVBK2UJl59avQ8+vYglAmltCJFf+1GkbbmRraCT70TGMHIiOCqyCn/Fwxe0
	 3eDqeNqDSYzwBgDcRHrnaht6Bsv9MYb8xu3W0an46/OvopE//SwD+6fipR/O7gPqkq
	 eus7Yap7GLJd+BixxuThac2Vx9yeiw5cCVwb7voeBYKC12MPHT0WTcxesvpCO2rfNe
	 qDhfGzgfSEjUmlOEnrswALFLHl4i79nvin2Rkz4tyhRoIKwnVJPYshMRkyX1zW0yBz
	 L/GNBWotZDfmyS+vUqMsauvG95ESv98fQdl2XBQFxY6AOSPINgb8+cwHY6qc294/fK
	 WKTu2q3ZRMW2w==
Date: Thu, 26 Aug 2021 15:06:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: Remove GPL boilerplates from decompress lib
 files
Message-ID: <YSgQUNys90jh/ZgA@sol.localdomain>
References: <20210826214441.1614837-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826214441.1614837-1-kari.argillander@gmail.com>

On Fri, Aug 27, 2021 at 12:44:41AM +0300, Kari Argillander wrote:
> Files already have SDPX identifier so no reason to keep boilerplates in
> these files anymore.
> 
> CC: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>

It's fine with me.

Acked-by: Eric Biggers <ebiggers@kernel.org>

- Eric
