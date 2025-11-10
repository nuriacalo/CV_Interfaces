import 'package:flutter/material.dart';
import 'package:t3_2/main.dart';

class Education extends StatelessWidget {
  final String institution;
  final String degree;
  final DateTime startDate;
  final DateTime? endDate;

  const Education({
    super.key,
    required this.institution,
    required this.degree,
    required this.startDate,
    this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: primaryGreen.withAlpha(102),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: backgroundWhite,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                institution,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: contentDarkGrey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                degree,
                style: TextStyle(fontSize: 16, color: secondaryGrey),
              ),
              const SizedBox(height: 4),
              Text(
                "${startDate.month}/${startDate.year} - ${endDate != null ? '${endDate?.month}/${endDate?.year}' : 'Presente'}",
                style: TextStyle(fontSize: 16, color: secondaryGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}