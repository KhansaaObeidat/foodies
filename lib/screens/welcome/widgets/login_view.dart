
import 'package:flutter/material.dart';
import 'package:foodes/screens/login/login_screen.dart';

Future<Widget> showLoginInView(BuildContext context) async {

 return await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return  const LoginInScreen();
    },
  );}

