Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B75230F95
	for <ntfs3@lists.linux.dev>; Mon, 16 Oct 2023 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qgaue/Nr"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5a7cc03dee5so59442517b3.3
        for <ntfs3@lists.linux.dev>; Mon, 16 Oct 2023 10:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697478902; x=1698083702; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6bw4UalwD6RTLFekVHi/CP+1fpgIfdUhpzj+EU1oO1Y=;
        b=Qgaue/NrMmWZE0FmjXM7TsCWBK2zj1wAoJr/6fEy5Q8jY6HHeeJyA/O1kHApc8wKka
         G48dRndO9GSEjNQ0cu06eMGZit5wyd6eUTHZjWxi6ZY/90YNbIt49ZbKTHQJumIwZWf/
         liDrNOCvQvWzGpo6HWvJ1d7EzoO/h7JSc9/7/c5400d5uH5hGAtGUgEIhanUhuh71U1l
         ysC52z7I5Wq+ta6T6YgjZCeRsw5RwgjlbQ8CopJ6Cm24P50a9elSh13VEk/oCtiQVvW4
         pVsIcKHBHEN1qTLrd0ejZhrGW8XQMEeZJBrKRzYePC2NuSvj1/qwlOLRJlcUFDGxBQ7Z
         yvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697478902; x=1698083702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bw4UalwD6RTLFekVHi/CP+1fpgIfdUhpzj+EU1oO1Y=;
        b=XRY41QoLqFKOnKjixIzMmeYQ2rT4bxgnyX1ogVATEQFwgzebPPyUhulXOy6S0SYWL0
         k9DtQjtWubmbQ4aB3Gu6dZJgmuAUJPhLv1u7LKENYrJWGGdZfTkdGYzRV2KqA/tw8mFf
         1pa9dYv1+TBW/H4GzjSorJdDBnpV1x+A7W2dPR25ILhwni1VfxPEBtvUOf+tYwgKNgyK
         dpuVMR6Eym5PnXy50JehHOeq+cAU35ga9lUCG0bEJFa7djfSfFz086gjHnuAviTdkYD7
         JvqF8pvXDQV/JKhnwJPwJtsjVlES54LzVYJLHSlZJvMwBhvfYFL4E0gDB1k3h26mgDJb
         i3pA==
X-Gm-Message-State: AOJu0YyVmSaiYw8CA779YYWbQ9CWjcBd3CTPbaJtH5szImjbLzLUTdnz
	XT+xdXaB8MnVr8woR3k6Sv8=
X-Google-Smtp-Source: AGHT+IGTSnIMdj/n4Ja3NbcbsGlcoAWOTqGIDx359ahueXqqmFI98BytrXJ2gg+e90t8fNnGTP3pNA==
X-Received: by 2002:a05:690c:95:b0:5a8:6286:bee with SMTP id be21-20020a05690c009500b005a862860beemr5534482ywb.4.1697478901928;
        Mon, 16 Oct 2023 10:55:01 -0700 (PDT)
Received: from localhost ([2607:fb90:be80:2b9:64a5:5a0e:5435:bd4])
        by smtp.gmail.com with ESMTPSA id w185-20020a817bc2000000b005a7ab32d454sm2404120ywc.10.2023.10.16.10.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 10:55:01 -0700 (PDT)
Date: Mon, 16 Oct 2023 10:54:58 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexander Potapenko <glider@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	David Ahern <dsahern@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <simon.horman@corigine.com>, netdev@vger.kernel.org,
	linux-btrfs@vger.kernel.org, dm-devel@redhat.com,
	ntfs3@lists.linux.dev, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] ip_tunnel: convert __be16 tunnel flags to
 bitmaps
Message-ID: <ZS148saIsG7WY8ul@yury-ThinkPad>
References: <20231016165247.14212-1-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016165247.14212-1-aleksander.lobakin@intel.com>

On Mon, Oct 16, 2023 at 06:52:34PM +0200, Alexander Lobakin wrote:
> Based on top of "Implement MTE tag compression for swapped pages"[0]
> from Alexander Potapenko as it uses its bitmap_{read,write}() functions
> to not introduce another pair of similar ones.
> 
> Derived from the PFCP support series[1] as this grew bigger (2 -> 13
> commits) and involved more core bitmap changes. Only commits 10 and 11
> are from the mentioned tree, the rest is new. PFCP itself still depends
> on this series.
> 
> IP tunnels have their flags defined as `__be16`, including UAPI, and
> after GTP was accepted, there are no more free bits left. UAPI (incl.
> direct usage of one of the user structs) and explicit Endianness only
> complicate things.
> Since it would either way end up with hundreds of locs due to all that,
> pick bitmaps right from the start to store the flags in the most native
> and scalable format with rich API. I don't think it's worth trying to
> praise luck and pick smth like u32 only to redo everything in x years :)
> More details regarding the IP tunnel flags is in 11 and 13.
> 
> The rest is just a good bunch of prereqs and tests: a couple of new
> helpers and extensions to the old ones, a few optimizations to partially
> mitigate IP tunnel object code growth due to __be16 -> long, and
> decouping one UAPI struct used throughout the whole kernel into the
> userspace and the kernel space counterparts to eliminate the dependency.
> 
> [0] https://lore.kernel.org/lkml/20231011172836.2579017-1-glider@google.com
> [1] https://lore.kernel.org/netdev/20230721071532.613888-1-marcin.szycik@linux.intel.com
> 
> Alexander Lobakin (13):
>   bitops: add missing prototype check
>   bitops: make BYTES_TO_BITS() treewide-available
>   bitops: let the compiler optimize {__,}assign_bit()
>   linkmode: convert linkmode_{test,set,clear,mod}_bit() to macros
>   s390/cio: rename bitmap_size() -> idset_bitmap_size()
>   fs/ntfs3: add prefix to bitmap_size() and use BITS_TO_U64()
>   btrfs: rename bitmap_set_bits() -> btrfs_bitmap_set_bits()
>   bitmap: introduce generic optimized bitmap_size()
>   bitmap: make bitmap_{get,set}_value8() use bitmap_{read,write}()
>   ip_tunnel: use a separate struct to store tunnel params in the kernel
>   ip_tunnel: convert __be16 tunnel flags to bitmaps
>   lib/bitmap: add compile-time test for __assign_bit() optimization
>   lib/bitmap: add tests for IP tunnel flags conversion helpers
> 
>  drivers/md/dm-clone-metadata.c                |   5 -
>  drivers/net/bareudp.c                         |  19 ++-
>  .../ethernet/mellanox/mlx5/core/en/tc_tun.h   |   2 +-
>  .../mellanox/mlx5/core/en/tc_tun_encap.c      |   6 +-
>  .../mellanox/mlx5/core/en/tc_tun_geneve.c     |  12 +-
>  .../mellanox/mlx5/core/en/tc_tun_gre.c        |   8 +-
>  .../mellanox/mlx5/core/en/tc_tun_vxlan.c      |   9 +-
>  .../net/ethernet/mellanox/mlx5/core/en_tc.c   |  16 +-
>  .../ethernet/mellanox/mlxsw/spectrum_ipip.c   |  56 ++++---
>  .../ethernet/mellanox/mlxsw/spectrum_ipip.h   |   2 +-
>  .../ethernet/mellanox/mlxsw/spectrum_span.c   |  10 +-
>  .../ethernet/netronome/nfp/flower/action.c    |  27 +++-
>  drivers/net/geneve.c                          |  44 +++---
>  drivers/net/vxlan/vxlan_core.c                |  14 +-
>  drivers/s390/cio/idset.c                      |  12 +-
>  fs/btrfs/free-space-cache.c                   |   8 +-
>  fs/ntfs3/bitmap.c                             |   4 +-
>  fs/ntfs3/fsntfs.c                             |   2 +-
>  fs/ntfs3/index.c                              |  11 +-
>  fs/ntfs3/ntfs_fs.h                            |   4 +-
>  fs/ntfs3/super.c                              |   2 +-
>  include/linux/bitmap.h                        |  46 ++----
>  include/linux/bitops.h                        |  23 +--
>  include/linux/cpumask.h                       |   2 +-
>  include/linux/linkmode.h                      |  27 +---
>  include/linux/netdevice.h                     |   7 +-
>  include/net/dst_metadata.h                    |  10 +-
>  include/net/flow_dissector.h                  |   2 +-
>  include/net/gre.h                             |  70 +++++----
>  include/net/ip6_tunnel.h                      |   4 +-
>  include/net/ip_tunnels.h                      | 136 ++++++++++++++---
>  include/net/udp_tunnel.h                      |   4 +-
>  include/uapi/linux/if_tunnel.h                |  33 ++++
>  kernel/trace/trace_probe.c                    |   2 -
>  lib/math/prime_numbers.c                      |   2 -
>  lib/test_bitmap.c                             | 123 ++++++++++++++-
>  net/bridge/br_vlan_tunnel.c                   |   9 +-
>  net/core/filter.c                             |  26 ++--
>  net/core/flow_dissector.c                     |  20 ++-
>  net/ipv4/fou_bpf.c                            |   2 +-
>  net/ipv4/gre_demux.c                          |   2 +-
>  net/ipv4/ip_gre.c                             | 144 +++++++++++-------
>  net/ipv4/ip_tunnel.c                          | 109 ++++++++-----
>  net/ipv4/ip_tunnel_core.c                     |  82 ++++++----
>  net/ipv4/ip_vti.c                             |  41 +++--
>  net/ipv4/ipip.c                               |  33 ++--
>  net/ipv4/ipmr.c                               |   2 +-
>  net/ipv4/udp_tunnel_core.c                    |   5 +-
>  net/ipv6/addrconf.c                           |   3 +-
>  net/ipv6/ip6_gre.c                            |  85 ++++++-----
>  net/ipv6/ip6_tunnel.c                         |  14 +-
>  net/ipv6/sit.c                                |  38 ++---
>  net/netfilter/ipvs/ip_vs_core.c               |   6 +-
>  net/netfilter/ipvs/ip_vs_xmit.c               |  20 +--
>  net/netfilter/nft_tunnel.c                    |  44 +++---
>  net/openvswitch/flow_netlink.c                |  61 +++++---
>  net/psample/psample.c                         |  26 ++--
>  net/sched/act_tunnel_key.c                    |  36 ++---
>  net/sched/cls_flower.c                        |  27 ++--
>  tools/include/linux/bitmap.h                  |   8 +-
>  tools/include/linux/bitops.h                  |   2 +
>  tools/perf/util/probe-finder.c                |   2 -
>  62 files changed, 1011 insertions(+), 600 deletions(-)
> 
> ---
> Not sure whether it's fine to have that all in one series, but OTOH
> there's not much stuff I could split (like, 3 commits), it either
> depends directly (new helpers etc.) or will just generate suboptimal
> code w/o some of the commits.
> 
> I'm also thinking of which tree this would ideally be taken through.
> The main subject is networking, but most of the commits are generic.
> My idea is to push this via Yury / bitmaps and then ask the netdev
> maintainers to pull his tree before they take PFCP (dependent on this
> one).

Let's wait for more comments, but I'm generally OK with the generic
part, and have nothing against moving it, or the whole series, through
bitmap-for-next.

Thanks,
Yury
 
> >From v1[2]:
>  * 03: convert assign_bit() to a macro as well, saves some bytes and
>    looks more consistent (Yury);
>  * 03: enclose each argument into own pair of braces (Yury);
>  * 06: use generic BITS_TO_U64() while at it (Yury);
>  * 07: pick Acked-by (David);
>  * 08: Acked-by, use bitmap_size() in the code from 05 as well (Yury);
>  * 09: instead of introducing a new pair of functions, use generic
>    bitmap_{read,write}() from [0]. bloat-o-meter shows no regressions
>    from the switch (Yury, also Andy).
> 
> Old pfcp -> bitmap changelog:
> 
> As for former commits (now 10 and 11), almost all of the changes were
> suggested by Andy, notably: stop violating bitmap API, use
> __assign_bit() where appropriate, and add more tests to make sure
> everything works as expected. Apart from that, add simple wrappers for
> bitmap_*() used in the IP tunnel code to avoid manually specifying
> ``__IP_TUNNEL_FLAG_NUM`` each time.
> 
> [2] https://lore.kernel.org/lkml/20231009151026.66145-1-aleksander.lobakin@intel.com
> -- 
> 2.41.0
