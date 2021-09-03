Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73BB3FC9
	for <ntfs3@lists.linux.dev>; Fri,  3 Sep 2021 06:23:24 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id t12so9498629lfg.9
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 23:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=dTYOXH7zK0vPgrarPgldqYxyLQBs1zMUKXRf1qh7M7c=;
        b=X8uK0KppmfcXaTvcG4M6gJFAzLmhzPapPqlPcfW4C3ZlgGKw6o3OSSL15N/3wICP5A
         mM782u5rNZSykV55miEaPV0FdTV1KzdBGShVKWhaINOknmkMF1W18ywyvQrOB0u5dFzK
         1N5nc4MLrrxK+16v7vaoB0p7ezdRFHIe+0MUfsIzAchRi+CT+iKy0ki3We7QQy2820IA
         10Wj+FUA5GvUGR8unNP4m3h7DZkyd1BAJFCN6tbXw9olkxW/6PgN3poNMjD7L26C1Ezh
         Q8cRdTVwq2x+IdGSkyAxtC0WK47oNtlAi99xtLl85QYjsCjewJFhmczsOtMQrz8KeaGd
         edag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=dTYOXH7zK0vPgrarPgldqYxyLQBs1zMUKXRf1qh7M7c=;
        b=Ha/8ETJX8HLCwlQokiyrsmNvc1LVYTWc3yk2YvWw9yHIk4drEDevKUhkVZSXU36Fnp
         mNNA8O+dvndt+v0wm+xhC+3v5WotW0OaQuiFyAyCD1HT2ytIvKHfERxFR2BlI8ONlhfl
         0qP1ZkgQytD9eLhYFajy7yEDRG1fiyODXvQhQ41zdOY/nZeoNDyGmpm+T9hyc3A9Eo+X
         R5JmV0Z2FlD49LNJjeVPfwMzO+mo3hTLSuNsPIFfuMZHyTqZIElPPAhLOChwxCfdN20K
         PlZ6s+u3CkSqDUT8JS23/V+JzbUE6svtHb1JJDOUgwF1k12+O7erKtATqn3x/EjKmfMM
         OOFw==
X-Gm-Message-State: AOAM530RC9bFbio8EuXLXdSXwyZTsOVI1eSm1BjB0zyf7+TLDIRvwZ6f
	DCswccvx2IkIcmok75ev7MB+6ZDptIO3JQ==
X-Google-Smtp-Source: ABdhPJyDRCu1pP1mXhe9mFWyARklrHQdg4/UrV5QLlTKm++vyS2nXR2QHPLKnhBtO6ShYB2qpEaYiw==
X-Received: by 2002:a05:6512:22d3:: with SMTP id g19mr1614158lfu.544.1630650202662;
        Thu, 02 Sep 2021 23:23:22 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id x6sm402461lfd.208.2021.09.02.23.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 23:23:22 -0700 (PDT)
Date: Fri, 3 Sep 2021 09:23:20 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
Subject: ntfs3 pull request to linus
Message-ID: <20210903062320.kk57imzcf47pzpzh@kari-VirtualBox>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Konstantin.

Linus has just stated that he is waiting for your pull request [1]. As
this is your first can you please send pull request first to this list
or to me personally so that we/I can check that it is somehow correct.
Please note that this is quite urgant already if we want ntfs3 to be
merged in this merge window.

[1]: https://lore.kernel.org/linux-fsdevel/CAHk-=wg7GMGD1YNM7WgPAU3nwHhMAvQ8yvdwvJtuwe9J1pBgvg@mail.gmail.com/

