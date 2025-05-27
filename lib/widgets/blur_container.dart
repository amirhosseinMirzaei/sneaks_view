import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BlurContainer extends StatelessWidget {
  final Widget child;

  const BlurContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(filter: ImageFilter.blur(sigmaY: 10.0, sigmaX: 10.0), child: child),
    );
  }
}
