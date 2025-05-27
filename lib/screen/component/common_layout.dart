import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const CommonLayout({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 상단 AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCEEFF),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: Image.asset("assets/images/logo.png"), // 필요 시 로고 추가
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),

      // 중심 Body
      body: child,

      // 하단 BottomNavigationBar: 경로 전체 다 수정해야함
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/vehicle');
              break;
            case 1:
              context.go('/');
              break;
            case 2:
              context.go('/');
              break;
            case 3:
              context.go('/');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: '마이 페이지'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: '공유'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: '지도'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '즐겨찾기'),
        ],
      ),
    );
  }
}
