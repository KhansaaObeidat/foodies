import 'package:flutter/material.dart';

class WelcomeLogoView extends StatelessWidget {
  const WelcomeLogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Image.asset("assets/logo.png"),
        const SizedBox(
          height: 100,
        ),
        const Text(
          "Welcome",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text("Enjoy the worlds fastest and best network",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            )),
      ],
    );
  }
}
