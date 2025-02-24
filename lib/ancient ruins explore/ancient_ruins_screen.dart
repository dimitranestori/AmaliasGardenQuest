import 'package:get/get.dart';
import '../notepadoverlay.dart';
import 'ancient_ruins_controller.dart';
import 'package:flutter/material.dart';
import '../carousel.dart';
import '../pages_map/map_page.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../initial_animation/start_screen.dart';
import '../vault/solution.dart';

class AncientRuinsScreen extends StatelessWidget {
  const AncientRuinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final InfoController_ancientruins infoController =
        Get.put(InfoController_ancientruins());

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
          // Εικόνα που αλλάζει
          Positioned.fill(
            child: Obx(() => Image.asset(
                  infoController.currentImage,
                  fit: BoxFit.cover,
                )),
          ),
          // AppBar παραμένει διαφανές
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: null,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
          ),
          // Κείμενο κάτω από την εικόνα
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color:
                    const Color.fromRGBO(148, 152, 144, 100).withOpacity(0.85),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ANCIENT RUINS',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Εμφάνιση παραγράφων
                    Expanded(
                      child: SingleChildScrollView(
                        child: Obx(() => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  infoController.currentText.map((paragraph) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    paragraph,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      height: 1.5,
                                    ),
                                  ),
                                );
                              }).toList(),
                            )),
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
        height: 50,
        child: BottomAppBar(
          color: const Color.fromARGB(192, 57, 57, 44).withOpacity(0.85),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: infoController.previousTextContent,
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 24),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
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
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MapPage()),
                      );
                    },
                    tooltip: 'Map',
                    icon: const Icon(Icons.map_outlined,
                        color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 16),
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
              IconButton(
                onPressed: infoController.nextTextContent,
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
