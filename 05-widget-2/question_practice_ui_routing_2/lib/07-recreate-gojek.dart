import 'package:flutter/material.dart';

void main() {
  runApp(const GojekApp());
}

class GojekApp extends StatelessWidget {
  const GojekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gojek Homepage',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gojek'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Your Favorites',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action when the "Edit" button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.green, width: 2),
                      ),
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const FavoritesSection(), // Add FavoritesSection here
            ],
          ),
        ),
      ),
    );
  }
}

class FavoritesSection extends StatelessWidget {
  const FavoritesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4, // Adjust the number of columns as needed
          children: const [
            FavoriteServiceCard(
              backgroundColor: Color.fromARGB(255, 209, 241, 212),
              serviceName: 'GoRide',
              icon: Icons.directions_bike,
              iconColor: Color.fromARGB(255, 133, 231, 21),
            ),
            FavoriteServiceCard(
              backgroundColor: Color.fromARGB(255, 209, 241, 212),
              serviceName: 'GoCar',
              icon: Icons.directions_car,
              iconColor: Color.fromARGB(255, 133, 231, 21),
            ),
            FavoriteServiceCard(
              backgroundColor: Color.fromARGB(255, 243, 214, 212),
              serviceName: 'GoFood',
              icon: Icons.fastfood,
              iconColor: Color.fromARGB(255, 212, 40, 40),
            ),
            FavoriteServiceCard(
              backgroundColor: Color.fromARGB(255, 209, 241, 212),
              serviceName: 'GoSend',
              icon: Icons.local_shipping,
              iconColor: Color.fromARGB(255, 133, 231, 21),
            ),
            FavoriteServiceCard(
              backgroundColor: Color.fromARGB(255, 243, 214, 212),
              serviceName: 'GoMart',
              icon: Icons.shopping_cart,
              iconColor: Color.fromARGB(255, 212, 40, 40),
            ),
            FavoriteServiceCard(
              backgroundColor: Color.fromARGB(255, 220, 242, 252),
              serviceName: 'GoPulsa',
              icon: Icons.phone,
              iconColor: Colors.lightBlue,
            ),
            FavoriteServiceCard(
              backgroundColor: Color.fromARGB(255, 220, 242, 252),
              serviceName: 'Check-In',
              icon: Icons.check,
              iconColor: Colors.lightBlue,
            ),
          ],
        ),
      ],
    );
  }
}

class FavoriteServiceCard extends StatelessWidget {
  final String serviceName;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor; // Tambahkan properti untuk warna ikon

  const FavoriteServiceCard({
    super.key,
    required this.serviceName,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor, // Tambahkan properti untuk warna ikon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Card(
            elevation: 4,
            color: backgroundColor,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: 40,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity, // Set the width to match the parent width
            child: Text(
              serviceName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
