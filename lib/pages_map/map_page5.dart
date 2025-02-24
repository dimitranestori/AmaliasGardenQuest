import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../washigtonia explore/explore1.dart';
import '../sundial explore/explore2.dart';
import '../ancient ruins explore/explore3.dart';
import '../samaras explore/explore4.dart';
import '../amalias rock explore/explore5.dart';
import '../carousel.dart';
import '../notepadoverlay.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import '../overlay_pages/instructions/instruction_screen_overlay.dart';
import '../initial_animation/start_screen.dart';

class MapPage5 extends StatefulWidget {
  const MapPage5({super.key});

  @override
  _MapPageState5 createState() => _MapPageState5();
}

class _MapPageState5 extends State<MapPage5> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  final Location _location = Location();
  int _selectedIndex = 1;

  // Δημιουργούμε GlobalKey για το Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _addDeviceLocationMarker();
    _addMarkers();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addMarkers() {
    // Παράδειγμα Marker 1
    _markers.add(
      Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(37.973869, 23.736034),
        infoWindow: InfoWindow(
          title: 'Washingtonia Filifera',
          snippet: 'Click for more info',
          onTap: () {
            _showCustomInfoWindow(
              'Washingtonia Filifera',
              'assets/images/washingtonia.jpg',
              Explore1(),
            );
          },
        ),
      ),
    );

    // Παράδειγμα Marker 2
    _markers.add(
      Marker(
        markerId: MarkerId('marker2'),
        position: LatLng(37.97398, 23.73584),
        infoWindow: InfoWindow(
          title: 'Sundial',
          snippet: 'Click for more info',
          onTap: () {
            _showCustomInfoWindow(
              'Sundial',
              'assets/images/sundial.jpg',
              Explore2(),
            );
          },
        ),
      ),
    );

    // Παράδειγμα Marker 3
    _markers.add(
      Marker(
        markerId: MarkerId('marker3'),
        position: LatLng(37.972926, 23.73742),
        infoWindow: InfoWindow(
          title: 'Ancient Ruins',
          snippet: 'Click for more info',
          onTap: () {
            _showCustomInfoWindow(
              'Ancient Ruins',
              'assets/images/ruins.jpg',
              Explore3(),
            );
          },
        ),
      ),
    );

    // Παράδειγμα Marker 4
    _markers.add(
      Marker(
        markerId: MarkerId('marker4'),
        position: LatLng(37.972875, 23.735867),
        infoWindow: InfoWindow(
          title: 'S. Samaras',
          snippet: 'Click for more info',
          onTap: () {
            _showCustomInfoWindow(
              'S. Samaras',
              'assets/images/samaras.jpg',
              Explore4(),
            );
          },
        ),
      ),
    );

    // Παράδειγμα Marker 5
    _markers.add(
      Marker(
        markerId: MarkerId('marker5'),
        position: LatLng(37.971721, 23.738839),
        infoWindow: InfoWindow(
          title: 'The rock of Amalia',
          snippet: 'Click for more info',
          onTap: () {
            _showCustomInfoWindow(
              'The rock of Amalia',
              'assets/images/stone.jpg',
              Explore5(),
            );
          },
        ),
      ),
    );

    setState(() {});
  }

  void _showCustomInfoWindow(
      String title, String imagePath, Widget explorePage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imagePath, width: 100, height: 100), // Εικόνα
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ), // Τίτλος
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _navigateToExplorePage(explorePage);
                  },
                  child: Text('Explore'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _addDeviceLocationMarker() async {
    LocationData currentLocation = await _location.getLocation();
    Marker deviceMarker = Marker(
      markerId: MarkerId('deviceLocation'),
      position: LatLng(currentLocation.latitude!, currentLocation.longitude!),
      infoWindow: InfoWindow(
        title: 'Your Location',
        snippet: 'This is your current location',
      ),
    );

    setState(() {
      _markers.add(deviceMarker);
    });

    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(37.971721, 23.738839),
        20,
      ),
    );
  }

  void _navigateToExplorePage(Widget explorePage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => explorePage),
    ).then((_) {
      setState(() {
        _selectedIndex = 1;
      });
    });
  }

  void _showNotepadOverlay() {
    int previousIndex = _selectedIndex; // Αποθήκευση του προηγούμενου index
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NotepadOverlay(); // Το widget του σημειωματάριου
      },
    ).then((_) {
      // Επανέρχεται στον προηγούμενο index όταν κλείνει το overlay
      setState(() {
        _selectedIndex = previousIndex;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Ορίζουμε το κλειδί για το Scaffold
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
          GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(37.971721, 23.738839),
              zoom: 20,
            ),
            markers: _markers,
          ),
          Positioned(
            top: 40, // Απόσταση από την κορυφή
            left: 10, // Απόσταση από την αριστερή πλευρά
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                // Χρήση του GlobalKey για να ανοίξουμε το Drawer
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_outlined),
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_note_outlined),
            label: 'Notebook',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 170, 255),
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CarouselPage(),
              ),
            );
          } else if (index == 2) {
            // Αν ο χρήστης πατήσει Notebook, εμφάνιση του overlay
            _showNotepadOverlay();
          }
          _onItemTapped(index); // Ενημέρωση του επιλεγμένου δείκτη
        },
      ),
    );
  }
}
