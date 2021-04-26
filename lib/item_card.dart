import 'package:flutter/material.dart';
import 'package:virt_shelf/rounded_button.dart';

class ItemCard extends StatelessWidget {
  final String title;

  final Function pressRead;
  final String auth;

  const ItemCard({
    Key key,
    this.title,
    this.pressRead,
    this.auth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 40),
      height: 245,
      width: 202,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 221,
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 19),
                    blurRadius: 33,
                    color: Color(0xFFD3D3D3).withOpacity(.84),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              height: 200,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: Color(0xFF393939)),
                        children: [
                          TextSpan(
                            text: "$title\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: auth,
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      /*GestureDetector(
                        child: Container(
                          width: 101,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text("Detaylar"),
                        ),
                      ),*/
                      Expanded(
                        child: RoundedButton(
                          text: "Oku",
                          press: pressRead,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
