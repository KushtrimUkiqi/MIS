import 'package:flutter/material.dart';
import 'package:lab2/dto/ClothesQuestion.dart';

import 'components/button.dart';
import 'dto/ClothSelection.dart';

void main() => runApp(const MaterialApp(
  home: ClothesPage(),
));

class ClothesPage extends StatefulWidget {
  const ClothesPage({Key? key}) : super(key: key);

  @override
  State<ClothesPage> createState() => _ClothesPageState();
}



class _ClothesPageState extends State<ClothesPage> {

  int currentCounter = 0;

  bool showQuestions = true;
  String clothesSelection = "";
  List<ClothesSelection> selectedClothes = [];

  List<List<String>> selectedColors = [];

  List<ClothesQuestions> questions = [
    ClothesQuestions(1, "shirt" , "Which color should my shirt be?", ["red", "green", "blue", "orange"]),
    ClothesQuestions(2, "jeans", "What color should my jeans be?", ["black", "gray", "light blue", "dark blue"]),
    ClothesQuestions(3, "sneakers" ,"What color should my sneakers be?", ["black", "white", "gray", "brown"]),
  ];

  void onPressed(String cloth,String value){
    setState(() {
      selectedColors.add([cloth, value]);
      currentCounter++;

      selectedClothes.add(ClothesSelection(cloth, value));

      if(selectedColors.length >= questions.length){
        showQuestions = false;
        currentCounter = 0;
        clothesSelection = selectedColors.map((e) => " for " + e[0] + " is " + e[1]).join(" ,");
        selectedColors = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        elevation: 0.0,
        centerTitle: true,
        title: const Text(""),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: Column(
            children: [
              Visibility(
                visible: showQuestions,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      heightFactor: 15.0,
                      child: Text(
                          questions[currentCounter].question,
                          style: const TextStyle(
                            color: Colors.blue,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClothesButton(
                          onPressed: (int index)
                          {
                            onPressed(questions[currentCounter].clotheType ,questions[currentCounter].answers[0]);
                          },
                          index: 1,
                          text: questions[currentCounter].answers[0],
                        ),
                        ClothesButton(
                          onPressed: (int index)
                          {
                            onPressed(questions[currentCounter].clotheType ,questions[currentCounter].answers[1]);
                          },
                          index: 1,
                          text: questions[currentCounter].answers[1],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClothesButton(
                          onPressed: (int index)
                          {
                            setState(() {
                              onPressed(questions[currentCounter].clotheType ,questions[currentCounter].answers[2]);
                            });
                          },
                          index: 2,
                          text: questions[currentCounter].answers[2],
                        ),
                        ClothesButton(
                          onPressed: (int index)
                          {
                            onPressed(questions[currentCounter].clotheType ,questions[currentCounter].answers[3]);
                          },
                          index: 3,
                          text: questions[currentCounter].answers[3],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                  visible: !showQuestions,
                  child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Center(
                            child: Text(
                                "Your clothes selection is" +  clothesSelection
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: ElevatedButton(
                              onPressed: () => {
                                setState((){
                                  currentCounter = 0;
                                  selectedColors = [];
                                  showQuestions = true;
                                  clothesSelection = "";
                                })
                              },
                              child: Text("Start over")),
                        )
                      ]
                  )
              )
            ]
        ),
      ),
    );
  }

  void _addCloth(BuildContext context) {

  }

  void _editCloth(BuildContext context, int index) {
  }

  void _deleteCloth(int index) {
  }
}