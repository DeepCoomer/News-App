import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('This feature is not supported yet')));
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Send Notifications',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: toggleSwitch,
                  activeColor: Colors.blue,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
