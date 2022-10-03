import 'package:bmi/constants/app_constants.dart';
// import 'package:bmi/widgets/left_bar.dart';
// import 'package:bmi/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  String _bmiIndicator = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300, fontSize: 30),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox( height: 20 ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height (cm)",
                        hintStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight (kg)",
                        hintStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox( height: 30 ),

              GestureDetector(
                onTap: () {
                  double height = double.parse(_heightController.text);
                  double weight = double.parse(_weightController.text);

                  double convertHeight;
                  setState(() {
                    convertHeight = (height / 100);
                    _bmiResult = weight / (convertHeight * convertHeight);
                    if(_bmiResult > 25){
                      _textResult = "You\'re over weight";
                      _bmiIndicator = "OW";
                    }
                    else if(_bmiResult >= 18.5 && _bmiResult <= 25){
                      _textResult = "You have normal weight";
                      _bmiIndicator = "NW";
                    }
                    else{
                      _textResult = "You\'re under weight";
                      _bmiIndicator = "UW";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor,
                        ),
                  ),
                ),
              ),

              SizedBox( height: 50 ),

              Container(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: accentHexColor),
                ),
              ),
            
              SizedBox( height: 30 ),
              
              Visibility(
                visible: _textResult.isNotEmpty,
                child: Container(
                  child: Text(
                    _textResult,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: accentHexColor),
                  ),
                )
              ),

              SizedBox( height: 30 ),

              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_setImage(_bmiIndicator)),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),

              // Image( image: AssetImage(_setImage(_bmiIndicator))),

              // SizedBox( height: 20 ),
              // LeftBar( barWidth: 40 ),

              // SizedBox( height: 20 ),
              // LeftBar( barWidth: 70 ),

              // SizedBox( height: 20 ),
              // LeftBar( barWidth: 40 ),

              // SizedBox( height: 20 ),
              // RightBar(barWidth: 70),

              // SizedBox( height: 50 ),
              // RightBar( barWidth: 70 ),
            ],
          ),
        ));
  }
}

String _backgroundImage = "";
String _setImage(String _bmiIndicator) {

  if(_bmiIndicator == "OW") {
     _backgroundImage = "lib/images/fat_guy.png";
  }
  else if(_bmiIndicator == "UW") {
    _backgroundImage = "lib/images/slim_guy.png";
  } 
  else{
    _backgroundImage = "lib/images/slim_and_fat.png";
  } 

  return _backgroundImage;
}