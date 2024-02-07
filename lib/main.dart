import 'package:bmi_app/result.dart';
import 'package:bmi_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';

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
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          useMaterial3: true,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 15, color: Colors.white),
          )),
      home: spsc(),
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
  var height = TextEditingController();
  var weight = TextEditingController();
  var age = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
//backgroundColor: Theme.of(context).primaryColor,
          title: Text(widget.title),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text(
                    "BMI Calculator",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 310, bottom: 20),
                  child: Text(
                    'Weight',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                          controller: weight,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Enter: ",
                              prefixIcon: Icon(FontAwesomeIcons.weight),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                        "kg",
                        style: TextStyle(fontSize: 25),
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 310, bottom: 20),
                  child: Text(
                    'Height',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                          controller: height,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Enter:",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              prefixIcon: Icon(Icons.accessibility)),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                        "cm",
                        style: TextStyle(fontSize: 25),
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 320, bottom: 20),
                  child: Text(
                    "Age",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 7),
                  child: Container(
                    width: 370,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: age,
                      decoration: InputDecoration(
                          prefixIcon: Icon(FontAwesomeIcons.star),
                          hintText: "Enter:",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Container(
                  width: 370,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {
                      double h = double.parse(height.text);
                      double w = double.parse(weight.text);
                      double bmi = w / ((h / 100) * (h / 100));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return result(h, w, bmi);
                      }));
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 90, 220, 94))),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
