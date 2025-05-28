import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneaks_view/data/model/Sneaker.dart';
import 'package:sneaks_view/widgets/animation.dart';
import 'package:sneaks_view/widgets/blur_container.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(tag: product.image, child: Image.asset(product.image)),
              Positioned(
                bottom: 10,
                left: 10,
                child: FadeInItem(
                  delay: const Duration(milliseconds: 300),
                  child: BlurContainer(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white.withOpacity(0.1)),
                      width: 160,
                      height: 40,
                      child: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70, fontSize: 14)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          FadeInItem(
            delay: const Duration(milliseconds: 800),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(product.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
          SizedBox(height: 10),
          FadeInItem(
            delay: const Duration(milliseconds: 1000),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Manufactured in : ${product.country}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInItem(delay: const Duration(milliseconds: 1500), child: _InfoTile(title: "3d 5h 23m", subtitle: "remaining time discount")),
                FadeInItem(
                  delay: const Duration(milliseconds: 2000),
                  child: _InfoTile(title: "\$ ${product.discountedPrice}", subtitle: "current price"),
                ),
                FadeInItem(
                  delay: const Duration(milliseconds: 2200),
                  child: _InfoTile(title: "\$ ${product.originalPrice}", subtitle: "original price"),
                ),
              ],
            ),
          ),
          const Spacer(),
          FadeInItem(
            delay: const Duration(milliseconds: 2200),
            child: Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff3000ff)),
              child: Text('Place Bid', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InfoTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 5),
        Text(subtitle, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)),
      ],
    );
  }
}
