import 'package:flutter/material.dart';


class screenPage extends StatefulWidget{
  const screenPage({super.key});

  @override
  State<screenPage> createState() {
    return _ScreenPageTemplate();
  }
}

class _ScreenPageTemplate extends State<screenPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                  Color.fromRGBO(100, 29, 137, 1),
                Color.fromRGBO(211, 19, 233, 0.274),
              ],
              begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            )
          ),
          child: Center(
            child: Text("hello world"),
          ),
        ),
      ),
    );
  }
}