import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  XFile? _videoFile;
  VideoPlayerController? _videoController;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickVideoFromCamera() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.camera);

    if (pickedFile != null) {
      _videoFile = pickedFile;
      _videoController = VideoPlayerController.file(File(pickedFile.path))
        ..initialize().then((_) {
          setState(() {
            //파일 저장
            _videoFile = pickedFile;
          });

          //알림 표시
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("분석이 완료되었습니다."),
                duration: Duration(seconds: 2),
              ),
            );

            // 결과 화면으로 이동(임시로 분석 결과 사용한거임)
            context.go('/result', extra: {
              'carNumber': '123가 4567',
              'imageUrl': 'https://example.com/car.jpg',
              'location': '서울시 강남구 테헤란로 123',
              'violation': true,
            });
          }
        });
    }
  }
  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lotify')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/vehicle'); // 차량 등록 화면으로 이동
              },
              child: Text("차량 등록"),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _pickVideoFromCamera,
              icon: const Icon(Icons.videocam),
              label: const Text("영상 촬영"),
            ),
            const SizedBox(height: 20),
            if (_videoController != null &&
                _videoController!.value.isInitialized)
              AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: VideoPlayer(_videoController!),
              ),
          ],
        ),
      ),
    );
  }
}
