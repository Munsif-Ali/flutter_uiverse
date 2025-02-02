import 'package:flutter/material.dart';

class SlidingSquareLoader extends StatefulWidget {
  const SlidingSquareLoader({super.key});

  @override
  State<SlidingSquareLoader> createState() => _SlidingSquareLoaderState();
}

class _SlidingSquareLoaderState extends State<SlidingSquareLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Cubic(0.23, 1, 0.32, 1),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 20,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0974F1),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x660975F1),
                  blurRadius: 20,
                  offset: Offset.zero,
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                left: _animation.value * 60,
                bottom: 3,
                child: Transform.rotate(
                  angle: _animation.value * 1.5 * 3.14159,
                  child: child,
                ),
              );
            },
            child: Container(
              height: 14,
              width: 14,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
