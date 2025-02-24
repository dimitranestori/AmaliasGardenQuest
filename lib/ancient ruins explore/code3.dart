import 'package:flutter/material.dart';
import 'ancient_ruins_screen.dart';
import 'dart:async';
import '../carousel.dart';
import '../pages_map/map_page.dart';
import '../notepadoverlay.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../initial_animation/start_screen.dart';

class CodeAnimation3 extends StatefulWidget {
  const CodeAnimation3({super.key});

  @override
  _CodeAnimation3State createState() => _CodeAnimation3State();
}

class _CodeAnimation3State extends State<CodeAnimation3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _numberScaleAnimation;
  String displayedText = "";
  final String fullText = "The third digit is...";
  int number = 3; // Το νούμερο που θα εμφανιστεί
  bool showNumber = false;

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Number scaling animation
    _numberScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _startTextAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _startTextAnimation() async {
    for (int i = 0; i < fullText.length; i++) {
      setState(() {
        displayedText += fullText[i];
      });
      await Future.delayed(const Duration(milliseconds: 100));
    }
    _controller.forward().then((_) {
      setState(() {
        showNumber = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 89, 106),
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
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StartScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline_outlined),
              title: const Text('Help'),
              onTap: () {
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
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PasscodeScreen()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 89, 106),
        iconTheme: const IconThemeData(
          color: Colors.white, // Χρώμα μενού
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayedText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            if (showNumber)
              ScaleTransition(
                scale: _numberScaleAnimation,
                child: Text(
                  "$number",
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50, // Fixed height for BottomAppBar
        child: BottomAppBar(
          color: const Color.fromARGB(255, 3, 49, 58),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Διαμοιρασμός χώρου
            children: [
              // Αριστερό Βελάκι
              IconButton(
                onPressed: () {
                  // Ενέργεια για αριστερό βελάκι
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => AncientRuinsScreen()),
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
                    MaterialPageRoute(builder: (context) => CarouselPage()),
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
