import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_mobile/src/screens/splash/bloc/splash_bloc.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';
import 'package:todo_mobile/taskez_template/widgets/AppLogo/app_logo.dart';
import 'package:todo_mobile/taskez_template/widgets/DarkBackground/darkRadialBackground.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    _dispatchEvent(context); // This will dispatch the navigateToHomeScreen event.
  }

  final Shader linearGradient = LinearGradient(
    begin: FractionalOffset.topCenter,
    colors: <Color>[HexColor.fromHex("#a7b2fd"), HexColor.fromHex("#c1a0fd")],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 30.0, 40.0));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        DarkRadialBackground(
          color: HexColor.fromHex("#074d80"),
          position: "topLeft",
        ),
        Positioned(left: 140, child: AppLogo()),
        Center(
            child: Container(
          child: RichText(
            text: TextSpan(
              text: 'To',
              style: GoogleFonts.lato(fontSize: 40),
              children: <TextSpan>[
                TextSpan(
                    text: 'Do',
                    style: TextStyle(
                        foreground: Paint()..shader = linearGradient,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        )),
        Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 150, 20, 20),
            child: const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }

  //This method will dispatch the navigateToHomeScreen event.
  void _dispatchEvent(BuildContext context) {
    BlocProvider.of<SplashBloc>(context).add(
      NavigateToHomeOrLoginScreenEvent(),
    );
  }
}
