import 'package:flutter/material.dart';

class Addon extends StatefulWidget {
  const Addon({super.key});

  @override
  State<Addon> createState() => _AddonState();
}

class _AddonState extends State<Addon> {
  // Food item data
  final List<Map<String, dynamic>> foodItems = [
    {"name": "Fried Rice", "price": 120.00, "quantity": 0},
    {"name": "Noodles", "price": 80.00, "quantity": 0},
    {"name": "Fried Chicken", "price": 80.00, "quantity": 0},
    {"name": "Chicken Biryani", "price": 150.00, "quantity": 0},
    {"name": "Shawarma", "price": 40.00, "quantity": 0},
    {"name": "Burger", "price": 60.00, "quantity": 0},
    {"name": "French Fries", "price": 40.00, "quantity": 0},
    {"name": "Pasta", "price": 60.00, "quantity": 0},
    {"name": "Tandoori Chicken", "price": 100.00, "quantity": 0},
    {"name": "Pizza", "price": 100.00, "quantity": 0},
  ];

  // Function to increase the quantity of an item
  void _increaseQuantity(int index) {
    setState(() {
      foodItems[index]["quantity"]++;
    });
  }

  // Function to decrease the quantity of an item
  void _decreaseQuantity(int index) {
    setState(() {
      if (foodItems[index]["quantity"] > 0) {
        foodItems[index]["quantity"]--;
      }
    });
  }

  // Calculate total price
  double _calculateTotalPrice() {
    double total = 0.0;
    for (var item in foodItems) {
      total += item["price"] * item["quantity"];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addon'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Stack(
              children: [
                // Background image
                Container(
                  height: 150, // Set a fixed height for the background image
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'img/${foodItems[index]["name"].toLowerCase().replaceAll(" ", "_")}.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Content on top of the image
                Container(
                  height: 150, // Match height with the background container
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        foodItems[index]["name"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White color for text
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Price: Rs.${foodItems[index]["price"]}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => _decreaseQuantity(index),
                            icon: const Icon(Icons.remove, color: Colors.white),
                          ),
                          Text(
                            'Quantity: ${foodItems[index]["quantity"]}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () => _increaseQuantity(index),
                            icon: const Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price: Rs.${_calculateTotalPrice().toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text('Order',style: TextStyle(color: Colors.purple)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
