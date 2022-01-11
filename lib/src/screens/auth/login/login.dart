import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_mobile/src/datas/models/auth/authenticate_model.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/account_repository.dart';
import 'package:todo_mobile/src/screens/dashboard/timeline.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:todo_mobile/taskez_template/widgets/Forms/form_input_with%20_label.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  IAccountRepository accountRepository = GetIt.I.get<IAccountRepository>();

  TextEditingController _passController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  bool obscureText = false;

  Future login() async {
    try {
      accountRepository.authenticateModel = AuthenticateModel(
          userNameOrEmailAddress: _usernameController.text,
          password: _passController.text,
          rememberClient: false);
      await accountRepository.loginUser();
      Get.to(() => Timeline());
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      DarkRadialBackground(
        color: HexColor.fromHex("#181a1f"),
        position: "topLeft",
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login',
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            AppSpaces.verticalSpace20,
            RichText(
              text: TextSpan(
                text: 'Using  ',
                style: GoogleFonts.lato(color: HexColor.fromHex("676979")),
                children: <TextSpan>[
                  // TextSpan(text: widget.email, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "to login.",
                      style:
                          GoogleFonts.lato(color: HexColor.fromHex("676979"))),
                ],
              ),
            ),
            const SizedBox(height: 30),
            LabelledFormInput(
                placeholder: "UserName",
                keyboardType: "text",
                controller: _usernameController,
                obscureText: obscureText,
                label: "Your UserName"),
            const SizedBox(height: 30),
            LabelledFormInput(
                placeholder: "Password",
                keyboardType: "text",
                controller: _passController,
                obscureText: obscureText,
                label: "Your Password"),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  onPressed: () async {
                    await login();
                  },
                  style: ButtonStyles.blueRounded,
                  child: Text('Sign In',
                      style: GoogleFonts.lato(fontSize: 20, color: Colors.white))),
            )
          ],
        )),
      )
    ]));
  }
}
