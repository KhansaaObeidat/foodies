import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodes/screens/home/home_screen.dart';
import 'package:foodes/screens/signup/signup_bloc.dart';

import '../../utils/shared_widget/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final bloc = SignUpBloc();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
            height: 750,
            width: 375,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 20, right: 20),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        color: Color(0xffd6001b),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 20, right: 20, bottom: 30),
                  child: const SizedBox(
                      height: 35,
                      width: 335,
                      child: Text(
                          "Register with  airtel account number, to start your account !",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                ),
                Center(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Column(
                      children: [
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
                            hintText: "Enter your Full Name",
                            maxLength: 50,
                            onSubmitted: (value) {
                              bloc.validatefullname();
                              setState(() {});
                            },
                            controller: bloc.fullNameController),
                        bloc.checkfullname
                            ? const Text("the full name is very long",
                                style: TextStyle(color: Colors.red))
                            : Container(),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            hintText: "Enter your e_mail",
                            keyboardType: TextInputType.emailAddress,
                            onSubmitted: (value) {
                              bloc.validateemail();
                              setState(() {});
                            },
                            controller: bloc.emailController),
                        bloc.checkemail
                            ? const Text(
                                "the E_mail is not valid",
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
                            if (bloc.repasswordController.text.isNotEmpty) {
                              bloc.passwordmatch();
                              setState(() {});
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            hintText: "Enter Your re_Password",
                            obscureText: !bloc.repasswordShown,
                            onSubmitted: (value) {
                              bloc.passwordmatch();
                              setState(() {});
                            },
                            suffixIcon: InkWell(
                              child: Icon(bloc.repasswordShown
                                  ? Icons.remove_red_eye
                                  : Icons.security),
                              onTap: () {
                                bloc.repasswordShown = !bloc.repasswordShown;
                                setState(() {});
                              },
                            ),
                            controller: bloc.repasswordController),
                        bloc.checkpassword
                            ? const Text(
                                "the password is not matched",
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              bloc.isCheckBoxChecked = !bloc.isCheckBoxChecked;
                              setState(() {});
                            },
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Image.asset(bloc.isCheckBoxChecked
                                    ? "assets/check2.png"
                                    : "assets/check1.png"),
                                const SizedBox(width: 5),
                                const Text("Terms & conditions",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(400, 50),
                              // ignore: deprecated_member_use
                              primary: const Color.fromARGB(255, 197, 11, 11),
                            ),
                            onPressed: bloc.fieldValidation()
                                ? () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (ctx) {
                                      return  HomeScreen();
                                    }));
                                  }
                                : null,
                            child: const Text("SIGN UP")),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
