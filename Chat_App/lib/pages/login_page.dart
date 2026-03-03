import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chat_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kPrimaryColor,
                Color(0xff112031), // darker shade of primary color
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Spacer(flex: 3),
                          Hero(
                            tag: 'logo',
                            child: Image.asset(
                              'assets/images/scholar.png',
                              height: 100,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Scholar Chat',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontFamily: 'pacifico',
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                          Spacer(flex: 2),
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Sign in to your account',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 32),
                          CustomFormTextField(
                            onChange: (data) {
                              email = data;
                            },
                            hintText: 'Email Address',
                            icon: Icons.email_outlined,
                            inputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 16),
                          CustomFormTextField(
                            obscureText: true,
                            onChange: (data) {
                              password = data;
                            },
                            hintText: 'Password',
                            icon: Icons.lock_outline,
                            inputType: TextInputType.text,
                          ),
                          SizedBox(height: 32),
                          CustomButton(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                isLoading = true;
                                setState(() {});
                                try {
                                  await loginUser();
                                  Navigator.pushNamed(
                                    context,
                                    ChatPage.id,
                                    arguments: email,
                                  );
                                } on FirebaseAuthException catch (e) {
                                  // 1. اطبع الكود عشان تشوفه بعينك في الـ Console
                                  print("Error Code: ${e.code}");
                                  print(" The error message is: ${e.message}");

                                  // 2. التعديل الجديد: ضيف احتمال invalid-credential
                                  if (e.code == 'user-not-found') {
                                    showSnackBar(
                                      context,
                                      'No user found for that email.',
                                    );
                                  } else if (e.code == 'wrong-password') {
                                    showSnackBar(
                                      context,
                                      'Wrong password provided.',
                                    );
                                  } else if (e.code == 'invalid-credential') {
                                    // هو ده اللي بييجي دلوقتي لما الباسورد يكون غلط أو الإيميل مش موجود
                                    showSnackBar(
                                      context,
                                      'Invalid Email or Password.',
                                    );
                                  }
                                } catch (ex) {
                                  showSnackBar(context, 'There was an error');
                                }
                              }
                              isLoading = false;
                              setState(() {});
                            },
                            title: 'SIGN IN',
                          ),
                          Spacer(flex: 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, RegisterPage.id);
                                },
                                child: Text(
                                  'Register Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
