import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final List<String> tabBarElements;
  final TabController tabController;

  const TabBarWidget(
      {Key? key, required this.tabBarElements, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: this.getList(),
      controller: tabController,
      labelColor: Theme.of(context).colorScheme.tertiary,
      indicatorColor: Theme.of(context).colorScheme.tertiary,
      isScrollable: true,
      labelPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10),
    );
  }

  List<Widget> getList() {
    return tabBarElements.map(
      (tabBarElement) {
        return Tab(
          text: tabBarElement,
        );
      },
    ).toList();
  }
}
