Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7343F0AB3
	for <ntfs3@lists.linux.dev>; Tue,  9 Jun 2026 23:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046527; cv=none; b=a5DQolhZaKdc2YBPV0k3CXMRHjCOoQwSlenQ1hYLZueJKszFQrvhbUHIWHUE/0REselrGyiCz1n6iodff0smW6yGFTX76U2qjw+fbS8Mjtp10TO+wELcXK1f7m6kTdER0BbpwOx37fAvuisR/6iX1Ef4+sQyaI5V25eDRI7elr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046527; c=relaxed/simple;
	bh=Npg/TCEiHuZ+qQeGT1n6vU8c0+QZ+po25lEzrE8PivM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igbkZMNb5CfYuboAdidDKGD0qAjQyEYKtxJC37S9kXn20oVe8Wxu1dklUm+OHj6ByuE+lex23BDipUONvJ53MSSWPpqx8InkggC2E8zCQNMMI2CFCjwlAp+5EYo84ge8KHRzZyiOS6Axbt2vtpovBpvOvT6PJ6pZYVLp1KzpABc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=NAOXAq4w; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="NAOXAq4w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zazKa5xEfktodOlVOcvkX1eEEaya57i/ZPFFl8Gc54E=; b=NAOXAq4wgFA/5neE1VJZnbg/q5
	Zn5WCQ33Ovjr9q6hKdSSJGBvqTbz0dR1JjFBR52SozqwttLahoPeV3GkJbuZB4I+ADGuOpG6VZu7y
	t1GZjnnxXYQjvfJfgWU2KcLZxk0kM86P/Sn6ZwP2noC1anQwISITU0LiJPQsOWxu1yQZMy0FW0wfX
	VB+1VRzQkqIpPqFhWhUMBS6vNZco6iNtXl7j6WfbgpXfrLa+AU3zjvEVJBAU4bGEHFUxfweGrOVin
	Wa6SRAPG08hsSK2XkNocVU2pIL2VSreQ7kQTj0VoPzQT1uc50ZCzCPVnANfKiYdcpu1Spp+mElzO2
	PUmTxJMw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wX5Yo-0000000Fpp7-0MvE;
	Tue, 09 Jun 2026 23:08:42 +0000
Date: Wed, 10 Jun 2026 00:08:42 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, lvc-project@linuxtesting.org,
	syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com
Subject: Re: [PATCH] ntfs3: fix info-leak in ntfs_rename()
Message-ID: <20260609230842.GA3766471@ZenIV>
References: <20260609123618.712961-1-dmantipov@yandex.ru>
 <20260609201948.GK2636677@ZenIV>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609201948.GK2636677@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Jun 09, 2026 at 09:19:48PM +0100, Al Viro wrote:
> On Tue, Jun 09, 2026 at 03:36:18PM +0300, Dmitry Antipov wrote:
> > In 'ntfs_rename()', buffer passed to 'fill_name_de()' should
> > be allocated with 'kzalloc()' to avoid exposing contents of
> > an uninitialized kernel memory via 'copy_to_user_iter()'.
> > 
> > Reported-by: syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=905d785c4923bea2c1db
> > Fixes: ca2a04e84af7 ("ntfs: ->d_compare() must not block")
> > Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> > ---
> >  fs/ntfs3/namei.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
> > index b2af8f695e60..74fe002214f3 100644
> > --- a/fs/ntfs3/namei.c
> > +++ b/fs/ntfs3/namei.c
> > @@ -303,7 +303,7 @@ static int ntfs_rename(struct mnt_idmap *idmap, struct inode *dir,
> >  			return err;
> >  	}
> >  
> > -	de = kmalloc(PATH_MAX, GFP_KERNEL);
> > +	de = kzalloc(PATH_MAX, GFP_KERNEL);
> >  	if (!de)
> >  		return -ENOMEM;
> 
> Could you please elaborate the way by which the contents of that
> object would have managed to reach copy_to_user_iter()?
> While we are at it, which userland addresses would rename()
> want to write into?

From the syzkaller spew it would appear that data (filename converted
to unicode, AFAICS) somehow gets returned by read(2).  If that is
accurate, I would suggest that the things are already FUBAR and zeroing
is not going to fix whatever underlying bug you've got there (metadata
bh left around after the corresponding on-disk block got freed and
reused for regular file, perhaps?)
