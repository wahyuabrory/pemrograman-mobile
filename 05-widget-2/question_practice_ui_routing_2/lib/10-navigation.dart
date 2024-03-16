import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue, // Blue app bar
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "For You", // Adjusted tab label
                    style: TextStyle(
                        color: Colors.white), // Set text color to white
                  ),
                ),
                Tab(
                  child: Text(
                    "Following", // Adjusted tab label
                    style: TextStyle(
                        color: Colors.white), // Set text color to white
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // For You Tab
              ListView.builder(
                itemCount: 10, // Example item count
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(), // Add border decoration
                    ),
                    child: ListTile(
                      leading: const FlutterLogo(size: 24), // Flutter logo
                      title: Text("Data ke $index"), // Text data
                    ),
                  );
                },
              ),
              // Following Tab
              GridView.count(
                crossAxisCount: 2, // 2 columns
                children: List.generate(6, (index) {
                  // Example owl image URLs
                  List<String> owlImages = [
                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
                    // Add more owl image URLs as needed
                  ];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(owlImages[index]), // Owl image
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
