import 'package:flutter/material.dart';
import 'package:foodes/screens/welcome/welcome_bloc.dart';
import 'package:foodes/screens/welcome/widgets/login_view.dart';
import 'package:foodes/screens/welcome/widgets/signup_view.dart';
import 'package:foodes/screens/welcome/widgets/welcome_logo.dart';

import '../language/languageview.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final bloc = WelcomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6001B),
      body: Center(
        child: Column(children: [
          const WelcomeLogoView(),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, bottom: 20),
            child: InkWell(
              onTap: ()=>showSignView( context),
              child: Container(
                height: 52,
                width: 335,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: const Center(
                    child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: ()=>showLoginInView(context),
            child: Container(
              height: 52,
              width: 335,
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.white)),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Color(0xFFD6001B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("language   ",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
              Container(
                height: 30,
                width: 78,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(106, 64, 64, 64),
                    border: Border.all(style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: InkWell(
                    onTap: ()=>showLanguage(context),

    
                    child: Text(
                      bloc.selectedLanguage = "germany",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
