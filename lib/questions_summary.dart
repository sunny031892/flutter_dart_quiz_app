import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data['user_answer'] == data['correct_answer']
                            ? const Color.fromARGB(255, 150, 198, 241)
                            : const Color.fromARGB(255, 249, 133, 241)),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                    ),
                  ),
                const SizedBox(width: 5,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),),
                        const SizedBox(height: 10,),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(color: Color.fromARGB(255, 202, 171, 252)),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style:const  TextStyle(color: Color.fromARGB(255, 181, 254, 246),),
                        ),
                        const SizedBox(height: 10,),
                      ],
                  
                    ),
                  )
                ],
              );
            }
          ).toList(),
        ),
      ),
    );
  }
}
