import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const TextBtn({super.key,
  required this.title,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(title, style: TextStyle(
        color: Colors.deepPurple, fontWeight: FontWeight.bold,
      ),),
    );
  }
}
