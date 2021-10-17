import 'dart:math';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;

  //double heightVal = 170;

  int weight = 65;
  int age = 18;

  TextEditingController myController = TextEditingController();

  var enteredValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Body Mass Index"),
          centerTitle: true,
        ),
        body: SafeArea(
          // safe area will place the widgets away from the mobile notch
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      buildExpanded(context, 'male'),
                      SizedBox(width: 15),
                      buildExpanded(context, 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Height",
                            style: Theme.of(context).textTheme.headline2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('${enteredValue.toStringAsFixed(1)}',
                                style: Theme.of(context).textTheme.headline1),
                            Text("cm",
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(12.0),
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: Colors.blueGrey,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: "Enter Your Height",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              suffixIcon: TextButton(
                                child: Text("Done",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                onPressed: () {
                                  setState(() {
                                    //initialValue = myController.text;
                                    enteredValue =
                                        double.parse(myController.text);
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            controller: myController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      buildExpanded_2(context, 'weight'),
                      SizedBox(width: 15),
                      buildExpanded_2(context, 'age'),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.tealAccent,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 17,
                child: TextButton(
                  onPressed: () {
                    var result = weight / pow(enteredValue / 100, 2);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            Result(result: result, isMale: isMale, age: age),
                      ),
                    );
                  },
                  child: Text(
                    "Calculate",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildExpanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          isMale = type == 'male' ? true : false;
        }),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'male' ? Icons.male : Icons.female, size: 90),
              SizedBox(height: 15),
              Text(
                type == 'male' ? "Male" : "Female",
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildExpanded_2(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? "Age" : "Weight",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  type == 'age' ? "$age" : "$weight",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(width: 3),
                Text(
                  type == 'age' ? "yr" : "kg",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'Weight--',
                  onPressed: () => setState(() => type == 'age'
                      ? (age <= 0 ? age : age--)
                      : (weight <= 0 ? weight : weight--)),
                  child: Icon(Icons.remove),
                  mini: true,
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'Weight++',
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  child: Icon(Icons.add),
                  mini: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
