import 'package:flutter/material.dart';

import 'widgets/loaders/sliding_dot_loader.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Uiverse")),
      body: const Center(
        child: SlidingDotLoader(),
      ),
    );
  }
}
