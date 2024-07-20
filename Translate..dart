import 'package:flutter/material.dart';

class TranslateAnimationExample extends StatefulWidget {
  @override
  _TranslateAnimationExampleState createState() =>
      _TranslateAnimationExampleState();
}

class _TranslateAnimationExampleState extends State<TranslateAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.5, 0.0), // Move 1.5 times the width to the right
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translate Animation Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlideTransition(
              position: _animation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: _startAnimation,
              child: Text('Start Animation'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TranslateAnimationExample(),
  ));
}
