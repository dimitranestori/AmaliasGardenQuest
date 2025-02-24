import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import '../../pages_map/map_page.dart';
import '../../notepadoverlay.dart';
import '../../carousel.dart';
import 'amalias_rock_screen.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../initial_animation/start_screen.dart';

class Explore5 extends StatelessWidget {
  const Explore5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;
  late ImagePicker imagePicker;
  late ImageLabeler labeler;
  String resultMessage = ""; // For result message

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    ImageLabelerOptions options = ImageLabelerOptions(confidenceThreshold: 0.6);
    labeler = ImageLabeler(options: options);
  }

  chooseImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      image = File(selectedImage.path);
      await performImageLbeling();
      setState(() {
        image;
      });
    }
  }

  captureImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      image = File(selectedImage.path);
      await performImageLbeling();
      setState(() {
        image;
      });
    }
  }

  performImageLbeling() async {
    InputImage inputImage = InputImage.fromFile(image!);

    final List<ImageLabel> labels = await labeler.processImage(inputImage);

    bool containsPlant = false;

    for (ImageLabel label in labels) {
      final String text = label.label;
      //final double confidence = label.confidence;
      //print('$text      $confidence');
      if (text.toLowerCase() == 'plant') {
        containsPlant = true;
        break;
      }
    }

    if (containsPlant) {
      // Navigate to AmaliasRock screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AmaliasRockScreen()),
      );
    } else {
      // Update message if not Washingtonia filifera
      setState(() {
        resultMessage = "This is not Amalias' Rock";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Height of the AppBar
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFF2F7FD),
                  Color(0xFFD1E4F7),
                  Color(0xFFECF4FC),
                  Color(0xFF98C2ED),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Center(
            child: Text(
              'Take a picture of Amalia’s Rock ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image == null
                ? Icon(
                    Icons.add_a_photo_outlined,
                    size: 150,
                  )
                : Image.file(image!),
            SizedBox(height: 30), // Απόσταση κάτω από την εικόνα
            ElevatedButton(
              onPressed: () {
                chooseImage();
              },
              onLongPress: () {
                captureImage();
              },
              child: Text('Choose/Capture'),
            ),
            SizedBox(height: 20), // Απόσταση κάτω από το κουμπί
            if (resultMessage
                .isNotEmpty) // Εμφάνιση του μηνύματος μόνο αν δεν είναι κενό
              Text(
                resultMessage,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50, // Fixed height for BottomAppBar
        child: BottomAppBar(
          color: const Color.fromARGB(255, 38, 103, 183).withOpacity(0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center alignment
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
              SizedBox(width: 35), // Spacing between icons
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MapPage()),
                  );
                },
                tooltip: 'Map',
                icon: Icon(Icons.map_outlined, color: Colors.white, size: 24),
              ),
              SizedBox(width: 35), // Spacing between icons
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NotepadOverlay()),
                  );
                },
                tooltip: 'Notebook',
                icon: Icon(Icons.edit_note_outlined,
                    color: Colors.white, size: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
