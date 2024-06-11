import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/controllers/sign_in_controller.dart';
import 'package:sql_davomi_2_dars/views/screens/home_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final _authHttpServices = AuthhttpService();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  String? email, password, passwordConfirm;
  bool isLoading = false;

  void submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      //? Register
      setState(() {
        isLoading = true;
      });
      try {
        await _authHttpServices.registration(email!, password!);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return const HomeScreen();
            },
          ),
        );
      } catch (e) {
        String message = e.toString();
        if (e.toString().contains("EMAIL_EXISTS")) {
          message = "Email mavjud";
        }
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Xatolik"),
              content: Text(message),
            );
          },
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Iltimos elektron pochtangizni kiriting";
                    }

                    return null;
                  },
                  onSaved: (newValue) {
                    //? save email
                    email = newValue;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Parol",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Iltimos parolingizni kiriting";
                    }

                    return null;
                  },
                  onSaved: (newValue) {
                    //? save password
                    password = newValue;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordConfirmController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm password",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Enter confirmed password";
                    }

                    if (_passwordController.text !=
                        _passwordConfirmController.text) {
                      return "Passwords are not the same";
                    }

                    return null;
                  },
                  onSaved: (newValue) {
                    //? save password confirm
                    passwordConfirm = newValue;
                  },
                ),
                const SizedBox(height: 20),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : FilledButton(
                        onPressed: submit,
                        child: const Text("Sign Up"),
                      ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return const SignUpScreen();
                        },
                      ),
                    );
                  },
                  child: const Text("Entrance"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
