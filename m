Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F375472
	for <ntfs3@lists.linux.dev>; Fri, 27 Aug 2021 09:43:25 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id i9so13121867lfg.10
        for <ntfs3@lists.linux.dev>; Fri, 27 Aug 2021 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x6pU9uaWUe7Vofvdr9IcoW1Wt/2k8KaV3FfF55Sakjo=;
        b=L4iSNQ9A3oiI+Bj6bWPrr7uaxBH+PNnf2wYWwqo/sJMdLCu3UaGKtPCL1855UlrcPq
         lrVJ2k/dIs1Wt50pyJm+v0c759O8qP7H3nyoHlMG1uZzpOCwB47fK/yxHVNDilqvSvs+
         nEJ/cPEAynH7BJ4aLWH4COIsNv5NCMRtWoPMZXrylvt15sfkHLRn8HdOVOqh9Ncp+dUa
         lxkbUxSiiCZYU3s3jwzdlt/jVavu3JBuRIWK2EOEqEwx3zQiSTk6EUaiohjNrNlPwsRr
         L+muE5RlbBozkP7DtE8FGOMHnoEA/d+Om6tEzQnOqMu9qPLKIn/y3yvvG7EQx1y7Kxu4
         bdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x6pU9uaWUe7Vofvdr9IcoW1Wt/2k8KaV3FfF55Sakjo=;
        b=UpPB4eAwKYvelFIXSA39KNmTYd9pIR7leBWf0c/vb3eiurIxQ9Ff8IKBPpfF/IcElJ
         0ncxy5NYnsANLwTZkazkwKlpykRAmtiScewLKfe4/ec+snxDbfhH/7VpcJ5D59mCD243
         xsV+6Db3HX3+igaz0T8HqVbUcT2HEmqp2KEzbW69W0ZFInEJjmxpDrVF3RlAjkzQ06u9
         3wk12uJHRlEIOghC5+kwPYG/fmvk+aMBf2XDCZGshfIpbVvo/KPMFVy3rfLICEl9cb8/
         9URD0HoBO8791fC/f7E0T7LMV7o8RDARNkFacYTmKkFseGykIjbEU0S+0AzU9PJqbMDp
         p8zg==
X-Gm-Message-State: AOAM532Pafexfw3zrS29Z3Xq01asyXLqm2Fqg0v5FKXNL2eLp9A34WNu
	bjp+rP/B/fFQ57wAKI0SSLU=
X-Google-Smtp-Source: ABdhPJztZ5RthXUVzcWbtbx5LIoG4rFvX+gCATzgbFSaK2N9Mlue9acvjeNU4BYJVwbSMIRfXJuolQ==
X-Received: by 2002:ac2:4d48:: with SMTP id 8mr6237888lfp.244.1630057404017;
        Fri, 27 Aug 2021 02:43:24 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u10sm545891lft.252.2021.08.27.02.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 02:43:23 -0700 (PDT)
Date: Fri, 27 Aug 2021 12:43:21 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev
Subject: Re: [bug report] fs/ntfs3: missing error code in
 attr_data_get_block()
Message-ID: <20210827094321.r2nxmzdq44lc6a2m@kari-VirtualBox>
References: <20210827085757.GA9449@kili>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827085757.GA9449@kili>

On Fri, Aug 27, 2021 at 11:57:57AM +0300, Dan Carpenter wrote:
> Hello Konstantin Komarov,
> 
> The patch be71b5cba2e6: "fs/ntfs3: Add attrib operations" from Aug
> 13, 2021, leads to the following
> Smatch static checker warning:
> 
> 	fs/ntfs3/attrib.c:1031 attr_data_get_block()
> 	warn: missing error code here? 'ni_load_mi()' failed. 'err' = '0'
> 
> fs/ntfs3/attrib.c
>     823 int attr_data_get_block(struct ntfs_inode *ni, CLST vcn, CLST clen, CLST *lcn,
>     824                         CLST *len, bool *new)
>     825 {
>     826         int err = 0;
>     827         struct runs_tree *run = &ni->file.run;
>     828         struct ntfs_sb_info *sbi;
>     829         u8 cluster_bits;
>     830         struct ATTRIB *attr = NULL, *attr_b;
>     831         struct ATTR_LIST_ENTRY *le, *le_b;
>     832         struct mft_inode *mi, *mi_b;
>     833         CLST hint, svcn, to_alloc, evcn1, next_svcn, asize, end;
>     834         u64 total_size;
>     835         u32 clst_per_frame;
>     836         bool ok;
>     837 
>     838         if (new)
>     839                 *new = false;
>     840 
>     841         down_read(&ni->file.run_lock);
>     842         ok = run_lookup_entry(run, vcn, lcn, len, NULL);
>     843         up_read(&ni->file.run_lock);
>     844 
>     845         if (ok && (*lcn != SPARSE_LCN || !new)) {
>     846                 /* normal way */
>     847                 return 0;
>     848         }
>     849 
>     850         if (!clen)
>     851                 clen = 1;
>     852 
>     853         if (ok && clen > *len)
>     854                 clen = *len;
>     855 
>     856         sbi = ni->mi.sbi;
>     857         cluster_bits = sbi->cluster_bits;
>     858 
>     859         ni_lock(ni);
>     860         down_write(&ni->file.run_lock);
>     861 
>     862         le_b = NULL;
>     863         attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL, 0, NULL, &mi_b);
>     864         if (!attr_b) {
>     865                 err = -ENOENT;
>     866                 goto out;
>     867         }
>     868 
>     869         if (!attr_b->non_res) {
>     870                 *lcn = RESIDENT_LCN;
>     871                 *len = 1;
>     872                 goto out;
>     873         }
>     874 
>     875         asize = le64_to_cpu(attr_b->nres.alloc_size) >> sbi->cluster_bits;
>     876         if (vcn >= asize) {
>     877                 err = -EINVAL;
>     878                 goto out;
>     879         }
>     880 
>     881         clst_per_frame = 1u << attr_b->nres.c_unit;
>     882         to_alloc = (clen + clst_per_frame - 1) & ~(clst_per_frame - 1);
>     883 
>     884         if (vcn + to_alloc > asize)
>     885                 to_alloc = asize - vcn;
>     886 
>     887         svcn = le64_to_cpu(attr_b->nres.svcn);
>     888         evcn1 = le64_to_cpu(attr_b->nres.evcn) + 1;
>     889 
>     890         attr = attr_b;
>     891         le = le_b;
>     892         mi = mi_b;
>     893 
>     894         if (le_b && (vcn < svcn || evcn1 <= vcn)) {
>     895                 attr = ni_find_attr(ni, attr_b, &le, ATTR_DATA, NULL, 0, &vcn,
>     896                                     &mi);
>     897                 if (!attr) {
>     898                         err = -EINVAL;
>     899                         goto out;
>     900                 }
>     901                 svcn = le64_to_cpu(attr->nres.svcn);
>     902                 evcn1 = le64_to_cpu(attr->nres.evcn) + 1;
>     903         }
>     904 
>     905         err = attr_load_runs(attr, ni, run, NULL);
>     906         if (err)
>     907                 goto out;
>     908 
>     909         if (!ok) {
>     910                 ok = run_lookup_entry(run, vcn, lcn, len, NULL);
>     911                 if (ok && (*lcn != SPARSE_LCN || !new)) {
>     912                         /* normal way */
>     913                         err = 0;
>     914                         goto ok;
>     915                 }
>     916 
>     917                 if (!ok && !new) {
>     918                         *len = 0;
>     919                         err = 0;
>     920                         goto ok;
>     921                 }
>     922 
>     923                 if (ok && clen > *len) {
>     924                         clen = *len;
>     925                         to_alloc = (clen + clst_per_frame - 1) &
>     926                                    ~(clst_per_frame - 1);
>     927                 }
>     928         }
>     929 
>     930         if (!is_attr_ext(attr_b)) {
>     931                 err = -EINVAL;
>     932                 goto out;
>     933         }
>     934 
>     935         /* Get the last lcn to allocate from */
>     936         hint = 0;
>     937 
>     938         if (vcn > evcn1) {
>     939                 if (!run_add_entry(run, evcn1, SPARSE_LCN, vcn - evcn1,
>     940                                    false)) {
>     941                         err = -ENOMEM;
>     942                         goto out;
>     943                 }
>     944         } else if (vcn && !run_lookup_entry(run, vcn - 1, &hint, NULL, NULL)) {
>     945                 hint = -1;
>     946         }
>     947 
>     948         err = attr_allocate_clusters(
>     949                 sbi, run, vcn, hint + 1, to_alloc, NULL, 0, len,
>     950                 (sbi->record_size - le32_to_cpu(mi->mrec->used) + 8) / 3 + 1,
>     951                 lcn);
>     952         if (err)
>     953                 goto out;
>     954         *new = true;
>     955 
>     956         end = vcn + *len;
>     957 
>     958         total_size = le64_to_cpu(attr_b->nres.total_size) +
>     959                      ((u64)*len << cluster_bits);
>     960 
>     961 repack:
>     962         err = mi_pack_runs(mi, attr, run, max(end, evcn1) - svcn);
>     963         if (err)
>     964                 goto out;
>     965 
>     966         attr_b->nres.total_size = cpu_to_le64(total_size);
>     967         inode_set_bytes(&ni->vfs_inode, total_size);
>     968         ni->ni_flags |= NI_FLAG_UPDATE_PARENT;
>     969 
>     970         mi_b->dirty = true;
>     971         mark_inode_dirty(&ni->vfs_inode);
>     972 
>     973         /* stored [vcn : next_svcn) from [vcn : end) */
>     974         next_svcn = le64_to_cpu(attr->nres.evcn) + 1;
>     975 
>     976         if (end <= evcn1) {
>     977                 if (next_svcn == evcn1) {
>     978                         /* Normal way. update attribute and exit */
>     979                         goto ok;
>     980                 }
>     981                 /* add new segment [next_svcn : evcn1 - next_svcn )*/
>     982                 if (!ni->attr_list.size) {
>     983                         err = ni_create_attr_list(ni);
>     984                         if (err)
>     985                                 goto out;
>     986                         /* layout of records is changed */
>     987                         le_b = NULL;
>     988                         attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL,
>     989                                               0, NULL, &mi_b);
>     990                         if (!attr_b) {
>     991                                 err = -ENOENT;
>     992                                 goto out;
>     993                         }
>     994 
>     995                         attr = attr_b;
>     996                         le = le_b;
>     997                         mi = mi_b;
>     998                         goto repack;
>     999                 }
>     1000         }
>     1001 
>     1002         svcn = evcn1;
>     1003 
>     1004         /* Estimate next attribute */
>     1005         attr = ni_find_attr(ni, attr, &le, ATTR_DATA, NULL, 0, &svcn, &mi);
>     1006 
>     1007         if (attr) {
>     1008                 CLST alloc = bytes_to_cluster(
>     1009                         sbi, le64_to_cpu(attr_b->nres.alloc_size));
>     1010                 CLST evcn = le64_to_cpu(attr->nres.evcn);
>     1011 
>     1012                 if (end < next_svcn)
>     1013                         end = next_svcn;
>     1014                 while (end > evcn) {
>     1015                         /* remove segment [svcn : evcn)*/
>     1016                         mi_remove_attr(mi, attr);
>     1017 
>     1018                         if (!al_remove_le(ni, le)) {
>     1019                                 err = -EINVAL;
>     1020                                 goto out;
>     1021                         }
>     1022 
>     1023                         if (evcn + 1 >= alloc) {
>     1024                                 /* last attribute segment */
>     1025                                 evcn1 = evcn + 1;
>     1026                                 goto ins_ext;
>     1027                         }
>     1028 
>     1029                         if (ni_load_mi(ni, le, &mi)) {
>     1030                                 attr = NULL;
> 
> No error code on this path.  Also no need to set "attr" to NULL.

This same code can also be founded from attr_allocate_frame(). This
"repack" really needs to be own function.

> 
> --> 1031                                 goto out;
>     1032                         }
>     1033 
>     1034                         attr = mi_find_attr(mi, NULL, ATTR_DATA, NULL, 0,
>     1035                                             &le->id);
>     1036                         if (!attr) {
>     1037                                 err = -EINVAL;
>     1038                                 goto out;
>     1039                         }
>     1040                         svcn = le64_to_cpu(attr->nres.svcn);
>     1041                         evcn = le64_to_cpu(attr->nres.evcn);
>     1042                 }
>     1043 
>     1044                 if (end < svcn)
>     1045                         end = svcn;
>     1046 
>     1047                 err = attr_load_runs(attr, ni, run, &end);
>     1048                 if (err)
>     1049                         goto out;
>     1050 
>     1051                 evcn1 = evcn + 1;
>     1052                 attr->nres.svcn = cpu_to_le64(next_svcn);
>     1053                 err = mi_pack_runs(mi, attr, run, evcn1 - next_svcn);
>     1054                 if (err)
>     1055                         goto out;
>     1056 
>     1057                 le->vcn = cpu_to_le64(next_svcn);
>     1058                 ni->attr_list.dirty = true;
>     1059                 mi->dirty = true;
>     1060 
>     1061                 next_svcn = le64_to_cpu(attr->nres.evcn) + 1;
>     1062         }
>     1063 ins_ext:
>     1064         if (evcn1 > next_svcn) {
>     1065                 err = ni_insert_nonresident(ni, ATTR_DATA, NULL, 0, run,
>     1066                                             next_svcn, evcn1 - next_svcn,
>     1067                                             attr_b->flags, &attr, &mi);
>     1068                 if (err)
>     1069                         goto out;
>     1070         }
>     1071 ok:
>     1072         run_truncate_around(run, vcn);
>     1073 out:
>     1074         up_write(&ni->file.run_lock);
>     1075         ni_unlock(ni);
>     1076 
>     1077         return err;
>     1078 }
> 
> regards,
> dan carpenter
> 
