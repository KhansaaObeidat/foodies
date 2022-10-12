import 'package:flutter/material.dart';

import 'forgetpassword.dart';

Future<Widget> showForgetPassword(BuildContext context) async {
  return await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return const ForgetPassword();
      });
}
