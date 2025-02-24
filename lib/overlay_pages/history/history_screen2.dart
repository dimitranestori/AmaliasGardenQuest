import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'history_controller2.dart';

class HistoryScreen2 extends StatelessWidget {
  const HistoryScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final InfoController2_history_overlay infoController =
        Get.put(InfoController2_history_overlay());

    return Scaffold(
      body: Stack(
        children: [
          // Εικόνα που αλλάζει
          Positioned.fill(
            child: Obx(() => Image.asset(
                  infoController.currentImage,
                  fit: BoxFit.cover,
                )),
          ),
          // AppBar παραμένει διαφανές
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: null,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Επιστροφή στην προηγούμενη σελίδα
                },
              ),
            ),
          ),
          // Κείμενο ή εικόνα κάτω από την background εικόνα
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.85),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'HISTORY',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        // Χρησιμοποιούμε το Obx για να παρακολουθήσουμε το currentIndex
                      ],
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Obx(() {
                          final currentText = infoController.currentText;
                          final foregroundImage = infoController
                                  .content[infoController.currentIndex.value]
                              ['foregroundImage'];

                          if (foregroundImage != null) {
                            // Εμφάνιση της εικόνας αντί για κείμενο
                            return Center(
                              child: Image.asset(
                                foregroundImage,
                                fit: BoxFit.contain,
                                height: 200, // Προσαρμογή μεγέθους
                              ),
                            );
                          } else if (currentText != null &&
                              currentText.isNotEmpty) {
                            // Εμφάνιση του κειμένου
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: currentText.map((paragraph) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    paragraph,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      height: 1.5,
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          } else {
                            return const SizedBox
                                .shrink(); // Τίποτα αν δεν υπάρχει κείμενο ή εικόνα
                          }
                        }),
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
        height: 50,
        child: Obx(() {
          return BottomAppBar(
            color: const Color.fromARGB(255, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Αριστερό βέλος - Μόνο όταν currentIndex > 0
                if (infoController.currentIndex.value > 0)
                  IconButton(
                    onPressed: infoController.previousTextContent,
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 24),
                  )
                else
                  const SizedBox.shrink(),
                // Δεξί βέλος - Μόνο όταν currentIndex < content.length - 1
                if (infoController.currentIndex.value <
                    infoController.content.length - 1)
                  IconButton(
                    onPressed: infoController.nextTextContent,
                    icon: const Icon(Icons.arrow_forward,
                        color: Colors.white, size: 24),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
