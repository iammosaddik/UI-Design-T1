import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:untitled1/Screens/Authontication/sign_in.dart';
import 'package:untitled1/Screens/Authontication/sign_up.dart';

import '../../Constant Data/app_color.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/splash.png'),
              fit: BoxFit.fill,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 350),
                  height: 99.03,
                  width: 141.13,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/branding.png'))),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: (() => const SignIn().launch(context)),
                  child: Container(
                    height: 56,
                    width: 331,
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
                  height: 15,
                ),
                InkWell(
                  onTap: (() => const SignUp().launch(context)),
                  child: Container(
                    height: 56,
                    width: 331,
                    decoration: BoxDecoration(
                        border: Border.all(color: darkGreyColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: const Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Continue as a guest',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
