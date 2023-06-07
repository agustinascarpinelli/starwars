import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  final Widget child;

  const BackgroundPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
