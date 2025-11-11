import 'package:flutter/material.dart';
import 'package:t3_2/main.dart';

class WorkExperience extends StatelessWidget {
  final String company;
  final String role;
  final DateTime startDate;
  final DateTime? endDate;

  const WorkExperience({
    super.key,
    required this.company,
    required this.role,
    required this.startDate,
    this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    // Obtenemos el ancho de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;

    // Definimos un margen horizontal responsivo
    final horizontalMargin = screenWidth > 600 ? screenWidth * 0.15 : 16.0;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 8.0),
      elevation: 2.0,
      shadowColor: primaryGreen.withAlpha(102),
      color: backgroundWhite,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: contentDarkGrey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Puesto: $role",
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
    );
  }
}
