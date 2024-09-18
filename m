Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A31C7B83
	for <ntfs3@lists.linux.dev>; Wed, 18 Sep 2024 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726681429; cv=none; b=RPAa3vQZNLoankPm9bVUKwnAJ9gZ03AZccF1/a8kok7M5Qi6o9Lk2fXleYWQwxuFmFx3xRMQD9D95msI1nEg+2Ifk6I8k5hp9T5WIK3PR4Tkjq+CHtskbTcml7XCpwhw5ebFF3FCl4QZCyvk5ggQWVlqHB2IOeu23f6DCU0jjhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726681429; c=relaxed/simple;
	bh=sgsZ9th74YEypO7KWA9vv1IUuQrb5H0WMvkk2t8USOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jUROJDCz0znSTBJHtTEMNGi4vglnstiMO2dRbcn6bJKRYm2I5RxC4WioTMHAwkqkJt3SM7rwlpuqndG8j1/urqPohIg4SH+4iWoITCbGikOdLLdilpMFXKQtHLcB3gMcrK1/JL6SIgPCVV+nYVzY/PDJckON875F4cSYL0Z+GsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCUNEP4j; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCUNEP4j"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2068bee21d8so235035ad.2
        for <ntfs3@lists.linux.dev>; Wed, 18 Sep 2024 10:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726681426; x=1727286226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u93mWgTEl/HquhdTEss9CS7X31wqgA34c4eSNrM6rRs=;
        b=BCUNEP4j9mGfDnF4R0/78T3le5lAxJgE54lom9o+vgSF0yu41XphaFwc4gs30RYbC2
         Q4D5zp7hbrEEKCzQPPIFOBimAAftKEasTb+NZzi/rUhlX9FNf43H483vj3CbScBueGLP
         f//lU4WhtJ3KhaItjua0qYunsylKTcpcH55zHAJT0hh6A5PgtKnTb9XoJA4DZ5Ywn7Gn
         Xz0pQR5rwj1JIE2+X7+Ma2VaR6qWJ9KER/SrwokdUK60kyLjqUnxyAx1OKXRA/0MfNiW
         2mKsFAx797FcIqEwosLaVJw1GiaL0Nfwj81qaPCVXfrJ5k+0vzZ3ACE6JNsd/Elq8NPU
         5Nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726681426; x=1727286226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u93mWgTEl/HquhdTEss9CS7X31wqgA34c4eSNrM6rRs=;
        b=Kn5b8aT72VKcEIsNqqQ/L2ojXpZLq5A+ua0U27EdOGIEcHhQu3OR5nBJ8rCebea/Nn
         AGIxB/vKyQnqRVmWAnvr6oykrPeuR7thloHmMBBCybLMhYMu5D2LeRyjQ+8Hzplx195D
         M32YZRFXBmIXUI5QBiRER5JjvGBD2r7LY/+ompwTwdcnZUpvV/7nKKbP6/HEXyBu2Lg8
         9q6TjitsCBX12yYakga98le1n8C7U4/jQ7M+/B6IAyBUnDLb208RgARchqgtzf05b2WC
         7cTUxIonrbi/1+pkdDUuGNE/AIORJS+gXzQw8jt4zYpZ8lc1QM9U9KQ2uvrWefnxGzvJ
         K+SA==
X-Forwarded-Encrypted: i=1; AJvYcCWB64I4GXcNjjJ1c/C0tQygPwtES+BZVwW/9CFo8JQKE9hC94XpitbUbCFbVVLLoA+sIfYNxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgPxHj6pI4EV/wnkhGfbAbTMCD3LSUo0VLhA5GZh8PzpgNKbVe
	tZ8nQZVV+igtDceLQiWn4IpJSp+4SRoIPLmzyZWyNLGTe08QKlp0
X-Google-Smtp-Source: AGHT+IEYOfO7Bea5jt0lyBcbgzzw7uSXAA4qa3lGeF60gz1l9XmTGJsYyRW0U7QX+YTwyWuOf8yDTw==
X-Received: by 2002:a17:90b:3e87:b0:2dd:5e86:8c2f with SMTP id 98e67ed59e1d1-2dd5e8699c8mr3118797a91.21.1726681425617;
        Wed, 18 Sep 2024 10:43:45 -0700 (PDT)
Received: from localhost.localdomain ([47.76.200.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd608b7394sm1961499a91.21.2024.09.18.10.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 10:43:45 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: llfamsec@gmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Subject: Re: [PATCH v2] ntfs3: Add bounds checking to enum_rstbl()
Date: Thu, 19 Sep 2024 01:43:24 +0800
Message-Id: <20240918174324.555381-1-llfamsec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918171720.555304-1-llfamsec@gmail.com>
References: <20240918171720.555304-1-llfamsec@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Konstantin,

In log_replay, enum_rstbl didn't check the real size of the entry. It
traverses based on RESTART_TABLE.size. There is a lack of boundary check
if the real size is not equal to RESTART_TABLE.size.

Here is a PoC to reproduce.
PoC:
1) Found NTFS_RESTART by CLIENT_REC[0].restart_lsn
   NTFS_RESTART.open_attr_table_lsn: LSN where PoC is located
   NTFS_RESTART.open_attr_len: 0x1
2) Layout PoC as follow in a LSN area as follow:
   LFS_RECORD_HDR.this_lsn: 0x28455b
   LFS_RECORD_HDR.client_prev_lsn: 0x0
   LFS_REOCRD_HDR.client_undo_next_lsn: 0x0
   LFS_RECORD_HDR.client_data_len: 0x98
   LFS_RECORD_HDR.CLIENT_ID.seq_num: 0x0
   LFS_RECORD_HDR.CLIENT_ID.client_idx: 0x0
   LFS_RECORD_HDR.record_type: 0x1
   LFS_RECORD_HDR.transact_id: 0x18
   LFS_RECORD_HDR.flags: 0x4
   LOG_REC_HDR.redo_op: 0x0
   LOG_REC_HDR.undo_op: 0x0
   LOG_REC_HDR.redo_off: 0x98-sizeof(RESTART_TABLE)-RESTART_TABLE.size (redo_off&7 != 0)
   LOG_REC_HDR.redo_len: 0x0
   LOG_REC_HDR.undo_off: 0x0
   LOG_REC_HDR.undo_len: 0x0
   LOG_REC_HDR.target_attr: 0x0
   LOG_REC_HDR.lcns_follow: 0x0
   LOG_REC_HDR.record_off: 0x0
   LOG_REC_HDR.attr_off: 0x0
   LOG_REC_HDR.cluster_off: 0x0
   LOG_REC_HDR.reserved: 0x0
   LOG_REC_HDR.target_vcn: 0x0
   LOG_REC_HDR.page_lcns[0]: 0x0
   RESTART_TABLE.size: 8
   RESTART_TABLE.used: 0x1
   RESTART_TABLE.total: 0x1
   RESTART_TABLE.res[0]: 0x0
   RESTART_TABLE.res[1]: 0x0
   RESTART_TABLE.res[2]: 0x0
   RESTART_TABLE.free_goal: 0x0
   RESTART_TABLE.first_free: 0x0
   RESTART_TABLE.last_free: 0x0
   entry[0][0:4]: 0xFFFFFFFF (OPEN_ATTR_ENRTY[0].next)
   OPEN_ATTR_ENRTY[0].bytes_per_index: 0x0

In the patch, taking DIR_PAGE_ENTRY_32/DIR_PAGE_ENTRY as an example, there are two
situations:
[1] https://elixir.bootlin.com/linux/v6.10-rc4/source/fs/ntfs3/fslog.c#L4186
    If entry is DIR_PAGE_ENTRY_32, it seems to explain it as DIR_PAGE_ENTRY, but the
    entry size is still DIR_PAGE_ENTRY_32, so we use sizeof(struct DIR_PAGE_ENTRY_32)
[2] https://elixir.bootlin.com/linux/v6.10-rc4/source/fs/ntfs3/fslog.c#L4206
    - If entry is DIR_PAGE_ENTRY directly, we use sizeof(*dp)
    - If entry is DIR_PAGE_ENTRY_32, but it is explained as DIR_PAGE_ENTRY. Because
      We check it in [1], and sizeof(struct DIR_PAGE_ENTRY) is smaller, so we also
      use sizeof(*dp)

Thanks,
LL
