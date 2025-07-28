
import 'package:flutter/material.dart';
import 'package:tetwo/data/question.dart';
import 'package:tetwo/screen_utama/screen_hasil/summary_question.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key, required this.choosenSelect});
  final List<String>choosenSelect;

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

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You answer $numCorrectAnswer out of $numTotalAnswer question correctly!"),
              const SizedBox(height: 30,),
              SummaryQuestion(summaryListData),
            ],
          ),
        ),
    );
  }
}