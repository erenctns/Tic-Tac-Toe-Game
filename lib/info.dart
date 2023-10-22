import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GameInfo extends StatelessWidget {
  const GameInfo({super.key});
  static var customFontWhiteSmall = GoogleFonts.coiny(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 25));
  static var customFontWhiteMiddle = GoogleFonts.coiny(
      textStyle:
          TextStyle(color:Colors.white, letterSpacing: 3, fontSize: 28));
  static var customFontWhiteBig = GoogleFonts.coiny(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 45));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              child: Center(
                child: Text(
                  "How To Play \nThis Game?",
                  style: customFontWhiteBig,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: Text(
                  "The game is played on a grid that's 3 squares by 3 squares. You are X , your friend is O . Players take turns putting their marks in empty squares. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.",
                  style: customFontWhiteSmall,
                  textAlign: TextAlign.center),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: MainColor.secondaryColor,
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.home,
                  size: 25,
                )),
          ],
        ));
  }
}
