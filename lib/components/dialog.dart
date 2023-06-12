import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<String> ringtones = [
    'None',
    'Strong',
    'Highest',
    'Baddas',
    'Calindro',
    'Caontela',
    'Monida'
  ];

  String? selectedRing = 'None';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Ringtone'),
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ringtones.length,
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile(
              value: ringtones[index],
              groupValue: selectedRing,
              onChanged: (val) {
                setState(() {
                  selectedRing = val;
                });
              },
              title: Text(ringtones[index]),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, selectedRing);
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
