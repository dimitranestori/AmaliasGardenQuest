import 'package:flutter/material.dart';
import '../history/history_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Η εικόνα φόντου που καταλαμβάνει όλη την οθόνη
          Positioned.fill(
            child: Image.asset(
              'assets/images/garden.jpg', // Βεβαιώσου ότι η εικόνα υπάρχει στη σωστή διαδρομή
              fit: BoxFit.cover, // Κάνει την εικόνα να καλύπτει όλη την οθόνη
            ),
          ),
          // Το κουμπί που είναι πιο κάτω στην οθόνη
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 200), //ύθμιση του χώρου από το κάτω μέρος
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HistoryScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Color.fromARGB(
                          255, 59, 60, 55), // Χρώμα του περιγράμματος
                      width: 2,
                    ),
                  ),
                  backgroundColor:
                      Color.fromARGB(255, 241, 241, 104).withOpacity(0.80),
                ),
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
