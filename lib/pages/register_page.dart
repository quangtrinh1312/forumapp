import 'package:flutter/material.dart';
import 'package:forum_app/components/button_component.dart';
import 'package:forum_app/components/text_field_component.dart';
import 'package:forum_app/controller/authentication.dart';
// import 'package:forum_app/model/Account.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final String? title;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  RegisterPage({
    super.key,
    this.title,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    const double spaceBetwenComponents = 15.0;
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Register Page',
            style: GoogleFonts.poppins(fontSize: size * 0.08),
          ),
          const SizedBox(
            height: spaceBetwenComponents,
          ),
          TextFieldComponent(
            controller: widget._nameController,
            hintText: 'name',
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
            controller: widget._emailController,
            hintText: 'Email',
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
          TextFieldComponent(
            controller: widget._rePasswordController,
            hintText: 'Repassword',
          ),
          const SizedBox(
            height: spaceBetwenComponents,
          ),
          ButtonComponent(
            onPressed: () async {
              dynamic response = await widget._authenticationController.register(
                name: widget._nameController.text.trim(),
                username: widget._usernameController.text.trim(),
                email: widget._emailController.text.trim(),
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
            child: Obx(() {
              return widget._authenticationController.isLoading.value
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      'Register',
                      style: GoogleFonts.poppins(
                        fontSize: size * 0.040,
                      ),
                    );
            }),
          ),
          ButtonComponent(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.transparent,
            textColor: Colors.black,
            child: const Text('Back'),
          )
        ],
      ),
    );
  }
}
