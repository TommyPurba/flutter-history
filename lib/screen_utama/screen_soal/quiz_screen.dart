  import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:tetwo/data/question.dart';
  import 'package:tetwo/screen_utama/screen_soal/choice_button/answer_button.dart';


  class QuizScreen extends StatefulWidget {
    const QuizScreen({super.key, required this.onSelectAnswer});
  
    final void Function(String answer) onSelectAnswer;


    @override
    State<QuizScreen> createState() {

      return _QuizScreenTemp();
    }
  }

  class _QuizScreenTemp extends State<QuizScreen>{
    var currentQuestionIndex = 0;
    void answerQuestion(String answer){
      widget.onSelectAnswer(answer);
      setState(() {
        currentQuestionIndex++;
      });
    }
    @override
    Widget build(BuildContext context) {
      final questionData = questions[currentQuestionIndex];
      
      return Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(62, 39, 35, 1),   // Cokelat tua pekat
                  Color.fromRGBO(93, 64, 55, 1),   // Cokelat sedikit lebih terang
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  questionData.text,
                  style: GoogleFonts.lato(
                    color: Color.fromRGBO(255, 253, 208, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30,),
                ...questionData.getShuffelAnswer().map((answer){
                  return AnswerButton(answer: answer, onTap: (){
                    answerQuestion(answer);
                  });
                })
              ],
            ),
          ),
        ),
      );
    }
  }