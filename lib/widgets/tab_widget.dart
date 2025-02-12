import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    super.key,
    required this.pages,
    required this.titles,
  });

  final List<Widget> pages;
  final List<String> titles;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 44,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBar(
            controller: _tabController,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2,
                color: AppColors.accent,
              ),
            ),
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            tabs: List.generate(
              widget.titles.length,
              (index) {
                return _Tab(
                  widget.titles[index],
                  _selectedIndex == index,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.pages,
          ),
        ),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab(
    this.title,
    this.active,
  );

  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: TextStyle(
          color: active ? Colors.white : const Color(0xff7E8082),
          fontSize: 18,
          fontFamily: 'w700',
        ),
      ),
    );
  }
}
