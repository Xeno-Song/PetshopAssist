import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WaveDecoratedFloatingActionButton extends StatelessWidget {
  const WaveDecoratedFloatingActionButton({
    super.key,
    this.onPressed,
    this.tooltip,
    this.child,
  });

  final Function? onPressed;
  final String? tooltip;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed?.call(),
      tooltip: tooltip,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.bottomRight,
            // Add SVG image in to flutter
            // https://pub.dev/packages/flutter_svg
            // https://progdev.tistory.com/24
            child: SvgPicture.asset("assets/images/fab_background.svg"),
          ),
          Container(
            alignment: Alignment.center,
            child: child,
          ),
        ],
      ),
    );
  }
}
