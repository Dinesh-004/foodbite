import 'package:flutter/material.dart';

class Addon extends StatefulWidget {
  @override
  State<Addon> createState() => _AddonState();
}

class _AddonState extends State<Addon> {
  Map<String, int> foodQuantities = {
    "Fried Rice": 0,
    "Noodles": 0,
    "Fried Chicken": 0,
    "Chicken Biryani": 0,
    "Shawarma": 0,
  };

  Map<String, double> foodPrices = {
    "Fried Rice": 120.00,
    "Noodles": 80.00,
    "Fried Chicken": 80.00,
    "Chicken Biryani": 150.00,
    "Shawarma": 40.00,
  };

  double getTotalPrice() {
    double total = 0.0;
    foodQuantities.forEach((key, value) {
      total += value * foodPrices[key]!;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Addon"),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: foodQuantities.keys.length,
              itemBuilder: (context, index) {
                String foodName = foodQuantities.keys.elementAt(index);
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset('assets/images/${foodName.toLowerCase().replaceAll(" ", "_")}.png', height: 50, width: 50, fit: BoxFit.cover),
                    title: Text(foodName),
                    subtitle: Text("Price: Rs.${foodPrices[foodName]?.toStringAsFixed(2)}"),
                    trailing: Container(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (foodQuantities[foodName]! > 0) {
                                  foodQuantities[foodName] = foodQuantities[foodName]! - 1;
                                }
                              });
                            },
                          ),
                          Text('Quantity: ${foodQuantities[foodName]}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                foodQuantities[foodName] = foodQuantities[foodName]! + 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price: Rs.${getTotalPrice().toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.purple, fontSize: 20),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // background
                  ),
                  onPressed: () {
                    // Handle Order action
                  },
                  child: Text("Order"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
