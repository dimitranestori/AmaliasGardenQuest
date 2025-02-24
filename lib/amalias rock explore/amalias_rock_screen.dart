import 'package:flutter/material.dart';
import '../carousel.dart';
import 'explore5.dart';
import '../notepadoverlay.dart';
import '../pages_map/map_page.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../initial_animation/start_screen.dart';
import 'code5.dart';

class AmaliasRockScreen extends StatelessWidget {
  const AmaliasRockScreen({super.key});

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
              'assets/images/Amalias_rock.jpg',
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
                color: const Color.fromARGB(146, 23, 53, 144).withOpacity(0.85),
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
                      'AMALIAS ROCK',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          'The Rock of Amalia is a prominent geological feature within the National Garden, located behind the Children s Playground area. Queen Amalia placed a metal seat on this rocky outcrop to oversee the gardening and landscaping works taking place at the time. During that era, when the trees were still young and the modern urban sprawl of Athens was nonexistent, the view from the rock extended all the way to the sea, the island of Aegina, and even the Peloponnese on clear days. It is also believed that this spot was once part of the ancient walls of the city of Athens.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            height: 1.5,
                          ),
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
        height: 50, // Σταθερό ύψος για το BottomAppBar
        child: BottomAppBar(
          color: const Color.fromARGB(179, 13, 11, 73).withOpacity(0.85),
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Κεντραρισμένα εικονίδια
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Διάταξη αριστερά, δεξιά, και στη μέση
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Explore5()),
                  );
                },
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
              ),
              Row(
                mainAxisSize:
                    MainAxisSize.min, // Συστέλλει τη γραμμή στα περιεχόμενά της
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Κεντραρισμένα εικονίδια
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CarouselPage()),
                      );
                    },
                    tooltip: 'Collection',
                    icon: Icon(Icons.collections_outlined,
                        color: Colors.white, size: 24),
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MapPage()),
                      );
                    },
                    tooltip: 'Map',
                    icon:
                        Icon(Icons.map_outlined, color: Colors.white, size: 24),
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => NotepadOverlay()),
                      );
                    },
                    tooltip: 'Notebook',
                    icon: Icon(Icons.edit_note_outlined,
                        color: Colors.white, size: 24),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CodeAnimation5()),
                  );
                },
                icon: Icon(Icons.arrow_forward, color: Colors.white, size: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
