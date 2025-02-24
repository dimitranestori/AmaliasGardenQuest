import 'package:get/get.dart';
import 'history_controller.dart';
import 'package:flutter/material.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../instructions/instruction_screen.dart';
import '../initial_animation/start_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final InfoController infoController = Get.put(InfoController());

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
          // Κείμενο ή εικόνα κάτω από την background εικόνα
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.85),
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
                    // Εδώ δημιουργούμε το Row για τον τίτλο και το κουμπί "SKIP"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'HISTORY',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        // Χρησιμοποιούμε το Obx για να παρακολουθήσουμε το currentIndex
                        Obx(() {
                          // Εμφάνιση του κουμπιού "SKIP" μόνο όταν είμαστε στην πρώτη οθόνη
                          if (infoController.currentIndex.value == 0) {
                            return ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InstructionsScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: const Color.fromARGB(
                                    255, 140, 141, 142), // Χρώμα φόντου
                                foregroundColor: Colors
                                    .white, // Χρώμα για το κείμενο του κουμπιού
                                elevation: 5, // Σκιά του κουμπιού
                              ),
                              child: const Text(
                                'SKIP',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          } else {
                            return SizedBox
                                .shrink(); // Εμφάνιση τίποτα αν δεν είμαστε στην πρώτη οθόνη
                          }
                        }),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Obx(() {
                          final currentText = infoController.currentText;
                          final foregroundImage = infoController
                                  .content[infoController.currentIndex.value]
                              ['foregroundImage'];

                          if (foregroundImage != null) {
                            // Εμφάνιση της εικόνας αντί για κείμενο
                            return Center(
                              child: Image.asset(
                                foregroundImage,
                                fit: BoxFit.contain,
                                height: 200, // Προσαρμογή μεγέθους
                              ),
                            );
                          } else if (currentText != null &&
                              currentText.isNotEmpty) {
                            // Εμφάνιση του κειμένου
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: currentText.map((paragraph) {
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
                            );
                          } else {
                            return const SizedBox
                                .shrink(); // Τίποτα αν δεν υπάρχει κείμενο ή εικόνα
                          }
                        }),
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
          color: const Color.fromARGB(255, 0, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: infoController.previousTextContent,
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 24),
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
