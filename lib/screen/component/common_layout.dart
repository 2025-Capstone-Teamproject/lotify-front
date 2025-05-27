import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final bool isMainPage;

  const CommonLayout({
    super.key,
    required this.child,
    required this.currentIndex,
    this.isMainPage = false, // 기본값 false
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 상단 AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCEEFF),
        elevation: 0,
        leading: isMainPage
            ? null
            : IconButton(
                padding: const EdgeInsets.all(8.0),
                icon: Image.asset("assets/images/backBtn.png"),
                onPressed: () {
                  context.pop();
                },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer : Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
              accountName: Text('Lotify'),
              accountEmail: Text('lotify@naver.com'),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0x1A667EEA), // rgba(102, 126, 234, 0.1)
                    Color(0x0D764BA2), // rgba(118, 75, 162, 0.05)
                  ],
                ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.green[850],
              ),
              title: Text('홈'),
              onTap: () {
                context.go('/'); // 일단 go로
              },
            )
          ],
        ),
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
