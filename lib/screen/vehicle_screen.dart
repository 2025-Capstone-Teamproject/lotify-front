import 'package:flutter/material.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({super.key});

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  String? _selected = 'yes'; // 기본값 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCEEFF),
      appBar: AppBar(title: Text('차량 등록'),
          centerTitle: true,
        backgroundColor: Color(0xFFDCEEFF),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: '차량 번호'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '장애인 여부',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Text('예'),
                    Radio<String>(
                      value: 'yes',
                      groupValue: _selected,
                      onChanged: (value) {
                        setState(() {
                          _selected = value;
                        });
                      },
                    ),
                    Text('아니오'),
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

            TextField(
              decoration: InputDecoration(labelText: '관리자 아이디'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 등록 로직
                print('차량 등록 성공!: $_selected');
              },
              child: Text('등록'),
            ),
          ],
        ),
      ),
    );
  }
}
