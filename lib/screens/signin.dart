import 'package:challenge/Service/firebase_auth.dart';
import 'package:challenge/controller/signin_controller.dart';
import 'package:challenge/screens/register.dart';
import 'package:challenge/widgets/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GetBuilder<AuthController>(
            init: AuthController(),
            initState: (_) {},
            builder: (todoController) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Login Page',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            label: Text('Email'),
                          ),
                          validator: (value) {
                            bool _isEmailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_~{|}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);
                            if (!_isEmailValid) {
                              return 'Invalid Email';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: passwordContoller,
                          decoration: const InputDecoration(
                            label: Text('Password'),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Fill in the Form';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(color: Colors.blue),
                          child: TextButton(
                            onPressed: () async {
                              authController.login(
                                emailController.text,
                                passwordContoller.text,
                              );
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Get.to(Register()),
                  child: const Text('Register Here'),
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
