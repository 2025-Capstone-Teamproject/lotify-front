import 'package:flutter/material.dart';
import 'package:lotify/screen/component/common_layout.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({super.key});

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  String? _selected = 'no';

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      currentIndex: 0, // 필요에 따라 탭 인덱스 조절
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
                '차량 등록',
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
            const TextField(
              decoration: InputDecoration(labelText: '차량 번호'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '장애인 여부',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    const Text('예'),
                    Radio<String>(
                      value: 'yes',
                      groupValue: _selected,
                      onChanged: (value) {
                        setState(() {
                          _selected = value;
                        });
                      },
                    ),
                    const Text('아니오'),
                    Radio<String>(
                      value: 'no',
                      groupValue: _selected,
                      onChanged: (value) {
                        setState(() {
                          _selected = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: '관리자 아이디'),
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
                  print('차량 등록 성공!: \$_selected');
                },
                child: const Text('등록'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
