import 'package:flutter/material.dart';
import '../carousel.dart';
import '../history/history_screen.dart';
import 'instruction_screen2.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../initial_animation/start_screen.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});

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
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CarouselPage()),
                      );
                    },
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                        color: Color.fromARGB(255, 99, 99, 99),
                        fontWeight: FontWeight.bold,
                      ),
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
                        'Help Queen Amalia find the lost vault code!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'The pieces of the code are scattered throughout the garden. Tap the map icon to navigate through the garden.',
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.map_outlined, size: 40),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward, size: 30),
                            SizedBox(width: 10),
                            Image.asset(
                              'assets/images/garden1.jpg',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Use your notebook to write down the code pieces you discover.',
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit_note_outlined, size: 40),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward, size: 30),
                            SizedBox(width: 10),
                            Image.asset(
                              'assets/images/garden2.jpg',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Head to the collection of landmarks, where the places where Queen Amalia hid the pieces of the code are located.',
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.collections_outlined, size: 40),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward, size: 30),
                            SizedBox(width: 10),
                            Image.asset(
                              'assets/images/garden3.jpg',
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
                            builder: (context) => HistoryScreen()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward, size: 30),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => InstructionsScreen2()),
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
