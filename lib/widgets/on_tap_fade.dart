import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnTapFade extends StatelessWidget {
  const OnTapFade({super.key, required this.child, this.onTap});
  final Widget child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ValueBuilder<bool?>(
      builder: (tappedDown, updateFn) {
        return GestureDetector(
          onTapDown: (tapDetails) {
            updateFn(true);
          },
          onTapUp: (tapDetails) async {
            await Future.delayed(const Duration(milliseconds: 100));
            updateFn(false);
          },
          onPanStart: (tapDetails) {
            updateFn(true);
          },
          onPanEnd: (tapDetails) async {
            await Future.delayed(const Duration(milliseconds: 100));
            updateFn(false);
          },
          onPanCancel: () async {
            await Future.delayed(const Duration(milliseconds: 100));
            updateFn(false);
          },
          onTap: onTap,
          child: Opacity(
            opacity: tappedDown! ? .5 : 1,
            child: child,
          ),
        );
      },
      initialValue: false,
    );
  }
}
