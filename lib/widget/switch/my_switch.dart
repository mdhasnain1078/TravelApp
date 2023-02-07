import 'package:flutter/material.dart';

class MySwitch extends StatelessWidget {
  const MySwitch(
      {super.key,
      required this.image,
      this.height,
      this.width,
      this.onTap,
      required this.title,
      required this.borderColor});
  final Image image;
  final String title;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // padding: const EdgeInsets.all(10),
        height: height ?? 60,
        width: width ?? 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
