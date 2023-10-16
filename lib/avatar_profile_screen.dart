import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AvatarProfileScreen extends StatefulWidget {
  const AvatarProfileScreen({super.key});


  @override
  State<AvatarProfileScreen> createState() => _AvatarProfileScreenState();
}

class _AvatarProfileScreenState extends State<AvatarProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xff121212),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        // color: Color(0xffA1A1A1),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton.extended(
              backgroundColor: Color(0xff9D24C7),
              onPressed: () {},
              label: Text("Next")),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        title: Text(
          "Setup profile",
          style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold, fontSize: 20),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose avatar",
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  Avatar(),
                  Avatar(),
                  Avatar(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 100,
      decoration: BoxDecoration(
          color: Color(0xffFFDBA9),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
          child: Image.asset(
        'assets/images/avatar_1.png',
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      )),
    );
  }
}
