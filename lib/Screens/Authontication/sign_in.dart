import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:untitled1/Constant%20Data/app_color.dart';
import 'package:untitled1/Screens/Authontication/sign_up.dart';

import '../../Page All/Home Page/home_page.dart';
import '../../Page All/forget_password.dart';
import '../../Repository/auth_repo.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
                height: 41,
                width: 41,
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor, width: 2),
                    borderRadius: BorderRadius.circular(14)),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: darkColor,
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 300,
                    child: const Text(
                      'Welcome back! Glad to see you, Again!',
                      style: TextStyle(
                          color: darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                const SizedBox(
                  height: 32,
                ),
                AppTextField(
                  textFieldType: TextFieldType.EMAIL,
                  controller: emailAddressController,
                  decoration: InputDecoration(
                    fillColor: greyColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: borderColor)),
                    hintText: 'Enter your email',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  textFieldType: TextFieldType.PASSWORD,
                  controller: passwordController,
                  decoration: InputDecoration(
                    fillColor: greyColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: borderColor)),
                    hintText: 'Enter your password',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (() => const ForgotPassword().launch(context)),
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: darkGreyColor, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: (() async {
                    if (emailAddressController.text.isEmpty) {
                      toast('Please Enter Your Email');
                    } else if (passwordController.text.isEmpty) {
                      toast('Please Enter Your Password');
                    } else {
                      try {
                        EasyLoading.show(status: 'Signing In...');
                        bool status = await AuthRepo().signInWithEmail(
                            emailAddressController.text,
                            passwordController.text);
                        if (status) {
                          EasyLoading.showSuccess('Sign In Successful');
                          const HomePage().launch(context);
                        } else {
                          EasyLoading.showError('Email or Password is wrong');
                        }
                      } catch (e) {
                        EasyLoading.showError(e.toString());
                      }
                    }
                  }),
                  child: Container(
                    height: 56,
                    width: 386,
                    decoration: BoxDecoration(
                        color: darkColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text(
                      'LogIn',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      width: 138,
                      color: borderColor,
                      height: 2,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Or Login with',
                      style: GoogleFonts.urbanist(
                          color: darkGreyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 138,
                      color: borderColor,
                      height: 2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 56,
                        width: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: greyColor, width: 2.0)),
                        child: FaIcon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 56,
                        width: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: greyColor, width: 2.0)),
                        child: Image(
                          image: AssetImage('images/google.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Container(
                        height: 56,
                        width: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: greyColor, width: 2.0)),
                        child: Icon(
                          Icons.apple,
                          size: 37,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 155,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    const Text(
                      'Register Now',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ).onTap(() => const SignUp().launch(context))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
