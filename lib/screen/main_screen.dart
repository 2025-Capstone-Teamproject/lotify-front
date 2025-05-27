import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotify/screen/component/common_layout.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      currentIndex: 0, // 탭 기준으로 인덱스 설정
      isMainPage: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(context, Icons.admin_panel_settings, '관리자 신청','/'),
                  _circleButton(context, Icons.directions_car, '차량 등록','/vehicle'),
                  _circleButton(context, Icons.forum, '게시판','/'),
                ],
              ),
            ),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible (
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        context.push('/report');
                      },
                      child: Container(
                        height: 190,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Color(0xFFBEE2FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, size: 50),
                            SizedBox(height: 10),
                            Text('특별 구역\n불법 주차 신고',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 45),
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 95,
                          child: _smallCardButton(context, '제보 내역', Colors.pink[200]!, 'assets/images/report.png','/'),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          height: 95,
                          child: _smallCardButton(context, '주차장 공지사항',Colors.blue[100]!, 'assets/images/anno.png', '/'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 20,
              height: 40,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(height: 35),
            Container(
              width: 350,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(
                      '자주 묻는 질문',
                      style: TextStyle(color: Colors.grey.shade900),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.black54),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey.shade100),
                  ListTile(
                    title: Text(
                      '불법 주차 신고 가이드',
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.black54),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _circleButton(BuildContext context, IconData icon, String label, String routePath) {
    return GestureDetector(
      onTap: () {
        context.push(routePath);
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 30,
            child: Icon(icon, size: 38, color: Colors.black),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _smallCardButton(BuildContext context ,String text, Color color, String imagePath, String routePath) {
    return GestureDetector(
      onTap: () {
        context.push(routePath);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 44,
              height: 44,
            ),
            SizedBox(height: 6),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
