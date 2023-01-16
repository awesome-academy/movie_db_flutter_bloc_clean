// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '/src/presentation/main/animated_tab_bar.dart';
import 'main_tab_model.dart';

class MainPgae extends StatefulWidget {
  const MainPgae({super.key});

  @override
  State<MainPgae> createState() => _MainPgaeState();
}

class _MainPgaeState extends State<MainPgae>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    const int tabBarLength = 4;
    _tabController = TabController(length: tabBarLength, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: AnimatedTabBar(
          tabs: mainTabs(context),
          tabController: _tabController,
        ),
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: mainViews(context),
          ),
        ),
      );
}
