Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFCE29CA
	for <ntfs3@lists.linux.dev>; Thu, 23 Sep 2021 16:53:57 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id b10so547287ejg.11
        for <ntfs3@lists.linux.dev>; Thu, 23 Sep 2021 09:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=Uecg0dqXqMSqnK56wbAqmk55fIP4CRte/A67bO/6DJ0=;
        b=cAX2nBzpuSLlPfgui9WC9T995YcXBY61m8sNTttpCDiuOAG8Ga41WkfCk8WX9nI+OF
         ITgZIMoQbGfdy2sYhsxvjlGGeoowfFmPc2uUBsVmiebp43SXaIr6qTg40CjzJMbVsLr5
         qPIR1aPMy1djiD/CpfkvAEWdY9GbkJejchtAC2nu80gOzUxQ8l/denvExNiAjDRqQFJ1
         5EppCL8ier49RymoDdzjeqqyaJ/8fJShDrC0yi+09pAUm5BUU6rgw6N3mO+y6eV01kQD
         Dvmnf+l7papqDXwAysHJ4E8LAM3mLubjMCNJN6FVNgDsJ2TMMJOuxwZnVa+Eb8u9elKU
         B0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Uecg0dqXqMSqnK56wbAqmk55fIP4CRte/A67bO/6DJ0=;
        b=QTvApcdjO9WPq60DpvGeBLvspLyjzHvI7JBAmUgNwQpjFnA17GSj0rebWkbKBWo7mC
         TtaF/F7M1GfqI1j9sipdJf/xS1WLkVl7BpbmqEsbeh1q2VD94fmZJJiAox02un7xvXMV
         E7PGa2HEvvn6AxxseJNUfOBwsXvZWUKj+vzVOTWEd0Rds+JLo2sLTI4AB9fwV1UjO0q9
         IJIgnl/QcGGMXhEfURXMQYbYIf3DAU9jDUbUxZHf0ZRjsXeMkgI9nb2AJWz+qJmytfMT
         BRQWPzK2C8pl8XTMPiEjzH2TNUpB8+7Swj7ySeeGes9feL59A+1ezaJb3qFGBlz1MnhR
         EJaA==
X-Gm-Message-State: AOAM5306rVtXaRbRXd1bbh/F6VlJ18HkRuEOrafpbhJwS+mFX3uWBTMH
	Bh7//nmrEIiH4Tv4zusq8RbmuAlaNUjKgUiXiLKRmcSOznQ=
X-Google-Smtp-Source: ABdhPJyK1Ikp7FmH22FAbDzu7LTeNSOnezyzGrVUMdbfflopelJapkZyn4fu5fBlqoX6fbgY5cBhmtckYUjLFOX6Ym0=
X-Received: by 2002:a17:906:658:: with SMTP id t24mr5945286ejb.358.1632416035665;
 Thu, 23 Sep 2021 09:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sebastian Eifert <eifert@gmail.com>
Date: Thu, 23 Sep 2021 18:53:45 +0200
Message-ID: <CAOZgwEd7NDkGEpdF6UQTcbYuupDavaHBoj4WwTy3Qe4Bqm6V0g@mail.gmail.com>
Subject: Bonnie++ failure with ntfs3
To: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm currently trying out ntfs3 (v27 from the mailing list, 5.15-rc2,
and current master from the Paragon github repo) with the good old
Bonnie++ benchmark (1.04), and I'm seeing a hard failure:

<console>
/mnt/ntfs4gb # bonnie\+\+ -u root -s 64 -r 32
Using uid:0, gid:0.
Writing with putc()...done
Writing intelligently...done
Rewriting...done
Reading with getc()...done
Reading intelligently...done
start 'em...done...done...done...
Create files in sequential order...done.
Stat files in sequential order...done.
Delete files in sequential order...
Bonnie: drastic I/O error (rmdir): Directory not empty
Cleaning up test directory after error.
</console>

Environment is an AARCH64 embedded platform, with a 4GB NTFS image
file mounted via a loopback device.

Could someone try Bonnie++ on a different setup and confirm/reject my result?

I hacked around in Bonnie a bit, and it turns out that the directory
traversal with opendir/readdir is not enumerating all files that were
created just before. Running the default 1024 test files, I'm seeing
~20 files not enumerating. Adding a sleep before opendir/readdir does
not change the result. However, doing a second opendir/readdir
enumeration immediately after the first *will* enumerate all files.

Thanks,
Sebastian
