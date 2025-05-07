import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:task_app/models/question.dart';
import 'package:task_app/utils/colors/app_colors.dart';
import 'package:task_app/utils/styles/app_style.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  bool isSelected = false;
  bool isLastQuestion = false;
  Answers? selectAnswer;
  int score = 0;
  int questNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children:[
             Positioned(
        top: -100,
        left: -100,
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        ),
      ),


          Positioned(
            top: -80,
            left: -80,
            child: _buildCircle(200, Colors.white.withOpacity(0.1)),
          ),
          Positioned(
            top: 100,
            right: -50,
            child: _buildCircle(150, Colors.white.withOpacity(0.08)),
          ),
          Positioned(
            bottom: 100,
            left: -30,
            child: _buildCircle(120, Colors.white.withOpacity(0.06)),
          ),
          Positioned(
            bottom: -40,
            right: -40,
            child: _buildCircle(180, Colors.white.withOpacity(0.1)),
          ),

    

            Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Quiz App",
                style: HeadStyle.head,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Question ${index+1}/${questions.length}",
                    style: secondHead.secHead,
                  )),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
          
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          
                    // height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.quesBoxColor,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      questions[index].question,
                      style: Question.quest,
                    ),
                  ),
                  Positioned(
                      left: -35,
                      child: CircleAvatar(
                        backgroundColor: AppColors.scaffoldColor,
                        radius: 30,
                      )),
                  Positioned(
                    top: -10,
                    child: CircleAvatar(
                      backgroundColor: AppColors.quesBoxColor,
                      radius: 30,
                      child: Icon(
                        selectAnswer != null
                            ? (selectAnswer!.isCorrect
                                ? Icons.check
                                : Icons.close)
                            : Icons.timer_outlined,
                        color: selectAnswer != null
                            ? (selectAnswer!.isCorrect
                                ? Colors.green
                                : Colors.red)
                            : Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                      right: -35,
                      child: CircleAvatar(
                        backgroundColor: AppColors.scaffoldColor,
                        radius: 30,
                      )),
                ],
              ),
              for (int i = 0; i < questions[index].answers.length; i++)
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: AnswerButton(ans: questions[index].answers[i])),
              NextButton(),
            ],
          ),] 
        ),
      ),
    );
  }

  MaterialButton NextButton() {
    if (index == questions.length - 1) {
      isLastQuestion = true;
    }
    return MaterialButton(
      onPressed: () {
        if (selectAnswer!.isCorrect && isLastQuestion == false) {
          score++;
          index++;
        } else if (selectAnswer!.isCorrect && isLastQuestion == true) {
          score++;
        }
        if (isLastQuestion) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                      "${score > questions.length / 2 ? 'passed' : 'failed'} | score is $score / 4",style: TextStyle(color: Colors.green,fontSize: 27,fontWeight: FontWeight.bold),),
                      
                  content: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                          score = 0;
                          isLastQuestion = false;

                          Navigator.pop(context);
                        });
                      },
                      child: Text("reset",style: TextStyle(fontSize: 30),)),
                );
              });
        }
        setState(() {});
      },
      minWidth: 200,
      height: 50,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      color: AppColors.buttonColor,
      child: Text(
        isLastQuestion ? "Submit" : "Next",
        style: Question.quest,
      ),
    );
  }

  MaterialButton AnswerButton({required Answers ans}) {
    isSelected = selectAnswer == ans;
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      onPressed: () {
        if (ans.isCorrect) {}
        setState(() {
          selectAnswer = ans;
        });
      },
      child: Text(
        ans.answer,
        style: Question.quest,
      ),
      color: isSelected && ans.isCorrect
          ? Color.fromARGB(255, 94, 214, 85)
          : isSelected && ans.isCorrect == false
              ? Color.fromARGB(255, 214, 85, 85)
              : Color.fromARGB(255, 246, 246, 246),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }

  Widget _buildCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
