// lib/modules/washingtonia_palms/washingtonia_palms_controller.dart
import 'package:get/get.dart';
import 'explore3.dart';
import 'code3.dart';

class InfoController_ancientruins extends GetxController {
  final List<Map<String, dynamic>> content = [
    {
      'text': [
        'THIS IS THE RESERVOIR OF THE HADRIAN AQUEDUCT, THE MOST IMPORTANT WATER SYSTEM THAT ATHENS HAD IN ANCIENT TIMES, WHICH PROVIDED WATER TO THE CITY\'S INHABITANTS FOR OVER 1,800 YEARS.',
        'IT WAS BEGUN BY THE PHILHELLENIC EMPEROR HADRIAN IN 125 AD, AND COMPLETED BY HIS SUCCESSOR, ANTONINUS PIUS THE PIOUS, AROUND 140 AD.',
        'THE WATER RESERVOIR WAS BUILT BY THE METHOD OF MINING OF SUCCESSIVE WELLS, THE COMMON METHOD OF CANAT. THROUGHOUT THE EXCAVATION, 465 VERTICAL WELLS WERE DISTRIBUTED, AT A DISTANCE OF 35-40 METERS FROM EACH OTHER AND A DEPTH OF 10 M. UP TO 42 M. FROM THE SURFACE OF THE GROUND.',
      ],
      'image': 'assets/images/ancient_ruins_1.png'
    },
    {
      'text': [
        'OVER THE MIDDLE AVENUE WAS FORMED AN ARCHED CHAMBER, ON EACH SIDE OF WHICH THERE WAS AN INSCRIPTION REMEMBERING THE REMEMBERED HYDRAULIC WORK OF HADRIAN.',
        'IMPERIAL INSCRIPTIONS LIKE THIS ONE DEMONSTRATED THE GRAND ACHIEVEMENTS OF THE ROMAN EMPIRE. THIS WAS A TRIBUTE TO THE INGENUITY AND AMBITION OF ITS ENGINEERS.',
      ],
      'image': 'assets/images/ancient_ruins_2.png'
    },
    {
      'text': [
        'THE AQUARIUM OF HADRIAN, WITH ARCHAEOLOGICAL REMAINS VISIBLE AT MANY POINTS ON ITS COURSE ACROSS THE 8 MUNICIPALITIES IT CROSSES, OPERATED FOR MANY CENTURIES.',
        'DURING THE TURKISH ERA, HOWEVER, IT WAS ABANDONED AND NEGLECTED. THE LACK OF MAINTENANCE RESULTED IN MANY SECTIONS BEING DESTROYED, WITH TUNNELS BLOCKED BY COLLAPSED SOIL AND MUD.',
        'IT WAS REDISCOVERED IN 1827 WHEN THE MUNICIPALITY, SEARCHING FOR WATER TO MEET THE CITY\'S SEVERE NEEDS, LOCATED THE ANCIENT RESERVOIR. RESTORATION WORK BEGAN, AND BY 1840, THE AQUEDUCT WAS BACK IN USE, WATERING THE ATHENS OF THE LATER DAYS.',
      ],
      'image': 'assets/images/ancient_ruins_3.png'
    },
    {
      'text': [
        'TODAY, THE HADRIAN RESERVOIR, AN IMPORTANT SIGHT OF ATHENS, BELONGS TO THE EMPLOYEES CULTURAL ASSOCIATION AT EYDAP.',
        'CONNECTED TO THE CITY\'S MODERN WATER NETWORK, IT FILLS ONCE A YEAR, ON THE DAY OF THEOPHANIES, FOR THE CEREMONY OF THE SANCTIFICATION OF THE WATERS IN THE CITY CENTER.',
      ],
      'image': 'assets/images/ancient_ruins_4.png'
    },
  ];

  var currentIndex = 0.obs;

  List<String> get currentText => content[currentIndex.value]['text'];
  String get currentImage => content[currentIndex.value]['image']!;

  void nextTextContent() {
    if (currentIndex.value < content.length - 1) {
      currentIndex.value++;
    } else {
      // Αν είμαστε στην τελευταία οθόνη και πατηθεί το δεξί βέλος
      Get.to(() => CodeAnimation3()); // Μεταβαίνεις στην οθόνη Carousel
    }
  }

  void previousTextContent() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    } else {
      // Αν είμαστε στην πρώτη οθόνη και πατηθεί το αριστερό βέλος
      Get.to(() => Explore3()); // Μεταβαίνεις στην οθόνη Explore1
    }
  }
}
