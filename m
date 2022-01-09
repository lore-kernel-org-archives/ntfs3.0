Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7819C173
	for <ntfs3@lists.linux.dev>; Sun,  9 Jan 2022 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=o7K6r9Vpipp4WMVb1O7L1a0thKXJ4XeclMBh07YQlKU=; b=SnqbWmRkoYqen8baaiTqSMLos4
	hFZVMK2uQY3tZspSOC3+zTAZ8J7rs+OA0rkZXs1ZHlJGIWithYJAHNnaGMupu80afAkRhlsUDayES
	9mpdFNJl18i0iW1XUM6ie1eCqLV+a2Gc7SQ1j8gGHMLbS3sUTfCYTIXwzlDRbmRkLGyjcWfcW/6Pz
	8MxhejVrs6GWITwd24GAci0rthCtGGKKfO0UEevQj9/rHV5BM68EZh0qr3W1qFqXFO4NZFMocgduU
	+p39KIX9f9oZLDQTUHc8xxnwlz1qqLOSp98MgLqnNTm31hEoS9Q0fRL5YjCY7a0MMkihb1czd05wP
	vu4N0UzQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6arC-001Tpo-I8; Sun, 09 Jan 2022 16:15:46 +0000
Date: Sun, 9 Jan 2022 16:15:46 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Ganapathi Kamath <hgkamath@hotmail.com>
Cc: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: Re: regarding: Re: Bug using new ntfs3 file system driver (5.15.2 on
 Arch Linux)
Message-ID: <YdsKMu+W+R1YjOhj@casper.infradead.org>
References: <DM6PR04MB493813D5A09B3F03378E9398DA469@DM6PR04MB4938.namprd04.prod.outlook.com>
 <DM6PR04MB493866F0E97AD8DE883D0ECEDA4F9@DM6PR04MB4938.namprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR04MB493866F0E97AD8DE883D0ECEDA4F9@DM6PR04MB4938.namprd04.prod.outlook.com>

On Sun, Jan 09, 2022 at 12:06:07PM +0000, Ganapathi Kamath wrote:
> 
> I filed the bug in kernel.org bugzilla as
> https://bugzilla.kernel.org/show_bug.cgi?id=215460
> summary: fs/ntfs3: page_cache_ra_unbounded on rsync from ntfs3 to ext4 
> 
> I hope someone is looking into this. 

You should probably cc the maintainer.  I was just trying to help.

> In the below, email, I had to mention that to produce the trace as mentioned in the other emails
> one should load manjaro or arch live-cds
> * archlinux-2022.01.01-x86_64.iso (kernel-5.15.12)
> * manjaro-gnome-21.2.0-211220-linux515.iso (kernel-5.15.7) 
> 
> The bug happens if the src partition is mounted as ntfs3 on vhdx.
> So i believe it is triggered from the "read" side filesystem of rsync. 
> The dst partition/filesystem can be ext4 and is on a fixed qcow2 or raw disk. 
> 
> Bug does not happen if src partition is mounted using ntfs-fuseblk driver.
> 
> -Gana
> 
> From: Ganapathi Kamath
> Sent: Friday, December 31, 2021 11:22 AM
> To: Matthew Wilcox <willy@infradead.org>; ntfs3@lists.linux.dev <ntfs3@lists.linux.dev>
> Subject: regarding: Re: Bug using new ntfs3 file system driver (5.15.2 on Arch Linux) 
>  
> Hello,
> 
> A) Included below is I think a sure-way to reproduce the bug. (I wasn't sure if you had done reproduction yet, and were looking only at provided kernel traces) 
> B) Is there a specific kernel-bug ## I can cite and watch for progress/fix ? 
> 
> I ran into the same while doing similar rsync tests related to qemu bug 
> https://gitlab.com/qemu-project/qemu/-/issues/727 
> 
> 1) 
> create empty qcow2 file
> [root@sirius gana]# qemu-img create -f qcow2  /mnt/a16/gkpics01.qcow2 99723771904
> 
> 2) 
> create another qcow2/vhdx containing sgdata, Ensure that data is good/not be corrupt. (I prepare my vhdx on windows) 
> That issue filing mentioned earlier has scriptlets for "synthetic generated data"  (sgdata)
> https://gitlab.com/qemu-project/qemu/-/issues/727#note_739930694 
> 
> 3) download a fedora rawhide iso
> https://archive.fedoraproject.org/pub/fedora/linux/development/rawhide/Workstation/x86_64/iso/
> 
> 4)  
> [root@sirius gana]# qemu-system-x86_64 -cpu qemu64 -m 4096 -machine "type=q35" -accel "kvm" -smp "sockets=1,cores=8,threads=1" -boot "d" -cdrom "/vol/15KJ_Images/transcend/Fedora-Workstation-Live-x86_64-Rawhide-20211230.n.0.iso" -hda "/mnt/a16/gkpics01.qcow2" -hdb "/vol/15KJ_Images/test/sgdata.vhdx" -device "virtio-vga-gl" -display "gtk,gl=on" -rtc "base=utc" -net "user" -device "virtio-net,netdev=vmnic" -netdev "user,id=vmnic,net=192.168.20.0/24,dns=192.168.20.3,dhcpstart=192.168.20.15"
> 
> Inside VM, open a terminal tab
> 1) use gdisk make type-0700 partition /dev/sda1
> 2) format /dev/sda1 as  ntfs
> mkfs -t ntfs -Q -L fs_gkpics01 /dev/sda1
> 3) mount /dev/sda and /dev/sdb 
> mount /dev/sda1 /mnt/a
> mount /dev/sdb2 /mnt/b 
> 4) ( sdate=`date`; cd /mnt/b ; rsync -avH ./photos001 /mnt/a | tee /tmp/rsynclog.txt ; echo $sdate ; date ) 
> 
> monitor dmesg -w in a second tab
> 
> Basically, in the above test, I am trying to copy about 85GiB of data from /dev/sdb2 to /dev/sda1
> 
> The kernel trace happens within less than a couple of Gb of transfer, after which rsync bails out. 
> 
> -Gana
