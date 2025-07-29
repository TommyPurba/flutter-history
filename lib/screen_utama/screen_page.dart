import 'package:flutter/material.dart';
import 'package:tetwo/data/question.dart';
import 'package:tetwo/screen_utama/screen_hasil/result_screen.dart';
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
  // menampung jawaban yang sudah di select
  List<String> selectAnswer = [];
  void swicthScreen (){
    selectAnswer = [];
    setState(() {
      activeScreen = "quiz_screen";
    });
  }
  void answerSelect (String answer){
/// fungsinya untuk memasukkan data jawaban yang sudah dipilih ke list select answer
    selectAnswer.add(answer);
    if(selectAnswer.length == questions.length){
      setState(() {
        activeScreen = "result_screen";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(swicthScreen);
    if(activeScreen == 'quiz_screen'){
      screenWidget = QuizScreen(onSelectAnswer: answerSelect,);
    }
     if(activeScreen == 'result_screen'){
      screenWidget = ResultScreen(choosenSelect: selectAnswer, swicthScreen);
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