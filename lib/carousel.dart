import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'pages_map/map_page1.dart';
import 'pages_map/map_page2.dart';
import 'pages_map/map_page3.dart';
import 'pages_map/map_page4.dart';
import 'pages_map/map_page5.dart';
import 'pages_map/map_page.dart';
import 'notepadoverlay.dart';
import '../vault/solution.dart';
import '../overlay_pages/history/history_screen2.dart';
import 'overlay_pages/instructions/instruction_screen_overlay.dart';
import 'initial_animation/start_screen.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final List<String> imgList = [
    'https://media.istockphoto.com/id/1181149545/photo/washingtonia-filifera-palm-trees.jpg?s=612x612&w=0&k=20&c=Z6LYBwOSi62Ky3aDf2lH5SY0Gxz0rfm4jkpNj0seZ-E=',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR67xo2gqre2JiAqh8A0BgLTPev1MIhxeDoDQ&s',
    'https://green-athens.gr/wp-content/uploads/2022/11/%CE%95%CF%80%CE%B9%CF%83%CF%84%CE%AE%CE%BB%CE%B9%CE%BF-%CF%84%CE%B7%CF%82-%CE%91%CE%B4%CF%81%CE%B9%CE%AC%CE%BD%CE%B5%CE%B9%CE%B1%CF%82-%CE%94%CE%B5%CE%BE%CE%B1%CE%BC%CE%B5%CE%BD%CE%AE%CF%82-1-scaled.jpg',
    'https://green-athens.gr/wp-content/uploads/2022/11/spiros-filiskos-samaras-ethnikos-kipos.jpg',
    'https://media.cliomuseappserver.com/exhibits/exhibit_img/tour_item_img_1466604988.jpg'
  ];

  int _currentPage = 0;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToMapPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapPage1()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapPage2()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapPage3()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapPage4()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapPage5()),
        );
        break;
      default:
        break;
    }
  }

  void _showNotepadOverlay() {
    int previousIndex = _selectedIndex;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const NotepadOverlay();
      },
    ).then((_) {
      setState(() {
        _selectedIndex = previousIndex;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF98C2ED),
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text(
          'ATTRACTIONS',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
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
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapPage()),
            );
          } else if (index == 2) {
            _showNotepadOverlay();
          }
          _onItemTapped(index);
        },
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
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: imgList.asMap().entries.map((entry) {
                int index = entry.key;
                String imgUrl = entry.value;

                return GestureDetector(
                  onTap: () {
                    _navigateToMapPage(index);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _currentPage == index ? 1.0 : 0.5,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, size: 50);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 400,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                viewportFraction: 0.7,
                onPageChanged: (value, _) {
                  setState(() {
                    _currentPage = value;
                  });
                },
              ),
            ),
            buildCarouselIndicator(),
          ],
        ),
      ),
    );
  }

  Widget buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: const EdgeInsets.all(5),
            height: i == _currentPage ? 7 : 5,
            width: i == _currentPage ? 7 : 5,
            decoration: BoxDecoration(
              color: i == _currentPage ? Colors.black : Colors.grey,
              shape: BoxShape.circle,
            ),
          )
      ],
    );
  }
}
