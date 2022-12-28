import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:untitled1/Screens/Authontication/first_page.dart';

import '../../Page All/Home Page/home_page.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  Future<void> goToHome() async {
    final prefes = await SharedPreferences.getInstance();
    String token = prefes.getString('token')!;
    if (token.isEmptyOrNull) {
      await Future.delayed(const Duration(seconds: 3))
          .then((value) => const FirstPage().launch(context));
    } else {
      await Future.delayed(const Duration(seconds: 3))
          .then((value) => const HomePage().launch(context));
    }
  }

  @override
  void initState() {
    goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/screen.png'),
        )),
      ),
    );
  }
}
