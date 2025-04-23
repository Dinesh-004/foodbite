import 'package:flutter/material.dart';
import 'package:foodbite/controllers/maincontroller.dart';
import 'package:foodbite/home.dart';
import 'package:foodbite/notification.dart';
import 'package:foodbite/profile.dart';
import 'package:foodbite/payment.dart';
import 'package:foodbite/order.dart';
import 'package:foodbite/password.dart';
import 'package:foodbite/recharge.dart';
import 'package:foodbite/signin.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return PopScope(
      canPop: false,
      child: Scaffold(
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
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsPage()));
              },
            ),
            Obx(() {
            return IconButton(
              icon: mainController.isDarkMode.value ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
              onPressed: () {
                mainController.toggleThemeMode();
              },
            );
            }),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff7d2fd0), Color(0xff972ec6)],
                    ),
                  ),
                  child: Obx(() {
                    return Column(
                    children: [
                      SizedBox(height: 20.0),
                      Center(
                        child: GestureDetector(
                          onTap:() {
                            Get.back();
                              setState(() {
                                mainController.currentPageIndex.value = 3;
                              });
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage: mainController.imageBytes.value != null
                                ? MemoryImage(mainController.imageBytes.value!)
                                : null,
                            child: mainController.imageBytes.value == null
                                ? Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.grey.shade700,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      Text(
                            '${mainController.userEmail.value.split('@')[0].replaceAll(RegExp(r'[0-9]'), '').capitalize}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                    ],
                  );
                  }),
                ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text("Dashboard"),
                onTap: () {
                  Get.back();
                  setState(() {
                    mainController.currentPageIndex.value = 0;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.credit_card),
                title: const Text("Recharge"),
                onTap: () {
                  Get.back();
                  Get.to(() => Recharge());
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text("My Bills"),
                onTap: () {
                  Get.back();
                  setState(() {
                    mainController.currentPageIndex.value = 1;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text("My Orders"),
                onTap: () {
                  Get.back();
                  setState(() {
                    mainController.currentPageIndex.value = 2;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {
                  Get.back();
                  setState(() {
                    mainController.currentPageIndex.value = 3;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("Notification"),
                onTap: () {
                  Get.back();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const NotificationsPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text("Change Password"),
                onTap: () {
                  Get.back();
                  Get.to(() => Password());
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Log out"),
                onTap: () {
                  Get.back();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                  AlertDialog(
                    title: Text("Logout"),
                    content: Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      TextButton(
                        child: Text("Logout"),
                        onPressed: () {
                          mainController.logout();
                          Get.offAll(() => Signin());
                        },
                      ),
                    ],
                  )
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              mainController.currentPageIndex.value = value;
            });
          },
          elevation: 5,
          selectedIndex: mainController.currentPageIndex.value,
          destinations: 
            const <NavigationDestination>[
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.money),
                label: 'Payments',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: 'Orders',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   onTap: (int index) {
        //     setState(() {
        //       mainController.currentPageIndex.value = index;
        //     });
        //   },
        //   selectedItemColor: Colors.purple,
        //   unselectedItemColor: Colors.white,
        //   backgroundColor: Colors.black,
        //   elevation: 5,
        //   currentIndex: mainController.currentPageIndex.value,
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //       backgroundColor: Colors.black,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.money),
        //       label: 'Payments',
        //       backgroundColor: Colors.black,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.shopping_cart),
        //       label: 'Orders',
        //       backgroundColor: Colors.black,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person),
        //       label: 'Profile',
        //       backgroundColor: Colors.black,
        //     ),
        //   ],
        // ),
        body: IndexedStack(
          index: mainController.currentPageIndex.value,
          children: [
            Home(),
            Payment(),
            Order(),
            Profile(),
          ],
        ),
      ),
    );
  }
}
