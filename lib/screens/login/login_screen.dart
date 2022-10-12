import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodes/screens/login/login_bloc.dart';

import '../../utils/shared_widget/custom_text_field.dart';
import '../home/home_screen.dart';
import 'forgetpasswordview.dart';

class LoginInScreen extends StatefulWidget {
  const LoginInScreen({super.key});

  @override
  State<LoginInScreen> createState() => _LoginInScreenState();
}

class _LoginInScreenState extends State<LoginInScreen> {
  final bloc = LoginInbloc();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
                height: 423,
                width: 375,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 30, left: 16.0, bottom: 8),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color(0xffD6001B),
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Lets go started",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      Center(
                        child: Column(children: [
                          CustomTextField(
                              hintText: "Mobile Number",
                              maxLength: 10,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onSubmitted: (value) {
                                bloc.validatemobilenumber();
                                setState(() {});
                              },
                              keyboardType: TextInputType.phone,
                              controller: bloc.mobileController),
                          bloc.checkmobilenumber
                              ? const Text(
                                  "mobile number is not valid",
                                  style: TextStyle(color: Colors.red),
                                )
                              : Container(),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            hintText: "Enter Your Password",
                            obscureText: !bloc.passwordShown,
                            suffixIcon: InkWell(
                              child: Icon(bloc.passwordShown
                                  ? Icons.remove_red_eye
                                  : Icons.security),
                              onTap: () {
                                bloc.passwordShown = !bloc.passwordShown;
                                setState(() {});
                              },
                            ),
                            controller: bloc.passwordController,
                            onSubmitted: (value) {
                             {
                              
                                setState(() {});
                              }
                            },
                          ),
                         
                          Row(
                            children: [
                              Expanded(child: Container()),
                              TextButton(
                              
                                  onPressed: () {
                                    Navigator.of(context).pop(); 
                                     showForgetPassword(context);},
                                  child: const Text("Forget Password?",style: TextStyle(),)),
                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(400, 50),
                                // ignore: deprecated_member_use
                                primary:
                                    const Color.fromARGB(255, 197, 11, 11),
                              ),
                              onPressed: bloc.fieldValidation()
                                  ? () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (ctx) {
                                        return  HomeScreen();
                                      }),
                                      (route)=>false);
                                    }
                                  : null,
                              child: const Text("LOG IN")),
                        ]),
                      ),
                    ]))));
  }
}
