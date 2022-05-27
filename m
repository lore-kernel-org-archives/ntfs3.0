Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68561FA5
	for <ntfs3@lists.linux.dev>; Fri, 27 May 2022 16:07:41 +0000 (UTC)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 54528336CD;
	Fri, 27 May 2022 16:07:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id 39B3D32;
	Fri, 27 May 2022 16:07:33 +0000 (UTC)
Message-ID: <94dd870e498e89e0998dee4dd0dbaaa4b4497929.camel@perches.com>
Subject: Re: [PATCH 1/3] fs/ntfs3: Refactoring of indx_find function
From: Joe Perches <joe@perches.com>
To: Almaz Alexandrovich <almaz.alexandrovich@paragon-software.com>, 
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Date: Fri, 27 May 2022 09:07:30 -0700
In-Reply-To: <0f9648cc-66af-077c-88e6-8650fd78f44c@paragon-software.com>
References: <75a1215a-eda2-d0dc-b962-0334356eef7c@paragon-software.com>
	 <0f9648cc-66af-077c-88e6-8650fd78f44c@paragon-software.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: dckefw6kzm5u1pwrkyhcm45kktryhqqf
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 39B3D32
X-Spam-Status: No, score=-4.74
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19VwBNuG8zVMoN9lOhktdWQ7gt5m/9IoJY=
X-HE-Tag: 1653667653-438087

On Fri, 2022-05-27 at 17:21 +0300, Almaz Alexandrovich wrote:
> This commit makes function a bit more readable

trivia:

> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
[]
> @@ -1042,19 +1042,16 @@ int indx_find(struct ntfs_index *indx, struct ntf=
s_inode *ni,
>   {
>   	int err;
>   	struct NTFS_DE *e;
> -	const struct INDEX_HDR *hdr;
>   	struct indx_node *node;
>  =20
>   	if (!root)
>   		root =3D indx_get_root(&ni->dir, ni, NULL, NULL);
>  =20
>   	if (!root) {
> -		err =3D -EINVAL;
> -		goto out;
> +		/* Should not happed. */
> +		return -EINVAL;

s/happed/happen/

>   	for (;;) {
>   		node =3D NULL;
>   		if (*diff >=3D 0 || !de_has_vcn_ex(e)) {
>   			*entry =3D e;
> -			goto out;
> +			return 0;
>   		}

might be nicer with a break; or a while like

	while (*diff < 0 && de_has_vcn_ex(e)) {
		node =3D NULL;


>   		/* Read next level. */
>   		err =3D indx_read(indx, ni, de_get_vbn(e), &node);
>   		if (err)
> -			goto out;
> +			return err;
>  =20
>   		/* Lookup entry that is <=3D to the search value. */
>   		e =3D hdr_find_e(indx, &node->index->ihdr, key, key_len, ctx,
>   			       diff);
>   		if (!e) {
> -			err =3D -EINVAL;
>   			put_indx_node(node);
> -			goto out;
> +			return -EINVAL;
>   		}
>  =20
>   		fnd_push(fnd, node, e);
>   	}
> -
> -out:
> -	return err;

and a return 0;

or
	*entry =3D e;
	return 0;

so it appears that the function has a typical return value.

