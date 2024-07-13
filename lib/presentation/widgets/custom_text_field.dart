import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? textFieldTitle;

  CustomTextField({
    this.textFieldTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: TextField(
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: textFieldTitle,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(30),
          ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30),
          //   borderSide: BorderSide(color: Colors.blue),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30),
          //   borderSide: BorderSide(color: Colors.blue),
          // ),
          // disabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30),
          //   borderSide: BorderSide(color: Colors.blue),
          // ),
          hintStyle: TextStyle(
            color: Colors.black26,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
