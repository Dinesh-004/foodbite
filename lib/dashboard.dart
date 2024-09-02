import 'package:flutter/material.dart';
import 'package:foodbite/home.dart';
import 'package:foodbite/notification.dart';
import 'package:foodbite/profile.dart';
import 'package:foodbite/payment.dart';
import 'package:foodbite/order.dart';
import 'package:foodbite/logout.dart';
import 'package:foodbite/pass.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Bite"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsPage()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 105,
                      child: Text(
                        "Username",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 120,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("img/profilepic.png"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  currentPageIndex = 2; // Set index to Home
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("Recharge"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  currentPageIndex = 0; // Assume Recharge is at index 0
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text("My Bills"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  currentPageIndex = 0; // Set index to Payment
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("My Orders"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  currentPageIndex = 1; // Set index to Orders
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  currentPageIndex = 3; // Set index to Profile
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  currentPageIndex = 2; // Set index to Home
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Change Password"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Pass()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Logout()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 5,
        currentIndex: currentPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Payments',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
            backgroundColor: Colors.black,
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          Payment(),
          Order(),
          Home(),
          Profile(),
          Logout(),
        ],
      ),
    );
  }
}
