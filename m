Received: from outbound.mr.icloud.com (mr-2004f-snip4-1.eps.apple.com [57.103.69.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEEB36E470
	for <ntfs3@lists.linux.dev>; Mon,  5 Oct 2026 22:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239618; cv=none; b=B0gTdY1726Rytxaq2aEBw0aYYL3s9SdAfVb7kuYEDTPOYXRRZRJH5uaWnqlYlq7F6QYJjl5+KlOgfJTaYNA5LQLvanRK+XFzT+iL9QrTamgsEUZn1BrkOJGc7ZfQjOq+jeFaLry4dp6yJ5rRRvdfdVVKEu8urWL6cPqmr6jeezs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239618; c=relaxed/simple;
	bh=91YqBYaROfMqSszfT6L81U6vCAmusghWShAvS3iTnVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kr9cGVRr2ihBn5mxO4yHrnbsckvpZr81qdzXZsID9ICgdFfbrR/3nu+iZjrksXfpZYB8iwTXlHi5AVJFsmAW61qdioNCdCagcqjoWwIu9z5GIprcNvsKVbFALa4xQ2FNb8Eacw0KqVFMYC362cBH0GTYJf1VVW5P89qaoEkAUzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mennemann.net; spf=pass smtp.mailfrom=mennemann.net; dkim=pass (2048-bit key) header.d=mennemann.net header.i=@mennemann.net header.b=RAm8xb39; arc=none smtp.client-ip=57.103.69.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mennemann.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mennemann.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mennemann.net header.i=@mennemann.net header.b="RAm8xb39"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with ESMTPS id 2BC211800821;
	Mon, 05 Oct 2026 22:33:33 +0000 (UTC)
X-ICL-RepId: 01a10e33-6a98-71f5-9e13-4bd9f4a160b2
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhPC0MFWwNeC0gLQwVaAFBcHA4AVhlRGVc4XghZBVcdWBZdQ1kORlBfHA4AUgVcFVQZXQMZBVcEGQpQUANLWhVVFw4CQh9QH0wWV0NaGRwZWhRcGFNFUR9UWEMZRVZpQQtPHV0ZWxxCZFhXCQoGVx5XHV4MWQUcHlwMEwBeDw9MC0gBWwZbAkULSgBeBlMcQQBLA14aWh8dWApQBFkrXxVXFlYAVgVcXlcdR1MXH0sAXEVQGEQfXR1mHFwAVgJc
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mennemann.net; s=sig1; t=1791239616; x=1793831616; bh=7juJP48MqV1lvb3xNB4/Ia8hdqaNzx2MvQLN/MB8Db8=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=RAm8xb39x4XWVpSwJNpIeSgDiDPHvZSJn7FtFC5EuWPMZ2aHAzA0FlYIN9YQyvBFkvxM4hlreX0ltHTnK8lF7kFc/2q4F6Yszxy7l8o8OrVJTplTEM6K+TlY/9tYeWu1kkqIlAn2NVoAJp+wrJBZZ481jcgUdiWSRWuRmks31COQX2wlvUSkC7TWgkioE9x8uG6XeXP6Q/6QSHP6a7cm+TE2QOPZuSJ/gG7oZvgsU/aWgGcW6Jhh+oKDRkoeUhW/MyL6MxC9ol6TIR7dQXfbRbsU1cgrY6CxU/K3ljnc4lLIoe6XNvvOx23JVZF48bpQqRLCQ7NcAvfne7QmC6om7A==
mail-alias-created-date: 1719251376433
Received: from archlinux.localdomain (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with ESMTPSA id 3943C1800818;
	Mon, 05 Oct 2026 22:33:30 +0000 (UTC)
From: Marcin Mennemann <marcin@mennemann.net>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Marcin Mennemann <marcin@mennemann.net>
Subject: [PATCH] fs/ntfs3: fix SEEK_DATA/SEEK_HOLE for WOF compressed and dedup files
Date: Tue,  6 Oct 2026 00:33:18 +0200
Message-ID: <20261005223318.19303-1-marcin@mennemann.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RfSCFtZoBpS4LZ8alNStsJ00plkoN5zA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4OCBTYWx0ZWRfX4eUgtGBGlGuu
 IISmPj2RevG59d0Mpk7ha8CIGrbqFjhOxBZPI1igAo9bbm4w2LyfRavdiWhoCEAZqU+zCFFBkki
 3FVRUl4hWaNV20dEiK7ywvwaqWU6TopSLOcyiI2PCECNdUVYJmOXucYIPK7agM65Wfqt/PHvq+K
 jmAcaFZ8JeSDr2bPvGi+CUqu85FbdZjFiLHwklQUMuH3cUsGEdCUfWF83vf/ju248vnTztc+BZW
 44o2y+6kXcRtOzxx3/FFag2X0437itO8JWwvQ4CINLAj62j44+P1xBwzatWzxFJYeNDOotW1d/2
 q+3KJzUQKlneGXVE8oEJHW1GtdFLJjx3xDJzJ/VGDbJmAGsC0CBvX3U5CD24F8=
X-Proofpoint-ORIG-GUID: RfSCFtZoBpS4LZ8alNStsJ00plkoN5zA
X-Authority-Info-Out: v=2.4 cv=IfGKmGqa c=1 sm=1 tr=0 ts=6ac425bd
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=3BIuEVVFAAAA:8 a=0lyB3jaMq6HwW7RYUmIA:9
 a=Vn7Q3koVGW_X0o2JKQlw:22
X-JNJ: AAAAAAABcmKoza8nG+Nw9P2NHqb41yL5rqP6oGB39n/QNpi3whBAntq3a6lFoX1hSaoSBjCncz5wGxQmNJP2GjSlaLRdNFXqmjlwmNehoS9BxfKV4MlapExb2UO6EXrF+RmC1f20OCl3pIuJCyaq2eqxGHAT4O/xS0nbAahrn1pMclkDp7NGdH79TNzboJW6W5W9rHG9TkCrq5xrQn6tIRuGBvgWuTTdy9izzyDgMlROQUV2c6Nu3qHawN7HA8YQeMxPS55p9tGEhWoRxllB2YjK1DJSCKwnhBl7gPAGSCPf+nK5OaAJGLCR6JouQ+djhvTKXHHq6ArWE7anPD7nmyukDrsJQUEsgIWcV2MCnPvSa45c58eZLcptyH7ew4Wova0tk2SuIhdXFADi5yKn+2PjKJoY64WXH6fklMnAvqVS1DDl2E63g4bTWz6rwDS7fkcnSJTnQoGoPjXjKsc4VfBaHpEY6t1S30Cea93T3rnXM0neNtfgWW5HgbacwJ2eVGb0CdtG+RHZf2MgcZmT05ub2OFj3bs/uHKjD1X4SAtQ+qH/KyGw+ubUgC/5AbfWbnTFm4xXpREeai2ReYH2jFaGZJuso4tsysyPxDjGE1PzTBMrsjUcKQUlaco/YcnASlpNmoEhmPcuMtX92e/tdFvUsq9L7ECEcngA1RPSnOLxEUbmQ/ler7a9de9eXtNe8bnPIeNe3cGpNUJZHFN94A75u282aTJEFak0Oj3l3hmwAx1sD6K/5wWabNmkEXTcGFrYv+kOh5UXyQfq3O3kYy4uPsWcdhwNLvFJBo+dH2nUlAhWG49JgeTatnbVO8PfypoNybzbsDqBTbNY5UD+qQFJsKt25mGxdlizsxqXWs69G1bm/F6gsSG3Qy2DX3XERlBLaKuo7RoQG1WM7HnrIRR8TdiDcM5nHACDjNf4Mzit9bDfJpSqMphWCiZ2bnTdOvSJpggJEFKhLIuufNLr4djZjkWfLBz
 BrWsggp46Xq117Ys4/I3oNjTXAgJlPsruONoxwzU7HomWiP4CxtTT1YGoYu8rHxmXRuZ1fsQi3Qt/OAinPOtR0HZ9gPlzjGDIiX6xwFBqQwv+j8eqtd1Jy1ekEaZe6DFdmuI35hPnDDwDUENiAYo+sNb3hBliEbqKfoRNXGfMPe6777qtklYcPaOveJuQrIC71fwWRo3tCOyXbkZt4Ar6uBl/u23fKqYQGwZW6FZxyygm5b3vuNTNpj5jaZshCskBTHjX7wJtPBzfiD49fMC8T22ZVg==

Since commit c61326967728 ("fs/ntfs3: implement llseek
SEEK_DATA/SEEK_HOLE by scanning data runs"), ntfs_llseek() finds data
and holes by scanning the runs of the unnamed $DATA attribute.

This breaks WOF compressed files. Their data is stored in the
WofCompressedData stream and the unnamed stream is completely sparse,
so SEEK_DATA returns -ENXIO and the whole file looks like a hole.
Deduplicated files keep their data outside the unnamed stream as well.

cp from coreutils uses SEEK_DATA for these files and silently creates a
file full of zeros.

Fix this by using generic_file_llseek_size() for files with
NI_FLAG_COMPRESSED_MASK or NI_FLAG_DEDUPLICATED set, like before the
commit above.

Fixes: c61326967728 ("fs/ntfs3: implement llseek SEEK_DATA/SEEK_HOLE by scanning data runs")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Marcin Mennemann <marcin@mennemann.net>
---

Notes:
    I found this when cp of bootmgfw.efi from my Windows partition gave me
    a file of zeros.
    
    Tested on 7.2.8 with the Windows 11 partition mounted read-only: all
    WOF compressed files I sampled from C:\Windows were reported as one hole
    before the patch and as one data extent after it, and cp of bootmgfw.efi
    went from a zero-filled copy to an identical one. Sparse and LZNT1
    compressed files behave the same with and without the patch.
    
    Not tested: deduplicated files (I have none).

 fs/ntfs3/file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 2abf334bfa0c..bbabeea7248e 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -1554,7 +1554,9 @@ static loff_t ntfs_llseek(struct file *file, loff_t offset, int whence)
 	loff_t maxbytes = ntfs_get_maxbytes(ni);
 	loff_t ret;
 
-	if (whence != SEEK_DATA && whence != SEEK_HOLE) {
+	if ((whence != SEEK_DATA && whence != SEEK_HOLE) ||
+	    /* Data of WOF and dedup files is not in the unnamed stream. */
+	    (ni->ni_flags & (NI_FLAG_COMPRESSED_MASK | NI_FLAG_DEDUPLICATED))) {
 		ret = generic_file_llseek_size(file, offset, whence, maxbytes,
 					       i_size_read(inode));
 	} else if ((unsigned long long)offset >= i_size_read(inode)) {

base-commit: 67f0943b394d920b6c142aad8c6af94340342ae7
-- 
2.56.0

