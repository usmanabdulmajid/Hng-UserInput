import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TextEditingController editingController;
  AnimationController animationController;
  Animation<double> animation;
  String displayText = '';

  @override
  void initState() {
    editingController = TextEditingController();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticInOut,
    );

    super.initState();
  }

  @override
  void dispose() {
    editingController.dispose();
    animationController.dispose();
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
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: _size.width,
            height: _size.height,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
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
                      animationController.reset();
                      animationController.forward();
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      displayText = editingController.text;
                    });
                    animationController.reset();
                    animationController.forward();
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
                      textAlign: TextAlign.center,
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
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-_size.width, 0),
                    end: Offset(
                      0,
                      0,
                    ),
                  ).animate(animation),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.red,
                          Colors.teal,
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      displayText,
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                        fontFamily: 'Allison',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
