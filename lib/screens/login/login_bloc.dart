import 'package:flutter/material.dart';

class LoginInbloc
{
TextEditingController mobileController = TextEditingController();
TextEditingController passwordController = TextEditingController();
 bool checkmobilenumber =false;
 bool checkpassword=false;
  bool passwordShown=false;


void validatemobilenumber(){
    if (mobileController.text.length<10){
 checkmobilenumber= true;
    }else{
       checkmobilenumber=false;
    }
}
bool fieldValidation() {
return(mobileController.text.isNotEmpty&&passwordController.text.isNotEmpty);
}

}