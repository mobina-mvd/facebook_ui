import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/widgets/widgets.dart';

class MorOptionsList extends StatelessWidget {
  final User currentUser;

  const MorOptionsList({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<List> moreOptionsList = [
      [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
      [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
      [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
      [MdiIcons.flag, Colors.orange, 'Pages'],
      [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
      [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
      [MdiIcons.calendarStar, Colors.red, 'Events'],
    ];

    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      child: ListView.builder(
        itemCount: 1 + moreOptionsList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: UserCard(user: currentUser),
            );
          }
          final option = moreOptionsList[index - 1];
          return _Option(
            icon: option[0],
            color: option[1],
            label: option[2],
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _Option({
    Key? key,
    required this.icon,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        size: 38,
        color: color,
      ),
      label: Flexible(
        child: Text(
          label,
          style: const TextStyle(fontSize: 16),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
