import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class result extends StatelessWidget {
  double weight;
  double height;
  double bmi;
  var range = "";

  result(this.height, this.weight, this.bmi);

  void cal() {
    var b = bmi;
    if (b <= 18.4) {
      range = "UNDERWEIGHT";
    } else if (b >= 18.5 && b <= 24.9) {
      range = "NORMAL";
    } else if (b >= 25.0 && b <= 39.9) {
      range = "OVERWEIGHT";
    } else if (b >= 40) {
      range = "OBESE";
    }
  }

  //var bmi;
  @override
  Widget build(BuildContext context) {
    cal();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Result',
              style: Theme.of(context).textTheme.headline1,
            ),
            Container(
              width: 330,
              height: 270,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 46, 44, 44),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Your current BMI',
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 250,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          weight.toStringAsFixed(0) + " kg",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 90, 220, 94),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          height.toStringAsFixed(0) + ' cm',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 90, 220, 94),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Text(
                "Your BMI is ${bmi.toStringAsFixed(1)}, indicating your weight is in the ${range.toString()} category for adults of your height.",
                style: TextStyle(color: Colors.white60, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Text(
                "Maintaining a healthy weight may reduce the risk of chronic diseases associated with ovverweight and obesity.",
                style: TextStyle(color: Colors.white60, fontSize: 17),
              ),
            ),
            Container(
              width: 330,
              height: 55,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MyHomePage(title: "");
                  }));
                },
                child: Text(
                  'Recalculate BMI',
                  style: Theme.of(context).textTheme.headline2,
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 90, 220, 94))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
