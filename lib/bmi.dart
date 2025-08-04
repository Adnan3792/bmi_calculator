import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmi();
}

class _bmi extends State<bmi> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bmitype = "";
  var health = "";
  var bmitypecolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Container(
          width: 350,
          child: ListView(
            scrollDirection: Axis.vertical,

            children: [
              Text(
                "BMI",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
              ),
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  label: Text("Enter your Weight"),
                  prefixIcon: Icon(Icons.line_weight_rounded),
                  suffixText: "Kg",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 18,
              ),
              TextField(
                controller: feetController,
                decoration: InputDecoration(
                  label: Text("Enter your Height"),
                  prefixIcon: Icon(Icons.height_rounded),
                  suffixText: "feet",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 18,
              ),
              TextField(
                controller: inchController,
                decoration: InputDecoration(
                  label: Text("Enter your height"),
                  prefixIcon: Icon(Icons.height_sharp),
                  suffixText: "inch",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 21,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    var wt = weightController.text.toString();
                    var ft = feetController.text.toString();
                    var inch = inchController.text.toString();
                    if (wt != "" && ft != "" && inch != "") {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iinch = int.parse(inch);
                
                      var toInch = ift * 12 + iinch;
                      var toCm = toInch * 2.54;
                      var toMeter = toCm / 100;
                
                      var bmi = iwt / (toMeter * toMeter);
                      
                
                      setState(() {
                       
                        result = "BMI : ${bmi.toStringAsFixed(4)}";
                        if (bmi <= 25 && bmi >= 29.9) {
                          bmitype = "Overweight";
                          health =
                              "Move more daily and cut back on sugary foods.";
                          bmitypecolor = Colors.yellowAccent;
                        } else if (bmi < 18) {
                          bmitype = "UnderWeight";
                          health =
                              "Focues on balanced meals and strength-building exercises.";
                          bmitypecolor = const Color.fromARGB(255, 19, 113, 190);
                        } else if (bmi >= 30 && bmi < 35) {
                          bmitype = "Obese Class 1";
                          health =
                              "Start light exercise and choose healthier meals. ";
                          bmitypecolor = Colors.orange;
                        } else if (bmi >= 35 && bmi <= 39.9) {
                          bmitype = "Obese Class 2";
                          health =
                              "Set small goals, eat slowly, and avoid processed food.";
                          bmitypecolor = Colors.deepOrange;
                        } else if (bmi >= 40) {
                          bmitype = "Obese Class 3";
                          health = "Work with a doctor on safe weight-loss plan.";
                          bmitypecolor = Colors.red;
                        } else {
                          bmitype = "Normal";
                          health = "Maintain a balanced diet and stay active.";
                          bmitypecolor = const Color.fromARGB(255, 47, 148, 51);
                        }
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the fields.";
                        bmitype = "Null.";
                        health = "Null.";
                        
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    elevation: 10,
                    padding: EdgeInsets.symmetric(horizontal: 34,vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                    ),
                   
                  ),
                  child: Text("Calculate",style: TextStyle(fontSize: 15,),),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Column(children: [
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "BMI type : ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmitype,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: bmitypecolor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Health Advice ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    health,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: bmitypecolor,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
