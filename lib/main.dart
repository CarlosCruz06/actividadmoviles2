import 'package:flutter/material.dart';
import 'package:GvApp/screen/contacts.dart';
import 'package:GvApp/screen/qr_code_scanner_screen.dart';
import 'package:GvApp/screen/speech_to_text.dart';
import 'package:GvApp/screen/text_to_speech.dart';
import 'package:GvApp/screen/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:GvApp/screen/sensor.dart';

final Uri _url = Uri.parse('https://github.com/cristianrm13/APP_practica2.git');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade900),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<Widget> _screens = [
    const ContactsScreen(),
    const QrCodeScannerScreen(),
    const SpeechSampleApp(),
    TtsPage(),
    const LocationStatusScreen(),
    const SensorScreen(), // Agrega aquí la pantalla oscura de ubicación
  ];

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('No se pudo abrir la URL $_url');
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            physics: const NeverScrollableScrollPhysics(),
            children: _screens,
          ),
          Positioned(
            top: 25,
            left: 325,
            child: FloatingActionButton(
              onPressed: _launchUrl,
              tooltip: 'Flutter',
              backgroundColor: const Color.fromARGB(132, 134, 133, 133),
              elevation: 10,
              child: const Icon(Icons.circle_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.contacts_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Scanner'),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Speech'),
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'TTS'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Location'),
          BottomNavigationBarItem(icon: Icon(Icons.sensors), label: 'Sensors'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
