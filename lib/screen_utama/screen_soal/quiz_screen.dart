import 'package:flutter/material.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen(this.activescreen, {super.key});
  final void Function() activescreen;
  @override
  State<QuizScreen> createState() {

    return _QuizScreenTemp();
  }
}

class _QuizScreenTemp extends State<QuizScreen>{
  @override
  Widget build(BuildContext context) {
    
    return Text("screen soal");
  }
}