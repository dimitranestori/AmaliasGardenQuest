import 'package:flutter/material.dart';
import 'instruction_screen_overlay2.dart';

class InstructionsScreen3Overlay extends StatelessWidget {
  const InstructionsScreen3Overlay({super.key});

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
                        'The locations are divided into two categories:',
                      ),
                      SizedBox(height: 20),
                      Text(
                        '1. Information Locations: Provide information through activities such as taking photos of landmarks.',
                      ),
                      SizedBox(height: 20),
                      Text(
                        '2. Code Piece Locations: In addition to information, they reveal characters of the code that will lead you to victory.',
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Once you find all the code elements, type the digits of the code.',
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/garden9.jpg',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20),
                            Icon(Icons.arrow_forward, size: 30),
                            SizedBox(width: 20),
                            Image.asset(
                              'assets/images/garden8.jpg',
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
                              const InstructionsScreen2Overlay(),
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
