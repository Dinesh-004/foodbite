import 'package:flutter/material.dart';
import 'package:foodbite/home.dart';
import 'package:foodbite/notification.dart';
import 'package:foodbite/profile.dart';
import 'package:foodbite/payment.dart';
import 'package:foodbite/order.dart';
import 'package:foodbite/logout.dart';
import 'package:foodbite/password.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPageIndex = 2;

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
        title: const Text("Food Bite",style: TextStyle(fontWeight: FontWeight.bold)),
        foregroundColor: Colors.black,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsPage()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 170,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff7d2fd0), Color(0xff972ec6)],
                ),
              ),
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Positioned(
                      top: 30,
                      left: 105,
                      child: Text(
                        "Username",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    const Positioned(
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
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  currentPageIndex = 2; // Set index to Home
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text("Recharge"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  currentPageIndex = 0; // Assume Recharge is at index 0
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text("My Bills"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  currentPageIndex = 0; // Set index to Payment
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("My Orders"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  currentPageIndex = 1; // Set index to Orders
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  currentPageIndex = 3; // Set index to Profile
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Notification"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NotificationsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Change Password"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Password()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log out"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Logout()));
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
          const Payment(),
          const Order(),
          Home(),
          const Profile(),
          const Logout(),
        ],
      ),
    );
  }
}
