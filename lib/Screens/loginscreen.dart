import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../repository/loginrepository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'kiran');
  final _passwordController = TextEditingController(text: 'kiran');

  _loginUser() async {
    bool isLogin = await UserRepository()
        .login(_emailController.text, _passwordController.text);
    if (isLogin) {
      _showMessage(true);
    } else {
      _showMessage(false);
    }
  }

  _showMessage(bool isLogin) {
    if (isLogin) {
      Navigator.pushNamed(context, '/dashboard');
    } else {
      MotionToast.error(description: const Text('Invalid username or password'))
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset(
            'assets/images/logo1.jpg',
          ),
        ));

    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'kiran123@gmail.com',
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter username';
        }
        return null;
      },
    );

    final password = TextFormField(
      controller: _passwordController,
      autofocus: false,
      // initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter password';
        }
        return null;
      },
    );

    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'home');
        },
        child: const Padding(
          padding: EdgeInsets.all(12),
          child: Text('LOG IN', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'register');
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(color: Colors.black54),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            logo,
            const SizedBox(height: 38.0),
            email,
            const SizedBox(height: 8.0),
            password,
            const SizedBox(height: 20.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
