import 'package:flutter/material.dart';

class AvatarData {
  final String imagePath;
  final Color backgroundColor;

  AvatarData({required this.imagePath, required this.backgroundColor});
}

List<AvatarData> dummyAvatarData = [
  AvatarData(
      imagePath: 'assets/images/avatar_1.png', backgroundColor: Color(0xffDCDCDC)),
  AvatarData(
      imagePath: 'assets/images/avatar_2.png', backgroundColor: Color(0xffCAEDFD)),

  // Tambahkan lebih banyak data avatar jika diperlukan
];
