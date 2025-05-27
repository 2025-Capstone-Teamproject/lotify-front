import 'package:go_router/go_router.dart';
import 'screen/main_screen.dart';
import 'screen/vehicle_screen.dart';
import 'screen/detect_result_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/vehicle',
      builder: (context, state) => const Vehicle(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>? ?? {};
        return DetectionResultScreen(
          carNumber: extra['carNumber'] ?? '번호 없음',
          imageUrl: extra['imageUrl'] ?? '',
          locationDescription: extra['location'] ?? '위치 정보 없음',
          violation: extra['violation'] ?? false,
        );
      },
    ),
  ],
);
