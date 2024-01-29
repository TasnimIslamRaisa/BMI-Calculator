import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var note = "";
  var bgColor = Colors.purple.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Your BMI Calculator "),
            backgroundColor: Colors.purple.shade700,
            centerTitle: true,
            foregroundColor: Colors.white),
        body: Container(
          color: bgColor,
          child: Center(
              child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      //alignLabelWithHint: Null,
                      label: Text("Enter Your Weight in KG"),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      //alignLabelWithHint: Null,
                      label: Text("Enter Your height in feet"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      //alignLabelWithHint: Null,
                      label: Text("Enter Your height in inches"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        //BMI Calculation
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iin = int.parse(inch);
                        var totalinch = (ift * 12) + iin; //cm
                        var totalcm = totalinch * 2.54;
                        var totalmeter = totalcm / 100;
                        var bmi = iwt / (totalmeter * totalmeter);
                        var msg = "";
                        if (bmi < 18.5) {
                          msg = "You Are Underweight!";
                          bgColor = Colors.orange.shade100;
                        } else if (bmi >= 18.5 && bmi < 24.9) {
                          msg = "You Are Normalweight";
                          bgColor = Colors.green.shade100;
                        } else if (bmi > 24.9 && bmi < 29.9) {
                          msg = "You Are Overweight!!";
                          bgColor = Colors.red.shade100;
                        } else {
                          msg = "Obesity!!!";
                          bgColor = Colors.red.shade200;
                        }

                        setState(() {
                          result =
                              "$msg \n Your BMI Is : ${bmi.toStringAsFixed(2)} ";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the required blanks!!";
                        });
                      }
                    },
                    child: Text("Calculate")),
                SizedBox(
                  height: 25,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          )),
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
