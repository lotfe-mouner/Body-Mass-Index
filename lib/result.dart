import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final bool isMale;
  final double result;
  final int age;

  const Result({Key? key, required this.result, required this.isMale, required this.age,
  }) : super(key: key);


  String get resultPhrase{
String resultText='';
if(result >=30) return resultText='Obese';
else if (result>=25 && result <30) return resultText='Overweight';
else if (result >=18.5 && result <24.9) return resultText = 'Normal';
else return resultText='Thin';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Gender : ${isMale ? "Male" : "Female"}',
                style:Theme.of(context).textTheme.headline1,
              ),
              Text(
                'Result  : ${result.toStringAsFixed(1)}', //changes result to string after taking 1 value of the result afer the .
                style:Theme.of(context).textTheme.headline1,
              ),
              Text(
                'Healthiness: $resultPhrase',
                style:Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ), Text(
                'Age: $age',
                style:Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
