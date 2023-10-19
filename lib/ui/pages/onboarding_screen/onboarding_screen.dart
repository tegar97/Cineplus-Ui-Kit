import 'package:cineplus/ui/config/theme.dart';
import 'package:cineplus/ui/pages/user_profile/avatar_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/data/local/dummy/onboarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
              backgroundColor: backgroundColor,
  
        elevation: 0,
        actions: [
          Padding(padding: EdgeInsets.only(right: 16,left: 16) , child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
              TextButton(child: Text("Skip" , style: subtitleTextStyle.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )  , onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AvatarSelectScreen(),
                        ));
              },),
                Icon(Icons.arrow_right_alt)
            ],
          ),)
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80,left: 16,right: 16),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (_, i) {
                    return buildPageViewContent(i);
                  },
                ),
              ),
              buildPageViewIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageViewContent(int i) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: defaultMargin, right: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            '${contents[i].image}',
            width: 324,
            height: 355,
          ),
          Text(
            contents[i].title.toString(),
            style: GoogleFonts.plusJakartaSans(
              textStyle: headingTextStyle,
            ),
          ),
          SizedBox(height: 10),
          Text(
            contents[i].description.toString(),
            style: subtitleTextStyle.copyWith(
              fontSize: 14,
              color: Color(0xffE1E1E1)
            )
          ),
          SizedBox(height: 10),
          Text(contents[i].description.toString()),
          buildActionButton(i),
        ],
      ),
    );
  }

  Widget buildActionButton(int i) {
    return currentIndex == contents.length - 1
        ? TextButton(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Color(0xff9D24C7),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AvatarSelectScreen(),
                  ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Continue"),
                Icon(Icons.arrow_right_alt),
              ],
            ),
          )
        : TextButton(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Color(0xff9D24C7),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              _controller?.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Next"),
                Icon(Icons.arrow_right_alt),
              ],
            ),
          );
  }

  Widget buildPageViewIndicator() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          contents.length,
          (index) => buildBubbleDot(index),
        ),
      ),
    );
  }

  Container buildBubbleDot(int index) {
    return Container(
      height: 8,
      width: currentIndex == index ? 35 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.white : Color(0xff717171),
      ),
    );
  }
}
