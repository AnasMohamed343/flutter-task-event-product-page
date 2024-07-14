import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/product_cubit.dart';

class CustomTextField extends StatelessWidget {
  String? textFieldTitle;
  final TextEditingController _controller = TextEditingController();

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
        controller: _controller,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: textFieldTitle,
          prefixIcon: InkWell(
            onTap: () {
              if (_controller.text.length >= 3) {
                context
                    .read<ProductCubit>()
                    .searchProductsByTitle(_controller.text);
              }
            },
            child: Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blue),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintStyle: TextStyle(
            color: Colors.black26,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
