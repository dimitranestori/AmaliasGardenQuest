import 'package:flutter/material.dart';
import 'explore4.dart';
import '../notepadoverlay.dart';
import 'package:video_player/video_player.dart';
import 'samaras_info_2.dart';
import '../carousel.dart';
import '../pages_map/map_page.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../initial_animation/start_screen.dart';

class SamarasInfoScreen extends StatefulWidget {
  const SamarasInfoScreen({super.key});

  @override
  _SamarasInfoScreenState createState() => _SamarasInfoScreenState();
}

class _SamarasInfoScreenState extends State<SamarasInfoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/olympic_hymn.mp4')
      ..initialize().then((_) {
        setState(() {}); // Update UI when video is loaded
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
          Positioned(
            top: -85, // Moving the image up beyond the screen
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/samaras_image.png',
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
              height:
                  MediaQuery.of(context).size.height * 0.65, // Adjusted height
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 104, 103, 114),
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
                      'SPYRIDON FILISKOS SAMARAS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SPYRIDON-FILISKOS SAMARAS WAS ONE OF THE MOST PROMINENT GREEK COMPOSERS AND THE LEADING COMPOSER OF THE IONIAN SCHOOL. '
                              'HE WAS BORN IN CORFU. HE DISTINGUISHED HIMSELF IN THE FIELD OF OPERA. IN 1895, HE WAS COMMISSIONED BY THE INTERNATIONAL OLYMPIC '
                              'COMMITTEE TO COMPOSE AN OLYMPIC HYMN ON THE OCCASION OF THE HOLDING OF THE FIRST MODERN OLYMPIC GAMES IN ATHENS IN 1896. '
                              'AFTER THE ASSIGNMENT TO SAMARAS, THE COMMITTEE CHOSE TO SET THE POEM OF THE SAME NAME BY COSTIS PALAMAS TO MUSIC.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(
                                height:
                                    32), // Larger space between text and video

                            // Check if video is initialized and then show it
                            _controller.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  )
                                : Center(
                                    child:
                                        CircularProgressIndicator()), // Show a loading indicator if not initialized

                            SizedBox(height: 5), // Space before the button

                            // Slider for controlling the video progress
                            Slider(
                              value: _controller.value.position.inSeconds
                                  .toDouble(),
                              min: 0.0,
                              max: _controller.value.duration.inSeconds
                                  .toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  _controller
                                      .seekTo(Duration(seconds: value.toInt()));
                                });
                              },
                            ),

                            SizedBox(
                                height:
                                    5), // Space before the play/pause button

                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom:
                                      30.0), // Προσθέτει padding από το κάτω μέρος
                              child: Align(
                                alignment: Alignment
                                    .bottomCenter, // Ευθυγραμμίζει το κουμπί στο κέντρο κάτω
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
                                    backgroundColor: Colors
                                        .white, // Χρώμα φόντου του κουμπιού
                                  ),
                                  child: Icon(
                                    _controller.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    size:
                                        36, // Μεγαλύτερο μέγεθος για το εικονίδιο
                                  ),
                                ),
                              ),
                            )
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
        height: 50, // Fixed height for the BottomAppBar
        child: BottomAppBar(
          color: const Color.fromARGB(255, 16, 16, 16).withOpacity(0.85),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Center icons
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Left, right, and center layout
            children: [
              IconButton(
                onPressed: () {
                  _controller.pause(); // Σταματάμε το βίντεο
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Explore4()),
                  );
                },
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 24),
              ),
              Row(
                mainAxisSize: MainAxisSize.min, // Shrinks row to fit contents
                crossAxisAlignment: CrossAxisAlignment.center, // Center icons
                children: [
                  IconButton(
                    onPressed: () {
                      _controller.pause(); // Σταματάμε το βίντεο
                      Navigator.push(
                        context,
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
                      _controller.pause(); // Σταματάμε το βίντεο
                      Navigator.push(
                        context,
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
                      _controller.pause(); // Σταματάμε το βίντεο
                      Navigator.push(
                        context,
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
                onPressed: () {
                  _controller.pause(); // Pause the video
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SamarasInfoScreen2()), // Navigate to another screen
                  );
                },
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
