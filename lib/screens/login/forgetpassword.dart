import 'package:flutter/material.dart';
import 'package:foodes/screens/signup/signup_bloc.dart';
import 'package:foodes/utils/shared_widget/custom_text_field.dart';

import '../home/home_screen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final bloc = SignUpBloc();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 400,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  "Register with  airtel account number, to start your account !",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextField(
                hintText: "Mobile Number",
                maxLength: 10,
                controller: bloc.mobileController,
                onSubmitted: (value) {
                  bloc.validatemobilenumber();
                  setState(() {});
                },
              ),
            ),
            bloc.checkmobilenumber
                ? const Text(
                    "mobile number is not valid",
                    style: TextStyle(color: Colors.red),
                  )
                : Container(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: bloc.mobilevalidate()
                    ? () {
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (ctx) {
                        //   return const HomeScreen();
                        // }));
                        Navigator.of(context).pop();
                      }
                    : null,
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
