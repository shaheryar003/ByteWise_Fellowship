import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Hero(
            tag: "homescreen",
            child: Image.asset(
              "assets/images/img1.png",
              
            )),
      );
  }
}