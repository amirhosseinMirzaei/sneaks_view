import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneaks_view/widgets/blur_container.dart';

class DetailScreen extends StatelessWidget {
  final String image;

  const DetailScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(tag: image, child: Image.asset(image)),
              Positioned(
                bottom: 10,
                left: 10,
                child: BlurContainer(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white.withOpacity(0.1)),
                    width: 160,
                    height: 40,
                    child: Text("Nike shoes", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70, fontSize: 14)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
