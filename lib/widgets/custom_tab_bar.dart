import 'package:facebook_ui/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onTap;
  final int selectedIndex;
  final bool isBottomIndicator;

  const CustomTabBar({
    Key? key,
    required this.icons,
    required this.onTap,
    required this.selectedIndex,
    this.isBottomIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        border: isBottomIndicator
            ? const Border(
                bottom: BorderSide(
                  color: Palette.facebookBlue,
                  width: 3,
                ),
              )
            : const Border(
                top: BorderSide(
                  color: Palette.facebookBlue,
                  width: 3,
                ),
              ),
      ),
      tabs: icons
          .asMap()
          .map(
            (index, icon) => MapEntry(
              index,
              Tab(
                icon: Icon(
                  icon,
                  color: index == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black54,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
