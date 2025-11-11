import 'package:flutter/material.dart';
import 'package:t3_2/widgets/education_card.dart';
import 'package:t3_2/widgets/expandable_section.dart';
import 'package:t3_2/widgets/work_experience_card.dart';
import 'package:t3_2/widgets/languages_card.dart';

// Paleta de colores
const Color primaryGreen = Color(0xFF4CAF50);
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
        colorScheme: ColorScheme.fromSeed(seedColor: primaryGreen,),
      ),
      home: const MyHomePage(title: 'Curriculum Vitae'),
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

  final List<String> publicationsData = [
    'Calo Mosquera, N., García-Rodeja Gayoso, I. y Sesto Varela, V. (2021). Construyendo conceptos sobre electricidad en infantil mediante actividades de indagación. Enseñanza de las Ciencias, 39(2), 223-240. https://doi.org/10.5565/rev/ensciencias.3238',
  ];
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
          title: const Text(
            'Información de Contacto',
            style: TextStyle(color: contentDarkGrey, fontWeight: FontWeight.bold),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Puedes contactarme a través de:'),
              const SizedBox(height: 12), 
              const Row(
                children: [
                  Icon(Icons.email, color: primaryGreen, size: 20), 
                  SizedBox(width: 8), 
                  Expanded( 
                    child: Text(
                      'nuriacalomosquera@gmail.com',
                      style: TextStyle(fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.phone, color: primaryGreen, size: 20),
                  SizedBox(width: 8),
                  Text(
                    '+34 666 67 66 76',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el ancho de la pantalla para usarlo en varios sitios
    final screenWidth = MediaQuery.of(context).size.width;
    // Definimos un margen/padding horizontal responsivo
    final horizontalPadding = screenWidth > 600 ? screenWidth * 0.15 : 16.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Stack(
                alignment: Alignment
                    .bottomCenter, 
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.only(top: 16, bottom: 16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/nuria.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    // Etiqueta superpuesta
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: primaryGreen.withAlpha(200),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Desarrolladora Multiplataforma',
                      style: TextStyle(color: contentDarkGrey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Column(
                children: [                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Column(
                      children: [
                        Text(
                          'Nuria Calo Mosquera',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            fontFamily: 'Arial',
                            color: contentDarkGrey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.code, color: secondaryGrey, size: 18),
                                SizedBox(width: 8),
                                Text(
                                  'github.com/nuriacalo',
                                  style: TextStyle(
                                    color: secondaryGrey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.group, color: secondaryGrey, size: 18),
                                SizedBox(width: 8),
                                Text(
                                  'linkedin.com/in/nuriacalo',
                                  style: TextStyle(
                                    color: secondaryGrey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: _buildSectionDivider(context)),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.work, color: primaryGreen),
                    SizedBox(width: 8),
                    Text(
                      'Experiencia Laboral',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Arial',
                        color: contentDarkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverList.builder(
              itemCount: workExperienceData.length,
              itemBuilder: (context, index) {
                final experience = workExperienceData[index];
                return WorkExperience(
                  company: experience['company'],
                  role: experience['role'],
                  startDate: experience['startDate'],
                  endDate: experience['endDate'],
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: _buildSectionDivider(context)),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.school, color: primaryGreen),
                    SizedBox(width: 8),
                    Text(
                      'Educación',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Arial',
                        color: contentDarkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverList.builder(
              itemCount: educationData.length,
              itemBuilder: (context, index) {
                final education = educationData[index];
                return Education(
                  institution: education['institution'],
                  degree: education['degree'],
                  startDate: education['startDate'],
                  endDate: education['endDate'],
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: _buildSectionDivider(context)),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.language, color: primaryGreen),
                    SizedBox(width: 8),
                    Text(
                      'Idiomas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Arial',
                        color: contentDarkGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SliverList.builder(
              itemCount: languagesData.length,
              itemBuilder: (context, index) {
                final language = languagesData[index];
                return Languages(
                  language: language['language']!,
                  level: language['level']!,
                  certification: language['certification'],
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: _buildSectionDivider(context)),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverList.builder(
              itemCount: skillsData.length,
              itemBuilder: (context, index) {
                final category = skillsData.keys.elementAt(index);
                List<String> skills = skillsData[category]!;
                return ExpandableSection(
                  key: ValueKey(category),
                  title: category,
                  children: [
                    for (final skill in skills) ListTile(title: Text(skill)),
                  ],
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: _buildSectionDivider(context)),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.article, color: primaryGreen),
                    SizedBox(width: 8),
                    Text(
                      'Publicaciones',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Arial',
                        color: contentDarkGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverList.builder(
              itemCount: publicationsData.length,
              itemBuilder: (context, index) {
                final publication = publicationsData[index];
                final horizontalMargin =
                    screenWidth > 600 ? screenWidth * 0.15 : 16.0;
                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: horizontalMargin,
                    vertical: 8.0,
                  ),
                  elevation: 2.0,
                  shadowColor: primaryGreen.withAlpha(102),
                  color: backgroundWhite,
                  child: ListTile(title: Text(publication)),
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _contact,
        tooltip: 'Contact',
        backgroundColor: primaryGreen,
        child: const Icon(Icons.contact_mail, color: backgroundWhite, size: 32),
      ),
    );
  }

  Widget _buildSectionDivider(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalIndent = screenWidth > 600 ? screenWidth * 0.15 : 12.0;

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: secondaryGrey,
            thickness: 2,
            indent: horizontalIndent,
            endIndent: 6,
          ),
        ),
        const Icon(Icons.computer, color: primaryGreen),
        Expanded(
          child: Divider(
            color: secondaryGrey,
            thickness: 2,
            indent: 6,
            endIndent: horizontalIndent,
          ),
        ),
      ],
    );
  }
}
