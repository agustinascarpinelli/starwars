import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'background_screen.dart';
import 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 800),
                    pageBuilder: (_, __, ___) =>
                        const BackgroundPage(child: SpeciesListScreen()),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo_app.png', // Ruta de la imagen personalizada
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedTextKit(repeatForever: true, animatedTexts: [
                      TypewriterAnimatedText(
                        'Report a species',
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 30),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ])
                  ],
                ),
              ))),
    );
  }
}
