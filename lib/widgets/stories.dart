import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:facebook_ui/models/models.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        itemCount: 1 + stories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _StoryCard(story: story),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  const _StoryCard({
    Key? key,
    this.isAddStory = false,
    this.currentUser,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          // child: CachedNetworkImage(
          //   imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
          //   height: double.infinity,
          //   width: 110,
          //   fit: BoxFit.cover,
          //   errorWidget: (context, url, error) {
          //     return Container(
          //       color: Colors.grey.shade200,
          //     );
          //   },
          // ),
          child: Container(
            height: double.infinity,
            width: 110,
            color: Colors.grey.shade200,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: Palette.storyGradient,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: isAddStory
              ? GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Palette.facebookBlue,
                      size: 30,
                    ),
                  ),
                )
              : ProfileAvatar(
                  hasBorder: !story!.isViewed,
                  imageUrl: story!.user.imageUrl,
                ),
        ),
        Positioned(
          left: 8,
          right: 8,
          bottom: 8,
          child: Text(
            isAddStory ? 'Add To Story' : story!.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
