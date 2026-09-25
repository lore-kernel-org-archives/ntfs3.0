Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0A549A3A5
	for <ntfs3@lists.linux.dev>; Fri, 25 Sep 2026 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334995; cv=none; b=BC0c918qCXm6LkqHmrcEtVDbv6cW6/pTlx5caweE4yk6Tt9p0LNrPHZKLB03PbYzVuAIZmWfFfjD6Eo03mmjcX+/Cn8i9csq/9iRbXjL3qnJKIMMxPPD4OMQDqNgdvU5KWfzK9uAmNkqCrdTJVxaVgs/b6zjiJPHyRBYSmGvWNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334995; c=relaxed/simple;
	bh=U1jbHaueY7MC/HxzyFNnEOFEzHSMOSsXPYHrHaf6/ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMpylr0pt0+qFk6rHbQLmvo9I86wRVLVhfcZHUwdTpoWMVp6UC68eGJFDbZLPHWnV43KSCyQEsVIaNo0ZjAJAJkkVaqaGdNf3DGJhkBbP+JRBSIjLPeP6ldp3BVUFhMieJo1oeU4bB1KTAfAWp0ouU8syQqsSB+yVbjH1e/hw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=P3Xp+nFY; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="P3Xp+nFY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so6530185e9.3
        for <ntfs3@lists.linux.dev>; Fri, 25 Sep 2026 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790334991; x=1790939791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ik+WyQO23IiOEtGjTwj6K1Ip96ewUvjpBHAq+J58URE=;
        b=P3Xp+nFYVT0UG4t6ATj8fBAQGlY7W0TIVboE75X3RsEv7ajy/5ZUIyOgEplXPLfpZR
         bdamHf53m/PqzxnH/D9OM+rbzvice70N5OBFZhyXmBK+yUKDynOTkmPZd+7y65MP5IUX
         vdv2nTD6vVzqUQeNJfYHD06pUkIW5iXnKEl2W2p2JpSpiWu7vJoQBmwASPxZdmsHKaD3
         Ksm0ZymP33ejy3QulcGgjPcztVw6IbUtgDREuOv5M6eTz/OfLQjRwM1PMF0FQAX4gSGU
         fcWaLN88ZrXeyZd1gMPsE7CNYRjU6shMKDLZ/0YGsCZ/Brlh/cW610o+nmJta/OaO6zx
         gMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334991; x=1790939791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ik+WyQO23IiOEtGjTwj6K1Ip96ewUvjpBHAq+J58URE=;
        b=k8cymgmwb4kKPtOi8p4EC3W2FvrMvQU8FGeTKUa5SEJjRUTNFHKbJC1PPgPkW0x+bc
         35+eSPSTCmJGA4Y1CnLvXGB7zN2Bui8tq7DBICYN7sYa40aN2S4iFBJcJXts/wQOvVqt
         tNAN+jnVhDEhBRlqV/lg8kPw2cPp+Cq/wnjhzmt5/77P5etV7LfmL7VyVyfdkjZR+4Ui
         top8ItMYChAlz+lFZn58HBMJPXLacXZoKRy4c7FAEDfXqD6PFKlmIZ8C+hs1xgiV6i3X
         lH3Ns9alW4iYE0ityAo0nAkRWPF7yQSxD6cdfkkacMZl6d75wUEaRU1TqdQio2vMrW4F
         iFDw==
X-Gm-Message-State: AFuF++lV+5kJZbflH53PMuI+X2EQ6LRaLZ7Kr8NVenrtHlLUyFO9ph76
	iaD0FCfypaXrEk1csUsntVflv/rtDfVujD5dNh5Kjp4/4MThNSw6xvSE0+Ud4pJd354D7/X9CPE
	Dfe4cmN9pn2JQ/Q==
X-Gm-Gg: AYBFou0EYX3yXAL2iFg4oZ162fj2AbKvy0kROYwgNwfSvmn5jNmRU14dZqqAwV6ICZw
	wAblTCLcW27MxqMqmuONvUQXZFLMAawV3aCIHoHUYOZiHk2jFIZOS+AYhbKB55VwOuhy8zSeQ9R
	TkPNZcpM63Xe8tCdwegF6yGsadYOn2lwaLvIhHnJhDUzQJ+eygy7ZAhtbRo2gbTmagGREWDXic+
	fwsolKAjvFNs/CbMmIKtm3TEe57XhET8XperpzOqkSZQKE06R12x6Sh3+Qm1gX8A8pp9ni3QDwo
	IqXpVBZYwSN+S+LM+2Qd2uPo6iyo0FpIoG/2KE+fLS5B7uHQg4117MaL6yRgGuT4cP1ByEGs5qA
	0Tj931NWr2hsXl5HxiMB9mozzjre56Jbs6IyZTuoc2GIHOuK9j6uIjhRU92R10j6+1j3zH8TrF/
	znskE3R5URCUEO6V1qpty+1raMDEStcKu8Dc7VGEElM4v/1qXNVw==
X-Received: by 2002:a05:600c:4e86:b0:49e:6ac4:b76e with SMTP id 5b1f17b1804b1-49fe66f720bmr97531355e9.30.1790334990763;
        Fri, 25 Sep 2026 04:16:30 -0700 (PDT)
Received: from cachyos ([151.36.34.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbd2dsm50237695e9.12.2026.09.25.04.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:16:30 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] fs/ntfs3: fix log replay payload overreads
Date: Fri, 25 Sep 2026 13:16:12 +0200
Message-ID: <20260925111619.68345-1-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two journal replay paths that can read past crafted
redo or undo payloads while mounting a dirty NTFS volume.

Patch 1 validates that redo and undo payload ranges stay within the log
record before replay uses them, while preserving the compensation-log
record undo exception used by Windows. It also validates the fixed-size
OpenNonresidentAttribute redo entry and optional undo name before the
analysis pass copies them.

Patch 2 validates the minimum payload length for SetNewAttributeSizes,
which always reads alloc_size, valid_size and data_size but previously
only checked whether the optional total_size field was present.

The two checks are complementary. Patch 1 makes sure the selected
payload range is inside the log record when that range is expected to be
present. Patch 2 makes sure that the selected range is large enough for
the SetNewAttributeSizes operation that interprets it.

Both issues are reachable while mounting crafted images. Each patch
contains the KASAN report observed before the fix. With these patches,
the same images are rejected during mount without sanitizer reports.

Giulia Aloia (2):
  fs/ntfs3: fix out-of-bounds read of redo/undo data during log replay
  fs/ntfs3: validate SetNewAttributeSizes payload length

 fs/ntfs3/fslog.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

-- 
2.55.0
