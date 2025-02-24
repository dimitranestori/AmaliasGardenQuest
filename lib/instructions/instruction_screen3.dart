import 'package:flutter/material.dart';
import '../carousel.dart';
import 'instruction_screen2.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../initial_animation/start_screen.dart';

class InstructionsScreen3 extends StatelessWidget {
  const InstructionsScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF98C2ED),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app_outlined),
              title: const Text('Exit'),
              onTap: () {
                // Ενέργεια για έξοδο
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StartScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline_outlined),
              title: const Text('Help'),
              onTap: () {
                // Μετάβαση σε σελίδα "Help"
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => InstructionsScreenOverlay()),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/history.png',
                width: 24,
                height: 24,
              ),
              title: const Text('History'),
              onTap: () {
                // Μετάβαση σε σελίδα "History"
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HistoryScreen2()),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/vault.png',
                width: 24,
                height: 24,
              ),
              title: const Text('Vault'),
              onTap: () {
                // Μετάβαση σε σελίδα "Vault"
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PasscodeScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Color(0xFF98C2ED),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, size: 30),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  'INSTRUCTIONS',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The locations are divided into two categories:',
                      ),
                      SizedBox(height: 20),
                      Text(
                        '1. Information Locations: Provide information through activities such as taking photos of landmarks.',
                      ),
                      SizedBox(height: 20),
                      Text(
                        '2. Code Piece Locations: In addition to information, they reveal characters of the code that will lead you to victory.',
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Once you find all the code elements, type the digits of the code.',
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/garden9.jpg',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20),
                            Icon(Icons.arrow_forward, size: 30),
                            SizedBox(width: 20),
                            Image.asset(
                              'assets/images/garden8.jpg',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 30),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => InstructionsScreen2()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward, size: 30),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CarouselPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
