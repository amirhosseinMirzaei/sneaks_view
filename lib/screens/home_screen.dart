import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneaks_view/widgets/image_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010101),
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (rect) {
                  return LinearGradient(colors: [Colors.transparent, Colors.transparent]).createShader(rect);
                },
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    ImageListView(startIndex: 1, duration: 3),
                    SizedBox(height: 10),
                    ImageListView(startIndex: 6, duration: 8),
                    SizedBox(height: 10),
                    ImageListView(startIndex: 11, duration: 15),
                    SizedBox(height: 10),
                    ImageListView(startIndex: 16, duration: 5),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 24,
            right: 24,
            child: Container(
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Sneaker UI Demo", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
                  SizedBox(height: 12),
                  const Text(
                    "Sneaker UI Demo – A Flutter-based sneaker showcase app with a dark theme and neon accents, built to highlight UI design and animation skills.",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70, fontSize: 14, height: 1.2),
                  ),
                  Spacer(),
                  Container(
                    width: 140,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Color(0xff3000ff), borderRadius: BorderRadius.circular(8)),
                    child: Text("Discover", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
