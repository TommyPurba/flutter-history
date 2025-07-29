
  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
  import 'package:tetwo/data/question.dart';
  import 'package:tetwo/screen_utama/screen_hasil/summary_question.dart';

  class ResultScreen extends StatelessWidget{
    const ResultScreen(this.restardQuiz, {super.key, required this.choosenSelect});
    final List<String>choosenSelect;
    final void Function() restardQuiz;

    List<Map<String, Object>> getSummaryData(){
        final List<Map<String, Object>> summary =[];
        for(var i=0; i<choosenSelect.length;i++){
          summary.add({
                'question_index' : i,
                'question' : questions[i].text,
                'user_answer' : choosenSelect[i],
                'correct_answer' : questions[i].answer[0],
          });
        
        }
        return summary;
    }
    @override
    Widget build(BuildContext context) {
      final summaryListData = getSummaryData();
      final numTotalAnswer = questions.length;
      final numCorrectAnswer = summaryListData.where(
        (data){
          return data['correct_answer'] == data['user_answer'];
        }
      ).length;

      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:   [
                    Color.fromRGBO(62, 39, 35, 1),   // Cokelat tua pekat
                    Color.fromRGBO(93, 64, 55, 1),   // Cokelat sedikit lebih terang
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
            )
        ),
        child: SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You answer $numCorrectAnswer out of $numTotalAnswer question correctly!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 253, 208, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  SummaryQuestion(summaryListData),
                  const SizedBox(height: 30,),
                  TextButton.icon(
                    onPressed: restardQuiz,
                    style: TextButton.styleFrom(
                      // Mengatur warna untuk ikon dan teks
                      foregroundColor: const Color.fromRGBO(255, 253, 208, 1), // Warna Krem
                    ),
                    icon: const Icon(Icons.refresh),
                    label: Text(
                      'Restart Quiz', // Typo diperbaiki
                      style: GoogleFonts.poppins(
                        fontSize: 16, // Ukuran font untuk tombol
                      ),
                    ),
                  )
                ],
              ),
            ),
        ),
      );
    }
  }