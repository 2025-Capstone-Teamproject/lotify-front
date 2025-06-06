import 'package:go_router/go_router.dart';
import 'package:lotify/screen/SignUp.dart';
import 'package:lotify/screen/board_post.dart';
import 'package:lotify/screen/board_screen.dart';
import 'package:lotify/screen/board_write.dart';
import 'package:lotify/screen/login_screen.dart';
import 'screen/main_screen.dart';
import 'screen/vehicle_screen.dart';
import 'screen/detect_result_screen.dart';

final router = GoRouter(
  routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const LoginPage(),
    // ),
// >>>>>>> 4cb4bd86a932a1e7f9953b9ab0221181ed445899
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path:'/',
      builder: (context, state) => const MainPage()
    ),
    GoRoute(
      path: '/vehicle',
      builder: (context, state) => const Vehicle(),
    ),
    GoRoute(
      path: '/board',
      builder: (context, state) => const BoardPage(),
    ),
    GoRoute(
      path: '/board_write',
      builder: (context, state) => const BoardWritePage(),
    ),
    GoRoute(
      path: '/board_post',
      builder: (context, state) => const BoardPostPage(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>? ?? {};

        final rawViolationData = extra['violationData'] ?? {};
        final Map<String, dynamic> violationData =
        Map<String, dynamic>.from(rawViolationData);

        return DetectionResultScreen(
          imageUrl: extra['imageUrl'] ?? '',
          violation: extra['violation'] ?? false,
          violationData: violationData,
        );
      },
    ),

  ],
);
