import 'package:flutter/material.dart';
import 'package:forum_app/components/button_component.dart';
import 'package:forum_app/components/text_field_component.dart';
import 'package:forum_app/pages/register_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
            onPressed: () {},
            text: 'Login',
            color: Colors.black,
            textColor: Colors.white,
          ),
          ButtonComponent(
            onPressed: () {
              Route route = MaterialPageRoute(
                builder: (context) =>RegisterPage(),
              );
              Navigator.push(context, route);
            },
            text: 'Sign up',
            color: Colors.transparent,
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}
