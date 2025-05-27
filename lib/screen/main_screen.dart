import 'dart:io';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 상/하단 배경색
      backgroundColor: Color(0xFFFFFFFF),

      // 상단
      appBar: AppBar(
        backgroundColor: Color(0xFFDCEEFF),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(""),
        ),
       actions: [
         IconButton(
           icon: Icon(Icons.notifications_none),
           onPressed: () {},
         ),
         IconButton(
             icon: Icon(Icons.menu),
             onPressed: () {},
         ),
       ],
      ),

      // 중심
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(Icons.admin_panel_settings, '관리자 신청'),
                  _circleButton(Icons.directions_car, '차량 등록'),
                  _circleButton(Icons.forum, '게시판'),
                ],
              ),
            ),
            // 중앙선
            Divider(
              color: Colors.grey[300],
              thickness: 20,
              height: 40,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xFFBEE2FF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, size: 50),
                          SizedBox(height: 16),
                          Text('특별 구역\n불법 주차 신고',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        _smallCardButton('제보 내역', Colors.pink[200]!),
                        SizedBox(height: 10),
                        _smallCardButton('주차장 공지사항',Colors.blue[100]!),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // 중앙선
            Divider(
              color: Colors.grey[300],
              thickness: 20,
              height: 40,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _listTileButton("자주 묻는 질문"),
                  _listTileButton("불법 주차 신고 가이드"),
                ],
              ),
            ),
          ],
        ),
      ),
      // 하단
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person), label: '마이 페이지'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: '공유'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: '지도'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '즐겨찾기'),
        ]
      ),
    );
  }
  //상단 버튼 3개 위젯
  Widget _circleButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 30,
          child: Icon(icon, size: 38, color: Colors.black),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  // 중단 버튼 3개 위젯
  Widget _smallCardButton(String text, Color color) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(text,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
    );
  }

  Widget _listTileButton(String text) {
    return Column(
      children: [
        ListTile(
          title: Text(text),
          trailing: Icon(Icons.chevron_right),
        ),
        Divider(height: 1),
      ],
    );
  }
}