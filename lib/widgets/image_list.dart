import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';

class ImageListView extends StatefulWidget {
  const ImageListView({super.key, required this.startIndex, this.duration = 0});

  final int startIndex;
  final int duration;

  @override
  State<ImageListView> createState() => _State();
}

class _State extends State<ImageListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        _autoScroll();
      }
    });
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  _autoScroll() {
    final _currentScrollPosition = _scrollController.offset;
    final _endScrollPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
        _currentScrollPosition == _endScrollPosition ? 0 : _endScrollPosition,
        duration: Duration(seconds: widget.duration),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        height: 130,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return _ImageTile(image: 'asset/img/${widget.startIndex + index}.PNG');
          },
        ),
      ),
    );
  }
}

class _ImageTile extends StatelessWidget {
  final String image;

  const _ImageTile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(image: image))),
      child: Hero(tag: image, child: Image.asset(image, width: 130)),
    );
  }
}
