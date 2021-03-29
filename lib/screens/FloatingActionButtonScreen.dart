import 'package:flutter/material.dart';

class FloatingActionButtonScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<FloatingActionButtonScreen> {
  int _count = 0;
  FloatingActionButtonLocation _location =
      FloatingActionButtonLocation.endDocked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonScreen'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          ListTile(title: Text("$_count")),
          RadioListTile(
            title: const Text('endDocked'),
            value: FloatingActionButtonLocation.endDocked,
            groupValue: _location,
            onChanged: (FloatingActionButtonLocation value) {
              setState(() {
                _location = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('startDocked'),
            value: FloatingActionButtonLocation.startDocked,
            groupValue: _location,
            onChanged: (FloatingActionButtonLocation value) {
              setState(() {
                _location = value;
              });
            },
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: this.incrementCounter,
        label: const Text('Plus'),
        icon: const Icon(Icons.plus_one),
        backgroundColor: Colors.pink,
      ),
      floatingActionButtonLocation: _location,
    );
  }

  void incrementCounter() {
    setState(() {
      this._count++;
    });
  }
}
