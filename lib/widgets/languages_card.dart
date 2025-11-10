import 'package:flutter/material.dart';
import 'package:t3_2/main.dart';

class Languages extends StatelessWidget {
  final String language;
  final String level;
  final String? certification;

  const Languages({
    super.key,
    required this.language,
    required this.level,
    this.certification,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2.0,
      shadowColor: primaryGreen.withAlpha(102),
      color: backgroundWhite,
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                language,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: contentDarkGrey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Nivel: $level",
                style: TextStyle(fontSize: 16, color: secondaryGrey),
              ),
              const SizedBox(height: 4),
              if (certification != null)
                Text(
                  "Certificado: $certification",
                  style: TextStyle(fontSize: 16, color: secondaryGrey),
                ),
            ],
          ),
        ),
    );
  }
}
