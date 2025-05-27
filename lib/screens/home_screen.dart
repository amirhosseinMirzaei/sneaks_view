import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneaks_view/widgets/image_list.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xff010101),
    body: Stack(
      children: [
        Positioned.fill(child: SingleChildScrollView(child: Column(children: [SizedBox(height: 30,),ImageListView(startIndex: 1,duration: 25,)],),))
      ],
    ),
  );
  }

}