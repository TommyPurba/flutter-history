import 'package:flutter/material.dart';


class SummaryQuestion extends StatelessWidget{
  const SummaryQuestion(this.summaryData, {super.key});

 final  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: summaryData.map(
          (data){
            return Padding(
              padding: EdgeInsets.all(1.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ((data['question_index'] as int) +1).toString(),
                  ),
                  SizedBox(height: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String
                        )
                    ],
                  )
                ],
              ),
            );
          }
          ).toList(),
      ),
    );
  }

}