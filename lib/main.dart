import 'dart:math';

import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 231, 235, 231),
        ),
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
        color: Colors.grey[200],
        border: Border(
          top: BorderSide(color: Colors.grey.shade400, width: 1.0),
          bottom: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.email, size: 24, color: Colors.green),
              SizedBox(width: 8.0),
              Text('Email: $email', style: TextStyle(fontSize: 16)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone, size: 24, color: Colors.green),
              SizedBox(width: 8.0),
              Text('Teléfono: $phone', style: TextStyle(fontSize: 16)),
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
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(
          top: BorderSide(color: Colors.grey.shade400, width: 1.0),
          bottom: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Empresa: $company",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text("Puesto: $role", style: TextStyle(fontSize: 16)),
          Text(
            "Período Laboral: ${startDate.month}/${startDate.year} - ${endDate != null ? '${endDate?.month}/${endDate?.year}' : 'Presente'}",
            style: TextStyle(fontSize: 16),
          ),
        ],
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
              ),
              textAlign: TextAlign.justify,
            ),
            ContactInfo(
              email: 'nuriacalomosquera@gmail.com',
              phone: '666 66 66 66',
            ),
            workExperience(
              company: "Clúster TIC Galicia",
              role: "Bootcap de formación en desarrollo web",
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
      floatingActionButton: FloatingActionButton(
        onPressed: _contact,
        tooltip: 'Contact',
        child: const Icon(Icons.contact_mail),
      ),
    );
  }
}
