import 'package:flutter/cupertino.dart';

class SignUpBloc {
  TextEditingController mobileController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  bool isCheckBoxChecked = false;
  bool passwordShown=false;
  bool repasswordShown=false;
  bool checkmobilenumber =false;
  bool checkemail =false;
  bool checkpassword=false;
  bool checkfullname=false;
  bool fieldValidation() {

//   if(mobileController.text.isEmpty){
//     return false;
//   }else if(fullNameController.text.isEmpty){
// return false;
//   }else if(passwordController.text.isEmpty){
//     return false;
//   } else if(repasswordController.text.isEmpty){
//     return false;
//   }else if(isCheckBoxChecked==false){
//   return isCheckBoxChecked;
// }else{
//   return true;
// }
// if(mobileController.text.isEmpty||fullNameController.text.isEmpty||passwordController.text.isEmpty||repasswordController.text.isEmpty||!isCheckBoxChecked){
//   return false;

// }else{
//   return true;
// }

    return (mobileController.text.isNotEmpty &&
        fullNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        repasswordController.text.isNotEmpty &&
        _checkPassword()&&
        isCheckBoxChecked);
  }
  bool _checkPassword(){
    return  passwordController.text==repasswordController.text;
  }
   void validatemobilenumber(){
    if (mobileController.text.length<10){
 checkmobilenumber= true;
    }else{
       checkmobilenumber=false;
    }
 
  }
void validatefullname(){
  if(fullNameController.text.length<50){
    checkfullname=false;
  }else{
    checkfullname=true;
  }
}

  void validateemail(){
   bool emailvalidate= RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(emailController.text);
  if(emailvalidate){
    checkemail=false;
  }else{
    checkemail=true;
  }
  }
 void passwordmatch(){
  if(passwordController.text==repasswordController.text){
    checkpassword=false;
  }else{
    checkpassword=true;
  }
 }
 mobilenumber(){
if(mobileController.text.length<10){
return false;
}else{
  return true;
}
}
  mobilevalidate(){
  return(mobileController.text.isNotEmpty&&mobilenumber());
 }
}
