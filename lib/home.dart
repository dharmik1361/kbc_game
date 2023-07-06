// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import f'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(KBCGAME());

class KBCGAME extends StatefulWidget {
  const KBCGAME({Key? key}) : super(key: key);

  @override
  State<KBCGAME> createState() => _KBCGAMEState();
}

class _KBCGAMEState extends State<KBCGAME> {
  int questionIndex = 0;
  int timeLeft = 30;
  int totalEarnings = 0;

  List<String> questions = [
    "The International Literacy Day is observed on which date?",
    "Which of the following corresponds to 'ek bataa do'?",
    "Which of the following deities is also known as 'Gauri Nandan'?",
    "In the game of ludo, the discs or tokens are of how many colors?",
    "Which of these are names of national parks located in Madhya Pradesh?",
    "Where was the BRICS summit held in 2014?",
    "Who wrote the introduction to the English translation of Rabindranath Tagore's Gitanjali?",
    "Which of these leaders was a recipient of a gallantry award in 1987 by a state government for saving two girls from drowning?",
    "The wife of which of these famous sports persons was once captain of the Indian volleyball team?",
    "Which of these terms can only be used for women?",
  ];

  List<List<String>> options = [
    ["A. Sep 8", "B. Nov 28", "C. May 2", "D. Sep 22"],
    ["A. Pura", "B. Sava", "C. Adha", "D. Pauna"],
    ["A. Agni", "B. Indra", "C. Hanuman", "D. Ganesha"],
    ["A. One", "B. Two", "C. Three", "D. Four"],
    [
      "A. Krishna and Kanhaiya",
      "B. Kanha and Madhav",
      "C. Ghanshyam and Murari",
      "D. Girdhar and Gopal"
    ],
    ["A. Brazil", "B. India", "C. Russia", "D. China"],
    ["A. PB Shelley", "B. Alfred Tennyson", "C. WB Yeats", "D. TS Elliot"],
    [
      "A. Anandiben Patel",
      "B. Vasundhara Raje Scindia",
      "C. Uma Bharti",
      "D. Mamata Banerjee"
    ],
    ["A. K.D. Jadav", "B. Dhyan Chand", "C. Prakash Padukone", "D. Milkha Singh"],
    ["A. Dirghaayu", "B. Suhagan", "C. Chiranjeevi", "D. Sushil"],
  ];

  List<String> correctAnswers = [
    "A. Sep 8",
    "C. Adha",
    "D. Ganesha",
    "D. Four",
    "B. Kanha and Madhav",
    "A. Brazil",
    "C. WB Yeats",
    "A. Anandiben Patel",
    "D. Milkha Singh",
    "B. Suhagan",
  ];

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (timeLeft < 1) {
          timer.cancel();
          handleAnswer(false);
        } else {
          timeLeft -= 1;
        }
      });
    });
  }

  void handleAnswer(bool isCorrect) {
    if (isCorrect) {
      totalEarnings += 1000;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              LossScreen(totalEarnings: totalEarnings),
        ),
      );
      return;
    }

    if (questionIndex == questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              WinScreen(totalEarnings: totalEarnings),
        ),
      );
      return;
    }

    setState(() {
      questionIndex += 1;
      timeLeft = questionIndex < 5 ? 30 : 60;
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5b1d8c),
      appBar: AppBar(
        title: Text("KBC GAME"),
        backgroundColor: Color(0xff111b5c),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: Image.asset(
                  "image/logo.png",
                  height: 150,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 30,
                width: 40,
                child: Center(
                  child: Text(
                    timeLeft.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  color: Color(0xff111b5c),
                ),
              ),
              Container(
                height: 50,
                width: 400,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    questions[questionIndex],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff111b5c),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: options[questionIndex]
                    .map(
                      (option) => Container(
                    height: 40,
                    width: 400,
                    margin: EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: () => handleAnswer(
                          option == correctAnswers[questionIndex]),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xff111b5c)),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            option,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.skip_previous),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.skip_next),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff111b5c)),
                ),
                child: Text(
                  "Quit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 1),
          TextButton(
            onPressed: () {},
            child: Text("Audience"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Phone a Friend"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("50/50"),
          ),
        ],
      ),
    );
  }
}

class WinScreen extends StatelessWidget {
  final int totalEarnings;

  const WinScreen({Key? key, required this.totalEarnings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("image/win.png", height: 200),
          SizedBox(height: 20),
          Text(
            "Congratulations!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "You have earned \$${totalEarnings.toString()}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Next Question"),
          ),
        ],
      ),
    );
  }
}

class LossScreen extends StatelessWidget {
  final int totalEarnings;

  const LossScreen({Key? key, required this.totalEarnings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("image/lose.png", height: 200),
          SizedBox(height: 20),
          Text(
            "Wrong Answer!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "You have earned \$${totalEarnings.toString()}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
