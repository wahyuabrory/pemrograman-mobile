import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peduli Lindungi',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Entering a public space?',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Stay alert to stay safe',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Image.asset('images/illustration-scan.png'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.keyboard_arrow_down),
                    SizedBox(width: 8.0),
                    Text(
                      'Check-in Preference',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    color: Colors.blue,
                  ),
                  label: const Text(
                    'Check-in',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 192, 226, 255),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const MenuSection(),
        ],
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  const MenuSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: const [
                  MenuCard(
                    backgroundColor: Color.fromARGB(255, 209, 241, 212),
                    serviceName: 'COVID-19 Vaccine',
                    icon: Icons.local_hospital,
                    iconColor: Color.fromARGB(255, 133, 231, 21),
                  ),
                  MenuCard(
                    backgroundColor: Color.fromARGB(255, 209, 241, 212),
                    serviceName: 'COVID-19 Test Result',
                    icon: Icons.assignment,
                    iconColor: Color.fromARGB(255, 133, 231, 21),
                  ),
                  MenuCard(
                    backgroundColor: Color.fromARGB(255, 243, 214, 212),
                    serviceName: 'EHAC',
                    icon: Icons.vaccines,
                    iconColor: Color.fromARGB(255, 212, 40, 40),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: const [
                  MenuCard(
                    backgroundColor: Color.fromARGB(255, 209, 241, 212),
                    serviceName: 'COVID-19 Vaccine',
                    icon: Icons.local_hospital,
                    iconColor: Color.fromARGB(255, 133, 231, 21),
                  ),
                  MenuCard(
                    backgroundColor: Color.fromARGB(255, 209, 241, 212),
                    serviceName: 'COVID-19 Test Result',
                    icon: Icons.assignment,
                    iconColor: Color.fromARGB(255, 133, 231, 21),
                  ),
                  MenuCard(
                    backgroundColor: Color.fromARGB(255, 243, 214, 212),
                    serviceName: 'EHAC',
                    icon: Icons.vaccines,
                    iconColor: Color.fromARGB(255, 212, 40, 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final String serviceName;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  const MenuCard({
    super.key,
    required this.serviceName,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Card(
            elevation: 4,
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Icon(
                icon,
                size: 55,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Text(
              serviceName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
