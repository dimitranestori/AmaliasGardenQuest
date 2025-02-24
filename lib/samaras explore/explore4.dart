import 'package:flutter/material.dart';
import '../pages_map/map_page4.dart';
import 'dart:async';
import 'samaras_info_1.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../initial_animation/start_screen.dart';

class Explore4 extends StatefulWidget {
  const Explore4({super.key});

  @override
  _Explore4State createState() => _Explore4State();
}

class _Explore4State extends State<Explore4> {
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool showTryAgain = false;

  final List<String> answers = [
    'S. Samaras',
    'D. Solomos',
    'J. Moreas',
    'I. Kapodistrias',
  ];

  final int correctAnswerIndex = 0; // Σωστή απάντηση

  void handleAnswerTap(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });

    if (index == correctAnswerIndex) {
      // Σωστή απάντηση
      setState(() {
        isCorrect = true;
      });
    } else {
      // Λάθος απάντηση
      setState(() {
        showTryAgain = true;
      });

      // Επαναφορά μετά από 1 δευτερόλεπτο
      Timer(const Duration(seconds: 1), () {
        setState(() {
          showTryAgain = false;
          selectedAnswerIndex = null;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF98C2ED), // Δοκιμάστε με σταθερό χρώμα
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Άνοιγμα μενού
            },
          ),
        ),
      ),
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
      backgroundColor:
          const Color(0xFF98C2ED), // Εδώ χρησιμοποιείτε το χρώμα σας
      body: Column(
        children: [
          Image.asset(
            'assets/images/samaras_1.png', // Εικόνα του quiz
            //width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Who does this bust belong to? Select the correct answer below...',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: answers.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedAnswerIndex == index;
                bool isAnswerCorrect =
                    isSelected && index == correctAnswerIndex;
                bool isAnswerWrong = isSelected && index != correctAnswerIndex;

                return GestureDetector(
                  onTap: () => handleAnswerTap(index),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isAnswerCorrect
                          ? Colors.green
                          : isAnswerWrong
                              ? Colors.red
                              : Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Text(
                      answers[index],
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (showTryAgain)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'TRY AGAIN',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomAppBar(
          color: const Color.fromARGB(179, 12, 106, 194),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MapPage4()),
                  );
                },
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 24),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    tooltip: 'Collection',
                    icon: const Icon(Icons.collections_outlined,
                        color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {},
                    tooltip: 'Map',
                    icon: const Icon(Icons.map_outlined,
                        color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {},
                    tooltip: 'Notebook',
                    icon: const Icon(Icons.edit_note_outlined,
                        color: Colors.white, size: 24),
                  ),
                ],
              ),
              IconButton(
                onPressed: isCorrect
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SamarasInfoScreen()),
                        );
                      }
                    : null, // Ενεργοποιείται μόνο αν είναι σωστή
                icon: Icon(Icons.arrow_forward,
                    color: isCorrect ? Colors.white : Colors.grey, size: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
