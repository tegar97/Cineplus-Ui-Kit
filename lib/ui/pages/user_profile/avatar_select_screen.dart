import 'dart:ui';

import 'package:cineplus/core/data/local/dummy/avatar_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cineplus/ui/config/theme.dart';

class AvatarSelectScreen extends StatefulWidget {
  const AvatarSelectScreen({Key? key});

  @override
  _AvatarSelectScreenState createState() => _AvatarSelectScreenState();
}

class _AvatarSelectScreenState extends State<AvatarSelectScreen> {
  int selectedAvatarIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildNextButton(),
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          "Setup profile",
          style: headingTextStyle,
        ),
        elevation: 0,
      ),
      body: buildBody(),
    );
  }

  Widget buildNextButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Padding(
        padding: const EdgeInsets.all(defaultMargin),
        child: FloatingActionButton.extended(
          backgroundColor:
              selectedAvatarIndex != -1 ? primaryColor : Colors.grey,
          onPressed: () {
            if (selectedAvatarIndex != -1) {
              // Navigasi ke halaman home
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          label: const Text("Next"),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose avatar",
            style: subHeadingTextStyle,
          ),
          const SizedBox(
            height: 17,
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: dummyAvatarData.length,
            itemBuilder: (context, index) => buildAvatar(index),
          ),
        ],
      ),
    );
  }

  Widget buildAvatar(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedAvatarIndex = index;
        });
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 4),
        height: 100,
        decoration: BoxDecoration(
          color: selectedAvatarIndex == index
              ? primaryColor
              : dummyAvatarData[index].backgroundColor,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Tambahkan gambar avatar
            Image.asset(
              dummyAvatarData[index].imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            // Tambahkan icon checklist saat dipilih
            if (selectedAvatarIndex == index)
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Icon(
                  Icons.check,
                  size:  40,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
