import 'package:flutter/material.dart';
import 'code.dart';
import 'explore2.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../initial_animation/start_screen.dart';
import '../pages_map/map_page.dart';
import '../carousel.dart';
import '../notepadoverlay.dart';

class SundialScreen extends StatelessWidget {
  const SundialScreen({super.key});

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
      body: Stack(
        children: [
          // Background image starts from the top of the screen
          Positioned.fill(
            child: Image.asset(
              'assets/images/sundial2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // AppBar is transparent and does not affect the image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent, // Transparent AppBar
              elevation: 0, // No shadow
              title: null, // No title
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu,
                      color: Colors.white), // White menu icon
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Open Drawer
                  },
                ),
              ),
            ),
          ),
          // Main content (text at the bottom)
          Positioned(
            bottom: 0, // Positioned at the bottom of the screen
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.45, // 45% of the screen height
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 190, 120, 7).withOpacity(0.85),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'SUNDIAL',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'A SIGHT THAT ATTRACTS NOT ONLY INTERNATIONAL VISITORS TO THE GARDEN, BUT ALSO ATHENIANS THEMSELVES, IS THE FAMOUS SUNDIAL LOCATED AT THE MAIN ENTRANCE.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'THE SHADOW OF THE POINTER, DEPENDING ON THE POSITION OF THE SUN, ALSO INDICATES THE RELATIVE TIME AND EVERYONE EMBARKS ON THE ADVENTURE OF GUESSING THE EXACT TIME, WITHOUT LOOKING AT THEIR WATCH OR MOBILE PHONE, THUS TRAVELING FOR A WHILE, MENTALLY, TO THE DISTANT PAST.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'THE SUNDIAL IN THE NATIONAL GARDEN WAS MOVED TO ITS CURRENT LOCATION IN 1929, NEAR THE ENTRANCE TO THE NATIONAL GARDEN FROM AMALIAS AVENUE.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50, // Fixed height for BottomAppBar
        child: BottomAppBar(
          color: const Color.fromARGB(255, 111, 52, 1),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Διαμοιρασμός χώρου
            children: [
              // Αριστερό Βελάκι
              IconButton(
                onPressed: () {
                  // Ενέργεια για αριστερό βελάκι
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Explore2()),
                  );
                },
                tooltip: 'Previous',
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 24),
              ),
              // Κεντρικό Περιεχόμενο
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CarouselPage()),
                      );
                    },
                    tooltip: 'Collection',
                    icon: const Icon(Icons.collections_outlined,
                        color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 35),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const MapPage()),
                      );
                    },
                    tooltip: 'Map',
                    icon: const Icon(Icons.map_outlined,
                        color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 35),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => NotepadOverlay()),
                      );
                    },
                    tooltip: 'Notebook',
                    icon: const Icon(Icons.edit_note_outlined,
                        color: Colors.white, size: 24),
                  ),
                ],
              ),
              // Δεξί Βελάκι
              IconButton(
                onPressed: () {
                  // Ενέργεια για δεξί βελάκι
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CodeAnimation()),
                  );
                },
                tooltip: 'Next',
                icon: const Icon(Icons.arrow_forward,
                    color: Colors.white, size: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
