Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F083932DB
	for <ntfs3@lists.linux.dev>; Wed, 15 Apr 2026 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776236420; cv=none; b=SSQ49gjbF3jdnWYL7IcmOoKSwxPRU/3hzp+qQL6P2IoC/7qeocgOPshqZxG398KWaAmHcYwJ+LTGqR/kRwZB6yXbOX2FsiBQJ+7cw48LxVbrQJSGPIAkBtYogu71ngmn8hlGGZEzMy7fwi0R4+1WYvRnoc0L1n04brwpB6mEwJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776236420; c=relaxed/simple;
	bh=WhzO/K/EPIw/+ZMNd68sYu9k9reY+m06DSRQs9zH5do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReL949avpDLZXVA4f9nTPWkCJrJD2GzEs9YLhCMQ6rO1avSV6oSDSlfwcnktjrCto7rSs1eDWXA7cMRM8morerunjf4pxD5D4zRR2w0ZX+HYLXoFACRT72PtkEQoFgiHRRJQ7Zylnq9D7cE15hjxaA+MMQtCO6AILrJjs51210U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=MT8S0win; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="MT8S0win"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1776236415; bh=xo8BoMZmahNk8IcWrLoSMBXza9kfFUfWheV+0gsjZQs=;
	h=From:Message-ID:From;
	b=MT8S0winOWaWRf7yaZsQKVbc2AUTSMk9TKApxA7xE3yDsAUCnhZgQfMFXXC11bUrW
	 ENPqSbEgkqxJyBLyIv26IICOdddwvUVkIrdZ3MdpQVHA0jnGyTSYt59cOtgbtZ648z
	 52ibp212wBZlTX2/kMx1w8024NvkQ17N9krjV7TM=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 20F68C1142;
	Wed, 15 Apr 2026 09:00:15 +0200 (CEST)
Date: Wed, 15 Apr 2026 09:00:08 +0200
From: Willy Tarreau <w@1wt.eu>
To: Tobias Gaertner <tob.gaertner@me.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, security@kernel.org,
        info@tiefgangsecuritylabs.com
Subject: Re: [PATCH 0/2] ntfs3: fix OOB read and integer overflow in
 run_unpack()
Message-ID: <ad83eJd_nJerhQPI@1wt.eu>
References: <f888b1b3-9bf7-4174-beef-3f954bafa175@paragon-software.com>
 <00E5BF40-413C-4E55-BD58-2CCFC455F96D@me.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00E5BF40-413C-4E55-BD58-2CCFC455F96D@me.com>

Hi,

On Tue, Apr 14, 2026 at 09:19:15PM -0700, Tobias Gaertner wrote:
> Hi Konstantin,
> 
> Great news! 
> 
> Will I get a CVE for that memory leak? 

CVEs are assigned by the CVE team once the patches are backported to
stable, according to the process described here:

   Documentation/process/cve.rst

regards,
Willy
