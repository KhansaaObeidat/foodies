import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(top: 50.0, left: 20, right: 20),
            child: Text(
              " Select Language",
              style: TextStyle(
                  color: Color(0xffd6001b),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(

mainAxisAlignment: MainAxisAlignment.center,            children: [
              
                languageView("assets/tamil.png", "English"),
               const SizedBox(width: 100,),
                languageView("assets/ara.png", "arabic"),
              ],
            ),
          ),
        ]));
  }
}

Widget languageView(image, text) {
  return Column(
    children: [Image.asset(image), Text(text)],
  );
}
