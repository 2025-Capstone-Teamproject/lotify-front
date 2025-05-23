import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/vehicle'); // GoRouter 사용
          },
          child: Text("차량 등록"),
        ),
      )
    );
  }
}