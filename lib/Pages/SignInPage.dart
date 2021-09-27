import 'package:ecommerce/Pages/TextInputWidget.dart';
import 'package:ecommerce/Pages/routes.dart';
import 'package:ecommerce/widgets/themes.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool checkValue = false;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Sign Up",
              style: MyTheme.headingStyleLeft,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextInputWidget(
                        iconName: Icon(Icons.account_circle_outlined),
                        hintText: "Enter Your First Name",
                        labelText: "FirstName",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "First Name Cannot be Empty";
                          } else if (value.length < 3) {
                            return "First Name sholud be greater than 3";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextInputWidget(
                        iconName: Icon(Icons.account_circle_outlined),
                        hintText: "Enter Your Last Name",
                        labelText: "LastName",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Last Name Cannot be Empty";
                          } else if (value.length < 3) {
                            return "Last Name sholud be greater than 3";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextInputWidget(
                        iconName: Icon(Icons.contact_mail),
                        hintText: "Enter Your Email Name",
                        labelText: "Email",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email Cannot be Empty";
                          } else if (value.length < 10) {
                            return "First Name sholud be greater than 10";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextInputWidget(
                        iconName: Icon(Icons.lock),
                        hintText: "Enter Your Password",
                        labelText: "Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Cannot be Empty";
                          } else if (value.length < 6) {
                            return "Password Length sholud be greater than 6";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextInputWidget(
                        iconName: Icon(Icons.lock),
                        hintText: "Enter Your Password (Again)",
                        labelText: "Password(Again)",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Cannot be Empty";
                          } else if (value.length < 6) {
                            return "Password Length sholud be greater than 6";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Checkbox(
                        value: this.checkValue,
                        onChanged: (bool? value) {
                          setState(() {
                            this.checkValue = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 19),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: "By Signing Up You Will Accept The "),
                              TextSpan(
                                  text: "Terms and Condition ",
                                  style: MyTheme.giveGreenAccentColor),
                              TextSpan(text: "and "),
                              TextSpan(
                                  text: "Privacy Policy ",
                                  style: MyTheme.giveGreenAccentColor),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => moveToHome(context),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(24)),
                    width: 120,
                    height: 50,
                    child: Center(
                        child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  moveToHome(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }
}
