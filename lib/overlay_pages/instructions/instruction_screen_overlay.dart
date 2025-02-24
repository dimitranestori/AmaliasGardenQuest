import 'package:flutter/material.dart';
import 'instruction_screen_overlay2.dart';

class InstructionsScreenOverlay extends StatelessWidget {
  const InstructionsScreenOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF98C2ED),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context); // Επιστροφή στην προηγούμενη σελίδα
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xFF98C2ED),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 0),
              const Center(
                child: Text(
                  'INSTRUCTIONS',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Help Queen Amalia find the lost vault code!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'The pieces of the code are scattered throughout the garden. Tap the map icon to navigate through the garden.',
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.map_outlined, size: 40),
                            const SizedBox(width: 10),
                            const Icon(Icons.arrow_forward, size: 30),
                            const SizedBox(width: 10),
                            Image.asset(
                              'assets/images/garden1.jpg',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Use your notebook to write down the code pieces you discover.',
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.edit_note_outlined, size: 40),
                            const SizedBox(width: 10),
                            const Icon(Icons.arrow_forward, size: 30),
                            const SizedBox(width: 10),
                            Image.asset(
                              'assets/images/garden2.jpg',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Head to the collection of landmarks, where the places where Queen Amalia hid the pieces of the code are located.',
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.collections_outlined, size: 40),
                            const SizedBox(width: 10),
                            const Icon(Icons.arrow_forward, size: 30),
                            const SizedBox(width: 10),
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
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward, size: 30),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const InstructionsScreen2Overlay(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
