import 'package:flutter/material.dart';
import 'package:try_app/summary/summary_item_final.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 470,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (data) {
                return SummaryItem(itemData: data);
              },
            )
          ],
        ),
      ),
    );
  }
}
