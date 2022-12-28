import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:untitled1/Constant%20Data/app_color.dart';
import 'package:untitled1/Repository/auth_repo.dart';
import 'package:untitled1/Screens/Authontication/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailAddressController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _SignUpState extends State<SignUp> {
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
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: darkColor,
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  padding: const EdgeInsets.only(top: 28),
                  child: const Text(
                    'Hello! Register to get started',
                    style: TextStyle(
                        color: darkColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: greyColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: borderColor)),
                      hintText: 'Enter your Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.PHONE,
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      fillColor: greyColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: borderColor)),
                      hintText: 'Enter your Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
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
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: borderColor)),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.PASSWORD,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      fillColor: greyColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: borderColor)),
                      hintText: 'Re-Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: (() async {
                      // if(emailAddressController.text.trim().isEmpty)return  toast('Please Enter Your Email');
                      if (emailAddressController.text.isEmpty) {
                        toast('Please Enter Your Email');
                      } else if (nameController.text.isEmpty) {
                        toast('Please Enter Your Name');
                      } else if (phoneNumberController.text.isEmpty) {
                        toast('Please Enter Your Phone Number');
                      } else if (passwordController.text.isEmpty) {
                        toast('Please Enter Your Password');
                      } else if (passwordController.text.length < 6) {
                        toast('Should be at lest 6 digit');
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        toast('Password did\'t match');
                      } else {
                        try {
                          EasyLoading.show(status: 'Signing Up...');
                          bool status = await AuthRepo().signUpWithEmail(
                              nameController.text,
                              emailAddressController.text,
                              phoneNumberController.text,
                              passwordController.text);
                          if (status) {
                            EasyLoading.showSuccess('Sign Up Successful');
                            SignIn().launch(context);
                          } else {
                            EasyLoading.showError(
                                'Something Went Wrong, Try Again');
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
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    width: 138,
                    color: borderColor,
                    height: 2,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Or Register with',
                    style: GoogleFonts.urbanist(
                        color: darkGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
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
                      child: const FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(
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
                      child: const Image(
                        image: AssetImage('images/google.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      height: 56,
                      width: 105,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: greyColor, width: 2.0)),
                      child: const Icon(
                        Icons.apple,
                        size: 38,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    const Text(
                      'LogIn Now',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ).onTap(() => const SignIn().launch(context))
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
