// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:get_it/get_it.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:todo_mobile/src/datas/repositories/interfaces/account_repository.dart';
// import 'package:todo_mobile/src/screens/auth/login/login.dart';
// import 'package:todo_mobile/src/screens/dashboard/timeline.dart';
// import 'package:todo_mobile/taskez_template/Values/values.dart';
// import 'package:todo_mobile/taskez_template/widgets/AppLogo/app_logo.dart';
// import 'package:todo_mobile/taskez_template/widgets/DarkBackground/darkRadialBackground.dart';
//
// import 'bloc/splash_bloc.dart';
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   IAccountRepository accountRepository = GetIt.I.get<IAccountRepository>();
//   Future stepReader() async {
//     final bool hasToken = await accountRepository.isUserLoggedIn();
//     if(hasToken){
//       Get.to(() =>  Timeline());
//     }else{
//       Get.to(() =>  const Login());
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 2), () {
//       stepReader();
//     });
//   }
//
//   final Shader linearGradient = LinearGradient(
//     begin: FractionalOffset.topCenter,
//     colors: <Color>[HexColor.fromHex("#a7b2fd"), HexColor.fromHex("#c1a0fd")],
//   ).createShader(const Rect.fromLTWH(0.0, 0.0, 30.0, 40.0));
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildBody(context),
//     );
//   }
//
//   BlocProvider<SplashBloc> _buildBody(BuildContext context) {
//     return BlocProvider(
//       builder: (context) => SplashBloc(),
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.orange,
//         child: Center(
//           // Here I have used BlocBuilder, but instead you can also use BlocListner as well.
//           child: BlocBuilder<SplashBloc, SplashState>(
//             builder: (context, state) {
//               if ((state is Initial) || (state is Loading)) {
//                 return SplashScreenWidget();
//               } else if (state is Loaded) {
//                 return Timeline();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(children: [
//         DarkRadialBackground(
//           color: HexColor.fromHex("#074d80"),
//           position: "topLeft",
//         ),
//         Positioned(left: 140, child: AppLogo()),
//         Center(
//             child: RichText(
//               text: TextSpan(
//                 text: 'To',
//                 style: GoogleFonts.lato(fontSize: 40),
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: 'Do',
//                       style: TextStyle(foreground: Paint()..shader = linearGradient, fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ))
//       ]),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/src/screens/auth/login/srceens/login.dart';
import 'package:todo_mobile/src/screens/dashboard/screens/timeline.dart';
import 'package:todo_mobile/src/widgets/splash/splash_screen_widget.dart';

import 'bloc/splash_bloc.dart';

// This the widget where the BLoC states and events are handled.
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<SplashBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: Center(
          // Here I have used BlocBuilder, but instead you can also use BlocListner as well.
          child: BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
            if (state is LoadedToDashboard) return Timeline();
            if (state is LoadedToLogin) return Login();
            return const SplashScreenWidget();
          }),
        ),
      ),
    );
  }
}
