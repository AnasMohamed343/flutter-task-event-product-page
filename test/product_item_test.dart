import 'package:flutter/material.dart';
import 'package:flutter_task_event/domain/entities/product.dart';
import 'package:flutter_task_event/presentation/widgets/product_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductItem', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      final product = Product(
        id: 1,
        title: 'Test Product',
        description: 'This is a test product',
        price: 10.99,
        discountPercentage: 20,
        rating: 4.5,
        stock: 10,
        brand: 'Test Brand',
        category: 'Test Category',
        thumbnail: 'https://example.com/image.jpg',
        images: [
          'https://example.com/image1.jpg',
          'https://example.com/image2.jpg'
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: ProductItem(product: product),
        ),
      );

      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('This is a test product'), findsOneWidget);
      expect(find.text('EGP 10.99'), findsOneWidget);
      expect(find.text('EGP 13.99'), findsOneWidget);
      expect(find.byIcon(Icons.favorite_outline), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });
}
