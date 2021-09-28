Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B47A2FB2
	for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 23:27:55 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id dn26so1272267edb.13
        for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 16:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8lm5y1AjOAjK7ZnE4al7pNXE243FwwAHWHeg19IyIec=;
        b=UPhcGM01HCbJx6zroAcuK3jILDvRXWaFKhJGRMiZ7Kjsd604uP3MzHh+mgBXAnLpYC
         CNp0AT9ojtYdZ67IdrdznKSBLCggg573iU10fHgwORnh8YPn+X0Dq80VvXi2eUGWQi/P
         41IVR28D/8XpeoINZ7AO7nkdDGNI3elPAsqiXNwRMM2t2Z3ZA5rms+OGAnaMIx4Fw0+c
         bWBPtEV05R40cbeRrdCq3udMVPxU6ouSO1dII6mTn4hK5GFVhRZDUKhj3XmsdG+INAfj
         bjCK+n23LCQcS7fbIfQWZXZzuslArhASYTesz5u3yz7SpeOAcJL6W5cH6/O+k8dcEVdL
         7PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8lm5y1AjOAjK7ZnE4al7pNXE243FwwAHWHeg19IyIec=;
        b=L3maRF9f2aVVc/kYOJirSZq++L4AHUPpqwyH/xp4nxMHMEi8P0NI2JB3UawXbjy2qb
         e/U6p4u2P+EO0y9EK2s/i2qItwdYtPxItZvliWQwAy5RGUXxT3NjGiuJ5nPrmBug5xNL
         YWwfr3jOLwbPXdQ2lcS7Kr/XYy+fbrZ9QfEP0T/2FcCwD9PCv2UE9eq/NNGROga913jY
         Bz2rX/AjAid1gO2rcIA3GNjBvbS+TWuRqYRIp/J3rZ13a0OurmFLu+m9JDlgX0KhvxMD
         r4YSCLyWUemZd8zE2zaCt6h2KrBtzYQwUXQqdEoNksBSHwDEB+QZ+Qa8/f/PtsBHtij7
         JNVw==
X-Gm-Message-State: AOAM5333wPNmYezwgBHk3R/xhBPEvzE4bg6Vu1g6EVGQ0msWGGUQqcDO
	lWjcB2ot/ZBXtr8Y5bA1fk3klFzfFRc=
X-Google-Smtp-Source: ABdhPJweGmrC4Lecjtbz/UCVovaR1OEhiSvuHmH6TsHRmnpzvF783ZJUGLCNlwLP3ADnw9ke8C25mg==
X-Received: by 2002:a17:906:a14b:: with SMTP id bu11mr9736346ejb.260.1632871673606;
        Tue, 28 Sep 2021 16:27:53 -0700 (PDT)
Received: from ?IPV6:2a02:8010:64ea:0:fad1:11ff:fead:57db? ([2a02:8010:64ea:0:fad1:11ff:fead:57db])
        by smtp.googlemail.com with UTF8SMTPSA id cb7sm288345edb.49.2021.09.28.16.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 16:27:53 -0700 (PDT)
Sender: Mark Harmstone <mark.harmstone@gmail.com>
Message-ID: <261705dd-64b2-32e0-e8d6-3be9fa202f0b@harmstone.com>
Date: Wed, 29 Sep 2021 00:27:52 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] fs/ntfs3: Fix logic in ntfs_cmp_names_cpu
Content-Language: en-US
To: Kari Argillander <kari.argillander@gmail.com>
Cc: ntfs3@lists.linux.dev
References: <20210928183300.12946-1-mark@harmstone.com>
 <20210928220718.fk2g7itrgmyxooql@kari-VirtualBox>
From: Mark Harmstone <mark@harmstone.com>
In-Reply-To: <20210928220718.fk2g7itrgmyxooql@kari-VirtualBox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/9/21 23:07, Kari Argillander wrote:
 > So I have checked this now. Yes function will always return non-zero
 > value if we use bothcase and this is intended behavier. But if
 > bothcase is false and upcase is not NULL then function can return zero
 > value.

Thanks Kari. It's not clear to the casual observer what both_case even
means... It's only ever true when called from cmp_fnames for a non-DOS
$FILE_NAME. Given that DOS names are guaranteed to be uppercase, I'm
guessing it's supposed to mean "no need to uppercase this string as
well", but that's not what it's doing.

 > Do you have some problems? There could be that in some place this or
 > other cmp function is called with wrong parameters. Example with
 > bothcase true when only case_insentive is needed.

Yes, it forces case-sensitivity - i.e. `ls WINDOWS` give ENOENT, whereas
`ls Windows` succeeds. cmp_fnames <- indx_find <- dir_search_u <-
ntfs_lookup.

I think perhaps ntfs_cmp_names_cpu was supposed to look something like
the following?

int ntfs_cmp_names_cpu(const struct cpu_str *uni1, const struct le_str *uni2,
		       const u16 *upcase, bool uni2_not_uc)
{
	const u16 *s1 = uni1->name;
	const __le16 *s2 = uni2->name;
	size_t l1 = uni1->len;
	size_t l2 = uni2->len;
	size_t len = min(l1, l2);

	while (len > 0) {
		int diff = *s1 - le16_to_cpu(*s2);
		
		if (diff) {
			if (upcase)
				break;
			
			return diff;
		}

		s1++;
		s2++;
		len--;
	}

	if (len > 0 && upcase) {
		while (len > 0) {
			int diff;
			u16 c = le16_to_cpu(*s2);

			if (uni2_not_uc)
				c = upcase_unicode_char(upcase, c);

			diff = upcase_unicode_char(upcase, *s1) - c;

			if (diff)
				return diff;

			s1++;
			s2++;
			len--;
		}
	}

	return l1 - l2;
}

Mark
