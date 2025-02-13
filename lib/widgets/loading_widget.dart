import 'dart:async';

import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    super.key,
    required this.active,
  });

  final bool active;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  int _index = 0;
  late Timer timer;

  final List<List<double>> _positions = [
    [20, 0],
    [34, 6],
    [40, 20],
    [34, 34],
    [20, 40],
    [6, 34],
    [0, 20],
    [6, 6]
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        if (widget.active && mounted) {
          setState(() {
            _index == 7 ? _index = 0 : _index++;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 48,
        width: 48,
        child: Stack(
          children: List.generate(8, (index) {
            return _Indicator(
              index == _index,
              _positions[index][0],
              _positions[index][1],
            );
          }),
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator(this.active, this.top, this.right);

  final bool active;
  final double top;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 0),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active ? const Color(0xff202327) : AppColors.accent,
        ),
      ),
    );
  }
}
