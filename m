Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9453FEE
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 21:58:06 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id c8so6608571lfi.3
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 14:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WLZl3PqyWx+rggs+0u8Sk8rv1+9lWGVvYG5XwXMIzBQ=;
        b=JR2C5cAQUoxr5kkBrs2fc8haKoE1+NnU8cweHE/UYFXBmxEM6oASSsy93hFnCdi3wT
         7Xo33B5VfF9o+TiIoXlE3xPXXKlxSSGUK7e7yNFrOYknPp7JId/EBAYRasWZw1mH5LrC
         4dH9vXL8TYedHa7kRvLsg421NWY8afm2As4F6yg5mAHmAbpdKpyQr0+wGWQh8rPjXusM
         L/slmfct95iCbTOGB+LBlcr2arv4TDGGoQhOCLNmKY74MiVooQSRcy1H6dUCEueKXu6A
         aK/XeYGQfvJBEAhxbwCJuFtGZQIDuhbmjyDJrefv8IwYwP6pJGimDhn370xqLfuCGnZu
         XAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WLZl3PqyWx+rggs+0u8Sk8rv1+9lWGVvYG5XwXMIzBQ=;
        b=XOviOeXNDH81sntD6BU72xpznRlzOhzfXyIJJzaNnEMjMEIJhN3qGYkmwSJWpEQGFJ
         URKWYVdONSe69B1FLg75bNthOwMOoj5ZsZb3YtnGGbviBVxOIRPAEFKXiB2qPtwgjbRW
         728F5NC5rEpe5JsRdpBhRpitOKR2eSrKYlKJ/Du08Vhbmm8UNQdO66PH469T5RkKIJLG
         bNHYsllDS8kaQRYczKJpnp3oG8+qiQe9uhu+EL3zEZkJSrNhr/sCPJC2y7/ZmO8aq7VE
         OiEelOpVxDjscXxAkTFDYYcx85HPh2cD9dP5L+qb2G1paRMFthSiZCeHXYq10Flain4u
         ffQg==
X-Gm-Message-State: AOAM5327rUOoRsduqQ9mfT3ZghojP5KZHj1YyHB5WqgfjJA/DQIhdgUP
	4/RKTtVjN8IveWhkgO0IeRk=
X-Google-Smtp-Source: ABdhPJzxhhazMqSZ1bBSZkAG2jpcgtQlWbpJZmdKGCztXW2xs1OdRhejD1vk+QhsHKs1yvPQr0Wctw==
X-Received: by 2002:a05:6512:2294:: with SMTP id f20mr1492829lfu.431.1631224684452;
        Thu, 09 Sep 2021 14:58:04 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id v15sm324446lfq.142.2021.09.09.14.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:58:03 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Doc/fs/ntfs3: Fix rst format and make it cleaner
Date: Fri, 10 Sep 2021 00:57:53 +0300
Message-Id: <20210909215753.34138-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current ntfs3 rst documentation is broken. I turn table to list table as
this is current Linux documentation quide line. Simple table also did
not quite work in our situation as we need to span rows together.

It still look quite good as text so we did not loss anything. This will
also make diffing quite bit more pleasure.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
As this is pretty new to me and Konstantin I CC Jonathan because he is
maintainer of documentation section. Do you want to get all
documentation patches to you about ntfs3? This probably still goes
through our tree? I ask because checkpatch will give your address also
and it is not clear to me at least should I send these to you also.

Konstanstin you can generate html page from rst with

	make htmldocs

and after that you can check just ntfs3 with

	make htmldocs Documentation/filesystems/ntfs3.rst

You need to first install punch of stuff but I trust that you will
succeed. Also imo this should be included to 5.15 patches as this
really fix the Documentation. Imo every time documentation gets
updated it can go to rc if it does not add info what is related to
some new feature.

---
 Documentation/filesystems/ntfs3.rst | 139 +++++++++++++++-------------
 1 file changed, 76 insertions(+), 63 deletions(-)

diff --git a/Documentation/filesystems/ntfs3.rst b/Documentation/filesystems/ntfs3.rst
index 7b6afe452197..d67ccd22c63b 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -4,99 +4,112 @@
 NTFS3
 =====
 
-
 Summary and Features
 ====================
 
-NTFS3 is fully functional NTFS Read-Write driver. The driver works with
-NTFS versions up to 3.1, normal/compressed/sparse files
-and journal replaying. File system type to use on mount is 'ntfs3'.
+NTFS3 is fully functional NTFS Read-Write driver. The driver works with NTFS
+versions up to 3.1. File system type to use on mount is *ntfs3*.
 
 - This driver implements NTFS read/write support for normal, sparse and
   compressed files.
-- Supports native journal replaying;
-- Supports extended attributes
-	Predefined extended attributes:
-	- 'system.ntfs_security' gets/sets security
-			descriptor (SECURITY_DESCRIPTOR_RELATIVE)
-	- 'system.ntfs_attrib' gets/sets ntfs file/dir attributes.
-		Note: applied to empty files, this allows to switch type between
-		sparse(0x200), compressed(0x800) and normal;
+- Supports native journal replaying.
 - Supports NFS export of mounted NTFS volumes.
+- Supports extended attributes. Predefined extended attributes:
+
+	- *system.ntfs_security* gets/sets security
+
+		Descriptor: SECURITY_DESCRIPTOR_RELATIVE
+
+	- *system.ntfs_attrib* gets/sets ntfs file/dir attributes.
+
+	  Note: Applied to empty files, this allows to switch type between
+	  sparse(0x200), compressed(0x800) and normal.
 
 Mount Options
 =============
 
 The list below describes mount options supported by NTFS3 driver in addition to
-generic ones.
+generic ones. You can use every mount option with **no** option. If it is in
+this table marked with no it means default is without **no**.
 
-===============================================================================
+.. flat-table::
+   :widths: 1 5
+   :fill-cells:
 
-iocharset=name		This option informs the driver how to interpret path
-			strings and translate them to Unicode and back. If
-			this option is not set, the default codepage will be
-			used (CONFIG_NLS_DEFAULT).
-			Examples:
-				'iocharset=utf8'
+   * - iocharset=name
+     - This option informs the driver how to interpret path strings and
+       translate them to Unicode and back. If this option is not set, the
+       default codepage will be used (CONFIG_NLS_DEFAULT).
 
-uid=
-gid=
-umask=			Controls the default permissions for files/directories created
-			after the NTFS volume is mounted.
+       Example: iocharset=utf8
 
-fmask=
-dmask=			Instead of specifying umask which applies both to
-			files and directories, fmask applies only to files and
-			dmask only to directories.
+   * - uid=
+     - :rspan:`1`
+   * - gid=
 
-nohidden		Files with the Windows-specific HIDDEN (FILE_ATTRIBUTE_HIDDEN)
-			attribute will not be shown under Linux.
+   * - umask=
+     - Controls the default permissions for files/directories created after
+       the NTFS volume is mounted.
 
-sys_immutable		Files with the Windows-specific SYSTEM
-			(FILE_ATTRIBUTE_SYSTEM) attribute will be marked as system
-			immutable files.
+   * - dmask=
+     - :rspan:`1` Instead of specifying umask which applies both to files and
+       directories, fmask applies only to files and dmask only to directories.
+   * - fmask=
 
-discard			Enable support of the TRIM command for improved performance
-			on delete operations, which is recommended for use with the
-			solid-state drives (SSD).
+   * - noacsrules
+     - "No access rules" mount option sets access rights for files/folders to
+       777 and owner/group to root. This mount option absorbs all other
+       permissions.
 
-force			Forces the driver to mount partitions even if 'dirty' flag
-			(volume dirty) is set. Not recommended for use.
+       - Permissions change for files/folders will be reported as successful,
+	 but they will remain 777.
 
-sparse			Create new files as "sparse".
+       - Owner/group change will be reported as successful, butthey will stay
+	 as root.
 
-showmeta		Use this parameter to show all meta-files (System Files) on
-			a mounted NTFS partition.
-			By default, all meta-files are hidden.
+   * - nohidden
+     - Files with the Windows-specific HIDDEN (FILE_ATTRIBUTE_HIDDEN) attribute
+       will not be shown under Linux.
 
-prealloc		Preallocate space for files excessively when file size is
-			increasing on writes. Decreases fragmentation in case of
-			parallel write operations to different files.
+   * - sys_immutable
+     - Files with the Windows-specific SYSTEM (FILE_ATTRIBUTE_SYSTEM) attribute
+       will be marked as system immutable files.
 
-noacsrules		"No access rules" mount option sets access rights for
-			files/folders to 777 and owner/group to root. This mount
-			option absorbs all other permissions:
-			- permissions change for files/folders will be reported
-				as successful, but they will remain 777;
-			- owner/group change will be reported as successful, but
-				they will stay as root
+   * - discard
+     - Enable support of the TRIM command for improved performance on delete
+       operations, which is recommended for use with the solid-state drives
+       (SSD).
 
-acl			Support POSIX ACLs (Access Control Lists). Effective if
-			supported by Kernel. Not to be confused with NTFS ACLs.
-			The option specified as acl enables support for POSIX ACLs.
+   * - force
+     - Forces the driver to mount partitions even if volume is marked dirty.
+       Not recommended for use.
 
-===============================================================================
+   * - sparse
+     - Create new files as sparse.
 
-ToDo list
-=========
+   * - showmeta
+     - Use this parameter to show all meta-files (System Files) on a mounted
+       NTFS partition. By default, all meta-files are hidden.
 
-- Full journaling support (currently journal replaying is supported) over JBD.
+   * - prealloc
+     - Preallocate space for files excessively when file size is increasing on
+       writes. Decreases fragmentation in case of parallel write operations to
+       different files.
 
+   * - acl
+     - Support POSIX ACLs (Access Control Lists). Effective if supported by
+       Kernel. Not to be confused with NTFS ACLs. The option specified as acl
+       enables support for POSIX ACLs.
+
+Todo list
+=========
+- Full journaling support over JBD. Currently journal replaying is supported
+  which is not necessarily as effectice as JBD would be.
 
 References
 ==========
-https://www.paragon-software.com/home/ntfs-linux-professional/
-	- Commercial version of the NTFS driver for Linux.
+- Commercial version of the NTFS driver for Linux.
+	https://www.paragon-software.com/home/ntfs-linux-professional/
 
-almaz.alexandrovich@paragon-software.com
-	- Direct e-mail address for feedback and requests on the NTFS3 implementation.
+- Direct e-mail address for feedback and requests on the NTFS3 implementation.
+	almaz.alexandrovich@paragon-software.com
-- 
2.30.2

