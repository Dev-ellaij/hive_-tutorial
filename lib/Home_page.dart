import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');

  // Write data
  void writeData() {
    _myBox.put(2, 'Dave');
  }

  // Read data
  String readData() {
    return _myBox.get(2, defaultValue: 'No data found');
  }

  // Delete data
  void deleteData() {
    _myBox.delete(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: writeData,
              // ignore: sort_child_properties_last
              child: const Text('Write'),
              color: Colors.pink[200],
            ),
            MaterialButton(
              onPressed: () {
                final data = readData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Read Data: $data')),
                );
              },
              // ignore: sort_child_properties_last
              child: const Text('Read'),
              color: Colors.pink[200],
            ),
            MaterialButton(
              onPressed: deleteData,
              // ignore: sort_child_properties_last
              child: const Text('Delete'),
              color: Colors.pink[200],
            ),
          ],
        ),
      ),
    );
  }
}
