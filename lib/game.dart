import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String _resultDeclaration = "";
  bool oTurn = true; //it decides O and X
  List<String> displayXO = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  ]; //holding spaces

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0; //its determine how many boxes are filled
  bool _winnerFound = false;
  bool _finish =
      false; //its determine Play Again and Enjoy texts on ElevatedButton
  List<int> matchedIndexes = [];
  static var customFontWhite = GoogleFonts.coiny(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 28));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Player X",
                              style: customFontWhite,
                            ),
                            Text(
                              "${xScore.toString()}",
                              style: customFontWhite,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 30,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Player O",
                              style: customFontWhite,
                            ),
                            Text(
                              "${oScore.toString()}",
                              style: customFontWhite,
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 4,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 5,
                                color: MainColor.primaryColor,
                              ),
                              color: matchedIndexes.contains(index)
                                  ? MainColor.accentColor
                                  : MainColor
                                      .secondaryColor //if matchedIndexes contains index then its color will be accentColor, else will be secondaryColor.
                              ),
                          child: Container(
                            child: Center(
                              child: Text(displayXO[index],
                                  style: GoogleFonts.coiny(
                                      fontSize: 64,
                                      color: MainColor.primaryColor)),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_resultDeclaration, style: customFontWhite),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _finish ==
                                      true //if app end then Play Again! display on screen , else display default Enjoy!
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              MainColor.secondaryColor,
                                          padding: EdgeInsets.all(10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)))),
                                      onPressed: () {
                                        _clearBoard();
                                      },
                                      child: Text(
                                        "Play Again!",
                                        style: customFontWhite,
                                      ))
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              MainColor.secondaryColor,
                                          padding: EdgeInsets.all(10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)))),
                                      onPressed: () {},
                                      child: Text(
                                        "EnjoyGame!",
                                        style: customFontWhite,
                                      )),
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: MainColor.secondaryColor,
                                      padding: EdgeInsets.all(15),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.home,
                                    size: 25,
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void _tapped(int index) {
    if (!_winnerFound && displayXO[index] == "") {
      setState(() {
        if (oTurn) {
          displayXO[index] = "O";
          filledBoxes++;
        } else {
          displayXO[index] = "X";
          filledBoxes++;
        }
        oTurn = !oTurn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    //1st row
    checkWinnerText(0, 1, 2);
    //2nd row
    checkWinnerText(3, 4, 5);
    //3rd row
    checkWinnerText(6, 7, 8);
    //1st column
    checkWinnerText(0, 3, 6);
    //2nd column
    checkWinnerText(1, 4, 7);
    //3rd column
    checkWinnerText(2, 5, 8);
    //diagonal
    checkWinnerText(0, 4, 8);
    //diagonal
    checkWinnerText(2, 4, 6);
  }

  //We do main check
  void checkWinnerText(int a, b, c) {
    if (displayXO[a] == displayXO[b] &&
        displayXO[a] == displayXO[c] &&
        displayXO[a] != "") {
      setState(() {
        _resultDeclaration = "Player ${displayXO[a]} Win";
        matchedIndexes = [
          a,
          b,
          c
        ]; //we show winner indexes and we change background color of container
        updateScore(displayXO[a]);
        _finish = true;
      });
    } else if (!_winnerFound && filledBoxes == 9) {
      setState(() {
        _resultDeclaration = "Nobody Wins";
        _finish = true;
      });
    }
  }

  void updateScore(String winner) {
    setState(() {
      if (winner == "X") {
        xScore++;
      } else if (winner == "O") {
        oScore++;
      }
      _winnerFound = true;
    });
  }

  void _clearBoard() {
    setState(() {
      if (!_winnerFound) {
        for (int i = 0; i < 9; i++) {
          displayXO[i] = "";
        }
        _resultDeclaration = "";
        filledBoxes = 0;
        oTurn = true; // Oyuna O ile başlama
        _winnerFound = false;
        matchedIndexes = [];
        _finish = false;
      } else {
        for (int i = 0; i < 9; i++) {
          displayXO[i] = "";
        }
        _resultDeclaration = "";
        filledBoxes = 0;
        oTurn = true; // Oyuna O ile başlama
        _winnerFound = false;
        matchedIndexes = [];
        _finish = false;
      }
    });
  }
}
