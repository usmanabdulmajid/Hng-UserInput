import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TextEditingController editingController;
  String displayText = '';

  @override
  void initState() {
    editingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hngi8',
          style: TextStyle(
            fontFamily: 'RobotoMono',
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: _size.width,
          height: _size.height,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(
                height: _size.height * 0.20,
              ),
              Text(
                'Enter Text',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: _size.width,
                height: 50.0,
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: Colors.black,
                    )),
                child: TextField(
                  style: TextStyle(fontFamily: 'RobotoMono'),
                  controller: editingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onSubmitted: (val) {
                    setState(() {
                      displayText = editingController.text;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    displayText = editingController.text;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Display',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GradientText(
                displayText,
                style: TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                  fontFamily: 'Anton',
                ),
                colors: [
                  Colors.blue,
                  Colors.red,
                  Colors.teal,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
