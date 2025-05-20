import 'package:go_router/go_router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lotify/screen/main_screen.dart';

final router = GoRouter(
  // initialLocation: FlutterNativeSplash
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return MainPage();
      }
    )
  ],
);