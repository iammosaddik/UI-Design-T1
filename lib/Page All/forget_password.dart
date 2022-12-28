import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:untitled1/Constant%20Data/app_color.dart';
import 'package:untitled1/Screens/Authontication/sign_in.dart';

import 'otp_verification.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: GestureDetector(
            onTap: (() => Navigator.pop(context)),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: darkGreyColor)),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: darkColor,
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.only(top: 28),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: darkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'Don\'t worry! It occurs. Please enter the email address linked with your account.',
              style: TextStyle(color: darkGreyColor, fontSize: 16),
            ),
            SizedBox(
              height: 32,
            ),
            AppTextField(
              textFieldType: TextFieldType.EMAIL,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: greyColor)),
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 56,
              width: 386,
              decoration: BoxDecoration(
                  color: darkColor, borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: (() => const OtpVerification().launch(context)),
                child: Center(
                  child: const Text(
                    'Send Code',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 376,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Remember Password?'),
                const Text(
                  'Login',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ).onTap(() => const SignIn().launch(context))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
