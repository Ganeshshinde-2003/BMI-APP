import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI APP'),
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

  var wtCont = TextEditingController();
  var ftCont = TextEditingController();
  var inCont = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 310,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("BMI", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.white), ),

                SizedBox(height: 20,),

                TextField(
                  controller: wtCont,
                  decoration: InputDecoration(
                    label: Text("Enter your  weight in KGs"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: ftCont,
                  decoration: InputDecoration(
                    label: Text("Enter you height in FEETs"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.height),

                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: inCont,
                  decoration: InputDecoration(
                    label: Text("Enter the height in INCHs"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 16,),

                ElevatedButton(onPressed: (){


                  var wt = wtCont.text.toString();
                  var ft = ftCont.text.toString();
                  var inch = inCont.text.toString();

                  if(wt!="" && ft!="" && inch!=""){

                    //BMI calculation

                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iIn = int.parse(inch);

                    var tInch = (iFt*12) + iIn;
                    var tCm = tInch*2.54;
                    var tMeter = tCm/100;

                    var bmi = iWt/(tMeter*tMeter);

                    var msg = "";

                    if(bmi>25){

                      msg = "You're OverWeight!!💀💀";
                      bgColor = Colors.orange.shade200;

                    }else if(bmi<18){

                      msg = "You're UnderWeight!!💀💀";
                      bgColor = Colors.red.shade300;

                    }else{

                      msg = "You're Healthy!!😍😍";
                      bgColor = Colors.green.shade200;

                    }


                    result = "$msg \nYour BMI is: ${bmi.toStringAsFixed(4)}";
                    setState(() {});


                  } else{
                    setState(() {
                      result = "Please fill all the required blanks!!!!☹️☹️";
                    });
                  }

                }, child: Text("Calculate")),

                SizedBox(height: 21,),

                Text("$result", style: TextStyle(fontSize: 17, color: Colors.white),),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
