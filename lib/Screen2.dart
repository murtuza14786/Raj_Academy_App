// lib/Screen2.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  // Controllers for email and password fields
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    // Validate form fields first
    if (!_formKey.currentState!.validate()) return;

    final email = _emailCtrl.text.trim();
    final password = _passCtrl.text;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Attempt to sign in with Firebase Auth
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // If successful, navigate to HomePage
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/HomePage');
    } on FirebaseAuthException catch (e) {
      // Friendly error messages for common FirebaseAuth errors
      String msg;
      if (e.code == 'user-not-found') {
        msg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        msg = 'Wrong password provided.';
      } else if (e.code == 'invalid-email') {
        msg = 'The email address is invalid.';
      } else {
        msg = e.message ?? 'Authentication error: ${e.code}';
      }
      setState(() => _errorMessage = msg);
      // Also show a SnackBar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg)),
        );
      }
    } catch (e) {
      setState(() => _errorMessage = 'An unexpected error occurred.');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An unexpected error occurred.')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:
                    Image.asset('assets/logo.png', width: 240, height: 52.55),
              ),
              const SizedBox(height: 35),
              const Text("Sign In",
                  style: TextStyle(
                    color: Color.fromRGBO(24, 24, 24, 1),
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFProText',
                    letterSpacing: -1,
                  )),
              const SizedBox(height: 3),
              const Text("Hi! Welcome back, you've been missed",
                  style: TextStyle(
                    color: Color.fromRGBO(67, 67, 67, 1),
                    fontSize: 15,
                    fontFamily: 'SFProText',
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Email",
                        style: TextStyle(
                          color: Color.fromRGBO(24, 24, 24, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ],
              ),
              SizedBox(
                width: 370,
                child: Stack(children: [
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      hintText: 'example@gmail.com',
                      hintStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      // simple email format check
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(3, 138, 0, 0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Verified',
                        style: TextStyle(
                          color: Color.fromRGBO(3, 138, 0, 1),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'AktivGroteskCorp',
                          fontSize: 11,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Password",
                        style: TextStyle(
                          color: Color.fromRGBO(24, 24, 24, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ],
              ),
              SizedBox(
                width: 370,
                child: TextFormField(
                  controller: _passCtrl,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    hintText: '*********',
                    hintStyle: const TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          _obscureText
                              ? 'assets/eyeicon.jpg'
                              : "assets/eyeopen.jpg",
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password cannot be empty";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SFProText',
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 369,
                height: 44,
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          await _login();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(237, 50, 55, 1),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text("Login",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
              ),
              const SizedBox(height: 12),
              if (_errorMessage != null) ...[
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
