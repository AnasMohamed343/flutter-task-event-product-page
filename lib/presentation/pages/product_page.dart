import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/di/injection.dart';
import '../cubit/product_cubit.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/product_item.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()..fetchProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Route',
            style: GoogleFonts.sofia(
              textStyle: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.normal,
                  fontSize: 28),
            ),
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
            Expanded(
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductLoaded) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5),
                      itemBuilder: (context, index) => ProductItem(
                        product: state.products[index],
                      ),
                      itemCount: state.products.length,
                    );
                  } else if (state is ProductError) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
