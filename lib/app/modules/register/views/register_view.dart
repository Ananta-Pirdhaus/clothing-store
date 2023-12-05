import '../../../routes/app_pages.dart';
// import '../../../widget/accountController.dart';
import '../controllers/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
State <RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

final AuthController _authController = Get.put(AuthController());
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
// disini nanti tambahin buat name

// APPWRITE
// final AccountController _accountController = Get.find();

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
              SizedBox(height: 30.0),

              Text(
              'Sign Up',
                style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0),

              Text(
              'Create an account',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30.0),

              //USERNAME TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _nameController, // INI JGN LUPA DIGANTI PAKE NAME
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12,)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Enter your Username',
                    fillColor: Colors.grey[200],
                    filled: true
                  ),
                ),
              ),
              SizedBox(height: 20),

                //EMAIL TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12,)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Enter your email address',
                    fillColor: Colors.grey[200],
                    filled: true
                  ),
                ),
              ),
              SizedBox(height: 20),

                // PASSWORD TEXTFIELD
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12,)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Enter your password',
                    fillColor: Colors.grey[200],
                    filled: true
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding:EdgeInsets.symmetric(horizontal: 20.0),
                    child: Obx(() {
                      return ElevatedButton(
                        onPressed: _authController.isLoading.value
                          ? null
                          : () {
                            _authController.registerUserAppwrite(
                              _emailController.text,
                              _passwordController.text,
                              _nameController.text,
                           );
                          },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black), 
                          minimumSize: MaterialStateProperty.all<Size>(Size(200.0, 50.0)), 
                        ),
                      child: _authController.isLoading.value
                      ? CircularProgressIndicator()
                      : Text(
                        'Register', style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                        ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20.0),

              Row(
                children: [
                Expanded(
                  child: Divider(color: Colors.black),
                ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Or Continue With'),
                  ),
                  Expanded(
                    child: Divider(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
                    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ElevatedButton(
                  onPressed: () {
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                    ),
                      child: Row(
                        children: [
                        Image.asset(
                          'assets/images/gg.png',
                          width: 30.0,
                          height: 30.0,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Google',
                          style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              SizedBox(width: 10.0),

              ElevatedButton(
                onPressed: () {
                },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/fb.png',
                            width: 20.0,
                            height: 20.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Facebook',
                            style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Roboto',
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already Have An Account?'),
                  TextButton(
                    onPressed: () {
                    Get.offNamed(Routes.LOGIN);
                  },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                      color: Colors.blue,
                       ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}
