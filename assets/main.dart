import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lolita',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(25, 74, 3, 77)),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _longController = TextEditingController();
  final TextEditingController _latController = TextEditingController();

  void _showConfirmationMessage() {
    final String long = _longController.text;
    final String lat = _latController.text;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Données entrées",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text("long: $long"),
              Text("lat: $lat"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Données Géographiques et Altitude"),
        backgroundColor: const Color.fromARGB(255, 3, 110, 110),
      ),
      body: Container(
        height: size.height,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', 
              
              height: 100,
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Envoyer les données de géolocalisation",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _longController,
                    decoration: const InputDecoration(
                      labelText: 'Longitude',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: _latController,
                    decoration: const InputDecoration(
                      labelText: 'Latitude',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _showConfirmationMessage,
              child: const Text("Envoyer"),
            ),
          ],
        ),
      ),
    );
  }
}