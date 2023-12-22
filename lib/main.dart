import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finding Falcone',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> planets = [
    'Planet 1',
    'Planet 2',
    'Planet 3',
    'Planet 4',
    'Planet 5',
    'Planet 6',
  ];

  Map<String, List<String>> vehiclesByPlanet = {
    'Planet 1': ['Vehicle 1', 'Vehicle 2', 'Vehicle 3', 'Vehicle 4'],
    'Planet 2': ['Vehicle 1', 'Vehicle 2', 'Vehicle 3', 'Vehicle 4'],
    'Planet 3': ['Vehicle 1', 'Vehicle 2', 'Vehicle 3', 'Vehicle 4'],
    'Planet 4': ['Vehicle 1', 'Vehicle 2', 'Vehicle 3', 'Vehicle 4'],
    'Planet 5': ['Vehicle 1', 'Vehicle 2', 'Vehicle 3', 'Vehicle 4'],
    'Planet 6': ['Vehicle 1', 'Vehicle 2', 'Vehicle 3', 'Vehicle 4'],
  };

  String selectedPlanet = 'Planet 1';
  List<String> selectedVehicles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finding Falcone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedPlanet,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPlanet = newValue!;
                  selectedVehicles = [];
                });
              },
              items: planets.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Select a planet to search'),
            ),
            SizedBox(height: 16),
            Text('Select vehicles for the search:'),
            Column(
              children: vehiclesByPlanet[selectedPlanet]!.map((String vehicle) {
                return CheckboxListTile(
                  title: Text(vehicle),
                  value: selectedVehicles.contains(vehicle),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        selectedVehicles.add(vehicle);
                      } else {
                        selectedVehicles.remove(vehicle);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                findFalcone();
              },
              child: Text('Find Falcone'),
            ),
          ],
        ),
      ),
    );
  }

  void findFalcone() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mission Details'),
          content: Text(
              'King Shan is searching $selectedPlanet with the following vehicles: ${selectedVehicles.join(", ")}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}


