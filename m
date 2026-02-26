Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8981372B21
	for <ntfs3@lists.linux.dev>; Thu, 26 Feb 2026 01:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=148.163.135.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772069926; cv=pass; b=hBDWCpo8WObV0dxdsgmz4Ymg/8V+naeyddFjqIRsseu4uZXZsclPkNAlvG/7hQQ8dPMGy910xBnPldtnOSYXk10yMIUMl0Sq8joOfiTth9NyRbiECIDyvwUPrUcjNjc3711FeUPZ+AdyKtfRYxUeaGZEAiQbYDPN8x6UH1J1H5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772069926; c=relaxed/simple;
	bh=ti4yzSkI6nET4kyh6UHM/WH/hezrg7wAnVqqzbeCD70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCFl2m5o+8DbgtAld3BqRqb6LMbzMF2ptgTi7sI7Y/Ybb+m0d4/DvM+9U5s6EmRPAwHR0lJk7UJVyPhqv1Kg90gJ9/wj3/2oe8FvzC9x5MyYLmByG5+UbsS0/jJzwdaOpqKkbC3Liz1P2Uu6kl0gpqzlPVz49OP9UhggoKCy5Hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=alfh4g7z; arc=pass smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="alfh4g7z"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q1CYAt1564191
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 20:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=RuUf
	KqLF8pxHEU0+4gJWx2JSltGDNKQcxuvzq6VPwys=; b=alfh4g7zGnrSJ3TqRJyt
	V5VcP7SDepx8NVi9vJhDyy8L5Ls5WE/RWZYhX4Ye5zukU4YSUajOuvw1hNA49SLE
	5MCVRYtKvCE10uV6CF70YwJulwzlLq4K9ukFkzKdcXeI/Bi4+EtJZkspWAQ/UxiS
	UAuXF8AJf0DZPpM47meX39PRepgBYuUes92asCRQQlWsHQzL/m7InreMTYXDR9TW
	g9tmlQQeJIjnOJXInA+ga3C6te0MJzR7Zh/RoLFz0L+iV9g1io5ESlZXDEXLNu3F
	RFDI77ScZHeVnIcmjYeOTWjiKdR4Xi3ro4xpWY03zOhgiOVRG1S+fz6senjXOYFF
	qg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4cj1dtecrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 20:38:41 -0500 (EST)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-79801be4ca3so5739357b3.0
        for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 17:38:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772069921; cv=none;
        d=google.com; s=arc-20240605;
        b=ShuyCZPPjA6vp2b1zOFtZ/fQxokptICWPE/d7ASoNlG+J+xjsfih49OAlbQTfj8M3h
         mZPP3+7ADDpFHbXlMNs6UWNFaweNJe6pMDhtpqHwE2rPWJ4zTOrvbTK9poRVNkOypXbZ
         ja/MO/P0b/E2rhFen+XYjJpRtj5GUJdobeOetuGEbqX21E1l8RmbekJZcfAmGPSpvfec
         bLuDp8qOwydxeQh77YDQ3qNDbAv/UGRVDLaKrmgVLrocbZ7WQqOIvbU9uG8k2W4Kjk7R
         /pWNpBeG+RYzHTkdU/2r0ZPCVsWuaamFeAjXC5OzE7sbeN4Aacvf37WyoSa4rv44VN2U
         HOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=RuUfKqLF8pxHEU0+4gJWx2JSltGDNKQcxuvzq6VPwys=;
        fh=jCG9EHu8/W4bdqDEGjrWMTqPdHQSQAlLrVBVhWWz5Zo=;
        b=Io6FPk0YKLpLNQRkQFtaxhwrZq2661wRbjVFJMGRTjF4W5qhAArwgVl6YHJszNHp+x
         94iRvIHew6U8eRkr6/zsA8eaSJB4vo+KYzRVYqZqAojUtIbb0HCCqZsq1aRcTQ3MI+hs
         EOCthu1SRFbNWgiPKUa1AdPheeTZXUoFYMywyGzU1q09tiryRK9zne43l7aMoB9ApGYk
         791FSPcmhDfKsYlkPA+WXHtZZF6j+4+E8KDQAj/LGarmI5BHB9byJGThOipQ7swXBmG4
         jjXQqgarCtVGG52nw8U7zUrM8Nh6oF5z/KiB0g7H+7oRMne8IQII9SMIiC7D2wz4XO9I
         hEMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772069921; x=1772674721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RuUfKqLF8pxHEU0+4gJWx2JSltGDNKQcxuvzq6VPwys=;
        b=EJOcJPJ06/W5Dxt6DcYOxX1uqvd3nPlwCOhiMmPHVn3+Bo2WP74UVc9Jwizy7UgxZ2
         flBBw9XA/PpvjX0m+IBj2gP/9j8K6EaOcMGkHoa8T8ophZdiXpbOlDhJgdKweyTbru5f
         CjsssK6dHeuC4Q3uAFVGbDLZOtkf6FZ2I5I36UBCXtpKK0u9ug3UFTfA+fEm6Wcf7v4T
         JNe/AQMpGRI0maa2CF52b4ZKdr6b/UbnxsDCcr78TVCzMvAr59VPJqr04vPyANbBdqX5
         MWpMZ2OMdc8kVK0aH7ScL2VWIWgg8baoE89wc9YyYzsnluk431Q6vSDh3jQ1O7dpLisM
         T38A==
X-Forwarded-Encrypted: i=1; AJvYcCUXQELaLBZaspiuA+7RrAxQnnzySTz88oY7x6wjUHmZHtbh+o0wVplPdlzZ3xnrRdgq1UApZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtcKd/NtpkeaNyzQmDwaYaQSek7mebsVDk+U4geYHPiorijfqT
	Km1BFGESs2ErRCXGVOGqOI33gLvD4PTutMuB4jzDqid8cMZbz0lut69L4hxxJRXacZOrtdVkF9R
	4IVO8b2ymm9wVr5ZisJ00rnz21SyE27xr+lICAd/hUapv8Cvl2M1FxJ5n3zeliqoLmq6fecl0sY
	rLvQ8b8IXRBZF3iVO3mppT2FWPwVg=
X-Gm-Gg: ATEYQzxzUaPusw+brYKMwo48N3j4fOuFcgAHgDa53FYy5yJtHSyoh/LfPfuMM9Et3w7
	TDeUacjsyyOnX6B4fZLC3K9F+ktVNvviBWd/F/rvul2y4+mNzOfrojxPQAA1FoWQUzwGtAhHKql
	anodE09WuuQIqvYqepXRY1ZPn+7klU7pDDBR8woPo4Xgib9EtEKno1l1YhkFl3GPjsbxeZysjbl
	s+fJQ==
X-Received: by 2002:a05:690c:4a05:b0:797:d268:b587 with SMTP id 00721157ae682-79876c862f0mr5591277b3.29.1772069921003;
        Wed, 25 Feb 2026 17:38:41 -0800 (PST)
X-Received: by 2002:a05:690c:4a05:b0:797:d268:b587 with SMTP id
 00721157ae682-79876c862f0mr5591057b3.29.1772069920550; Wed, 25 Feb 2026
 17:38:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260225-blk-dontcache-v2-0-70e7ac4f7108@columbia.edu>
 <20260225-blk-dontcache-v2-1-70e7ac4f7108@columbia.edu> <c8078a80-f801-4f8a-b3cd-e2ccbfca1def@kernel.dk>
In-Reply-To: <c8078a80-f801-4f8a-b3cd-e2ccbfca1def@kernel.dk>
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Feb 2026 20:38:29 -0500
X-Gm-Features: AaiRm52vdi5fnXqygcUgGP7ud7f8lrEjfwNIkhY8m1jYwEYqu5-B1oSLrvjdDbU
Message-ID: <CAKha_srSdS46FM8K-RKaiinP0y6kx_MhxnHjZ0KKP1NOAL+STA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/2] filemap: defer dropbehind invalidation from
 IRQ context
To: Jens Axboe <axboe@kernel.dk>
Cc: "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Yuezhang Mo <yuezhang.mo@sony.com>, Dave Kleikamp <shaggy@kernel.org>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Bob Copeland <me@bobcopeland.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
        linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
        linux-karma-devel@lists.sourceforge.net, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxMiBTYWx0ZWRfXxdtj85uNlkzM
 wa7iDN5hbFy/tAd4HbPX8QKje4l+5Kf+aE7OPQ3XxHWSkQeS79uaJL1oGcC5TBGL9TXRnL29Vxx
 10uPTIaBASMOcX0VJQIVx4wvLdp0OIRlS5PktECrbEAtRycXuh9B8m/i2/dYh6NvepPJ/V9s2k3
 UFUceTo5CxcvW8YGKasnnjea+zjF763UnrMJeUP1jO53SbEGzMthFdsd/0GwhlXqMqetV+eeuv1
 IujheEM+uE7/W9EaxF1gZ41rEYbiaSUEmxBoRX7WdkR2MGwJ32UXSMBO+x18AtvgDwZymiaDUdg
 5e3XPWqQFCdF4ny71WkQMe5+LJ30FKHHPUC4KFJVVMw9Uf1qRSWKWslQWutJbM360pFCqott9ji
 fR1ZHpU0Y+2g9JOR/tAcoRjV6glWGWobo8R+IbIP5plZ8nr72kJQtYfmI9YFJ76ntiWIeiIi7YZ
 vfdGfc+8etVbvyetwEg==
X-Proofpoint-GUID: AUxvVQwGit8_p6kwopFkv84xowZdtFcQ
X-Proofpoint-ORIG-GUID: AUxvVQwGit8_p6kwopFkv84xowZdtFcQ
X-Authority-Analysis: v=2.4 cv=ROu+3oi+ c=1 sm=1 tr=0 ts=699fa422 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=x7bEGLp0ZPQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22
 a=G--0XuH5328wxK7v7Suf:22 a=Sm8IU_2CoLCVsS0ef1cA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11712
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 impostorscore=10 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=10 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260012

On Wed, Feb 25, 2026 at 5:52=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
> On 2/25/26 3:40 PM, Tal Zussman wrote:
> > folio_end_dropbehind() is called from folio_end_writeback(), which can
> > run in IRQ context through buffer_head completion.
> >
> > Previously, when folio_end_dropbehind() detected !in_task(), it skipped
> > the invalidation entirely. This meant that folios marked for dropbehind
> > via RWF_DONTCACHE would remain in the page cache after writeback when
> > completed from IRQ context, defeating the purpose of using it.
> >
> > Fix this by deferring the dropbehind invalidation to a work item.  When
> > folio_end_dropbehind() is called from IRQ context, the folio is added t=
o
> > a global folio_batch and the work item is scheduled. The worker drains
> > the batch, locking each folio and calling filemap_end_dropbehind(), and
> > re-drains if new folios arrived while processing.
> >
> > This unblocks enabling RWF_UNCACHED for block devices and other
> > buffer_head-based I/O.
> >
> > Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> > ---
> >  mm/filemap.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++----
> >  1 file changed, 79 insertions(+), 5 deletions(-)
> >
> > diff --git a/mm/filemap.c b/mm/filemap.c
> > index ebd75684cb0a..6263f35c5d13 100644
> > --- a/mm/filemap.c
> > +++ b/mm/filemap.c
> > @@ -1085,6 +1085,8 @@ static const struct ctl_table filemap_sysctl_tabl=
e[] =3D {
> >   }
> >  };
> >
> > +static void __init dropbehind_init(void);
> > +
> >  void __init pagecache_init(void)
> >  {
> >   int i;
> > @@ -1092,6 +1094,7 @@ void __init pagecache_init(void)
> >   for (i =3D 0; i < PAGE_WAIT_TABLE_SIZE; i++)
> >   init_waitqueue_head(&folio_wait_table[i]);
> >
> > + dropbehind_init();
> >   page_writeback_init();
> >   register_sysctl_init("vm", filemap_sysctl_table);
> >  }
> > @@ -1613,23 +1616,94 @@ static void filemap_end_dropbehind(struct folio=
 *folio)
> >   * If folio was marked as dropbehind, then pages should be dropped whe=
n writeback
> >   * completes. Do that now. If we fail, it's likely because of a big fo=
lio -
> >   * just reset dropbehind for that case and latter completions should i=
nvalidate.
> > + *
> > + * When called from IRQ context (e.g. buffer_head completion), we cann=
ot lock
> > + * the folio and invalidate. Defer to a workqueue so that callers like
> > + * end_buffer_async_write() that complete in IRQ context still get the=
ir folios
> > + * pruned.
> >   */
> > +static DEFINE_SPINLOCK(dropbehind_lock);
> > +static struct folio_batch dropbehind_fbatch;
> > +static struct work_struct dropbehind_work;
> > +
> > +static void dropbehind_work_fn(struct work_struct *w)
> > +{
> > + struct folio_batch fbatch;
> > +
> > +again:
> > + spin_lock_irq(&dropbehind_lock);
> > + fbatch =3D dropbehind_fbatch;
> > + folio_batch_reinit(&dropbehind_fbatch);
> > + spin_unlock_irq(&dropbehind_lock);
> > +
> > + for (int i =3D 0; i < folio_batch_count(&fbatch); i++) {
> > + struct folio *folio =3D fbatch.folios[i];
> > +
> > + if (folio_trylock(folio)) {
> > + filemap_end_dropbehind(folio);
> > + folio_unlock(folio);
> > + }
> > + folio_put(folio);
> > + }
> > +
> > + /* Drain folios that were added while we were processing. */
> > + spin_lock_irq(&dropbehind_lock);
> > + if (folio_batch_count(&dropbehind_fbatch)) {
> > + spin_unlock_irq(&dropbehind_lock);
> > + goto again;
> > + }
> > + spin_unlock_irq(&dropbehind_lock);
> > +}
> > +
> > +static void __init dropbehind_init(void)
> > +{
> > + folio_batch_init(&dropbehind_fbatch);
> > + INIT_WORK(&dropbehind_work, dropbehind_work_fn);
> > +}
> > +
> > +static void folio_end_dropbehind_irq(struct folio *folio)
> > +{
> > + unsigned long flags;
> > +
> > + spin_lock_irqsave(&dropbehind_lock, flags);
> > +
> > + /* If there is no space in the folio_batch, skip the invalidation. */
> > + if (!folio_batch_space(&dropbehind_fbatch)) {
> > + spin_unlock_irqrestore(&dropbehind_lock, flags);
> > + return;
> > + }
> > +
> > + folio_get(folio);
> > + folio_batch_add(&dropbehind_fbatch, folio);
> > + spin_unlock_irqrestore(&dropbehind_lock, flags);
> > +
> > + schedule_work(&dropbehind_work);
> > +}
>
> How well does this scale? I did a patch basically the same as this, but
> not using a folio batch though. But the main sticking point was
> dropbehind_lock contention, to the point where I left it alone and
> thought "ok maybe we just do this when we're done with the awful
> buffer_head stuff". What happens if you have N threads doing IO at the
> same time to N block devices? I suspect it'll look absolutely terrible,
> as each thread will be banging on that dropbehind_lock.
>
> One solution could potentially be to use per-cpu lists for this. If you
> have N threads working on separate block devices, they will tend to be
> sticky to their CPU anyway.
>
> tldr - I don't believe the above will work well enough to scale
> appropriately.
>
> Let me know if you want me to test this on my big box, it's got a bunch
> of drives and CPUs to match.
>
> I did a patch exactly matching this, youc an probably find it

Yep, that makes sense. I think a per-cpu folio_batch, spinlock, and
work_struct would solve this (assuming that's what you meant by per-cpu lis=
ts)
and would be simple enough to implement. I can put that together and send i=
t
tomorrow. I'll see if I can find your patch too.

Any testing you can do on that version would be very appreciated! I'm
unfortunately disk-limited for the moment...

> >  void folio_end_dropbehind(struct folio *folio)
> >  {
> >   if (!folio_test_dropbehind(folio))
> >   return;
> >
> >   /*
> > - * Hitting !in_task() should not happen off RWF_DONTCACHE writeback,
> > - * but can happen if normal writeback just happens to find dirty folio=
s
> > - * that were created as part of uncached writeback, and that writeback
> > - * would otherwise not need non-IRQ handling. Just skip the
> > - * invalidation in that case.
> > + * Hitting !in_task() can happen for IO completed from IRQ contexts or
> > + * if normal writeback just happens to find dirty folios that were
> > + * created as part of uncached writeback, and that writeback would
> > + * otherwise not need non-IRQ handling.
> >   */
> >   if (in_task() && folio_trylock(folio)) {
> >   filemap_end_dropbehind(folio);
> >   folio_unlock(folio);
> > + return;
> >   }
> > +
> > + /*
> > + * In IRQ context we cannot lock the folio or call into the
> > + * invalidation path. Defer to a workqueue. This happens for
> > + * buffer_head-based writeback which runs from bio IRQ context.
> > + */
> > + if (!in_task())
> > + folio_end_dropbehind_irq(folio);
> >  }
>
> Ideally we'd have the caller be responsible for this, rather than put it
> inside folio_end_dropbehind().
>
> --
> Jens Axboe
