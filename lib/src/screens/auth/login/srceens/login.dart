import 'package:flutter/material.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'components/_body.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/person.jpg"),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    AppSpaces.verticalSpace40,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SIGN IN",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    AppSpaces.verticalSpace40,
                    AuthForm()
                  ],
                ),
              ),
            )
          ],
        ),
      // ),
    );
  }
}

