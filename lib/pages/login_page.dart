import 'package:flutter/material.dart';
import 'package:forum_app/components/button_component.dart';
import 'package:forum_app/components/text_field_component.dart';
import 'package:forum_app/controller/authentication.dart';
import 'package:forum_app/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    const double spaceBetwenComponents = 15.0;
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login Page',
            style: GoogleFonts.poppins(fontSize: size * 0.08),
          ),
          const SizedBox(
            height: spaceBetwenComponents,
          ),
          TextFieldComponent(
            controller: widget._usernameController,
            hintText: 'Username',
          ),
          const SizedBox(
            height: spaceBetwenComponents,
          ),
          TextFieldComponent(
            controller: widget._passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(
            height: spaceBetwenComponents,
          ),
          ButtonComponent(
            onPressed: () async {
              dynamic response = await widget._authenticationController.login(
                username: widget._usernameController.text.trim(),
                password: widget._passwordController.text.trim(),
              );
              String message = response.toString();
              if (!mounted) return;
              SnackBar snackBar = SnackBar(
                content: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                showCloseIcon: true,
                closeIconColor: Colors.white,
                dismissDirection: DismissDirection.up,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height - 70,
                    left: 10,
                    right: 10),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            color: Colors.black,
            textColor: Colors.white,
            child: widget._authenticationController.isLoading.value
                ? const CircularProgressIndicator()
                : Text(
                    'Login',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
          ),
          ButtonComponent(
            onPressed: () {
              Route route = MaterialPageRoute(
                builder: (context) => RegisterPage(),
              );
              Navigator.push(context, route);
            },
            color: Colors.transparent,
            textColor: Colors.black,
            child: const Text('Sign up'),
          )
        ],
      ),
    );
  }
}
