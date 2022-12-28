import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:untitled1/Constant%20Data/app_color.dart';
import 'package:untitled1/Page%20All/password_change.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: darkColor,
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 300,
                  child: Text(
                    'Create new password',
                    style: TextStyle(
                        color: darkColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                'Your new password must be unique from those previously used.',
                style: TextStyle(color: darkGreyColor, fontSize: 16),
              )),
              SizedBox(
                height: 32,
              ),
              AppTextField(
                textFieldType: TextFieldType.PASSWORD,
                decoration: InputDecoration(
                  fillColor: greyColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: borderColor)),
                  hintText: 'New Password',
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              AppTextField(
                textFieldType: TextFieldType.PASSWORD,
                decoration: InputDecoration(
                  fillColor: greyColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: borderColor)),
                  hintText: 'Confirm password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 56,
                width: 386,
                decoration: BoxDecoration(
                    color: darkColor, borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                    onTap: (() => const PasswordChange().launch(context)),
                    child: Center(
                      child: const Text(
                        'Reset Password',
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
