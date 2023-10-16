import 'package:cineplus/avatar_profile_screen.dart';
import 'package:cineplus/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/' :  (context) => const SplashScreen() ,
        '/avatar-profile' : (context) => const AvatarProfileScreen()
      },
      initialRoute: '/',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {


//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       backgroundColor:  Color(0xff121212),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: Container(
//         width: double.infinity,
//         // color: Color(0xffA1A1A1),
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: FloatingActionButton.extended(
//             backgroundColor: Color(0xff9D24C7),  
//             onPressed: (){} , label: Text("Next")),
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Color(0xff121212),
//         title: Text("Setup profile" , style: GoogleFonts.plusJakartaSans(
//           fontWeight: FontWeight.bold,
//           fontSize: 20
//         ), ),
//         elevation: 0,
      
//       ) ,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                 Text("Choose avatar" , style: GoogleFonts.plusJakartaSans(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white
//                 ),),
        
//                 SizedBox(height: 17,),
        
//                Row(children: [
//                  Avatar(),
//                  Avatar(),
//                   Avatar(),
             
//                ],)
        
                
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Avatar extends StatelessWidget {
//   const Avatar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        width: 100,
//        margin: EdgeInsets.symmetric(horizontal: 4),
//        height: 100,
//        decoration: BoxDecoration(
//            color: Color(0xffFFDBA9),
//            borderRadius: BorderRadius.all(Radius.circular(10))),
//        child: Center(
//            child: Image.asset(
//          'assets/images/avatar_1.png',
//          width: 80,
//          height: 80,
//          fit: BoxFit.cover,
//        )),
//      );
//   }
// }
