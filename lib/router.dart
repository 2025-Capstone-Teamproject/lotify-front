import 'package:go_router/go_router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lotify/screen/main_screen.dart';
import 'package:lotify/screen/vehicle_screen.dart';

final router = GoRouter(
  //initialLocation: 'flutter_native_splash',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return MainPage();
      }
    ),
    GoRoute(
        path:'/vehicle',
    builder: (context, state) => Vehicle())
  ],
);
