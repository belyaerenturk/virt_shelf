import 'dart:io';

import 'package:flutter/material.dart';
import 'package:virt_shelf/items/pdf_api.dart';
import 'package:virt_shelf/screens/about_screen.dart';
import 'package:virt_shelf/screens/book_writer.dart';
import 'package:virt_shelf/screens/opening_screen.dart';
import 'package:virt_shelf/screens/pdf_viewer_page.dart';
import 'package:virt_shelf/screens/settings_screen.dart';
import 'package:virt_shelf/screens/statistics_screen.dart';
import 'package:virt_shelf/services/auth_services.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
  );

  AuthService _authService = AuthService();

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
                    leading: Icon(Icons.file_upload),
                    title: Text("Dosya Aç"),
                    onTap: () async {
                      final file = await PDFApi.pickFile();
                      if (file == null) return;
                      openPDF(context, file);
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.open_in_browser),
                    title: Text("Gizlilik Sözleşmesi"),
                    onTap: () async {
                      final url =
                          'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      openPDF(context, file);
                    },
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.attach_file_sharp),
                    title: Text("Eserler ve Yazarları"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BookWriter();
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
                    leading: Icon(Icons.show_chart),
                    title: Text("İstatistikler"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StatisticsScreen()),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OpeningScreen()));
                      },
                      child: Text("ÇIKIŞ YAP",
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2.2,
                              color: Colors.black)),
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
