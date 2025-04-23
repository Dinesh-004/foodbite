import 'package:flutter/material.dart';

class Foodorder extends StatefulWidget {
  const Foodorder({super.key});

  @override
  State<Foodorder> createState() => _FoodorderState();
}

class _FoodorderState extends State<Foodorder> {
  DateTime _selectedDate = DateTime.now();

  final Map<String, Map<String, List<String>>> _foodItems = {
    'Monday': {
      'Breakfast': ['Dosa', 'Sambar', 'Tomato Chutney'],
      'Lunch': ['Rice', 'Curry'],
      'Dinner': ['Chapathi', 'Channa Masala']
    },
    'Tuesday': {
      'Breakfast': ['Idli', 'Sambar', 'Coconut Chutney'],
      'Lunch': ['Rice', 'Sambar', 'Rasam'],
      'Dinner': ['Dosa', 'Coconut Chutney']
    },
    'Wednesday': {
      'Breakfast': ['Poori', 'Kurma'],
      'Lunch': ['Curd Rice', 'Tomato Rice', 'Pickle'],
      'Dinner': ['Veg Biryani', 'Curd']
    },
    'Thursday': {
      'Breakfast': ['Chapathi', 'Kurma'],
      'Lunch': ['Lemon Rice', 'Pickle'],
      'Dinner': ['Chicken', 'Rice']
    },
    'Friday': {
      'Breakfast': ['Upma'],
      'Lunch': ['Rice', 'Sambar', 'Rasam'],
      'Dinner': ['Poori', 'Sabji']
    },
    'Saturday': {
      'Breakfast': ['Pongal', 'Coconut Chutney'],
      'Lunch': ['Tomato Rice', 'Potato Fry'],
      'Dinner': ['Mushroom Biryani', 'Parota']
    },
    'Sunday': {
      'Breakfast': ['Vermicelli'],
      'Lunch': ['Rice', 'Egg Curry'],
      'Dinner': ['Chicken Biryani', 'Chicken Fry']
    },
  };

  Map<String, List<String>>? _selectedFoodItems;
  final Map<String, bool> _selectedMeals = {
    'Breakfast': false,
    'Lunch': false,
    'Dinner': false,
  };

  final Map<String, int> _mealPrices = {
    'Breakfast': 30,
    'Lunch': 40,
    'Dinner': 40,
  };

  int _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _selectedFoodItems = _foodItems[_getDayOfWeek(_selectedDate)];
  }

  String _getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 7)),
      selectableDayPredicate: (DateTime date) {
        return date.isAfter(DateTime.now().subtract(const Duration(days: 1)));
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _selectedFoodItems = _foodItems[_getDayOfWeek(_selectedDate)];
        _updateTotalPrice();
      });
    }
  }

  void _updateTotalPrice() {
    _totalPrice = 0;
    _selectedMeals.forEach((meal, selected) {
      if (selected) {
        _totalPrice += _mealPrices[meal]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff7d2fd0), Color(0xff972ec6)],
            ),
          ),
        ),
        title: const Text('Order Food', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Selected Date: ${_selectedDate.toString().split(' ')[0]}'),
            trailing: const Icon(Icons.calendar_today),
            onTap: () => _selectDate(context),
          ),
          const SizedBox(height: 10),
          ..._selectedMeals.keys.map((meal) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(meal),
                    trailing: Switch(
                      value: _selectedMeals[meal] ?? false,
                      onChanged: (value) {
                        setState(() {
                          _selectedMeals[meal] = value;
                          _updateTotalPrice();
                        });
                      },
                    ),
                  ),
                  if (_selectedFoodItems != null && _selectedFoodItems!.containsKey(meal))
                    ..._selectedFoodItems![meal]!.map((item) {
                      return ListTile(
                        title: Text(item),
                      );
                    }).toList(),
                ],
              ),
            );
          }).toList(),
        ],
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
                'Total Price: Rs.$_totalPrice',
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