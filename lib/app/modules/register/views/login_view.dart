import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/AuthController.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 75),
            // Heloo Again
            Text(
              'HELLO AGAIN',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome Back!!',
              style: TextStyle(
                  fontSize: 20, fontFamily: 'Roboto', color: Colors.black),
            ),
            SizedBox(height: 30),

            // EMAIL TEXFIELD
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(
                          12,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Enter your email address',
                    fillColor: Colors.grey[200],
                    filled: true),
              ),
            ),
            SizedBox(height: 20),

            //PASSWORD TEXTFIELD
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(
                          12,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Enter your password',
                    fillColor: Colors.grey[200],
                    filled: true),
              ),
            ),

            // SIGN IN BUTTON
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Container(
                child: Obx(() {
                  return ElevatedButton(
                    onPressed: _authController.isLoading.value
                        ? null
                        : () {
                            // Memanggil fungsi login
                            _authController.loginUser(
                              _emailController.text,
                              _passwordController.text,
                            );

                            // Memeriksa apakah login berhasil
                            if (_authController.isLoggedIn.value) {
                              // Jika berhasil, arahkan ke halaman Homepage
                              Get.offNamed(Routes.HOMEPAGE);
                            }
                          },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(200.0, 50.0)),
                    ),
                    child: _authController.isLoading.value
                        ? CircularProgressIndicator()
                        : Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                  );
                }),
              ),
            ),
            SizedBox(height: 10),

            // REGISTER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?'),
                TextButton(
                  onPressed: () {
                    Get.offNamed(Routes.REGISTER);
                  },
                  child: Text(
                    ' Register Now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ))),
    );
  }
}
