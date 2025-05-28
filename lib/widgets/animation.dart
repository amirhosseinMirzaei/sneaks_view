import 'package:flutter/cupertino.dart';

class FadeInItem extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const FadeInItem({super.key, required this.child, required this.delay});

  @override
  State<FadeInItem> createState() => _FadeInItemState();
}

class _FadeInItemState extends State<FadeInItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
