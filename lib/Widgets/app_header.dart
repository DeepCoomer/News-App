import 'package:flutter/material.dart';
import 'package:mynewsapp/Utils/config.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Todays Headline',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: (){
                currentTheme.switchTheme();
              },
              child: Icon(
                Icons.light_mode,
                size: 40,
              ),
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
