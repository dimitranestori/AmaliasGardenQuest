import 'package:get/get.dart';
import '../initial_animation/start_screen.dart';
import '../instructions/instruction_screen.dart';

class InfoController extends GetxController {
  final List<Map<String, dynamic>> content = [
    {
      'text': [
        "THE NATIONAL GARDEN WAS CREATED BETWEEN 1838 AND 1840 BY ORDER OF QUEEN AMALIA, THE WIFE OF KING OTTO AND THE FIRST QUEEN OF GREECE. THE GERMAN AGRONOMIST FREDERICK SCHMIDT WAS RESPONSIBLE FOR ITS PLANTING. HE IMPORTED MORE THAN 500 PLANT SPECIES FROM GREECE AND AROUND THE WORLD, INCLUDING MANY TROPICAL PLANTS. UNFORTUNATELY, WITH THE PASSAGE OF TIME, SOME OF THESE PLANTS DIDN'T SURVIVE THE MEDITERRANEAN CLIMATE, BUT THOSE WHO HAVE SURVIVED, CREATE A LOVELY ENVIRONMENT TO RELAX.",
      ],
      'image': 'assets/images/history_1.png',
      'foregroundImage':
          null, // Δεν εμφανίζεται άλλη εικόνα στη θέση του κειμένου
    },
    {
      'text': [
        "INITIALLY, IT WAS NAMED ROYAL GARDEN BECAUSE IT WAS FENCED AND ONLY THE ROYAL FAMILY HAD THE RIGHT TO WALK THERE. THE PEOPLE WERE ONLY ALLOWED TO STROLL AROUND IN ZAPPEION, ANOTHER SMALL PARK NEXT TO THE ROYAL GARDEN. HOWEVER, AFTER THE RESTORATION OF DEMOCRACY IN GREECE IN 1975, THE PARK WAS NAMED NATIONAL GARDEN AND BECAME OPEN TO THE PUBLIC. TODAY, IT WELCOMES GUESTS FROM SUNRISE TO SUNSET.",
      ],
      'image': 'assets/images/history_2.png',
      'foregroundImage':
          null, // Δεν εμφανίζεται άλλη εικόνα στη θέση του κειμένου
    },
    {
      'text': null, // Χωρίς κείμενο
      'image': 'assets/images/history_3.png', // Νέα εικόνα για το background
      'foregroundImage':
          'assets/images/history_dates.png', // Εικόνα στη θέση του κειμένου
    },
  ];

  var currentIndex = 0.obs;

  List<String>? get currentText => content[currentIndex.value]['text'];
  String get currentImage => content[currentIndex.value]['image']!;

  void nextTextContent() {
    if (currentIndex.value < content.length - 1) {
      currentIndex.value++;
    } else {
      // Αν είμαστε στην τελευταία οθόνη και πατηθεί το δεξί βέλος
      Get.to(() => InstructionsScreen()); // Μεταβαίνεις στην οθόνη Carousel
    }
  }

  void previousTextContent() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    } else {
      // Αν είμαστε στην πρώτη οθόνη και πατηθεί το αριστερό βέλος
      Get.to(() => StartScreen()); // Μεταβαίνεις στην οθόνη Explore1
    }
  }
}
