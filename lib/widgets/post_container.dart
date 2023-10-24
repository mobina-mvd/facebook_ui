import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/widgets/widgets.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0, vertical: 5),
      elevation: isDesktop ? 1 : 0,
      // shape: isDesktop
      //     ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      //     : null,
      child: ClipRRect(
        borderRadius:
            isDesktop ? BorderRadius.circular(10) : BorderRadius.circular(0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PostHeader(post: post),
                    Text(post.caption),
                    post.imageUrl != null
                        ? const SizedBox.shrink()
                        : const SizedBox(height: 6),
                  ],
                ),
              ),
              post.imageUrl != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        height: 210,
                        width: double.infinity,
                        color: Colors.grey.shade200,
                      ),
                    )
                  //CachedNetworkImage(imageUrl: post.imageUrl!)
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _PostStats(post: post),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey.shade600,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz_outlined,
          ),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                post.likes.toString(),
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(width: 8),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              label: 'Like',
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey.shade600,
                size: 20,
              ),
              onPressed: () {},
            ),
            _PostButton(
              label: 'Comment',
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey.shade600,
                size: 20,
              ),
              onPressed: () {},
            ),
            _PostButton(
              label: 'Share',
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey.shade600,
                size: 25,
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function() onPressed;

  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          label,
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
