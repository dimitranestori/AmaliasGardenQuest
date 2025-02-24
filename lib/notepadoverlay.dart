import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotepadOverlay extends StatefulWidget {
  const NotepadOverlay({super.key});

  @override
  _NotepadOverlayState createState() => _NotepadOverlayState();
}

class _NotepadOverlayState extends State<NotepadOverlay> {
  final TextEditingController _controller = TextEditingController();
  String savedText = '';

  @override
  void initState() {
    super.initState();
    _loadSavedText();
  }

  // Φόρτωση αποθηκευμένου κειμένου από το SharedPreferences
  _loadSavedText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedText = prefs.getString('notepadText') ?? '';
      _controller.text = savedText;
    });
  }

  // Αποθήκευση κειμένου στο SharedPreferences
  _saveText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('notepadText', _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'Notebook',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextField(
                    controller: _controller,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Write here...',
                      border: InputBorder.none,
                    ),
                    onChanged: (text) {
                      _saveText();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
