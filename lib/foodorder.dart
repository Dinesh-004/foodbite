import 'package:flutter/material.dart';

class Foodorder extends StatefulWidget {
  @override
  State<Foodorder> createState() => _FoodorderState();
}

class _FoodorderState extends State<Foodorder> {
  DateTime _selectedDate = DateTime.now();

  Map<String, Map<String, List<String>>> _foodItems = {
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
  Map<String, bool> _selectedMeals = {
    'Breakfast': false,
    'Lunch': false,
    'Dinner': false,
  };

  Map<String, int> _mealPrices = {
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
      lastDate: DateTime(2025),
      selectableDayPredicate: (DateTime date) {
        return date.isAfter(DateTime.now().subtract(Duration(days: 1)));
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
        title: Text('Order Food'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text(
                'Selected Date: ${_selectedDate.toString().split(' ')[0]}'),
            trailing: Icon(Icons.calendar_today),
            onTap: () => _selectDate(context),
          ),
          SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Breakfast'),
                  trailing: Switch(
                    value: _selectedMeals['Breakfast'] ?? false,
                    onChanged: (value) {
                      setState(() {
                        _selectedMeals['Breakfast'] = value;
                        _updateTotalPrice();
                      });
                    },
                  ),
                ),
                if (_selectedFoodItems != null &&
                    _selectedFoodItems!.containsKey('Breakfast'))
                  ..._selectedFoodItems!['Breakfast']!.map((item) {
                    return ListTile(
                      title: Text(item),
                    );
                  }).toList(),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Lunch'),
                  trailing: Switch(
                    value: _selectedMeals['Lunch'] ?? false,
                    onChanged: (value) {
                      setState(() {
                        _selectedMeals['Lunch'] = value;
                        _updateTotalPrice();
                      });
                    },
                  ),
                ),
                if (_selectedFoodItems != null &&
                    _selectedFoodItems!.containsKey('Lunch'))
                  ..._selectedFoodItems!['Lunch']!.map((item) {
                    return ListTile(
                      title: Text(item),
                    );
                  }).toList(),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Dinner'),
                  trailing: Switch(
                    value: _selectedMeals['Dinner'] ?? false,
                    onChanged: (value) {
                      setState(() {
                        _selectedMeals['Dinner'] = value;
                        _updateTotalPrice();
                      });
                    },
                  ),
                ),
                if (_selectedFoodItems != null &&
                    _selectedFoodItems!.containsKey('Dinner'))
                  ..._selectedFoodItems!['Dinner']!.map((item) {
                    return ListTile(
                      title: Text(item),
                    );
                  }).toList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price: Rs.$_totalPrice',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement checkout functionality
                },
                child: Text('Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}