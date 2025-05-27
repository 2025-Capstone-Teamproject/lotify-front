import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotify/screen/component/common_layout.dart';

class DetectionResultScreen extends StatelessWidget {
  final String carNumber;
  final String imageUrl;
  final String locationDescription;
  final bool violation;
  final TextEditingController feedbackController = TextEditingController();

  DetectionResultScreen({
    super.key,
    required this.carNumber,
    required this.imageUrl,
    required this.locationDescription,
    required this.violation,
  });

  @override
  Widget build(BuildContext context) {
    final String resultMessage = violation
        ? "🚨 AI가 불법 주차 차량을 감지했습니다"
        : "✅ 정상 주차 상태입니다.";
    final Color statusColor = violation ? Colors.redAccent : Colors.green;

    return CommonLayout(
      currentIndex: 0, // 하단 네비게이션에서 현재 선택 인덱스
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resultMessage,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 차량 사진
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(child: Text("이미지를 불러올 수 없습니다")),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 차량 번호
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.directions_car),
                title: Text("차량 번호: $carNumber"),
              ),
            ),
            const SizedBox(height: 20),

            // 위치 정보
            const Text(
              "🚧 발생 위치",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(locationDescription, textAlign: TextAlign.center),
            ),

            const SizedBox(height: 30),
            // 신고 버튼
            if (violation)
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("신고가 접수되었습니다.")),
                    );
                  },
                  icon: const Icon(Icons.report_gmailerrorred),
                  label: const Text("불법 주차 신고하기"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ),

            const SizedBox(height: 40),
            const Text(
              "📝 피드백 남기기",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: feedbackController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "AI 판단에 대해 의견이 있다면 입력해 주세요...",
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  final feedback = feedbackController.text;
                  if (feedback.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("피드백 제출됨: \$feedback")),
                    );
                    feedbackController.clear();
                  }
                },
                child: const Text("제출"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}