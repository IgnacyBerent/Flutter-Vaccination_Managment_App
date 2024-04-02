import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/api/auth.dart';
import 'package:vaccination_managment_app/views/login_register/register_screen.dart';
import 'package:vaccination_managment_app/widgets/buttons/my_icon_button.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredUsername = '';
  var _enteredPassword = '';
  var _isLoading = false;
  String? errorMessage = '';
  bool _obscureText = true;
  final Authenticate auth = Authenticate();

  Future<void> _signIn() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await auth.login(_enteredUsername, _enteredPassword);
      } catch (e) {
        setState(() {
          _isLoading = false;
          errorMessage = e.toString();
        });

        if (!context.mounted) {
          return;
        }
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Login Failed'),
            content: Text(errorMessage!),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: 'Login',
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hello',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 30),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please sign in to continue',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 18),
            TextFormField(
              decoration: InputDecoration(
                label: Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 5),
                    Text(
                      'USERNAME',
                      style: TextStyle(
                        fontSize: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 12)
                            .fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              onSaved: (value) => _enteredUsername = value!,
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                label: Row(
                  children: [
                    const Icon(Icons.lock),
                    const SizedBox(width: 5),
                    Text(
                      'PASSWORD',
                      style: TextStyle(
                        fontSize: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 12)
                            .fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              obscureText: _obscureText,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) => _enteredPassword = value!,
            ),
            const SizedBox(height: 18),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyIconButton(
                  buttonText: 'LOGIN',
                  icon: const Icon(Icons.arrow_forward),
                  placement: 'right',
                  onPressed: _signIn,
                  isLoading: _isLoading,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text('Sign up'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
