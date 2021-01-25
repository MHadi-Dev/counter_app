import 'package:flutter/material.dart';
import 'dart:math';

int main() {
  runApp(CounterApp());
}


class CounterApp extends StatelessWidget {
  const CounterApp({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Guess Number"),
        ),
      body:MainBody() 
      
       
      ),
    );
  }
}

class MainBody extends StatefulWidget {

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  
  int selection=0;
  int number=Random().nextInt(11);
  String isGuessCorrect="Wrong";
  Color resultColor=Colors.red;
  Color backColor=Colors.white;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backColor,
      child: Center(
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                child: Text("The number you have to guess is between 0 and 10",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
              ),
              SizedBox(
                height: 160,
              ),
              Container(
                child: Text("Your Guess",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
              ),
              Container(
                child: Text("$selection",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40),),
              ),
              
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    onPressed: ()
                    {
                      setState(() {
                        selection++;
                      });
                    },
                    color: Colors.blue,
                   child: Text("+",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40,color: Colors.white),)
                  ),
                  FlatButton(
                    onPressed: ()
                    {
                      setState(() {
                        selection--;
                      });
                    },
                    color: Colors.blue,
                   child: Text("-",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40),)
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              FlatButton(
                onPressed: ()
                {
                  if(selection==number)
                  {
                    setState(() {
                      isGuessCorrect="Right";
                      resultColor=Colors.white;
                      backColor=Colors.green;
                    });
                  }
                  else
                  {
                    if((selection-number).abs()<2)
                    {
                      backColor=Colors.amberAccent.shade400;
                    }
                    else if((selection-number).abs()<4)
                    {
                      backColor=Colors.amberAccent.shade200;
                    }
                    else
                    {
                      backColor=Colors.red;
                    }
                    setState(() {
                      isGuessCorrect="Wrong";
                      resultColor=Colors.red;
                      backColor=backColor;
                    });
                  }
                  
                },
                color: Colors.blue,
                child: Text("Check"),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text("The number you guessed is",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text("$isGuessCorrect",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30,color: resultColor),),
              ),
            ]
          ),
      ),
    );
  }
}