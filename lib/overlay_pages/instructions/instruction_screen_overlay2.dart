import 'package:flutter/material.dart';
import 'instruction_screen_overlay.dart';
import 'instruction_screen_overlay3.dart';

class InstructionsScreen2Overlay extends StatelessWidget {
  const InstructionsScreen2Overlay({super.key});

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
          color: Color(0xFF98C2ED),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 0),
              Center(
                child: Text(
                  'INSTRUCTIONS',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tapping on an landmark will reveal the map showing its location.',
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/garden4.jpg',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20),
                            Icon(Icons.arrow_forward, size: 30),
                            SizedBox(width: 20),
                            Image.asset(
                              'assets/images/garden5.jpg',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        'Tapping on a red pin will display a card with the image of the landmark. Tapping on the "Explore" will take you  to the challenge of that specific landmark.',
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/garden6.jpg',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20),
                            Icon(Icons.arrow_forward, size: 30),
                            SizedBox(width: 20),
                            Image.asset(
                              'assets/images/garden7.jpg',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 30),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const InstructionsScreenOverlay(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward, size: 30),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const InstructionsScreen3Overlay(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
