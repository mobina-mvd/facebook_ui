import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:facebook_ui/models/user_model.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    super.key,
    required this.onlineUsers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        itemCount: 1 + onlineUsers.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _CreateRoomButton(
              onPressed: () {},
            );
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  final Function() onPressed;

  const _CreateRoomButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStatePropertyAll(
          BorderSide(
            width: 3,
            color: Colors.blueAccent.shade100,
          ),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          const Text(
            'Create\nRoom',
            style: TextStyle(
              color: Palette.facebookBlue,
            ),
          ),
        ],
      ),
    );
  }
}
