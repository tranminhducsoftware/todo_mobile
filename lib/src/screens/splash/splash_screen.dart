
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
