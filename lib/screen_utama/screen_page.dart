import 'package:flutter/material.dart';
import 'package:tetwo/screen_utama/screen_soal/quiz_screen.dart';
import 'package:tetwo/screen_utama/start_screen/start_screen.dart';


class ScreenPage extends StatefulWidget{
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() {
    return _ScreenPageTemplate();
  }
}

class _ScreenPageTemplate extends State<ScreenPage>{
  // pertama buat variabel untuk menentukan class mana yang di panggil, 
  var activeScreen = "active_screen" ;
  void swicthScreen (){
    setState(() {
      activeScreen = "quiz_screen";
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(swicthScreen);
    if(activeScreen == 'quiz_screen'){
      screenWidget = QuizScreen(swicthScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
             colors: [
                Color.fromRGBO(54, 69, 79, 1),   // Abu-abu arang (di atas)
                Color.fromRGBO(79, 79, 79, 1),   // Abu-abu sedikit lebih terang (di bawah)
              ],
              begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            )
          ),
          child: Center(
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}