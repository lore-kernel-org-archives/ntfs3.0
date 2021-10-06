Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959922C8E
	for <ntfs3@lists.linux.dev>; Wed,  6 Oct 2021 17:42:17 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id v18so12855954edc.11
        for <ntfs3@lists.linux.dev>; Wed, 06 Oct 2021 10:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Qe8d8dZHR7PWAqZF2wp9Kd9MdbqQA5hjoMXX5eZBDmM=;
        b=QWc0eVjlPoAeiD04FzPK95wWN5SfSpxKHtuR5XGBt6JCvsLIF/oQHgMI8ppWDrazRY
         WgtY/JN7+uqxtcb5LvopzPcvqNlHKNB7aoN3VhkGHJsQyG1/+d1V5FEaZ4CIGLkg8RRR
         fEHCIZsxNLaRbce3f7+t0p+FsBlpo8hkpDHEvSB2Jq8TchFV0wriVB8NtDNbdoBUTVgS
         WvCvrBEFzkleeqZZfsVbuH4rPvw8U3pwxwX6AOtqCBFa/OeBvYrkAWZohQmKnci0G3ez
         kkSZoa0Cur6xctxOASJ246r4aCjOUOQ2gMSElLSy82yOJ7gR0MB8DfnCoJG7C2w/YsVY
         YQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Qe8d8dZHR7PWAqZF2wp9Kd9MdbqQA5hjoMXX5eZBDmM=;
        b=6OqtB01wJKlZpjOUnO0HsvbZcNpyz+1zMhZWfomNjbqDFvGBc4Mhkdp8b+BERjf0eT
         CnWIJaZy+337LCYIJxvdiW1DGhpIdNqFExG3L8eS8wA+KP47Odbbud/I0GhY5QbTH2eX
         sSBOa/TGYMPHG2AKIib+5mSWoweBUR5CVT2pid+PaRWXDxduVl3KuPhYvZ67KCVwqYWT
         YaYU/wrZGVtrrIwHDoE3CwKmcvzobNiRmIDv6C8fBEehwzD/vno+WXj/lOvE9YmJBxJf
         uSBFhIcZGpLpgABgbkRKHDAcj6h2hrQUsMa7cQnj8yDEktdrSpyJWnq8KCAsGlrtx/2e
         PWYw==
X-Gm-Message-State: AOAM530XAm+e04PRBI1jGtSAJ8zbtgvTCu7z+r+Kntp+aORDsqwY1CLl
	BDWzf1PABzl+b8KWXYd9AGQ=
X-Google-Smtp-Source: ABdhPJyP6hXIRUbEK3j354QypMnQ5fa+YCuDkVXhaY4kqqa3RHD4Lk788DFqeiSzS/Lc010X+0XSxg==
X-Received: by 2002:aa7:cd90:: with SMTP id x16mr37809173edv.148.1633542135765;
        Wed, 06 Oct 2021 10:42:15 -0700 (PDT)
Received: from [192.168.0.163] ([37.239.218.11])
        by smtp.gmail.com with ESMTPSA id bx22sm3863617edb.0.2021.10.06.10.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 10:42:15 -0700 (PDT)
Message-ID: <2998a9b9-8ea0-6a44-7093-66c7a08dcab2@gmail.com>
Date: Wed, 6 Oct 2021 20:42:13 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] fs/ntfs3: Check for NULL if ATTR_EA_INFO is incorrect
Content-Language: en-US
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Kari Argillander <kari.argillander@gmail.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <227c13e3-5a22-0cba-41eb-fcaf41940711@paragon-software.com>
 <20211003175036.ly4m3lw2bjoippsh@kari-VirtualBox>
 <c892016c-3e50-739b-38d2-010f02d52019@gmail.com>
 <bcbb8ddc-3ddf-4a91-6e92-d5cee2722bad@paragon-software.com>
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
In-Reply-To: <bcbb8ddc-3ddf-4a91-6e92-d5cee2722bad@paragon-software.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/21 17:47, Konstantin Komarov wrote:
>
> On 04.10.2021 23:39, Mohammad Rasim wrote:
>> On 10/3/21 20:50, Kari Argillander wrote:
>>> On Wed, Sep 29, 2021 at 07:35:43PM +0300, Konstantin Komarov wrote:
>>>> This can be reason for reported panic.
>>>> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
>>> I see that you have include this to devel branch but you did not send V2
>>> [1]. I also included Mohammad Rasim to this thread. Maybe they can test
>>> this patch. Rasim can you test [2] if your problem will be fixed with
>>> this tree. Or just test this patch if you prefer that way.
>>>
>>> [1]: github.com/Paragon-Software-Group/linux-ntfs3/commit/35afb70dcfe4eb445060dd955e5b67d962869ce5
>>> [2]: github.com/Paragon-Software-Group/linux-ntfs3/tree/devel
>> Yeah unfortunately the problem still exist, moving the buildroot git tree from my nvme ext4 partition to my wd ntfs partition still causes the panic.
>>
>> Note that i used the master branch if that matters but it contains the same commit
>>
>>
>> Regards
>>
> Is panic the same as old one?
>
> BUG: kernel NULL pointer dereference, address: 000000000000000e
> RIP: 0010:ni_write_inode+0xe6b/0xed0 [ntfs3]
> etc.

This is the complete panic log:

[  241.985898] ntfs3: sdb1: ino=724a0, "buildroot-raw" add mount option 
"acl" to use acl
[  241.985905] ntfs3: sdb1: ino=724a0, "buildroot-raw" add mount option 
"acl" to use acl
[  241.987109] ntfs3: sdb1: ino=724a1, ".git" add mount option "acl" to 
use acl
[  241.987114] ntfs3: sdb1: ino=724a1, ".git" add mount option "acl" to 
use acl
[  241.987630] ntfs3: sdb1: ino=724af, "branches" add mount option "acl" 
to use acl
[  241.987634] ntfs3: sdb1: ino=724af, "branches" add mount option "acl" 
to use acl
[  241.987645] ntfs3: sdb1: ino=724b0, "hooks" add mount option "acl" to 
use acl
[  241.987647] ntfs3: sdb1: ino=724b0, "hooks" add mount option "acl" to 
use acl
[  241.987670] ntfs3: sdb1: ino=724b1, "info" add mount option "acl" to 
use acl
[  241.987672] ntfs3: sdb1: ino=724b1, "info" add mount option "acl" to 
use acl
[  246.614529] BUG: kernel NULL pointer dereference, address: 
000000000000000e
[  246.614531] #PF: supervisor read access in kernel mode
[  246.614532] #PF: error_code(0x0000) - not-present page
[  246.614533] PGD 0 P4D 0
[  246.614535] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  246.614536] CPU: 8 PID: 196 Comm: kworker/u64:7 Not tainted 
5.14.0-rc7-MANJARO+ #51
[  246.614538] Hardware name: Micro-Star International Co., Ltd 
MS-7C02/B450 TOMAHAWK MAX (MS-7C02), BIOS 3.B0 05/12/2021
[  246.614539] Workqueue: writeback wb_workfn (flush-8:16)
[  246.614543] RIP: 0010:ni_write_inode+0xd69/0xe40
[  246.614545] Code: 4f 06 44 8b 40 04 41 8b 37 48 89 c3 44 0f b7 48 0a 
48 8b 7c 24 18 4c 01 fa 44 89 44 24 30 e8 ae 32 01 00 8b 54 24 30 48 89 
de <44> 0f b7 48 0e 48 89 c7 44 89 4c 24 28 e8 85 fc 97 00 44 8b 4c 24
[  246.614546] RSP: 0018:ffffac2dc09cbac8 EFLAGS: 00010286
[  246.614548] RAX: 0000000000000000 RBX: ffff98b0d08ac430 RCX: 
0000000000000000
[  246.614548] RDX: 0000000000000050 RSI: ffff98b0d08ac430 RDI: 
ffff98b0d88b31a4
[  246.614549] RBP: ffff98b0d654f7a0 R08: ffff98b0d5be0000 R09: 
0000000000000001
[  246.614550] R10: 0000000000000002 R11: 0000000000000002 R12: 
0000000000000000
[  246.614550] R13: ffff98b0d4f6a000 R14: ffff98b0da2fcc80 R15: 
ffff98b0d08ab060
[  246.614551] FS:  0000000000000000(0000) GS:ffff98b7dea00000(0000) 
knlGS:0000000000000000
[  246.614552] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  246.614553] CR2: 000000000000000e CR3: 00008001011f8000 CR4: 
0000000000350ee0
[  246.614554] Call Trace:
[  246.614558]  __writeback_single_inode+0x25a/0x310
[  246.614560]  writeback_sb_inodes+0x1fc/0x480
[  246.614562]  __writeback_inodes_wb+0x4c/0xe0
[  246.614563]  wb_writeback+0x1ff/0x2f0
[  246.614564]  wb_workfn+0x2f8/0x510
[  246.614566]  ? psi_task_switch+0xb9/0x1e0
[  246.614567]  ? _raw_spin_unlock+0x16/0x30
[  246.614570]  process_one_work+0x1e3/0x3b0
[  246.614573]  worker_thread+0x50/0x3b0
[  246.614574]  ? process_one_work+0x3b0/0x3b0
[  246.614575]  kthread+0x141/0x170
[  246.614577]  ? set_kthread_struct+0x40/0x40
[  246.614579]  ret_from_fork+0x22/0x30
[  246.614582] Modules linked in:
[  246.614584] CR2: 000000000000000e
[  246.614585] ---[ end trace 7c7c742732266d51 ]---
[  246.614585] RIP: 0010:ni_write_inode+0xd69/0xe40
[  246.614587] Code: 4f 06 44 8b 40 04 41 8b 37 48 89 c3 44 0f b7 48 0a 
48 8b 7c 24 18 4c 01 fa 44 89 44 24 30 e8 ae 32 01 00 8b 54 24 30 48 89 
de <44> 0f b7 48 0e 48 89 c7 44 89 4c 24 28 e8 85 fc 97 00 44 8b 4c 24
[  246.614587] RSP: 0018:ffffac2dc09cbac8 EFLAGS: 00010286
[  246.614588] RAX: 0000000000000000 RBX: ffff98b0d08ac430 RCX: 
0000000000000000
[  246.614589] RDX: 0000000000000050 RSI: ffff98b0d08ac430 RDI: 
ffff98b0d88b31a4
[  246.614589] RBP: ffff98b0d654f7a0 R08: ffff98b0d5be0000 R09: 
0000000000000001
[  246.614590] R10: 0000000000000002 R11: 0000000000000002 R12: 
0000000000000000
[  246.614590] R13: ffff98b0d4f6a000 R14: ffff98b0da2fcc80 R15: 
ffff98b0d08ab060
[  246.614591] FS:  0000000000000000(0000) GS:ffff98b7dea00000(0000) 
knlGS:0000000000000000
[  246.614592] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  246.614592] CR2: 000000000000000e CR3: 00008001011f8000 CR4: 
0000000000350ee0
[  246.991844] ntfs3: 6354 callbacks suppressed
[  246.991846] ntfs3: sdb1: ino=73f4b, ".gstreamer1-mm.mk.SxnMfX" add 
mount option "acl" to use acl
[  246.993111] ntfs3: sdb1: ino=73f4c, ".Config.in.2oeC7E" add mount 
option "acl" to use acl
[  246.993135] ntfs3: sdb1: ino=73f4d, ".gstreamer1.hash.MS4lZ2" add 
mount option "acl" to use acl
[  246.993159] ntfs3: sdb1: ino=73f4e, ".gstreamer1.mk.YFKaZf" add mount 
option "acl" to use acl
[  246.993189] ntfs3: sdb1: ino=73f4f, ".Config.in.KMudor" add mount 
option "acl" to use acl
[  246.993360] ntfs3: sdb1: ino=73f50, ".gtest.hash.2RTkJH" add mount 
option "acl" to use acl
[  246.993383] ntfs3: sdb1: ino=73f51, ".gtest.mk.KTCGz4" add mount 
option "acl" to use acl
[  246.993403] ntfs3: sdb1: ino=73f52, ".Config.in.8W4t5y" add mount 
option "acl" to use acl
[  246.993423] ntfs3: sdb1: ino=73f53, ".gtk2-engines.hash.AOVwL1" add 
mount option "acl" to use acl
[  246.994082] ntfs3: sdb1: ino=73f54, ".gtk2-engines.mk.WB8hM4" add 
mount option "acl" to use acl


>>>> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
>>>> ---
>>>>    fs/ntfs3/frecord.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
>>>> index 9a53f809576d..007602badd90 100644
>>>> --- a/fs/ntfs3/frecord.c
>>>> +++ b/fs/ntfs3/frecord.c
>>>> @@ -3080,7 +3080,9 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
>>>>                           const struct EA_INFO *info;
>>>>                             info = resident_data_ex(attr, sizeof(struct EA_INFO));
>>>> -                       dup->ea_size = info->size_pack;
>>>> +                       /* If ATTR_EA_INFO exists 'info' can't be NULL. */
>>>> +                       if (info)
>>>> +                               dup->ea_size = info->size_pack;
>>>>                   }
>>>>           }
>>>>    --
>>>> 2.33.0
>>>>
