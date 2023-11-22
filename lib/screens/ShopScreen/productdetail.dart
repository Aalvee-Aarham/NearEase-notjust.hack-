import 'package:flutter/material.dart';
import 'package:nearease/utils/Widgets.dart';
import 'package:nearease/utils/fetchimage.dart';

class ProductDetailScreen extends StatelessWidget {
  final String description;
  final String name;
  final String price;

  ProductDetailScreen({
    required this.description,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display product image
            FutureBuilder(
              future: fetchImage(name!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While the image is being loaded, display a loading image
                  return SizedBox(
                    width: 120,
                    height: 110,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  // If there's an error while loading the image, display an error message
                  return SizedBox(
                    width: 120,
                    height: 110,
                    child: Center(child: Text('Error loading image')),
                  );
                } else {
                  // If the image is loaded successfully, display it
                  return commonCacheImageWidget(snapshot.data.toString(), 200,
                      width: double.infinity, fit: BoxFit.cover);
                }
              },
            ),

            // Display product details
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '\$${price}', // Format price with two decimal places
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Add to Cart button
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Add your logic for adding to the cart
                // For simplicity, you can print a message for now.
                print('Added to Cart: $name');
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
