import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:untitled1/Constant%20Data/app_color.dart';
import 'package:untitled1/Screens/Authontication/sign_in.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({Key? key}) : super(key: key);

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  child: Image(image: AssetImage('images/complet.jpg'))),
              SizedBox(
                height: 35,
              ),
              Container(
                  child: Text(
                'Password Changed!',
                style: TextStyle(
                    color: darkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
              SizedBox(
                height: 8,
              ),
              Container(
                  child: Text(
                'Your password has been changed successfully.',
                style: TextStyle(color: darkGreyColor, fontSize: 15),
              )),
              SizedBox(
                height: 59,
              ),
              Container(
                height: 56,
                width: 386,
                decoration: BoxDecoration(
                    color: darkColor, borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                    onTap: (() => SignIn().launch(context)),
                    child: Center(
                      child: const Text(
                        'Back to Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
