import 'package:cineplus/ui/config/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultMargin),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Home",
                          style: headingTextStyle,
                        ),
                      ),
                      Row(
                        children: [
                       
                          TextButton(
                            child: Text(
                              "See more",
                              style: subtitleTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                                          Icon(Icons.arrow_right_alt,color: Colors.white,)

                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
