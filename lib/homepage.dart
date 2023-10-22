import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/constants/colors.dart';
import 'package:flutter_tic_tac_toe/game.dart';
import 'package:flutter_tic_tac_toe/info.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static var customFontWhite = GoogleFonts.coiny(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 28));
  static var customFontWhiteTitle = GoogleFonts.coiny(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 40));
  static var customFontWhiteEren = GoogleFonts.coiny(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 13));                

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: Center(child: Text("Tic-Tac-Toe\n    Game",style: customFontWhiteTitle,))),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MainColor.secondaryColor,
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return GameScreen();
                      }));
                    },
                    child: Text(
                      "Play",
                      style: customFontWhite,
                    )),
                    SizedBox(height:30,),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MainColor.secondaryColor,
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return GameInfo();
                      }));
                    },
                    child: Text(
                      "Info",
                      style: customFontWhite,
                    )),
                    SizedBox(height:30,),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MainColor.secondaryColor,
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Quit",
                      style: customFontWhite,
                    )),
                    SizedBox(height: 50,),
                    Text("Powered By Eren Çetin",style: customFontWhiteEren,),
                    SizedBox(height: 10,),
                    Text("Version:1.0.0",style: customFontWhiteEren,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
