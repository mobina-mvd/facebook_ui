import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/models/models.dart';

import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    super.key,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      // shape: isDesktop
      //     ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      //     : null,
      child: ClipRRect(
        borderRadius:
            isDesktop ? BorderRadius.circular(10) : BorderRadius.circular(0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  ProfileAvatar(imageUrl: currentUser.imageUrl),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'What\'s on your mind?',
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 10,
                thickness: .5,
              ),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Icon(
                            Icons.videocam,
                            color: Colors.red,
                          ),
                          SizedBox(width: 6),
                          Text('Live'),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Icon(
                            Icons.photo_library,
                            color: Colors.green,
                          ),
                          SizedBox(width: 6),
                          Text('Photo'),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Icon(
                            Icons.video_call,
                            color: Colors.purpleAccent,
                          ),
                          SizedBox(width: 6),
                          Text('Room'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
