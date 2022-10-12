import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'language_screen.dart';

Future<Widget> showLanguage(BuildContext context)async{
  return await showModalBottomSheet(context: context,backgroundColor: Colors.transparent, builder: (context){
return const LanguageScreen();
  });
}