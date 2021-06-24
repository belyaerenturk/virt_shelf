import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virt_shelf/items/constants.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var kullaniciAdi = TextEditingController();
  var sifre = TextEditingController();
  var spKullaniciAdi;
  var spSifre;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> girisKontrol() async {
    var id = kullaniciAdi.text;
    var pass = sifre.text;
    var sp = await SharedPreferences.getInstance();
    setState(() {
      spKullaniciAdi = sp.getString("kullaniciAdiKayit");
      spSifre = sp.getString("sifreKayit");

      if(id == spKullaniciAdi && pass == spSifre) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);
      }
      else {
        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Kullanici adi veya sifre yanlis.")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vLightRed,
      key: scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80.0,
              ),
              Text(
                "Hesabınız yoksa lütfen kayıt olunuz.\n",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: TextField(
                  controller: kullaniciAdi,
                  decoration: InputDecoration(
                    labelText: 'Kullanıcı Adı',
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: TextField(
                  controller: sifre,
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    prefixIcon: Icon(Icons.security),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {
                          girisKontrol();
                        },
                        child: Text(
                          'Giriş yap',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
