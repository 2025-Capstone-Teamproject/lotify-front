import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotify/screen/component/common_layout.dart';
import 'package:lotify/screen/camera_handler.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      currentIndex: 0, // 탭 기준으로 인덱스 설정
      isMainPage: true,

      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(context, Icons.admin_panel_settings, '관리자 신청', '/'),
                  _circleButton(context, Icons.directions_car, '차량 등록', '/vehicle'),
                  _circleButton(context, Icons.forum, '게시판', '/'),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 20,
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => showImageSourceActionSheet(context),
                      child: Container(
                        height: 190,
                        width: 170,
                        decoration: BoxDecoration(
                          color: const Color(0xFFBEE2FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, size: 50),
                            SizedBox(height: 10),
                            Text(
                              '특별 구역\n불법 주차 신고',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 45),
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 95,
                          child: _smallCardButton(context, '제보 내역', Colors.pink[200]!,
                              'assets/images/report.png', '/'),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          height: 95,
                          child: _smallCardButton(context, '주차장 공지사항', Colors.blue[100]!,
                              'assets/images/anno.png', '/'),
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
            ),
            const SizedBox(height: 35),
            Container(
              width: 350,
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                    trailing: const Icon(Icons.chevron_right, color: Colors.black54),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey.shade100),
                  ListTile(
                    title: Text(
                      '불법 주차 신고 가이드',
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                    trailing: const Icon(Icons.chevron_right, color: Colors.black54),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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

  Widget _circleButton(
      BuildContext context, IconData icon, String label, String routePath) {
    return GestureDetector(
      onTap: () {
        context.push(routePath);
      },
      child: Column(
        children: [
          const SizedBox(height: 4),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 30,
            child: Icon(icon, size: 38, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _smallCardButton(
      BuildContext context, String text, Color color, String imagePath, String routePath) {
    return GestureDetector(
      onTap: () {
        context.push(routePath);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
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
            const SizedBox(height: 6),
            Text(
              text,
              style: const TextStyle(
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
