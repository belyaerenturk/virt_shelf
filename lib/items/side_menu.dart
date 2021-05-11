import 'package:flutter/material.dart';
import 'package:virt_shelf/items/constants.dart';
import 'package:virt_shelf/screens/about_screen.dart';
import 'package:virt_shelf/screens/opening_screen.dart';
import 'package:virt_shelf/screens/settings_screen.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/images/mylogo.png"),
            Expanded(
              child: ListView(
                children: [
                  // ListTile(leading, title, trailing)
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('HESAP'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("HAKKINDA"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AboutScreen();
                          },
                        ),
                      );
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("AYARLAR"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  Center(
                    child: OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return OpeningScreen();
                            },
                          ),
                        );
                      },
                      child: Text("ÇIKIŞ YAP",
                          style: TextStyle(
                              fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}