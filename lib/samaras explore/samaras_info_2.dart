import 'package:flutter/material.dart';
import '../notepadoverlay.dart';
import 'package:video_player/video_player.dart';
import '../carousel.dart';
import '../pages_map/map_page.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../initial_animation/start_screen.dart';
import 'code4.dart';

class SamarasInfoScreen2 extends StatefulWidget {
  const SamarasInfoScreen2({super.key});

  @override
  _SamarasInfoScreen2State createState() => _SamarasInfoScreen2State();
}

class _SamarasInfoScreen2State extends State<SamarasInfoScreen2> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/samaras_video.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ενημέρωση του UI όταν φορτωθεί το βίντεο
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Διαφανές AppBar
        elevation: 0, // Χωρίς σκιά
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
      backgroundColor: Color.fromARGB(255, 104, 103, 114),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Βίντεο τοποθετημένο πάνω από το κείμενο
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : CircularProgressIndicator(),

              SizedBox(
                  height: 10), // Μικρό κενό ανάμεσα στο βίντεο και το slider

              // Slider for controlling the video progress
              Slider(
                value: _controller.value.position.inSeconds.toDouble(),
                min: 0.0,
                max: _controller.value.duration.inSeconds.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _controller.seekTo(Duration(seconds: value.toInt()));
                  });
                },
              ),

              SizedBox(
                  height: 10), // Περισσότερος χώρος πριν το κουμπί play/pause

              // Κουμπί play/pause κάτω από το slider
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 30.0), // Padding από κάτω
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical:
                              5), // Μεγαλύτερο padding γύρω από το εικονίδιο
                      backgroundColor: Colors.white,
                    ),
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 36, // Μεγαλύτερο μέγεθος για το εικονίδιο
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16), // Κενό πριν το κείμενο

              // Τρεις παράγραφοι πληροφοριών
              Text(
                'SAMARAS WAS NEVER ALIENATED FROM GREECE, WHOSE MUSIC-LOVING COMMUNITY WATCHED WITH ADMIRATION THE COMPOSER S UPWARD TRAJECTORY. THUS, IN 1889, "FLORA MIRABILIS" WAS PERFORMED IN CORFU AND THEN IN ATHENS AS "THAUMASTI ANTHO".',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'THE FAILURE OF THE OPERA "LIONELLA" AT LA SCALA IN MILAN IN 1891 WAS REMEDIED BY THE TRIUMPH OF THE OPERA "LA MARTIRE" (THE MARTYR), WHICH WAS PRESENTED IN NAPLES IN MAY 1894. IT WAS THEN THAT THE COMPOSER WAS CLASSIFIED BY CRITICS AS PART OF THE VERISMO SCHOOL, OF WHICH HE IS CONSIDERED ONE OF THE PIONEERS, ALONGSIDE RUGGIERO LEONCAVALLO, PIETRO MASCAGNI AND GIACOMO PUCCINI.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'OTHER SUCCESSFUL OPERAS FOLLOWED, SUCH AS "THE TAMING OF THE SHREW" (LA FURIA DAMATA) IN 1895, BASED ON SHAKESPEARE S PLAY "THE TAMING OF THE SHREW", "STORIA D AMORE" 1903 (LATER PERFORMED IN GERMANY UNDER THE TITLE LA BIONTINETTA (THE BLONDE)) AND "MADEMOISELLE DE BELLE-ISLE" IN 1905.',
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
      bottomNavigationBar: SizedBox(
        height: 50, // Σταθερό ύψος για το BottomAppBar
        child: BottomAppBar(
          color: const Color.fromARGB(255, 16, 16, 16).withOpacity(0.85),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  _controller.pause(); // Σταματάμε το βίντεο
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    MaterialPageRoute(builder: (context) => CodeAnimation4()),
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
