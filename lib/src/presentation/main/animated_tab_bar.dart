import 'package:flutter/material.dart';
import 'package:movie_db_flutter_bloc_clean/src/core/utils/extensions/dimension.dart';
import 'package:movie_db_flutter_bloc_clean/src/core/utils/gen/colors.gen.dart';

import 'main_tab_model.dart';

class AnimatedTabBar extends StatefulWidget {
  const AnimatedTabBar({
    required this.tabs,
    required this.tabController,
    super.key,
  });

  final List<TabModel> tabs;
  final TabController tabController;

  @override
  State<AnimatedTabBar> createState() => _AnimatedTabBarState();
}

class _AnimatedTabBarState extends State<AnimatedTabBar> {
  final tabBarHeight = 60.0;
  int tabIndex = 0;
  final animationDuration = const Duration(milliseconds: 300);
  final curve = 0;
  final animatedCurve = Curves.linear;

  @override
  void initState() {
    widget.tabController.addListener(() {
      setState(() {
        tabIndex = widget.tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthTabbar = Dimensions.screenWidth(context) * 0.9;
    final paddingTabbar = Dimensions.screenWidth(context) * 0.05;
    return Padding(
      padding: EdgeInsets.all(paddingTabbar),
      child: Container(
        decoration: BoxDecoration(
          color: ColorName.tabbarColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              bottom: 12,
              left: (widthTabbar / 4) * tabIndex,
              duration: animationDuration,
              child: Container(
                width: widthTabbar / 4,
                child: Center(
                  child: Text(
                    '${widget.tabs[tabIndex].text}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: ColorName.tabbarTextColorEnable,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: widget.tabs
                  .asMap()
                  .entries
                  .map((entrie) => buildItem(
                        index: entrie.key,
                        tab: entrie.value,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem({required int index, required TabModel tab}) {
    final isActive = index == tabIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.tabController.animateTo(index);
        },
        child: Container(
          color: Colors.transparent,
          height: tabBarHeight,
          child: AnimatedSlide(
            offset: Offset(0, isActive ? -0.15 : 0),
            duration: animationDuration,
            child: Icon(
              tab.iconData,
              color: isActive
                  ? ColorName.primary
                  : ColorName.tabbarTextColorDisable,
            ),
          ),
        ),
      ),
    );
  }
}
