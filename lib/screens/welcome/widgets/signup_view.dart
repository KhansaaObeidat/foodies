import 'package:flutter/material.dart';

import '../../signup/signup_screen.dart';

Future<Widget> showSignView(BuildContext context) async {
  return await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return  const SignUpScreen();
    },
  );
}
