import 'package:flutter/material.dart';
import 'text_section.dart';
import 'image_banner.dart';


class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageBanner("assets/images/bg1.jpeg"),
          TextSection("Lean and Focused", "We cover the key concepts and widgets you need to learn to get productive. We skip the not-so-useful stuff."),
          TextSection("End-to-End", "Learn how to write Flutter apps step by step. No over simplified examples, only production quality, realistic code."),
          TextSection("Taught by a Flutter Developer", "All the tips and tricks learned from developing Flutter apps since 2017 are incorported into each course module."),
        ]
      )
    );
  }
}
