import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/widgets/buttons/my_icon_button.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // TODO: implement auth and db
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  final _passwordController = TextEditingController();
  var _enteredUsername = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  String? errorMessage = '';

  bool _obscureText = true;

  void _signUp() {}

  //Future<void> _signUp() async {
  //  FocusScope.of(context).unfocus(); // close keyboard
//
  //  if (_formKey.currentState!.validate()) {
  //    _formKey.currentState!.save();
  //    setState(() {
  //      _isLoading = true;
  //    });
//
  //    try {
  //      await Auth().createUserWithEmailAndPassword(
  //          email: _enteredEmail, password: _enteredPassword);
//
  //      final User? user = _auth.currentUser;
  //      if (user != null) {
  //        await _db.createNewUser(
  //          uid: user.uid,
  //          weight: _enteredWeight,
  //          height: _enteredHeight,
  //        );
  //      }
  //      if (!context.mounted) {
  //        return;
  //      }
  //      Navigator.pop(context);
  //    } on FirebaseAuthException catch (e) {
  //      setState(() {
  //        _isLoading = false;
  //        errorMessage = e.message;
  //      });
//
  //      if (!context.mounted) {
  //        return;
  //      }
  //      showDialog(
  //        context: context,
  //        builder: (ctx) => AlertDialog(
  //          title: const Text('Login Failed'),
  //          content: Text(errorMessage!),
  //          actions: <Widget>[
  //            TextButton(
  //              child: const Text('Okay'),
  //              onPressed: () {
  //                Navigator.of(ctx).pop();
  //              },
  //            ),
  //          ],
  //        ),
  //      );
  //    }
  //  }
  //}

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: 'Register',
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Create Account',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 30),
              ),
            ),
            const SizedBox(height: 16),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
              onSaved: (value) => _enteredUsername = value!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                label: Row(
                  children: [
                    const Icon(Icons.email),
                    const SizedBox(width: 5),
                    Text(
                      'EMAIL',
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
                const pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                final regExp = RegExp(pattern);

                if (value == null || value.isEmpty) {
                  return 'Please enter an email address';
                }

                if (!regExp.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) => _enteredEmail = value!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
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
                  return 'Enter a password';
                }
                if (value.length < 6) {
                  return 'Minimum 6 characters';
                }
                if (!value.contains(RegExp(r'[A-Z]'))) {
                  return 'Needs 1 uppercase';
                }
                if (!value.contains(RegExp(r'[a-z]'))) {
                  return 'Needs 1 lowercase';
                }
                if (!value.contains(RegExp(r'[0-9]'))) {
                  return 'Needs 1 digit';
                }
                if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                  return 'Needs 1 special char';
                }
                return null;
              },
              onSaved: (value) => _enteredPassword = value!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                label: Row(
                  children: [
                    const Icon(Icons.lock),
                    const SizedBox(width: 5),
                    Text(
                      'CONFIRM PASSWORD',
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
              obscureText: _obscureText,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password confirmation';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 18),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyIconButton(
                  buttonText: 'SIGN UP',
                  icon: const Icon(Icons.arrow_forward),
                  placement: 'right',
                  onPressed: _signUp,
                  isLoading: _isLoading,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Sign in'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
