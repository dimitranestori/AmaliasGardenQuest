import 'dart:math';

import 'start_screen.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controllerAmalias;
  late AnimationController _controllerGarden;
  late AnimationController _controllerQuest;

  late AnimationController _controllerExpandSquare;
  late Animation<double> _expandedSquareSize;

  late Animation<double> _squareSize;
  late Animation<double> _rotation;
  late Animation<double> _textProgressAmalias;
  late Animation<double> _textProgressGarden;
  late Animation<double> _textProgressQuest;

  late Animation<double> _moveUpAmalias;
  late Animation<double> _moveUpGarden;
  late Animation<double> _moveUpQuest;

  String _visibleWordAmalias = "";
  String _visibleWordGarden = "";
  String _visibleWordQuest = "";

  final String wordAmalias = "Amalia's";
  final String wordGarden = "Garden";
  final String wordQuest = "Quest";

  @override
  void initState() {
    super.initState();

    // Animation για "Amalia's"
    _controllerAmalias = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _squareSize = TweenSequence([
      TweenSequenceItem(
          tween: Tween<double>(begin: 40.0, end: 60.0), weight: 1),
      TweenSequenceItem(
          tween: Tween<double>(begin: 60.0, end: 20.0), weight: 1),
    ]).animate(
      CurvedAnimation(parent: _controllerAmalias, curve: Interval(0.0, 0.4)),
    );

    _rotation = Tween<double>(begin: 0.0, end: 0.25).animate(
      CurvedAnimation(parent: _controllerAmalias, curve: Interval(0.0, 0.4)),
    );

    _textProgressAmalias = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerAmalias,
        curve: Interval(0.4, 1.0, curve: Curves.linear),
      ),
    );

    _moveUpAmalias = Tween<double>(begin: 0.0, end: -80.0).animate(
      CurvedAnimation(parent: _controllerAmalias, curve: Curves.easeInOut),
    );

    // Animation για "Garden"
    _controllerGarden = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _textProgressGarden = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controllerGarden, curve: Curves.linear),
    );

    _moveUpGarden = Tween<double>(begin: 80.0, end: 0.0).animate(
      CurvedAnimation(parent: _controllerGarden, curve: Curves.easeInOut),
    );

    // Animation για "Quest"
    _controllerQuest = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _textProgressQuest = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controllerQuest, curve: Curves.linear),
    );

    _moveUpQuest = Tween<double>(begin: 160.0, end: 80.0).animate(
      CurvedAnimation(parent: _controllerQuest, curve: Curves.easeInOut),
    );

    // Animation για την μεγέθυνση του τετραγώνου
    _controllerExpandSquare = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _expandedSquareSize = Tween<double>(begin: 60.0, end: 1000.0).animate(
      CurvedAnimation(parent: _controllerExpandSquare, curve: Curves.easeInOut),
    );

    // Εκκίνηση όλων των animations με μικρή καθυστέρηση
    _controllerAmalias.forward();
    _controllerAmalias.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerGarden.forward();
      }
    });

    _controllerGarden.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerQuest.forward();
      }
    });

    _controllerQuest.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerExpandSquare.forward();
      }
    });

    _controllerAmalias.addListener(() {
      setState(() {
        _visibleWordAmalias =
            _calculateVisibleWord(_textProgressAmalias.value, wordAmalias);
      });
    });

    _controllerGarden.addListener(() {
      setState(() {
        _visibleWordGarden =
            _calculateVisibleWord(_textProgressGarden.value, wordGarden);
      });
    });

    _controllerQuest.addListener(() {
      setState(() {
        _visibleWordQuest =
            _calculateVisibleWord(_textProgressQuest.value, wordQuest);
      });
    });

    _controllerExpandSquare.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        Future.delayed(Duration(milliseconds: 100), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StartScreen()),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controllerAmalias.dispose();
    _controllerGarden.dispose();
    _controllerQuest.dispose();
    _controllerExpandSquare.dispose();
    super.dispose();
  }

  String _calculateVisibleWord(double progress, String word) {
    final visibleLength = (progress * word.length).clamp(0, word.length);
    final wholeLength = visibleLength.floor();
    final partialCharOpacity = visibleLength - wholeLength;
    return word.substring(0, wholeLength) +
        (partialCharOpacity > 0 ? word[wholeLength] : "");
  }

  double _getTextWidth(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final textStyle = TextStyle(
      fontFamily: 'Inter',
      fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    return Scaffold(
      backgroundColor: Color(0xFF044F65),
      body: Stack(
        children: [
          Positioned(
            left: screenWidth / 4,
            top: screenHeight / 2 - 40 + _moveUpAmalias.value,
            child: Text(_visibleWordAmalias, style: textStyle),
          ),
          Positioned(
            left: screenWidth / 4,
            top: screenHeight / 2 + 20 + _moveUpGarden.value,
            child: Text(_visibleWordGarden, style: textStyle),
          ),
          Positioned(
            left: screenWidth / 4,
            top: screenHeight / 2 + 80 + _moveUpQuest.value,
            child: Text(_visibleWordQuest, style: textStyle),
          ),
          AnimatedBuilder(
            animation:
                Listenable.merge([_controllerAmalias, _controllerExpandSquare]),
            builder: (context, child) {
              final squareSize = _controllerExpandSquare.isCompleted
                  ? _expandedSquareSize.value
                  : _controllerExpandSquare.isAnimating
                      ? _expandedSquareSize.value
                      : _squareSize.value;

              final amaliasWidth =
                  _getTextWidth(_visibleWordAmalias, textStyle);

              const double spacing = 10.0;

              final squareLeft =
                  (screenWidth / 4) + amaliasWidth + spacing - (squareSize / 2);
              final squareTop =
                  (screenHeight / 2 - 40 + 60 + _moveUpAmalias.value) -
                      (squareSize / 2);

              return Positioned(
                left: squareLeft,
                top: squareTop,
                child: Transform.rotate(
                  angle: _rotation.value * pi / 4,
                  child: Container(
                    width: squareSize,
                    height: squareSize,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFF8FC30),
                          Color(0xFF51F81A),
                          Color(0xFF31BA15),
                          Color(0xFF0E7811),
                          Color(0xFF003901),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: _controllerExpandSquare.isAnimating ||
                              _controllerExpandSquare.isCompleted
                          ? BorderRadius.circular(0)
                          : BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
