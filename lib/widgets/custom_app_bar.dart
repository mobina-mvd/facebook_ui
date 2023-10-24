import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:facebook_ui/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final List<IconData> icons;
  final User currentUser;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({
    Key? key,
    required this.icons,
    required this.currentUser,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'FaceBook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(
              icons: icons,
              onTap: onTap,
              selectedIndex: selectedIndex,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user: currentUser),
              const SizedBox(width: 12),
              CircleButton(
                icon: Icons.search,
                iconSize: 30,
                onPressed: () {},
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30,
                onPressed: () {},
              )
            ],
          ))
        ],
      ),
    );
  }
}
