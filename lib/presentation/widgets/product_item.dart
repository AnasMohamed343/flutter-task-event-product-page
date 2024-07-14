import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    double oldPrice = product.price! / (1 - product.discountPercentage! / 100);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff9FA8DA))),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        product.thumbnail ?? '',
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(9),
                      topLeft: Radius.circular(9),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.099,
                  width: double.infinity,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 125,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.blue,
                      size: 25,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 3, left: 5, top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? '',
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  product.description ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Row(
                    children: [
                      Text(
                        'EGP ${product.price}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 13),
                      Text(
                        '\$${oldPrice.toStringAsFixed(2)} EGP',
                        style: TextStyle(
                          fontSize: 9,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.blue,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Review',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '(${product.rating})',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 14,
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                      height: 30,
                      width: 30,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: Colors.blue,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
