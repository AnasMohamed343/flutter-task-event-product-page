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
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.only(right: 3, left: 4, top: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff9FA8DA))),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: double.infinity,
                child: Image.network(
                  product.thumbnail ?? '',
                  fit: BoxFit.fill,
                ),
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
          SizedBox(height: 5),
          Text(
            product.title ?? '',
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          Text(
            product.description ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Text(
                'EGP${product.price}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 14),
              Text(
                '\$${oldPrice.toStringAsFixed(2)} EGP',
                style: TextStyle(
                  fontSize: 10,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.blue,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Review',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(width: 5),
              Text(
                '(${product.rating})',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 15,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
