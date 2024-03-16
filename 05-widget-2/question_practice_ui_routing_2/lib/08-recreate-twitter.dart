import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            Stack(
              children: [
                const CoverImage(),
                Positioned(
                  top: 6,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        // Aksi ketika tombol kembali ditekan
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // Aksi ketika tombol search ditekan
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        // Aksi ketika tombol titik tiga ditekan
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Profile(),
          ],
        ),
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
          'images/header-upn.jpeg'), // Menggunakan Image.asset sebagai child
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: Image.asset('images/profile-upn.jpg').image,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action when the "Follow" button is pressed
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black, width: 2),
                  backgroundColor: Colors.black, // Warna latar belakang tombol
                ),
                child: const Text(
                  'Follow',
                  style: TextStyle(
                    color: Colors.white, // Warna teks
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'UPN Veteran Jawa Timur',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            '@upnvjt_official',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 75, 75, 75),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'AKUN RESMI UPN "VETERAN" JAWA TIMUR Dikelola oleh Humas UPN "Veteran" Jawa Timur Kampus Bela Negara',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 14, 14, 14),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Translate Bio',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
