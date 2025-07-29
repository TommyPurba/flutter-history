import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SummaryQuestion extends StatelessWidget{
  const SummaryQuestion(this.summaryData, {super.key});

 final  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data){
              final bool isCorrectAnswer = 
                      data['user_answer'] == data['correct_answer'];
              return Padding(
                padding: EdgeInsets.all(1.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: isCorrectAnswer? Colors.green[600]:Colors.red[600],
                      child: Text(
                        ((data['question_index'] as int) +1).toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        
                      ),
                    ),

                    // Teks soal & jawaban
                    SizedBox(width: 20,),
                    Expanded( 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: TextStyle(
                                 color: const Color.fromARGB(255, 246, 109, 109),
                                 fontSize: 16,
                                 fontWeight: FontWeight.w600,
                               ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                            data['user_answer'] as String,
                            style: GoogleFonts.poppins(
                               color: isCorrectAnswer
                                ? const Color.fromARGB(255, 192, 222, 194) // Krem kehijauan
                                : const Color.fromARGB(255, 246, 109, 109), // Merah
                               fontSize: 14,
                             ),
                          
                            ),
                            if (!isCorrectAnswer)
                            Text(
                              data['correct_answer'] as String,
                              style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 126, 203, 129), // Hijau
                                fontSize: 14,
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
            ).toList(),
        ),
      ),
    );
  }

}