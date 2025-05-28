import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaks_view/data/model/Sneaker.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';
import '../screens/detail_screen.dart';

class ImageListView extends StatefulWidget {
  const ImageListView({super.key, required this.startIndex, this.duration = 0});

  final int startIndex;
  final int duration;

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          final products = state.products;

          // final visibleProducts = widget.startIndex < products.length ? products.skip(widget.startIndex).take(10).toList() : products;

          return Transform.rotate(
            angle: 1.96 * pi,
            child: SizedBox(
              height: 130,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final product = products[index + widget.startIndex];

                  return _ImageTile(product: product);
                },
              ),
            ),
          );
        } else if (state is ProductError) {
          return Center(child: Text('خطا در بارگذاری: ${state.message}'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _ImageTile extends StatelessWidget {
  final Product product;

  const _ImageTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(product: product))),
      child: Hero(tag: product.image, child: Image.asset(product.image, width: 130, fit: BoxFit.cover)),
    );
  }
}
