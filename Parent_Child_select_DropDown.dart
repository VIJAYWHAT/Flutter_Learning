import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedParentValue;
  String? selectedChildValue;

  // Define the available parent and child dropdown values.
  final List<String> parentValues = ['Electrical', 'Plumbing', 'Painting'];
  final Map<String, List<String>> childValues = {
    'Electrical': ['Wires', 'Swiches', 'Bulbs'],
    'Plumbing': ['Tupes', 'Taps'],
    'Painting': ['Paint', 'Brush', 'Paint Remover'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Parent Container Dropdown
            DropdownButton<String>(
              value: selectedParentValue,
              hint: Text('Select The Category'),
              onChanged: (newValue) {
                setState(() {
                  selectedParentValue = newValue;
                  // When the parent value is changed, update the child value and reset the child dropdown
                  selectedChildValue = null;
                });
              },
              items: parentValues.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Child Container Dropdown
            DropdownButton<String>(
              value: selectedChildValue,
              hint: Text('Sub Category'),
              onChanged: (newValue) {
                setState(() {
                  selectedChildValue = newValue;
                });
              },
              items: selectedParentValue != null
                  ? childValues[selectedParentValue]?.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()
                  : [], // Show empty list when no parent value is selected.
            ),
          ],
        ),
      ),
    );
  }
}
