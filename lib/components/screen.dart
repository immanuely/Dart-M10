import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/dialog.dart';

class RingtoneApp extends StatefulWidget {
  @override
  State<RingtoneApp> createState() => _RingtoneAppState();
}

class _RingtoneAppState extends State<RingtoneApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ringtone App'),
        ),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(left: 15.0, top: 10, bottom: 20),
                child: Text('Pengaturan Ringtone',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w100)),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return MyListView();
                    },
                  ).then((selectedRingtone) {
                    if (selectedRingtone != null) {
                      showBanner(context, selectedRingtone);
                    }
                  });
                },
                title: ListTile(
                  title: Text('Set Ringtone'),
                  trailing: Icon(Icons.arrow_right_outlined),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
                child: Divider(
                  color: Colors.black26,
                ),
              ),
            ])));
  }

  void showBanner(BuildContext context, String ringtone) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text('Pilih ${ringtone} sebagai Ringtone?'),
        leading: const Icon(
          Icons.info,
          color: Colors.orange,
        ),
        actions: [
          TextButton(
            child: Text('UPDATE'),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              showSnackbar(context, ringtone);
            },
          ),
          TextButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
              child: const Text('DISMISS')),
        ],
      ),
    );
  }

  void showSnackbar(BuildContext context, String ringtone) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 6),
        content: Text('Ringtone "$ringtone" berhasil diterapkan.'),
        action: SnackBarAction(
            label: 'DISMISS',
            onPressed: () =>
                ScaffoldMessenger.of(context).removeCurrentSnackBar()),
      ),
    );
  }
}
