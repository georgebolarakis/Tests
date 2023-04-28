import 'package:first_test/validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //A validation form needs a key
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                key: const ValueKey('email_id'),
                decoration: const InputDecoration(hintText: 'Enter your email'),
                validator: (value) => Validator.validateEmail(value!),
              ),
              TextFormField(
                controller: _passwordController,
                key: const ValueKey('password'),
                decoration:
                    const InputDecoration(hintText: 'Enter your password'),
                validator: (value) => Validator.validatePassword(value ?? ""),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                key: const ValueKey('Login Button'),
                onPressed: () {
                  _key.currentState?.validate();
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
