Received: from smtprelay.hostedemail.com (smtprelay0068.hostedemail.com [216.40.44.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ACB2C82
	for <ntfs3@lists.linux.dev>; Wed, 27 Oct 2021 00:26:31 +0000 (UTC)
Received: from omf04.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay01.hostedemail.com (Postfix) with ESMTP id 4C464100E896F;
	Wed, 27 Oct 2021 00:26:24 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id 30217D1517;
	Wed, 27 Oct 2021 00:26:23 +0000 (UTC)
Message-ID: <868c29d45172a151b6a751de4ba32165cbf7a4cc.camel@perches.com>
Subject: Re: [PATCH] checkpatch: Remove cvs keyword check
From: Joe Perches <joe@perches.com>
To: Kari Argillander <kari.argillander@gmail.com>, apw@canonical.com
Cc: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev
Date: Tue, 26 Oct 2021 17:26:21 -0700
In-Reply-To: <20211026231637.3750-1-kari.argillander@gmail.com>
References: <20211026231637.3750-1-kari.argillander@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.25
X-Stat-Signature: yrhp8yq6gdmt8bg9ckaftq1j98qbcgoj
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 30217D1517
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+KOql8maOPTfoX2IZXwdHG1FfP0LkMQN8=
X-HE-Tag: 1635294383-507720

On Wed, 2021-10-27 at 02:16 +0300, Kari Argillander wrote:
> Time has pass and we do not need these anymore as almost all people are
> using git now days. Those who use cvs for kernel development probably
> will handle cvs pretty well already so this check is not needed anymore.

I think it's a relatively harmless thing to keep.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -4017,12 +4017,6 @@ sub process {
>  			}
>  		}
>  
> -# check for RCS/CVS revision markers
> -		if ($rawline =~ /^\+.*\$(Revision|Log|Id)(?:\$|)/) {

Looks like this would be better using

		if ($rawline =~ /^\+.*\b\$(?:Revision|Log|Id)\$?\b/) {

> -			WARN("CVS_KEYWORD",
> -			     "CVS style keyword markers, these will _not_ be updated\n". $herecurr);


