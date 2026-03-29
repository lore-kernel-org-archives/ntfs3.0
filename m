Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC53313272
	for <ntfs3@lists.linux.dev>; Sun, 29 Mar 2026 12:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774785613; cv=pass; b=I1cDIV+tX/dCFf7+gRLq+GtYIq+yJFvCDvpvW53L35HBfUlZzlGk79a+1luPmSZBqu7ZzFh8DN38dUF/ZWR6HvK0WJnFyybQwuQdfIV08BpHeyl3pQP16NEL6HaJ8ZGaAzhI9aGOm6l0l/bKVXqC2Ql2Al7WuPpqYYWYA1vX4QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774785613; c=relaxed/simple;
	bh=360OnJ62U01iuPYPJc65sM8MRjzVdUcsRLcZaez0mms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ib6HadMoP0D2tMIRuAdOgDYG+gTIs0wL5eWnhr9FzcwKY8qs+OEOd4ipcTythEK4TsKHs8VUzpDn6ANR3SBJ+aMH2KE1X2VX5dKbo0UY8F2mkhf6omRdlB3gmnzHsb/qETwWJSNe4/Lb330OgzJ+aWh+S521CguBz9wMbZ8bgeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUDOkiJz; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUDOkiJz"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d7447778b9so1843159a34.2
        for <ntfs3@lists.linux.dev>; Sun, 29 Mar 2026 05:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774785611; cv=none;
        d=google.com; s=arc-20240605;
        b=bwxCakkVORlHhipgmjZtSxzrzHoySBX6w7Gl6BKUHK2YWbVlIJS0kYQJpFl5Oyf3H9
         TaqmXahXvqKLEO+dt+fBZaJyl4p2086ZWweom1jnrL6T5M2mGbMPEEdsUyB0PBVeChQi
         71Tu7sXNzk0+2logSWFx+dLTW75f62DoHO4OXv9csOvErXrAii+2dKFcdxRIUCf++nZK
         eodR5fgp7qDJSsVio6Au2OaN7LVf0JSvqL6y8zg2tsRagzMpzUoZk5xjzzlQlAjnskbV
         a+1z6jSMPYWSBQZIOgdHCsVJczsU+l/mQUTHRqYRc0oaXoEshQj4FCai2aDFcCgmkTSL
         JJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e4cxyqhp2lKo6HQezstxnQI1KcRL6XZbchzgv4xAzow=;
        fh=7E8bKTzZAxCQKFGRBQeRBszy1UUeSGCfjUp17tKRLWY=;
        b=O4phpX3Uo1hr7I+klFKxJIw7LZrA+gEHkKgXGzWeDVv5mNRyeRdzlPB4RF9Mh1H8S0
         jgno3YZKd0zw/wscr1L8KjkPNaSUIsckBH71Mvx7kyJ1+QFV9uiTulhMLH/e0ZReHEfK
         /Ghq7Wiqbe6Ed3TK9s7EVqwh43VHExBMEiWtF8vRmhzrM5+2ZeblqGC0LjoTvL63OvfV
         V2qMpkwS5uuszWGq0BqBa3yhbiCd8PFqWBWCmVV+wddqFlOUt6oi0pTCrBZ4CW7OqICg
         XG3ggyhAhjZV6Pe8S/NJvcbky3gkQxXSkf+3XUoHW0bNdnX8UkSu3GePp9qwA7E7cl5A
         g71g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774785611; x=1775390411; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e4cxyqhp2lKo6HQezstxnQI1KcRL6XZbchzgv4xAzow=;
        b=AUDOkiJzGTOLO6MfTx11PIQK6DirCIL+oyLbWUFaPzivds3zriar+z/44P/GN9nS9Q
         M7/eWobO1LYjU0EMXLRHfN6ppJW+jfig3YhCiqRmCIAP5Qw76rVlNMYN6AsGWJXJrHFr
         NZ3Iy0TafC2EIffKKZGXaa5EcWVRZXnAd3wahPMuwkBazyty48ysRvQPXS13Br6J2H/A
         Q31MqkdvMsHXlFlhr0Vt0I8zpHOS14EKDau+coKqewfdUveCisjms1nD0Eny6NS7Orpb
         dOQThYKLw3nUs1FPQ3DNEXP4ItZ5JeraPqicYv0IY1bZRsTbdniwZlDoTkVL32HtNM9t
         o9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774785611; x=1775390411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4cxyqhp2lKo6HQezstxnQI1KcRL6XZbchzgv4xAzow=;
        b=VsXPE7YJkI7rMYtfUeZEqMBqvV/9MoDVAky4E4vauiddhC3j8cFVWwzHT1j74l8Fck
         Rk1X2LXs2jExJRZBOWKHnoRs8CjymBkzQD6S6U/rDW6Vtzyb7Tb27hwvX3Y4upbv0IU+
         E3YsD/8VMWY98ytioTvOfTb5X1xngA9jNv6zHfR7L1j021OAABNcqo8O+ZlSOBJhODN1
         Hwmaxrh2ejf8dqdIYvaTclK1tGTRjDL9dMKY7LRM8LeEuFS2/3uQhoNg8yMbCkOuflOZ
         NBzjOtL+Mvy0q7KdoV+ihFGcyer6FmpmYiGA0RI/6fp/g9ItzEWP0vaqoixTVv1iq6fB
         8jnA==
X-Gm-Message-State: AOJu0YxL6/i4WWiZXqr4Ntsf++iA5AIhwcMTNE0doWqoSJx2qSH4kTya
	Nv+llMfRv5SBdA0oEmu1WtWRToRAnfdOhMAFnW9X/Ulp7rY8H7yizRgNYcOY03W+drXXOp7/o2F
	zQNzS1iVOTwyCy4gcvb4d8NZUf2f3ZjI=
X-Gm-Gg: ATEYQzxTSRLX22Bi7KrJvDaXVQp6evkogMkKPjmOkpXelfAmZ1ehlc02aomRJGFA8El
	NW3aOfUNKXFPGlgddq52qiduHO6JHlp79XoS9rbyrUNA3dDIP3K5JVTewDQbSaQ/+gzmTBOMUFG
	O/Je3deTgKjSHtEK5Hqws+5f5IQZSup5BUxiK7Ch1uo8HFpoP7K1JTi/YZklVFDXP1jOa8UA/8X
	kWaz/9pVGi0GrTRr3Wyraphwc9XrEvy6a1ix50kakOoQ8CrJu2NBGYfLoZEGe4yTF0RvkIOQ6vX
	E2/l9w==
X-Received: by 2002:a05:6808:244d:b0:467:1c9e:2121 with SMTP id
 5614622812f47-46a8a37293amr3913717b6e.1.1774785611103; Sun, 29 Mar 2026
 05:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260329115757.66040-1-0xkkato@gmail.com>
In-Reply-To: <20260329115757.66040-1-0xkkato@gmail.com>
From: 0x Kato <0xkkato@gmail.com>
Date: Sun, 29 Mar 2026 13:59:59 +0200
X-Gm-Features: AQROBzAYyfjkM0ERcrGpSjl-LHe9x0EIS0fzoNqM8A_OYZB432kACxxxSMYf5vo
Message-ID: <CABujsrU4D-da+TJMw6Nzq1dxE+HmvhWmo8-j3kqsLNjnCP9gag@mail.gmail.com>
Subject: Re: [PATCH] ntfs3: fix OOB write in attr_wof_frame_info()
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000e7182e064e2879c3"

--000000000000e7182e064e2879c3
Content-Type: multipart/alternative; boundary="000000000000e7182c064e2879c1"

--000000000000e7182c064e2879c1
Content-Type: text/plain; charset="UTF-8"

Attaching the PoC image generator and trigger program referenced in the
reproducer.

On Sun, 29 Mar 2026 at 13:58, 0xkato <0xkkato@gmail.com> wrote:

> In attr_wof_frame_info(), the offset-table read range for a nonresident
> WofCompressedData stream is:
>
>     u64 from = vbo[i] & ~(u64)(PAGE_SIZE - 1);
>     u64 to   = min(from + PAGE_SIZE, wof_size);
>     ...
>     ntfs_read_run(sbi, run, addr, from, to - from);
>
> A crafted image sets WofCompressedData.nres.data_size to 0xfff while the
> file is large enough to request frame 1024 (offset 0x400000). This gives
> from=0x1000, to=0xfff. The unsigned (to - from) wraps to 0xffffffffffffffff
> and ntfs_read_write_run() overflows the single-page offs_folio via memcpy.
>
> Triggered by pread() on a mounted NTFS image. Depending on adjacent
> memory layout at the time of the overflow, KASAN reports this as
> slab-out-of-bounds, use-after-free, or slab-use-after-free all at
> ntfs_read_write_run(). Secondary corruption/panic paths were also observed.
>
> Reject the read when the offset-table page is outside the stream.
>
> Signed-off-by: 0xkato <0xkkato@gmail.com>
> ---
> Reproducer:
>
>   Create the crafted NTFS image:
>     python3 create_wof_poc.py -o wof-poc.img
>
>   Mount it read-only with ntfs3:
>     sudo mount -t ntfs3 -o loop,ro wof-poc.img /mnt
>
>   Build the trigger:
>     cc -O2 -static wof_offset_table_read_trigger.c -o trigger
>
>   Trigger the bug:
>     ./trigger /mnt/poc.bin 0x400000 1
>
> KASAN report on 6.19.10:
>
>   ==================================================================
>   BUG: KASAN: slab-out-of-bounds in ntfs_read_write_run+0x321/0x450 [ntfs3]
>   Write of size 4096 at addr ffff88800353b000 by task trigger-static/55
>
>   Call Trace:
>    __asan_memcpy+0x3c/0x60
>    ntfs_read_write_run+0x321/0x450 [ntfs3]
>    attr_wof_frame_info+0x52b/0xbc0 [ntfs3]
>    ni_read_frame+0x3cc/0xfe0 [ntfs3]
>    ni_read_folio_cmpr+0x3b9/0x820 [ntfs3]
>    read_pages+0x58a/0x810
>    page_cache_ra_unbounded+0x29c/0x5d0
>    filemap_get_pages+0x2c8/0x1530
>    filemap_read+0x2e7/0xb80
>    vfs_read+0x6da/0xa40
>    __x64_sys_pread64+0x195/0x250
>   ==================================================================
>
>  fs/ntfs3/attrib.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index 6cb9bc5d6..89921e509 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -1576,6 +1576,12 @@ int attr_wof_frame_info(struct ntfs_inode *ni,
> struct ATTRIB *attr,
>                         u64 from = vbo[i] & ~(u64)(PAGE_SIZE - 1);
>                         u64 to = min(from + PAGE_SIZE, wof_size);
>
> +                       if (from >= wof_size) {
> +                               _ntfs_bad_inode(&ni->vfs_inode);
> +                               err = -EINVAL;
> +                               goto out1;
> +                       }
> +
>                         err = attr_load_runs_range(ni, ATTR_DATA, WOF_NAME,
>                                                    ARRAY_SIZE(WOF_NAME),
> run,
>                                                    from, to);
> --
> 2.50.1 (Apple Git-155)
>
>

--000000000000e7182c064e2879c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-family:monospace;white-space:pre"><div =
style=3D"display:inline"><span style=3D"font-family:arial,sans-serif">Attac=
hing the PoC image generator and trigger program referenced in the reproduc=
er.</span></div></div></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 29 Mar 2026 at 13:58, 0=
xkato &lt;<a href=3D"mailto:0xkkato@gmail.com">0xkkato@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In attr_wof=
_frame_info(), the offset-table read range for a nonresident<br>
WofCompressedData stream is:<br>
<br>
=C2=A0 =C2=A0 u64 from =3D vbo[i] &amp; ~(u64)(PAGE_SIZE - 1);<br>
=C2=A0 =C2=A0 u64 to=C2=A0 =C2=A0=3D min(from + PAGE_SIZE, wof_size);<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 ntfs_read_run(sbi, run, addr, from, to - from);<br>
<br>
A crafted image sets WofCompressedData.nres.data_size to 0xfff while the<br=
>
file is large enough to request frame 1024 (offset 0x400000). This gives<br=
>
from=3D0x1000, to=3D0xfff. The unsigned (to - from) wraps to 0xffffffffffff=
ffff<br>
and ntfs_read_write_run() overflows the single-page offs_folio via memcpy.<=
br>
<br>
Triggered by pread() on a mounted NTFS image. Depending on adjacent<br>
memory layout at the time of the overflow, KASAN reports this as<br>
slab-out-of-bounds, use-after-free, or slab-use-after-free all at<br>
ntfs_read_write_run(). Secondary corruption/panic paths were also observed.=
<br>
<br>
Reject the read when the offset-table page is outside the stream.<br>
<br>
Signed-off-by: 0xkato &lt;<a href=3D"mailto:0xkkato@gmail.com" target=3D"_b=
lank">0xkkato@gmail.com</a>&gt;<br>
---<br>
Reproducer:<br>
<br>
=C2=A0 Create the crafted NTFS image:<br>
=C2=A0 =C2=A0 python3 create_wof_poc.py -o wof-poc.img<br>
<br>
=C2=A0 Mount it read-only with ntfs3:<br>
=C2=A0 =C2=A0 sudo mount -t ntfs3 -o loop,ro wof-poc.img /mnt<br>
<br>
=C2=A0 Build the trigger:<br>
=C2=A0 =C2=A0 cc -O2 -static wof_offset_table_read_trigger.c -o trigger<br>
<br>
=C2=A0 Trigger the bug:<br>
=C2=A0 =C2=A0 ./trigger /mnt/poc.bin 0x400000 1<br>
<br>
KASAN report on 6.19.10:<br>
<br>
=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0 BUG: KASAN: slab-out-of-bounds in ntfs_read_write_run+0x321/0x450 [n=
tfs3]<br>
=C2=A0 Write of size 4096 at addr ffff88800353b000 by task trigger-static/5=
5<br>
<br>
=C2=A0 Call Trace:<br>
=C2=A0 =C2=A0__asan_memcpy+0x3c/0x60<br>
=C2=A0 =C2=A0ntfs_read_write_run+0x321/0x450 [ntfs3]<br>
=C2=A0 =C2=A0attr_wof_frame_info+0x52b/0xbc0 [ntfs3]<br>
=C2=A0 =C2=A0ni_read_frame+0x3cc/0xfe0 [ntfs3]<br>
=C2=A0 =C2=A0ni_read_folio_cmpr+0x3b9/0x820 [ntfs3]<br>
=C2=A0 =C2=A0read_pages+0x58a/0x810<br>
=C2=A0 =C2=A0page_cache_ra_unbounded+0x29c/0x5d0<br>
=C2=A0 =C2=A0filemap_get_pages+0x2c8/0x1530<br>
=C2=A0 =C2=A0filemap_read+0x2e7/0xb80<br>
=C2=A0 =C2=A0vfs_read+0x6da/0xa40<br>
=C2=A0 =C2=A0__x64_sys_pread64+0x195/0x250<br>
=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0fs/ntfs3/attrib.c | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c<br>
index 6cb9bc5d6..89921e509 100644<br>
--- a/fs/ntfs3/attrib.c<br>
+++ b/fs/ntfs3/attrib.c<br>
@@ -1576,6 +1576,12 @@ int attr_wof_frame_info(struct ntfs_inode *ni, struc=
t ATTRIB *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 u64 from =3D vbo[i] &amp; ~(u64)(PAGE_SIZE - 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 u64 to =3D min(from + PAGE_SIZE, wof_size);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (from &gt;=3D wof_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_ntfs_bad_inode(&amp;ni-&gt;vfs_inode=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 err =3D attr_load_runs_range(ni, ATTR_DATA, WOF_NAME,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(WOF_NAME), run,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from, to);<br>
-- <br>
2.50.1 (Apple Git-155)<br>
<br>
</blockquote></div>

--000000000000e7182c064e2879c1--
--000000000000e7182e064e2879c3
Content-Type: text/x-python-script; charset="US-ASCII"; name="create_wof_poc.py"
Content-Disposition: attachment; filename="create_wof_poc.py"
Content-Transfer-Encoding: base64
Content-ID: <f_mnbphczw0>
X-Attachment-Id: f_mnbphczw0

IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwoiIiIKUmVzdG9yZSB0aGUgcHJlc2VydmVkIG50ZnMzIFdP
RiBvZmZzZXQtdGFibGUgUG9DIGltYWdlIGZyb20gdGhlIG1pbmltYWwgYXJjaGl2ZS4KClRoZSBv
cmlnaW5hbCBQb0MgZ2VuZXJhdG9yIHdhcyBsb3N0IGZyb20gL3RtcCwgYnV0IHRoZSBrbm93bi1n
b29kIGxhYiBpbWFnZSBhbmQKbWFuaWZlc3Qgc3RpbGwgZXhpc3QgaW5zaWRlIC9ob21lL2thdG8v
RG93bmxvYWRzL250ZnMzLXdvZi1wb2MtbWluaW1hbC50YXIuZ3ouClRoaXMgc2NyaXB0IHJlY29u
c3RydWN0cyB0aGUgcmVwb3J0IGF0dGFjaG1lbnQgaW50ZXJmYWNlOgoKICAgIHB5dGhvbjMgY3Jl
YXRlX3dvZl9wb2MucHkgLW8gd29mLXBvYy5pbWcKCk9wdGlvbmFsbHkgZW1pdCB0aGUgcHJlc2Vy
dmVkIG1hbmlmZXN0IGFzIHdlbGw6CgogICAgcHl0aG9uMyBjcmVhdGVfd29mX3BvYy5weSAtbyB3
b2YtcG9jLmltZyAtLW1hbmlmZXN0IHdvZi1wb2MuZW52CiIiIgoKZnJvbSBfX2Z1dHVyZV9fIGlt
cG9ydCBhbm5vdGF0aW9ucwoKaW1wb3J0IGFyZ3BhcnNlCmltcG9ydCBoYXNobGliCmltcG9ydCBz
aHV0aWwKaW1wb3J0IHN5cwppbXBvcnQgdGFyZmlsZQpmcm9tIHBhdGhsaWIgaW1wb3J0IFBhdGgK
CgpBUkNISVZFX05BTUUgPSAibnRmczMtd29mLXBvYy1taW5pbWFsLnRhci5neiIKSU1BR0VfTUVN
QkVSID0gInRvb2xzL3Jlc2VhcmNoL250ZnMzL2xhYi93b2YtcG9jLmltZyIKTUFOSUZFU1RfTUVN
QkVSID0gInRvb2xzL3Jlc2VhcmNoL250ZnMzL2xhYi93b2YtcG9jLmVudiIKREVGQVVMVF9BUkNI
SVZFID0gUGF0aChfX2ZpbGVfXykucmVzb2x2ZSgpLnBhcmVudC5wYXJlbnQgLyBBUkNISVZFX05B
TUUKCgpkZWYgcGFyc2VfYXJncygpIC0+IGFyZ3BhcnNlLk5hbWVzcGFjZToKICAgIHBhcnNlciA9
IGFyZ3BhcnNlLkFyZ3VtZW50UGFyc2VyKAogICAgICAgIGRlc2NyaXB0aW9uPSJSZWNyZWF0ZSB0
aGUgbnRmczMgV09GIG9mZnNldC10YWJsZSBQb0MgaW1hZ2UgZnJvbSB0aGUgc2F2ZWQgYXJjaGl2
ZS4iLAogICAgKQogICAgcGFyc2VyLmFkZF9hcmd1bWVudCgKICAgICAgICAiLW8iLAogICAgICAg
ICItLW91dHB1dCIsCiAgICAgICAgcmVxdWlyZWQ9VHJ1ZSwKICAgICAgICB0eXBlPVBhdGgsCiAg
ICAgICAgaGVscD0iUGF0aCB0byB3cml0ZSB0aGUgUG9DIGltYWdlIHRvLiIsCiAgICApCiAgICBw
YXJzZXIuYWRkX2FyZ3VtZW50KAogICAgICAgICItLW1hbmlmZXN0IiwKICAgICAgICB0eXBlPVBh
dGgsCiAgICAgICAgaGVscD0iT3B0aW9uYWwgcGF0aCB0byBhbHNvIHdyaXRlIHRoZSBwcmVzZXJ2
ZWQgbWFuaWZlc3QgdG8uIiwKICAgICkKICAgIHBhcnNlci5hZGRfYXJndW1lbnQoCiAgICAgICAg
Ii0tYXJjaGl2ZSIsCiAgICAgICAgdHlwZT1QYXRoLAogICAgICAgIGRlZmF1bHQ9REVGQVVMVF9B
UkNISVZFLAogICAgICAgIGhlbHA9ZiJBcmNoaXZlIGNvbnRhaW5pbmcgdGhlIHNhdmVkIFBvQyBh
c3NldHMgKGRlZmF1bHQ6IHtERUZBVUxUX0FSQ0hJVkV9KS4iLAogICAgKQogICAgcGFyc2VyLmFk
ZF9hcmd1bWVudCgKICAgICAgICAiLWYiLAogICAgICAgICItLWZvcmNlIiwKICAgICAgICBhY3Rp
b249InN0b3JlX3RydWUiLAogICAgICAgIGhlbHA9Ik92ZXJ3cml0ZSBleGlzdGluZyBvdXRwdXQg
ZmlsZXMuIiwKICAgICkKICAgIHJldHVybiBwYXJzZXIucGFyc2VfYXJncygpCgoKZGVmIGVuc3Vy
ZV93cml0YWJsZShwYXRoOiBQYXRoLCBmb3JjZTogYm9vbCkgLT4gTm9uZToKICAgIGlmIHBhdGgu
ZXhpc3RzKCkgYW5kIG5vdCBmb3JjZToKICAgICAgICByYWlzZSBGaWxlRXhpc3RzRXJyb3IoZiJy
ZWZ1c2luZyB0byBvdmVyd3JpdGUgZXhpc3RpbmcgZmlsZToge3BhdGh9IikKICAgIHBhdGgucGFy
ZW50Lm1rZGlyKHBhcmVudHM9VHJ1ZSwgZXhpc3Rfb2s9VHJ1ZSkKCgpkZWYgZXh0cmFjdF9tZW1i
ZXIodGY6IHRhcmZpbGUuVGFyRmlsZSwgbWVtYmVyX25hbWU6IHN0ciwgZHN0OiBQYXRoLCBmb3Jj
ZTogYm9vbCkgLT4gaW50OgogICAgZW5zdXJlX3dyaXRhYmxlKGRzdCwgZm9yY2UpCiAgICBtZW1i
ZXIgPSB0Zi5nZXRtZW1iZXIobWVtYmVyX25hbWUpCiAgICBzcmMgPSB0Zi5leHRyYWN0ZmlsZSht
ZW1iZXIpCiAgICBpZiBzcmMgaXMgTm9uZToKICAgICAgICByYWlzZSBGaWxlTm90Rm91bmRFcnJv
cihmImFyY2hpdmUgbWVtYmVyIGlzIG5vdCBhIHJlZ3VsYXIgZmlsZToge21lbWJlcl9uYW1lfSIp
CgogICAgd2l0aCBzcmMsIG9wZW4oZHN0LCAid2IiKSBhcyBvdXQ6CiAgICAgICAgc2h1dGlsLmNv
cHlmaWxlb2JqKHNyYywgb3V0KQoKICAgIHJldHVybiBtZW1iZXIuc2l6ZQoKCmRlZiBzaGEyNTZz
dW0ocGF0aDogUGF0aCkgLT4gc3RyOgogICAgZGlnZXN0ID0gaGFzaGxpYi5zaGEyNTYoKQogICAg
d2l0aCBvcGVuKHBhdGgsICJyYiIpIGFzIGY6CiAgICAgICAgZm9yIGNodW5rIGluIGl0ZXIobGFt
YmRhOiBmLnJlYWQoMTAyNCAqIDEwMjQpLCBiIiIpOgogICAgICAgICAgICBkaWdlc3QudXBkYXRl
KGNodW5rKQogICAgcmV0dXJuIGRpZ2VzdC5oZXhkaWdlc3QoKQoKCmRlZiBtYWluKCkgLT4gaW50
OgogICAgYXJncyA9IHBhcnNlX2FyZ3MoKQogICAgYXJjaGl2ZSA9IGFyZ3MuYXJjaGl2ZS5yZXNv
bHZlKCkKICAgIG91dHB1dCA9IGFyZ3Mub3V0cHV0LnJlc29sdmUoKQogICAgbWFuaWZlc3QgPSBh
cmdzLm1hbmlmZXN0LnJlc29sdmUoKSBpZiBhcmdzLm1hbmlmZXN0IGVsc2UgTm9uZQoKICAgIGlm
IG5vdCBhcmNoaXZlLmlzX2ZpbGUoKToKICAgICAgICBwcmludChmImVycm9yOiBhcmNoaXZlIG5v
dCBmb3VuZDoge2FyY2hpdmV9IiwgZmlsZT1zeXMuc3RkZXJyKQogICAgICAgIHJldHVybiAxCgog
ICAgdHJ5OgogICAgICAgIHdpdGggdGFyZmlsZS5vcGVuKGFyY2hpdmUsICJyOmd6IikgYXMgdGY6
CiAgICAgICAgICAgIGltYWdlX3NpemUgPSBleHRyYWN0X21lbWJlcih0ZiwgSU1BR0VfTUVNQkVS
LCBvdXRwdXQsIGFyZ3MuZm9yY2UpCiAgICAgICAgICAgIG1hbmlmZXN0X3NpemUgPSBOb25lCiAg
ICAgICAgICAgIGlmIG1hbmlmZXN0IGlzIG5vdCBOb25lOgogICAgICAgICAgICAgICAgbWFuaWZl
c3Rfc2l6ZSA9IGV4dHJhY3RfbWVtYmVyKHRmLCBNQU5JRkVTVF9NRU1CRVIsIG1hbmlmZXN0LCBh
cmdzLmZvcmNlKQogICAgZXhjZXB0IChGaWxlRXhpc3RzRXJyb3IsIEZpbGVOb3RGb3VuZEVycm9y
LCBLZXlFcnJvciwgdGFyZmlsZS5UYXJFcnJvciwgT1NFcnJvcikgYXMgZXhjOgogICAgICAgIHBy
aW50KGYiZXJyb3I6IHtleGN9IiwgZmlsZT1zeXMuc3RkZXJyKQogICAgICAgIHJldHVybiAxCgog
ICAgcHJpbnQoZiJ3cm90ZSBpbWFnZToge291dHB1dH0gKHtpbWFnZV9zaXplfSBieXRlcykiKQog
ICAgcHJpbnQoZiJzaGEyNTY6IHtzaGEyNTZzdW0ob3V0cHV0KX0iKQogICAgaWYgbWFuaWZlc3Qg
aXMgbm90IE5vbmUgYW5kIG1hbmlmZXN0X3NpemUgaXMgbm90IE5vbmU6CiAgICAgICAgcHJpbnQo
ZiJ3cm90ZSBtYW5pZmVzdDoge21hbmlmZXN0fSAoe21hbmlmZXN0X3NpemV9IGJ5dGVzKSIpCiAg
ICBwcmludCgidGFyZ2V0IGZpbGU6IC9wb2MuYmluIikKICAgIHByaW50KCJ0cmlnZ2VyIG9mZnNl
dDogMHg0MDAwMDAiKQogICAgcmV0dXJuIDAKCgppZiBfX25hbWVfXyA9PSAiX19tYWluX18iOgog
ICAgcmFpc2UgU3lzdGVtRXhpdChtYWluKCkpCg==
--000000000000e7182e064e2879c3
Content-Type: application/octet-stream; 
	name="wof_offset_table_read_trigger.c"
Content-Disposition: attachment; filename="wof_offset_table_read_trigger.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mnbphekz1>
X-Attachment-Id: f_mnbphekz1

I2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8c3RkaW8uaD4K
I2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3RyaW5nLmg+CiNpbmNsdWRlIDxzeXMvc3Rh
dC5oPgojaW5jbHVkZSA8c3lzL3R5cGVzLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KCnN0YXRpYyB2
b2lkIHVzYWdlKGNvbnN0IGNoYXIgKnByb2cpCnsKCWZwcmludGYoc3RkZXJyLAoJCSJ1c2FnZTog
JXMgPHBhdGg+IFtvZmZzZXRdIFtsZW5ndGhdXG4iCgkJIiAgb2Zmc2V0IGRlZmF1bHRzIHRvIDB4
NDAwMDAwXG4iCgkJIiAgbGVuZ3RoIGRlZmF1bHRzIHRvIDFcbiIsCgkJcHJvZyk7Cn0KCnN0YXRp
YyB1bnNpZ25lZCBsb25nIGxvbmcgcGFyc2VfdWxsKGNvbnN0IGNoYXIgKmFyZywgY29uc3QgY2hh
ciAqbmFtZSkKewoJY2hhciAqZW5kID0gTlVMTDsKCXVuc2lnbmVkIGxvbmcgbG9uZyB2YWx1ZTsK
CgllcnJubyA9IDA7Cgl2YWx1ZSA9IHN0cnRvdWxsKGFyZywgJmVuZCwgMCk7CglpZiAoZXJybm8g
fHwgIWVuZCB8fCAqZW5kKSB7CgkJZnByaW50ZihzdGRlcnIsICJpbnZhbGlkICVzOiAlc1xuIiwg
bmFtZSwgYXJnKTsKCQlleGl0KDIpOwoJfQoKCXJldHVybiB2YWx1ZTsKfQoKaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKiphcmd2KQp7Cgljb25zdCBjaGFyICpwYXRoOwoJdW5zaWduZWQgbG9uZyBs
b25nIG9mZnNldCA9IDB4NDAwMDAwdWxsOwoJdW5zaWduZWQgbG9uZyBsb25nIGxlbmd0aCA9IDE7
CgljaGFyICpidWY7Cglzc2l6ZV90IHJldDsKCWludCBmZDsKCglpZiAoYXJnYyA8IDIgfHwgYXJn
YyA+IDQpIHsKCQl1c2FnZShhcmd2WzBdKTsKCQlyZXR1cm4gMjsKCX0KCglwYXRoID0gYXJndlsx
XTsKCWlmIChhcmdjID49IDMpCgkJb2Zmc2V0ID0gcGFyc2VfdWxsKGFyZ3ZbMl0sICJvZmZzZXQi
KTsKCWlmIChhcmdjID49IDQpCgkJbGVuZ3RoID0gcGFyc2VfdWxsKGFyZ3ZbM10sICJsZW5ndGgi
KTsKCglpZiAoIWxlbmd0aCB8fCBsZW5ndGggPiAoMXVsbCA8PCAyMCkpIHsKCQlmcHJpbnRmKHN0
ZGVyciwgImxlbmd0aCBtdXN0IGJlIGJldHdlZW4gMSBhbmQgMTA0ODU3NlxuIik7CgkJcmV0dXJu
IDI7Cgl9CgoJYnVmID0gbWFsbG9jKChzaXplX3QpbGVuZ3RoKTsKCWlmICghYnVmKSB7CgkJZnBy
aW50ZihzdGRlcnIsICJtYWxsb2MoJWxsdSkgZmFpbGVkXG4iLCBsZW5ndGgpOwoJCXJldHVybiAx
OwoJfQoKCWZkID0gb3BlbihwYXRoLCBPX1JET05MWSk7CglpZiAoZmQgPCAwKSB7CgkJZnByaW50
ZihzdGRlcnIsICJvcGVuKCVzKSBmYWlsZWQ6ICVzXG4iLCBwYXRoLCBzdHJlcnJvcihlcnJubykp
OwoJCWZyZWUoYnVmKTsKCQlyZXR1cm4gMTsKCX0KCglyZXQgPSBwcmVhZChmZCwgYnVmLCAoc2l6
ZV90KWxlbmd0aCwgKG9mZl90KW9mZnNldCk7CglpZiAocmV0IDwgMCkgewoJCWZwcmludGYoc3Rk
ZXJyLCAicHJlYWQoJXMsIDB4JWxseCwgJWxsdSkgZmFpbGVkOiAlc1xuIiwKCQkJcGF0aCwgb2Zm
c2V0LCBsZW5ndGgsIHN0cmVycm9yKGVycm5vKSk7CgkJY2xvc2UoZmQpOwoJCWZyZWUoYnVmKTsK
CQlyZXR1cm4gMTsKCX0KCglwcmludGYoInByZWFkKCVzLCAweCVsbHgsICVsbHUpIC0+ICV6ZFxu
IiwgcGF0aCwgb2Zmc2V0LCBsZW5ndGgsIHJldCk7CgljbG9zZShmZCk7CglmcmVlKGJ1Zik7Cgly
ZXR1cm4gcmV0ID4gMCA/IDAgOiAxOwp9Cg==
--000000000000e7182e064e2879c3--
