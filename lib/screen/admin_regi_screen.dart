// 관리자 신청 페이지
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotify/screen/component/common_layout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdminRegiPage extends StatelessWidget {
  AdminRegiPage({super.key});
  final TextEditingController adminIdController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      currentIndex: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 84,
              alignment: Alignment.center,
              child: const Text(
                '관리자 등록',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 10,
              height: 1,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: adminIdController,
              decoration: InputDecoration(labelText: '관리자 아이디'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: regionController,
              decoration: InputDecoration(labelText: '관리 지역'),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDCEEFF),
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  _registerAdmin(context);
                },
                child: const Text('등록'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerAdmin(BuildContext context) async {
    print('registerAdmin 함수 시작됨');

    if(adminIdController.text.isEmpty ||
        regionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('모든 항목을 입력해주세요.'),
            backgroundColor: Colors.red,)
      );
      return;
    }

    print('서버 요청 시작');
    try {
      final baseUrl = dotenv.env['API_URL'];
      final url = Uri.parse('$baseUrl/user/admin');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user_id': adminIdController.text.trim(),
          'region': regionController.text.trim(),
        }),
      );
      print('서버 응답: ${response.statusCode}');
      print('응답 내용: ${response.body}');

      if(response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('관리자 신청이 완료되었습니다.'),
            backgroundColor: Colors.green,
          ),
        );
        context.push('/main');
      } else {
        final decodeBody = jsonDecode(utf8.decode(response.bodyBytes));
        var msg = decodeBody['detail'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('관리자 요청 실패: ${msg}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('에러 발생: ${e}');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('오류 발생: ${e}'),
            backgroundColor: Colors.red,
          )
      );
    }
  }
}

