import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resikuu/data/model/custom_exception.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.e,
  });

  final CustomException e;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Error'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 160),
            const SizedBox(height: 32),
            Text("Status code: ${e.statusCode ?? '-'}"),
            const SizedBox(height: 16),
            Text(e.message ?? "Uknowwn Error")
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
