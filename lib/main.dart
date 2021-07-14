import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // A widget which will be started on application startup
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle titleStyle = TextStyle(color: Color(0xFF5B777B), fontSize: 24, fontWeight: FontWeight.bold);

  //Now that we've fininshed the ui of the app
  //let is implement the logic and make it functional

  //step 1 : prepare the variables
  double bill = 0;
  double tip = 0;
  int person = 1;

  //prepare the result
  double tipPerPerson = 0;
  double totalPerPerson = 0;

  //create the text Editing controller to get the value
  TextEditingController billController = TextEditingController();
  TextEditingController tipController = TextEditingController();
  TextEditingController personController = TextEditingController();

  //create a function to calculate the tip
  void calculate() {
    tipPerPerson = (bill * tip) / person;
    totalPerPerson = (bill * (1 + tip)) / person;
  }

  //Now let's implement the variable in their places

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            Container(width: double.infinity, height: 200.0, child: Center(child: Image.network('https://lh3.googleusercontent.com/proxy/nmmDNJs9zR5bLwKJdwqcxDYg2y7TwKE8hn341Q4UQ99j384BaVrDzoo2qjL3fH7DsrAGO3r58NT6VzBTSTUSqbVI5gP3EWc'))),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 35),
              height: 900.0,
              decoration: BoxDecoration(
                color: Color(0xFFC5E4E7),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bills', style: TextStyle(color: Color(0xFF5B777B), fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: billController,
                    onEditingComplete: () {
                      setState(() {
                        if (billController.text.isNotEmpty) {
                          bill = double.parse(billController.text);
                        } else {
                          bill = 0;
                        }
                        //to dismiss the keyboard after editing
                        FocusScope.of(context).unfocus();
                        calculate();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(filled: true, fillColor: Color(0xFFF3F8F8), border: InputBorder.none, hintText: 'eg: 100', prefixIcon: Icon(Icons.attach_money_rounded)),
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Color(0xFF00474B)),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text('Select Tip %', style: titleStyle),
                  SizedBox(
                    height: 15,
                  ),
                  // lets create the button grid
                  Row(children: [
                    Expanded(
                      child: FlatButton(
                          height: 60,
                          color: Color(0xFF00474B),
                          onPressed: () {
                            setState(() {
                              tip = 0.05;
                              calculate();
                            });
                          },
                          child: Text("5 %",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: FlatButton(
                          height: 60,
                          color: Color(0xFF00474B),
                          onPressed: () {
                            setState(() {
                              tip = 0.10;
                              calculate();
                            });
                          },
                          child: Text("10 %",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ))),
                    ),
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  Row(children: [
                    Expanded(
                      child: FlatButton(
                          height: 60,
                          color: Color(0xFF00474B),
                          onPressed: () {
                            setState(() {
                              tip = 0.15;
                              calculate();
                            });
                          },
                          child: Text("15 %",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: FlatButton(
                          height: 60,
                          color: Color(0xFF00474B),
                          onPressed: () {
                            setState(() {
                              tip = 0.25;
                              calculate();
                            });
                          },
                          child: Text("25 %",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ))),
                    ),
                  ]),

                  SizedBox(
                    height: 15,
                  ),
                  Row(children: [
                    Expanded(
                      child: FlatButton(
                          height: 60,
                          color: Color(0xFF00474B),
                          onPressed: () {
                            setState(() {
                              tip = 0.50;
                              calculate();
                            });
                          },
                          child: Text("50 %",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                          controller: tipController,
                          onEditingComplete: () {
                            setState(() {
                              if (personController.text.isNotEmpty) {
                                tip = int.parse(personController.text) / 100;
                              } else {
                                tip = 0;
                              }
                              //to dismiss the keyboard after editing
                              FocusScope.of(context).unfocus();
                              calculate();
                            });
                          },
                          keyboardType: TextInputType.numberWithOptions(),
                          decoration: InputDecoration(filled: true, fillColor: Color(0xFFF3F8F8), border: InputBorder.none, hintText: 'CUSTOM'),
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Color(0xFF00474B))),
                    ),
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Number Of People', style: TextStyle(color: Color(0xFF5B777B), fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: personController,
                    onEditingComplete: () {
                      setState(() {
                        if (personController.text.isNotEmpty) {
                          person = int.parse(personController.text);
                        } else {
                          person = 1;
                        }
                        //to dismiss the keyboard after editing
                        FocusScope.of(context).unfocus();
                        calculate();
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(filled: true, fillColor: Color(0xFFF3F8F8), border: InputBorder.none, hintText: 'eg: 5', prefixIcon: Icon(Icons.person)),
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Color(0xFF00474B)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xFF00474B), borderRadius: BorderRadius.circular(18)),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('Tip Amount', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("/ Person", style: TextStyle(color: Color(0xFF598689), fontSize: 20)),
                          ]),
                          Text(
                            "\$${tipPerPerson.toStringAsFixed(2)}",
                            style: TextStyle(color: Color(0xFF29C0Ad), fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ]),
                        SizedBox(
                          height: 5,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('Total', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("/ Person", style: TextStyle(color: Color(0xFF598689), fontSize: 20)),
                          ]),
                          Text(
                            "\$${totalPerPerson.toStringAsFixed(2)}",
                            style: TextStyle(color: Color(0xFF29C0Ad), fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ]),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                tip = 0;
                                bill = 0;
                                person = 1;
                                calculate();
                                tipController.clear();
                                billController.clear();
                                personController.clear();
                              });
                            },
                            child: Text(
                              'RESET',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
            //Body
          ],
        ),
      ),
    );
  }
}
