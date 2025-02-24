import 'package:get/get.dart';
import 'package:map_2/washigtonia%20explore/code2.dart';
import 'explore1.dart'; // Εισάγεις το αρχείο για την Explore1 σελίδα

class InfoController_washingtonia extends GetxController {
  final List<Map<String, dynamic>> content = [
    {
      'text': [
        'THE WASHINGTONIA PALMS AT THE CENTRAL ENTRANCE OF THE SITE ARE NOT JUST BEAUTIFUL BUT ALSO RICH IN HISTORY.',
        'THIS PLANT BELONGS TO A PALM FAMILY NATIVE TO SOUTHWESTERN U.S. (SOUTHERN CALIFORNIA AND ARIZONA) AND NORTHWESTERN MEXICO.',
        'OVER TIME, PEOPLE HAVE SPREAD WASHINGTONIA PALMS FAR AND WIDE, AND THEY ARE NOW A COMMON ORNAMENTAL FEATURE IN SOUTHERN EUROPE, THE MIDDLE EAST, AND BEYOND.',
      ],
      'image': 'assets/images/washingtonia_palms1.jpg'
    },
    {
      'text': [
        'THEIR NAME WAS GIVEN IN 1879 BY GERMAN BOTANIST HERMANN VON WENDLAND, WHO CHOSE TO HONOR GEORGE WASHINGTON, THE FIRST U.S. PRESIDENT.',
        'INTERESTINGLY, THE NAME "WASHINGTONIA" HAD PREVIOUSLY BEEN PROPOSED FOR OTHER PLANTS, INCLUDING SEQUOIAS, BUT IT DIDN’T STICK UNTIL IT WAS USED FOR THESE ICONIC PALMS.',
      ],
      'image': 'assets/images/washingtonia_palms2.jpg'
    },
    {
      'text': [
        'THE PALMS AT THE ENTRANCE HAVE BECOME A SIGNATURE FEATURE OF THIS LOCATION.',
        'WHILE THEIR EXACT ORIGIN HERE REMAINS UNKNOWN, THEY ARE A TESTAMENT TO THE ENDURING APPEAL OF THESE MAJESTIC PLANTS.',
        'LOOK UP AND ENJOY THEIR TOWERING PRESENCE AS A REMINDER OF HOW PLANTS CAN CONNECT US TO DIFFERENT PLACES AND TIMES.',
      ],
      'image': 'assets/images/washingtonia_palms3.jpg'
    }
  ];

  var currentIndex = 0.obs;

  List<String> get currentText => content[currentIndex.value]['text'];
  String get currentImage => content[currentIndex.value]['image']!;

  void nextTextContent() {
    if (currentIndex.value < content.length - 1) {
      currentIndex.value++;
    } else {
      // Αν είμαστε στην τελευταία οθόνη και πατηθεί το δεξί βέλος
      Get.to(() => CodeAnimation2()); // Μεταβαίνεις στην οθόνη Carousel
    }
  }

  void previousTextContent() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    } else {
      // Αν είμαστε στην πρώτη οθόνη και πατηθεί το αριστερό βέλος
      Get.to(() => Explore1()); // Μεταβαίνεις στην οθόνη Explore1
    }
  }
}
