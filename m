Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E1972
	for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 08:33:44 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id h1so14010914ljl.9
        for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 01:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5OWRzAUmpu+ncOIFg+LR0HCgk7AbrDaj+ZdWFfqRHyI=;
        b=e1PmCJrHZBx2wVRn18R5AXtTpSPp/pJGnnmPVD7WTKD2bimO9rgv6zqvK+Bb97yo/k
         s8nellU0bCaz/uGvKP/PMPkr/ZR33BdmAEYfhVpEBxRAmRJmWCjUPGW6BaCqTXc+SrOG
         tX/owOOZmtxwK9PS/0fQU0sjcNlSMGKfrv0LhdgwSHChNX6SUQL9IexN3bOeIs9dzcQr
         mmGh0vZPhVoFI8MDBG2xSNCgwJSof7DvTysH/Pl/+Wx3gHs2P6kLoV5Jyqj6wfTjdBb4
         XBqbYypdoooMKSr15G8tTtxRdzn1slohE9E8dL9pMUu9AFPfc/bJuujv+RsXejHC54zy
         ncVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5OWRzAUmpu+ncOIFg+LR0HCgk7AbrDaj+ZdWFfqRHyI=;
        b=jhiWMlGca4t6XFFii4a8vhA/vyf+a4qlNxLcE3MBeT6YXyWVsuYjsXn9v4ziND1cBz
         OCfzmKxBAOcg8mkpKVVGCOeHuKR2zfkoNrjrsDjs3ff+m8atK1txTmjxIeUu9CM19Um4
         2IBuTe6t53SjlUkAR+Kj+yDBECOcjZRKrVN6UY/r6ZDBe9xbEP+d9DG9T0aOPa+IynDL
         qJu6FKGQTcQ+Atg3UDesuf9oJJRtHdwoXf4zFIOMPmUrSHDn/1oPLTFdIf8vWevS9AOI
         qUWgx9kygwQHrKRo0xf3u/JN3fH/O5YFMOxidmKXiF3nz1WDoEFCnchGIJi3wH6CfnFc
         SIQg==
X-Gm-Message-State: AOAM530BMA0AS46XL/dxauV3J7nBaEOJaFveeInAqBgk3V8ZQDAXRmsS
	NfrofWJRodZDYCmWtJZOtMc=
X-Google-Smtp-Source: ABdhPJy6ENw+t+lU50+2iGIDHAJQXTrj6MjCRXQb0vxia3dmbvEO0ejmDH1hz40drY8p58wQ9137tQ==
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr35831598ljo.436.1629880422566;
        Wed, 25 Aug 2021 01:33:42 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id x142sm2002531lff.5.2021.08.25.01.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 01:33:41 -0700 (PDT)
Date: Wed, 25 Aug 2021 11:33:40 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev
Subject: Re: [bug report] fs/ntfs3: integer overflow in ni_fiemap()
Message-ID: <20210825083340.zd2en66jqmohdy4u@kari-VirtualBox>
References: <20210825080440.GA17407@kili>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825080440.GA17407@kili>

On Wed, Aug 25, 2021 at 11:04:40AM +0300, Dan Carpenter wrote:
> Hello Konstantin Komarov,
> 
> The patch 4342306f0f0d: "fs/ntfs3: Add file operations and
> implementation" from Aug 13, 2021, leads to the following
> Smatch static checker warning:
> 
> 	fs/ntfs3/frecord.c:1894 ni_fiemap()
> 	warn: potential integer overflow from user 'vbo + len'
> 
> fs/ntfs3/frecord.c
>     1843 int ni_fiemap(struct ntfs_inode *ni, struct fiemap_extent_info *fieinfo,
>     1844 	      __u64 vbo, __u64 len)
> 
> "vbo" and "len" are u64 values which are controlled by the user from
> ioctl_fiemap().
> 
> I looked at how BTRFS does it and it uses the fiemap_prep() function.

And we should too. This was already in my todo list. Just didn't
notice real problem yet. I just though we should follow api as api
stated
	
	Flag checking should be done at the beginning of the ->fiemap
	callback via the fiemap_prep() helper.

Do you want to send a patch or do I? If I do it can I put reported-by
from you?

> To be honest, I don't know why fiemap_prep() isn't used in ioctl_fiemap()
> because that seems safer than relying on filesystems to do it themselves.

Example ext4 want to check some stuff before fiemap_prep(). There is
probably good reason in some corner case.

> 
>     1845 {
>     1846 	int err = 0;
>     1847 	struct ntfs_sb_info *sbi = ni->mi.sbi;
>     1848 	u8 cluster_bits = sbi->cluster_bits;
>     1849 	struct runs_tree *run;
>     1850 	struct rw_semaphore *run_lock;
>     1851 	struct ATTRIB *attr;
>     1852 	CLST vcn = vbo >> cluster_bits;
>     1853 	CLST lcn, clen;
>     1854 	u64 valid = ni->i_valid;
>     1855 	u64 lbo, bytes;
>     1856 	u64 end, alloc_size;
>     1857 	size_t idx = -1;
>     1858 	u32 flags;
>     1859 	bool ok;
>     1860 
>     1861 	if (S_ISDIR(ni->vfs_inode.i_mode)) {
>     1862 		run = &ni->dir.alloc_run;
>     1863 		attr = ni_find_attr(ni, NULL, NULL, ATTR_ALLOC, I30_NAME,
>     1864 				    ARRAY_SIZE(I30_NAME), NULL, NULL);
>     1865 		run_lock = &ni->dir.run_lock;
>     1866 	} else {
>     1867 		run = &ni->file.run;
>     1868 		attr = ni_find_attr(ni, NULL, NULL, ATTR_DATA, NULL, 0, NULL,
>     1869 				    NULL);
>     1870 		if (!attr) {
>     1871 			err = -EINVAL;
>     1872 			goto out;
>     1873 		}
>     1874 		if (is_attr_compressed(attr)) {
>     1875 			/*unfortunately cp -r incorrectly treats compressed clusters*/
>     1876 			err = -EOPNOTSUPP;
>     1877 			ntfs_inode_warn(
>     1878 				&ni->vfs_inode,
>     1879 				"fiemap is not supported for compressed file (cp -r)");
>     1880 			goto out;
>     1881 		}
>     1882 		run_lock = &ni->file.run_lock;
>     1883 	}
>     1884 
>     1885 	if (!attr || !attr->non_res) {
>     1886 		err = fiemap_fill_next_extent(
>     1887 			fieinfo, 0, 0,
>     1888 			attr ? le32_to_cpu(attr->res.data_size) : 0,
>     1889 			FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_LAST |
>     1890 				FIEMAP_EXTENT_MERGED);
>     1891 		goto out;
>     1892 	}
>     1893 
> --> 1894 	end = vbo + len;
>                 ^^^^^^^^^^^^^^^
> 
> This can overflow.
> 
>     1895 	alloc_size = le64_to_cpu(attr->nres.alloc_size);
>     1896 	if (end > alloc_size)
>     1897 		end = alloc_size;
>     1898 
>     1899 	down_read(run_lock);
>     1900 
>     1901 	while (vbo < end) {
>     1902 		if (idx == -1) {
>     1903 			ok = run_lookup_entry(run, vcn, &lcn, &clen, &idx);
>     1904 		} else {
>     1905 			CLST vcn_next = vcn;
>     1906 
>     1907 			ok = run_get_entry(run, ++idx, &vcn, &lcn, &clen) &&
>     1908 			     vcn == vcn_next;
>     1909 			if (!ok)
>     1910 				vcn = vcn_next;
>     1911 		}
>     1912 
>     1913 		if (!ok) {
>     1914 			up_read(run_lock);
>     1915 			down_write(run_lock);
>     1916 
>     1917 			err = attr_load_runs_vcn(ni, attr->type,
>     1918 						 attr_name(attr),
>     1919 						 attr->name_len, run, vcn);
>     1920 
>     1921 			up_write(run_lock);
>     1922 			down_read(run_lock);
>     1923 
>     1924 			if (err)
>     1925 				break;
>     1926 
>     1927 			ok = run_lookup_entry(run, vcn, &lcn, &clen, &idx);
>     1928 
>     1929 			if (!ok) {
>     1930 				err = -EINVAL;
>     1931 				break;
>     1932 			}
>     1933 		}
>     1934 
>     1935 		if (!clen) {
>     1936 			err = -EINVAL; // ?
>     1937 			break;
>     1938 		}
>     1939 
>     1940 		if (lcn == SPARSE_LCN) {
>     1941 			vcn += clen;
>     1942 			vbo = (u64)vcn << cluster_bits;
>     1943 			continue;
>     1944 		}
>     1945 
>     1946 		flags = FIEMAP_EXTENT_MERGED;
>     1947 		if (S_ISDIR(ni->vfs_inode.i_mode)) {
>     1948 			;
>     1949 		} else if (is_attr_compressed(attr)) {
>     1950 			CLST clst_data;
>     1951 
>     1952 			err = attr_is_frame_compressed(
>     1953 				ni, attr, vcn >> attr->nres.c_unit, &clst_data);
>     1954 			if (err)
>     1955 				break;
>     1956 			if (clst_data < NTFS_LZNT_CLUSTERS)
>     1957 				flags |= FIEMAP_EXTENT_ENCODED;
>     1958 		} else if (is_attr_encrypted(attr)) {
>     1959 			flags |= FIEMAP_EXTENT_DATA_ENCRYPTED;
>     1960 		}
>     1961 
>     1962 		vbo = (u64)vcn << cluster_bits;
>     1963 		bytes = (u64)clen << cluster_bits;
>     1964 		lbo = (u64)lcn << cluster_bits;
>     1965 
>     1966 		vcn += clen;
>     1967 
>     1968 		if (vbo + bytes >= end) {
>     1969 			bytes = end - vbo;
>     1970 			flags |= FIEMAP_EXTENT_LAST;
>     1971 		}
>     1972 
>     1973 		if (vbo + bytes <= valid) {
>     1974 			;
>     1975 		} else if (vbo >= valid) {
>     1976 			flags |= FIEMAP_EXTENT_UNWRITTEN;
>     1977 		} else {
>     1978 			/* vbo < valid && valid < vbo + bytes */
>     1979 			u64 dlen = valid - vbo;
>     1980 
>     1981 			err = fiemap_fill_next_extent(fieinfo, vbo, lbo, dlen,
>     1982 						      flags);
>     1983 			if (err < 0)
>     1984 				break;
>     1985 			if (err == 1) {
>     1986 				err = 0;
>     1987 				break;
>     1988 			}
>     1989 
>     1990 			vbo = valid;
>     1991 			bytes -= dlen;
>     1992 			if (!bytes)
>     1993 				continue;
>     1994 
>     1995 			lbo += dlen;
>     1996 			flags |= FIEMAP_EXTENT_UNWRITTEN;
>     1997 		}
>     1998 
>     1999 		err = fiemap_fill_next_extent(fieinfo, vbo, lbo, bytes, flags);
>     2000 		if (err < 0)
>     2001 			break;
>     2002 		if (err == 1) {
>     2003 			err = 0;
>     2004 			break;
>     2005 		}
>     2006 
>     2007 		vbo += bytes;
>     2008 	}
>     2009 
>     2010 	up_read(run_lock);
>     2011 
>     2012 out:
>     2013 	return err;
>     2014 }
> 
> regards,
> dan carpenter
> 
