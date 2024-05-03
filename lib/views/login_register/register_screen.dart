import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vaccination_managment_app/api/auth.dart';
import 'package:vaccination_managment_app/views/login_register/form_elements/form_container.dart';
import 'package:vaccination_managment_app/views/login_register/form_elements/form_validators.dart';
import 'package:vaccination_managment_app/views/login_register/form_elements/text_row.dart';
import 'package:vaccination_managment_app/widgets/buttons/my_icon_button.dart';
import 'package:vaccination_managment_app/widgets/layout_template/form_layout_template.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fromSeparator = const SizedBox(height: 16);

  Authenticate auth = Authenticate();
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  final _passwordController = TextEditingController();
  var _enteredUsername = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  String? errorMessage = '';

  bool _obscureText = true;

  void _signUp() async {
    FocusScope.of(context).unfocus(); // close keyboard

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      try {
        await auth.register(
          _enteredUsername,
          _enteredEmail,
          _enteredPassword,
        );
        if (!context.mounted) {
          return;
        }
      } on Exception catch (e) {
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
            title: const Text('Registration Failed'),
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
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormLayoutTemplate(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'REGISTER',
              style: GoogleFonts.lato(
                color: const Color(0xFF2F4858),
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            fromSeparator,
            FormContainer(
              text: 'USERNAME',
              icon: Icons.person,
              validator: (value) => isEmptyValidator(value),
              onSaved: (value) => _enteredUsername = value!,
            ),
            const SizedBox(height: 16),
            FormContainer(
              text: 'EMAIL',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => isEmailValidator(value),
              onSaved: (value) => _enteredEmail = value!,
            ),
            fromSeparator,
            FormContainer(
              controller: _passwordController,
              text: 'PASSWORD',
              icon: Icons.lock,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromARGB(255, 204, 231, 248),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              obscureText: _obscureText,
              validator: (value) => isValidPasswordValidator(value),
              onSaved: (value) => _enteredPassword = value!,
            ),
            fromSeparator,
            FormContainer(
              text: 'CONFIRM PASSWORD',
              icon: Icons.lock,
              obscureText: _obscureText,
              validator: (value) => doesMatchValidator(
                value,
                _passwordController.text,
              ),
            ),
            const Spacer(),
            MyIconButton(
              buttonText: 'SIGN UP',
              icon: Icons.arrow_forward,
              placement: 'right',
              onPressed: _signUp,
              isLoading: _isLoading,
            ),
            const SizedBox(height: 10),
            TextRow(
              text: 'Already have an account?',
              color: const Color(0xFF2F4858),
              onPressed: () {
                Navigator.pop(context);
              },
              clicText: 'Sign in',
            ),
          ],
        ),
      ),
    );
  }
}
