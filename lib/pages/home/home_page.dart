import 'package:flutter/material.dart';
import 'package:shoes_app/bloc_navigation/navigator_bloc.dart'; 

class HomePage extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'HomePage', 
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28, color: Colors.black)
        ),
      ),
    );
  }
}