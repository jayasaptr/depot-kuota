import 'package:depotkuota/bloc/auth/auth_bloc.dart';
import 'package:depotkuota/pages/splash/splash_page.dart';
import 'package:depotkuota/repositories/auth/auth_rerpository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(AuthRepostiroy()),
        )
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return GlobalLoaderOverlay(
            useDefaultLoading: false,
            overlayWidget: const Center(
              child: SpinKitCubeGrid(
                color: Color(0xff128ED3),
                size: 50.0,
              ),
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Depot Kuota',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SplashPage(),
            ),
          );
        },
      ),
    );
  }
}
