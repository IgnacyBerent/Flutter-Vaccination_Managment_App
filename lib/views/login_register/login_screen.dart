import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vaccination_managment_app/api/auth.dart';
import 'package:vaccination_managment_app/views/login_register/form_elements/form_container.dart';
import 'package:vaccination_managment_app/views/login_register/form_elements/form_validators.dart';
import 'package:vaccination_managment_app/views/login_register/form_elements/text_row.dart';
import 'package:vaccination_managment_app/views/login_register/register_screen.dart';
import 'package:vaccination_managment_app/widgets/buttons/my_icon_button.dart';
import 'package:vaccination_managment_app/widgets/layout_template/form_layout_template.dart';
import 'package:vaccination_managment_app/widgets/popups/info_popup.dart';

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

        if (mounted) {
          infoPopup(context, 'Login Vailed!', errorMessage!);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormLayoutTemplate(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'LOG IN',
              style: GoogleFonts.lato(
                color: const Color(0xFF2F4858),
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 50),
            FormContainer(
              text: 'USERNAME',
              icon: Icons.person,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => isEmptyValidator(value),
              onSaved: (value) => _enteredUsername = value!,
            ),
            const SizedBox(height: 12),
            FormContainer(
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
              validator: (value) => isEmptyValidator(value),
              onSaved: (value) => _enteredPassword = value!,
            ),
            const Spacer(),
            MyIconButton(
              buttonText: 'LOGIN',
              icon: Icons.arrow_forward,
              placement: 'right',
              onPressed: _signIn,
              isLoading: _isLoading,
            ),
            const SizedBox(
              height: 20,
            ),
            TextRow(
              text: "Don't have an account?",
              color: const Color(0xFF2F4858),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const RegisterScreen(),
                  ),
                );
              },
              clicText: 'Sign up',
            ),
          ],
        ),
      ),
    );
  }
}
