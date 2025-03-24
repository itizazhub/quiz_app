import 'package:flutter/material.dart';

import 'package:quiz_app/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * .6,
      height: 300,
      child: ListView.builder(
        itemCount: summaryData.length,
        itemBuilder: (context, index) {
          return SummaryItem(summaryData[index]);
        },
      ),
    );
  }
}
