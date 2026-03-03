import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: Colors.grey,
      blur: 1,
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
                            'Create Account',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Sign up to get started',
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
                                  // 1. محاولة إنشاء الحساب
                                  await registerUser();
                                  // 2. لو وصل لهنا يبقى نجح، نعرض رسالة النجاح
                                  showSnackBar(
                                    context,
                                    'Email Created Successfully',
                                  );

                                  // هنا المفروض تنقله للصفحة اللي بعدها (Home أو Chat)
                                  Navigator.pushNamed(context, LoginPage.id);
                                } on FirebaseAuthException catch (ex) {
                                  if (ex.code == 'email-already-in-use') {
                                    showSnackBar(
                                      context,
                                      'Email already in use',
                                    );
                                  } else if (ex.code == 'weak-password') {
                                    showSnackBar(context, 'Weak Password');
                                  }
                                } catch (ex) {
                                  showSnackBar(context, 'There was an error');
                                }
                              }
                              isLoading = false;
                              setState(() {});
                            },
                            title: 'SIGN UP',
                          ),
                          Spacer(flex: 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Login Now',
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

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
