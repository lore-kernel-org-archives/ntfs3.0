Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6538161B49
	for <ntfs3@lists.linux.dev>; Thu,  1 Feb 2024 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706790327; cv=none; b=jUj+/bfa/8Sv0sDwDEFzijedX9JNgAsaxPt0dRq8BUV6NQTXzyw5446eNf2KcZZ9kTn7gYeDwQI/ulehjhN3ZGkCq3D7n9p/g+9W9G2Kfo9/9F8BgNoPj7WGEddkxEeabNDiCBwJNtW4YlqGRs+6/xjngKhHu2VdSS/Iul1xTEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706790327; c=relaxed/simple;
	bh=Dd/X/a3E7PTQCMqLWky4djaC4x8rNov+S5OGSCD8Vtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOq8w4Ve/h0HlTEYmNzdFY7B97llBhuup9Dbay9AF/nminMXUOnZbpjsWJRwPvbRD1mn24rHiTzAf2BSDlXhdDFiCvyxds9DJ6Qw1hv+VxJWXTwRZSeNZ6EvmKJNLq6rzsJ0oQtINoJJHlIH2L4bkwFLLEG0EmR71dLAOOwqqqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdjp4Xvp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdjp4Xvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706790326; x=1738326326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dd/X/a3E7PTQCMqLWky4djaC4x8rNov+S5OGSCD8Vtk=;
  b=jdjp4XvpBpFYUBG4iFZV4FNgGWkQ0e1IRQ/6Dx6Hp8rriRXld4wNg7nt
   NQsR1Y8prcl1jKWB7CBp/PMJ8XyGXTGXXQTYO1Ye2e7bmEQg+9wVtpjUF
   jBjfyirba2fmnqMMRf9OLqdC+6BTlb65W5iTPmFZIqBc0RLOTOHHKKVsP
   53554mF6X7mq9K6B1ITCeTxWDXe3sNSaARdORWQpBoUr+a6x5qvgN5i9L
   Iwo2k5uezsbNHwaZtW810fS3vOtgbspXRfJk8Czgo7F8+lO7rdpSINTl0
   pknr6q6h1R5OypssSG4IMX1DQINBnHWoYsTedyQbN9aNhGqULy3FGWpWi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3747310"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3747310"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 04:25:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4499234"
Received: from newjersey.igk.intel.com ([10.102.20.203])
  by orviesa004.jf.intel.com with ESMTP; 01 Feb 2024 04:25:12 -0800
From: Alexander Lobakin <aleksander.lobakin@intel.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexander Potapenko <glider@google.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Ido Schimmel <idosch@nvidia.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <horms@kernel.org>,
	linux-btrfs@vger.kernel.org,
	dm-devel@redhat.com,
	ntfs3@lists.linux.dev,
	linux-s390@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <simon.horman@corigine.com>
Subject: [PATCH net-next v5 20/21] ice: refactor ICE_TC_FLWR_FIELD_ENC_OPTS
Date: Thu,  1 Feb 2024 13:22:15 +0100
Message-ID: <20240201122216.2634007-21-aleksander.lobakin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marcin Szycik <marcin.szycik@linux.intel.com>

FLOW_DISSECTOR_KEY_ENC_OPTS can be used for multiple headers, but currently
it is treated as GTP-exclusive in ice. Rename ICE_TC_FLWR_FIELD_ENC_OPTS to
ICE_TC_FLWR_FIELD_GTP_OPTS and check for tunnel type earlier. After this
refactor, it is easier to add new headers using FLOW_DISSECTOR_KEY_ENC_OPTS
- instead of checking tunnel type in ice_tc_count_lkups() and
ice_tc_fill_tunnel_outer(), it needs to be checked only once, in
ice_parse_tunnel_attr().

Signed-off-by: Marcin Szycik <marcin.szycik@linux.intel.com>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_tc_lib.h |  2 +-
 drivers/net/ethernet/intel/ice/ice_tc_lib.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_tc_lib.h b/drivers/net/ethernet/intel/ice/ice_tc_lib.h
index 65d387163a46..5d188ad7517a 100644
--- a/drivers/net/ethernet/intel/ice/ice_tc_lib.h
+++ b/drivers/net/ethernet/intel/ice/ice_tc_lib.h
@@ -22,7 +22,7 @@
 #define ICE_TC_FLWR_FIELD_ENC_SRC_L4_PORT	BIT(15)
 #define ICE_TC_FLWR_FIELD_ENC_DST_MAC		BIT(16)
 #define ICE_TC_FLWR_FIELD_ETH_TYPE_ID		BIT(17)
-#define ICE_TC_FLWR_FIELD_ENC_OPTS		BIT(18)
+#define ICE_TC_FLWR_FIELD_GTP_OPTS		BIT(18)
 #define ICE_TC_FLWR_FIELD_CVLAN			BIT(19)
 #define ICE_TC_FLWR_FIELD_PPPOE_SESSID		BIT(20)
 #define ICE_TC_FLWR_FIELD_PPP_PROTO		BIT(21)
diff --git a/drivers/net/ethernet/intel/ice/ice_tc_lib.c b/drivers/net/ethernet/intel/ice/ice_tc_lib.c
index b890410a2bc0..80797db9f2b9 100644
--- a/drivers/net/ethernet/intel/ice/ice_tc_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_tc_lib.c
@@ -35,7 +35,7 @@ ice_tc_count_lkups(u32 flags, struct ice_tc_flower_lyr_2_4_hdrs *headers,
 	if (flags & ICE_TC_FLWR_FIELD_ENC_DST_MAC)
 		lkups_cnt++;
 
-	if (flags & ICE_TC_FLWR_FIELD_ENC_OPTS)
+	if (flags & ICE_TC_FLWR_FIELD_GTP_OPTS)
 		lkups_cnt++;
 
 	if (flags & (ICE_TC_FLWR_FIELD_ENC_SRC_IPV4 |
@@ -219,8 +219,7 @@ ice_tc_fill_tunnel_outer(u32 flags, struct ice_tc_flower_fltr *fltr,
 		i++;
 	}
 
-	if (flags & ICE_TC_FLWR_FIELD_ENC_OPTS &&
-	    (fltr->tunnel_type == TNL_GTPU || fltr->tunnel_type == TNL_GTPC)) {
+	if (flags & ICE_TC_FLWR_FIELD_GTP_OPTS) {
 		list[i].type = ice_proto_type_from_tunnel(fltr->tunnel_type);
 
 		if (fltr->gtp_pdu_info_masks.pdu_type) {
@@ -1401,7 +1400,8 @@ ice_parse_tunnel_attr(struct net_device *dev, struct flow_rule *rule,
 		}
 	}
 
-	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_ENC_OPTS)) {
+	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_ENC_OPTS) &&
+	    (fltr->tunnel_type == TNL_GTPU || fltr->tunnel_type == TNL_GTPC)) {
 		struct flow_match_enc_opts match;
 
 		flow_rule_match_enc_opts(rule, &match);
@@ -1412,7 +1412,7 @@ ice_parse_tunnel_attr(struct net_device *dev, struct flow_rule *rule,
 		memcpy(&fltr->gtp_pdu_info_masks, &match.mask->data[0],
 		       sizeof(struct gtp_pdu_session_info));
 
-		fltr->flags |= ICE_TC_FLWR_FIELD_ENC_OPTS;
+		fltr->flags |= ICE_TC_FLWR_FIELD_GTP_OPTS;
 	}
 
 	return 0;
-- 
2.43.0

