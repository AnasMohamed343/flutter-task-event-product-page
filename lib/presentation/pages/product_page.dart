import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Route',
          style: TextStyle(
              fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              CustomTextField(
                textFieldTitle: 'What do you search for?',
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
