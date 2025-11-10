import 'package:flutter/material.dart';
import 'package:t3_2/widgets/education_card.dart';
import 'package:t3_2/widgets/expandable_section.dart';
import 'package:t3_2/widgets/languages_card.dart';
import 'package:t3_2/widgets/work_experience_card.dart';

// Paleta de colores
const Color primaryGreen = Color(0xFF4CAF50);
const Color accentOrange = Color(0xFFFFA726);
const Color backgroundWhite = Color(0xFFFFFFFF);
const Color contentDarkGrey = Color(0xFF333333);
const Color secondaryGrey = Color(0xFF757575);

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
        scaffoldBackgroundColor: backgroundWhite,
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

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> workExperienceData = [
    {
      'company': 'Clúster TIC Galicia',
      'role': 'Bootcamp de formación en desarrollo web',
      'startDate': DateTime(2025, 5),
      'endDate': DateTime(2025, 7),
    },
    {
      'company': 'Vegalsa S.A.',
      'role': 'Cajera',
      'startDate': DateTime(2022, 7),
      'endDate': DateTime(2024, 1),
    },
    {
      'company': 'El Corte Inglés S.A.',
      'role': 'Dependienta',
      'startDate': DateTime(2020, 7),
      'endDate': DateTime(2022, 1),
    },
    {
      'company': 'Primark S.L.',
      'role': 'Dependienta',
      'startDate': DateTime(2018, 7),
      'endDate': DateTime(2020, 1),
    },
  ];

  final List<Map<String, dynamic>> educationData = [
    {
      'institution': 'IES Fernando Wirtz Súarez',
      'degree': 'FP Superior en Desarrollo de Aplicaciones Multiplataforma',
      'startDate': DateTime(2024, 9),
      'endDate': null,
    },
    {
      'institution': 'Universidad de Santiago de Compostela',
      'degree': 'Grado en Maestra de Educación Infantil',
      'startDate': DateTime(2014, 9),
      'endDate': DateTime(2018, 6),
    },
    {
      'institution': 'Centro de Recursos educativos de la ONCE, Pontevedra',
      'degree': 'Braille en abierto',
      'startDate': DateTime(2024, 3),
      'endDate': DateTime(2024, 5),
    },
    {
      'institution': 'Universidad de Nebrija',
      'degree':
          "Atención al Alumnado con alteraciones del Comportamiento o Hiperactividad",
      'startDate': DateTime(2021, 1),
      'endDate': DateTime(2021, 4),
    },
    {
      'institution': 'Universidad de Nebrija',
      'degree':
          "Atención al Alumnado con Discapacidad Física o Sobredotación Intelectual",
      'startDate': DateTime(2020, 3),
      'endDate': DateTime(2020, 4),
    },
    {
      'institution': 'Universidad de Nebrija',
      'degree': "Atención al Alumnado con Discapacidad Sensorial",
      'startDate': DateTime(2019, 1),
      'endDate': DateTime(2019, 3),
    },
    {
      'institution': "Universidad de Nebrija",
      'degree': "Educando en Valores la Paz y la Igualdad",
      'startDate': DateTime(2019, 2),
      'endDate': DateTime(2019, 4),
    },
  ];

  final Map<String, List<String>> skillsData = {
    'Lengajes de Programación': [
      'Dart',
      'Java',
      'Kotlin',
      'HTML',
      'CSS',
      'TypeScript',
    ],
    'Frameworks': ['Flutter', 'Spring Boot', 'Angular'],
    'Bases de Datos': ['MySQL', 'PostgreSQL'],
  };

  final List<Map<String, String?>> languagesData = [
    {'language': 'Gallego', 'level': 'Nativo'},
    {'language': 'Español', 'level': 'Nativo'},
    {'language': 'Inglés', 'level': 'C1', 'certification': 'Oxford'},
  ];

  void _contact() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: const Text(
            'Información de Contacto',
            style: TextStyle(color: contentDarkGrey),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Puedes contactarme a través de:'),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.mail, color: primaryGreen),
                title: const Text('nuriacalomosquera@gmail.com'),
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: primaryGreen),
                title: const Text('+34 666 67 66 67'),
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cerrar',
                style: TextStyle(color: primaryGreen),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: primaryGreen, title: Text(widget.title)),
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 250,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/avatar.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: Text(
                      'Nuria Calo Mosquera',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        fontFamily: 'Arial',
                        color: Colors.white,
                        shadows: [
                          Shadow(blurRadius: 10.0, color: Colors.black)
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 12)),
            SliverToBoxAdapter(child: _buildSectionDivider()),
            SliverToBoxAdapter(child: const SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: _buildSectionTitle('Experiencia Laboral'),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 12)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final workExperience = workExperienceData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: WorkExperience(
                    company: workExperience['company'],
                    role: workExperience['role'],
                    startDate: workExperience['startDate'],
                    endDate: workExperience['endDate'],
                  ),
                );
              }, childCount: workExperienceData.length),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 18)),
            SliverToBoxAdapter(child: _buildSectionDivider()),
            SliverToBoxAdapter(child: const SizedBox(height: 18)),
            SliverToBoxAdapter(child: _buildSectionTitle('Educación')),
            SliverToBoxAdapter(child: const SizedBox(height: 12)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final education = educationData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Education(
                    institution: education['institution'],
                    degree: education['degree'],
                    startDate: education['startDate'],
                    endDate: education['endDate'],
                  ),
                );
              }, childCount: educationData.length),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 18)),
            SliverToBoxAdapter(child: _buildSectionDivider()),
            SliverToBoxAdapter(child: const SizedBox(height: 18)),
            SliverToBoxAdapter(child: _buildSectionTitle('Idiomas')),
            SliverToBoxAdapter(child: const SizedBox(height: 12)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final lang = languagesData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Lenguages(
                    language: lang['language']!,
                    level: lang['level']!,
                    certification: lang['certification'],
                  ),
                );
              }, childCount: languagesData.length),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 24)),
            SliverToBoxAdapter(child: _buildSectionDivider()),
            SliverToBoxAdapter(child: const SizedBox(height: 18)),
            SliverToBoxAdapter(
              child: _buildSectionTitle('Información Adicional'),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 12)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                String category = skillsData.keys.elementAt(index);
                List<String> skills = skillsData[category]!;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ExpandableSection(
                    title: category,
                    children: [
                      for (final skill in skills) ListTile(title: Text(skill)),
                    ],
                  ),
                );
              }, childCount: skillsData.length),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 24)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _contact,
        tooltip: 'Contacto',
        backgroundColor: accentOrange,
        child: const Icon(Icons.contact_mail, color: backgroundWhite),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: 'Arial',
        color: primaryGreen,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSectionDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: primaryGreen.withAlpha(102),
            thickness: 2,
            indent: 12,
            endIndent: 6,
          ),
        ),
        const Icon(Icons.star, color: primaryGreen),
        Expanded(
          child: Divider(
            color: primaryGreen.withAlpha(102),
            thickness: 2,
            indent: 6,
            endIndent: 12,
          ),
        ),
      ],
    );
  }
}
