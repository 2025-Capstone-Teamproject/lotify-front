// 게시판 화면
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotify/screen/component/common_layout.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      currentIndex: 0,
      child: Column(
        children: [],
      ),
    );
  }
}