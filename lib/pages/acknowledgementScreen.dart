import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcknowledgementScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Thank you for the information",style: TextStyle(fontSize: 20.0,color: Colors.black),),
        ),
      ),
    );
  }

}