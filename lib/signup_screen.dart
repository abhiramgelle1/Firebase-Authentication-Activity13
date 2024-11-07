import 'package:flutter/material.dart';
import 'auth_service.dart';

class SignUpScreen extends StatefulWidget {
  final AuthService authService;
  SignUpScreen({required this.authService});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _message;

  void _signUp() async {
    final user = await widget.authService.signUp(
      _emailController.text,
      _passwordController.text,
    );
    setState(() {
      _message = user != null
          ? 'Successfully registered ${user.email}'
          : 'Registration failed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('Register'),
            ),
            if (_message != null)
              Text(_message!, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
