import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynewsapp/Utils/routes.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Categories',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            ListTile(
                onTap: () => Navigator.pushNamed(context, MyRoutes.homeroute),
                leading: Icon(CupertinoIcons.globe),
                title: Text('World News'),
                hoverColor: Colors.black26,
                selected: true,
                selectedTileColor: Colors.black26),
            ListTile(
              onTap: () => Navigator.pushNamed(context, MyRoutes.indiaroute),
              leading: Image.asset('assets/images/flag.webp',height: 30,width: 32,),
              title: Text('India News'),
              hoverColor: Colors.black26,
              selected: false,
              selectedTileColor: Colors.transparent,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.scienceroute);
              },
              leading: Icon(Icons.science),
              title: Text('Science and Technology'),
              hoverColor: Colors.black26,
              selected: false,
              selectedTileColor: Colors.transparent,
            ),
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.businessroute);
                },
                leading: Icon(Icons.business),
                title: Text('Business'),
                hoverColor: Colors.black26,
                selected: false,
                selectedTileColor: Colors.transparent),
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.covidroute);
                },
                leading: Icon(Icons.health_and_safety),
                title: Text('Health'),
                hoverColor: Colors.black26,
                selected: false,
                selectedTileColor: Colors.transparent),
            Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.34,
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.settingroute);
              },
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              hoverColor: Colors.black26,
              selected: false,
              selectedTileColor: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
