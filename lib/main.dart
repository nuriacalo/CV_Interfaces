import 'dart:math';

import 'package:flutter/material.dart';

// Paleta de colores
const Color primaryGreen = Color(0xFF4CAF50);
const Color backgroundWhite = Color(0xFFFFFFFF);
const Color contentDarkGrey = Color(0xFF333333);
const Color secondaryGrey = Color(0xFF757575);
const Color accentNavyBlue = Color(0xFF1A237E);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Nuria Calo Mosquera',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryGreen),
      ),
      home: const MyHomePage(title: 'Nuria Calo Mosquera'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ContactInfo extends StatelessWidget {
  final String email;
  final String phone;

  const ContactInfo({super.key, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundWhite,
        border: Border(
          top: BorderSide(color: secondaryGrey, width: 1.0),
          bottom: BorderSide(color: secondaryGrey, width: 1.0),
        ),
      ),
      margin: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.email, size: 24, color: primaryGreen),
              SizedBox(width: 8.0),
              Text(
                'Email: $email',
                style: TextStyle(fontSize: 16, color: secondaryGrey),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone, size: 24, color: primaryGreen),
              SizedBox(width: 8.0),
              Text(
                'Teléfono: $phone',
                style: TextStyle(fontSize: 16, color: secondaryGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class workExperience extends StatelessWidget {
  final String company;
  final String role;
  final DateTime startDate;
  final DateTime? endDate;

  const workExperience({
    super.key,
    required this.company,
    required this.role,
    required this.startDate,
    this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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

class education extends StatelessWidget {
  final String institution;
  final String degree;
  final DateTime startDate;
  final DateTime? endDate;

  const education({
    super.key,
    required this.institution,
    required this.degree,
    required this.startDate,
    this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
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
            Text(degree, style: TextStyle(fontSize: 16, color: secondaryGrey)),
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

class _MyHomePageState extends State<MyHomePage> {
  void _contact() {
    setState(() {
      // Add your contact logic here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/avatar.jpg'),
                  ),
                ),
              ),
              const Text(
                'Nuria Calo Mosquera',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  fontFamily: 'Arial',
                  color: contentDarkGrey,
                ),
                textAlign: TextAlign.justify,
              ),
              ContactInfo(
                email: 'nuriacalomosquera@gmail.com',
                phone: '666 66 66 66',
              ),
              const SizedBox(height: 16),
              const Text(
                'Experiencia Laboral',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'Arial',
                  color: accentNavyBlue,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                color: backgroundWhite,
                child: Column(
                  children: [
                    workExperience(
                      company: "Clúster TIC Galicia",
                      role: "Bootcamp de formación en desarrollo web",
                      startDate: DateTime(2025, 5),
                      endDate: DateTime(2025, 7),
                    ),
                    workExperience(
                      company: "Vegalsa S.A.",
                      role: "Cajera",
                      startDate: DateTime(2022, 7),
                      endDate: DateTime(2024, 1),
                    ),
                    workExperience(
                      company: "El Corte Inglés S.A",
                      role: "Dependienta",
                      startDate: DateTime(2020, 7),
                      endDate: DateTime(2022, 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Educación',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'Arial',
                  color: accentNavyBlue,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                color: backgroundWhite,
                child: Column(
                  children: [
                    education(
                      institution: "IES Fernando Wirtz Súarez",
                      degree:
                          "FP Dual Superior en Desarrollo de Aplicaciones Multiplataforma",
                      startDate: DateTime(2024, 9),
                    ),
                    education(
                      institution: "Universidad de Santiago de Compostela",
                      degree: "Grado en Maestra de Educación Infantil",
                      startDate: DateTime(2014, 9),
                      endDate: DateTime(2018, 6),
                    ),
                    education(
                      institution:
                          "Centro de Recursos educativos de la ONCE, Pontevedra",
                      degree: "Braille en abierto",
                      startDate: DateTime(2024, 3),
                      endDate: DateTime(2024, 5),
                    ),
                    education(
                      institution: "Universidad de Nebrija",
                      degree:
                          "Atención al Alumnado con alteraciones del Comportamiento o Hiperactividad",
                      startDate: DateTime(2021, 1),
                      endDate: DateTime(2021, 4),
                    ),
                    education(
                      institution: "Universidad de Nebrija",
                      degree:
                          "Atención al Alumnado con Discapacidad Física o Sobredotación Intelectual",
                      startDate: DateTime(2020, 3),
                      endDate: DateTime(2020, 4),
                    ),
                    education(
                      institution: "Universidad de Nebrija",
                      degree: "Atención al Alumnado con Discapacidad Sensorial",
                      startDate: DateTime(2019, 1),
                      endDate: DateTime(2019, 3),
                    ),
                    education(
                      institution: "Universidad de Nebrija",
                      degree: "Educando en Valores la Paz y la Igualdad",
                      startDate: DateTime(2019, 2),
                      endDate: DateTime(2019, 4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _contact,
        tooltip: 'Contact',
        backgroundColor: primaryGreen,
        child: const Icon(Icons.contact_mail, color: backgroundWhite),
      ),
    );
  }
}
