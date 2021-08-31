Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DAD3FC2
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 18:43:18 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id y6so428921lje.2
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NW9pRq8jRsFXrS7VIuuj8MsRMAjJAt9fcukvZZ1utbk=;
        b=qGTUnhWYuebBX3IGzbOaygL1xjMkqiWXbBXvIrffCDCIaPvnilBs+b25u+o6hcJBPY
         dXz+Nc99HbBSHD+hu5SXw0UX5Mcu9+qF5gmrlD/ytXM8rNFeZEHTizA24U9G1/W5g/S7
         Rbg9ZEqnBM0+KnHBEfTUmkd7ECpdG89QXSDaOlr5JpaiOTDtr+tsCLiOF9XvMVojuJUq
         d/3hJNEFaSMKwMfiCTkw49N15AeGDnWPa200Qs4Xltkvb1S2nXZgw3jwZ9EQTfPTJmuQ
         3pWpVjlWpITq5l/yx4bkgG3ksutA1pIFcJMgvzAcEPyMqjesl1pSONAqmjiF8Z50UKPd
         0+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NW9pRq8jRsFXrS7VIuuj8MsRMAjJAt9fcukvZZ1utbk=;
        b=pD7g2h6vJiH1e4p82t4Rx/2gasDvd/6rh6oh1ZHKgranBtPzZcr8sQSZ6Bl1YJ5Ogz
         LgWuHsVc1h9dy5OOAjeZL/WfyAdhiDIUzkMpR1Pt0qEDfzxHrrfoghoxEURI4V3A9b/+
         asVFcxZzIfH+HpzrJM5m+nK7WSDSLqk3c2/qIHgvJHHFDdANF4plsnb6sG1uhr4UIkKc
         qojPYFujS/hZoMmrDIKAK31W1AFGP8kd9huiMWJNu7cHmDW+vqxDe9gbOwFovLnFYDdq
         7pSCMGoilldT8hci5ALVBYHkeD+hx2gQEzsANypdqBXwLpbxIlmufKZxTl05ya9xX7kE
         nz2A==
X-Gm-Message-State: AOAM532bk4EqZhZwUiYXGph8sMtQ2xsREzVa5hcFwp2A15TTNDYojQHX
	oeVvxFPBrUx5/dw3+229VfkOcsRo4M3Eqg==
X-Google-Smtp-Source: ABdhPJxWyxgfJO0cp+neOqvUDljek+zgtF/qalNTd8pdqmjvdMtxwkTfHCo7cBRE3sayaDczPvS5jQ==
X-Received: by 2002:a2e:a4c2:: with SMTP id p2mr26173356ljm.316.1630435396683;
        Tue, 31 Aug 2021 11:43:16 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id n3sm1813376lft.63.2021.08.31.11.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 11:43:16 -0700 (PDT)
Date: Tue, 31 Aug 2021 21:43:14 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] fs/ntfs3: Change right headers to lznt.c
Message-ID: <20210831184314.a7pjzimgksilyi7d@kari-VirtualBox>
References: <20210831141434.975175-7-kari.argillander@gmail.com>
 <202109010143.J3Eeb1Nw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202109010143.J3Eeb1Nw-lkp@intel.com>

On Wed, Sep 01, 2021 at 01:54:23AM +0800, kernel test robot wrote:
> Thank you for the patch! Yet something to improve:

Patch series should have be 8 patch long. Sorry for mistake. Good thing
robot noticed.  Will send v2 tomorrow night.

> [auto build test ERROR on next-20210831]
> [cannot apply to linus/master v5.14 v5.14-rc7 v5.14-rc6 v5.14]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]

Will do now on.  I did not know about this.

Still if someone wants to check why this report was made and what should
have be patch 1/8.  Here it is:

[PATCH 1/8] fs/ntfs3. Add forward declarations for structs to debug.h

Add forward declarations for structs so that we can include this file
without warnings even without linux/fs.h

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/debug.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/debug.h b/fs/ntfs3/debug.h
index 31120569a87b..53ef7489c75f 100644
--- a/fs/ntfs3/debug.h
+++ b/fs/ntfs3/debug.h
@@ -11,6 +11,9 @@
 #ifndef _LINUX_NTFS3_DEBUG_H
 #define _LINUX_NTFS3_DEBUG_H
 
+struct super_block;
+struct inode;
+
 #ifndef Add2Ptr
 #define Add2Ptr(P, I)		((void *)((u8 *)(P) + (I)))
 #define PtrOffset(B, O)		((size_t)((size_t)(O) - (size_t)(B)))
-- 
2.25.1
