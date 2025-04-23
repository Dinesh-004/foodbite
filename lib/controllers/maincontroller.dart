import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var userEmail = ''.obs;
  var userpass = ''.obs;
  var isDarkMode = true.obs;
  var currentPageIndex = 0.obs;
  final RxDouble wallet = 1000.00.obs;
  final Rxn<Uint8List> imageBytes = Rxn<Uint8List>();

  @override
  void onInit() {
    super.onInit();
    _loadLoginState();
    _loadProfileImage();
    _loadThemeMode();
  }

  Future<void> _loadLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
    userEmail.value = prefs.getString('userEmail') ?? '';
  }

  Future<void> login(String email, String pass) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    userEmail.value = email;
    userpass.value = pass;
    isLoggedIn.value = true;
    isLoading.value = false;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userEmail', email);
  }

  Future<void> logout() async{
    isLoggedIn.value = false;
    userEmail.value = '';
    userpass.value = '';
    imageBytes.value = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('userEmail');
    await prefs.remove('profileImage');
  }

  Future<void> changePassword(String newPassword) async {
    userpass.value = newPassword;
  }

  Future<void> toggleThemeMode() async {
    isDarkMode.value = !isDarkMode.value; // Toggle theme mode
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    await _saveThemeMode(isDarkMode.value); // Save theme mode
  }

  Future<void> _saveThemeMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> pickImage() async {
  final ImagePicker picker = ImagePicker();
  try {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageBytes.value = await image.readAsBytes();
      await _saveProfileImage(imageBytes.value!);
      print('Image path: ${image.path}');
    } else {
      print('No image selected.');
    }
  } catch (e) {
    print('Error picking image: $e');
  }
  }

  Future<void> _saveProfileImage(Uint8List bytes) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final base64Image = base64Encode(bytes); // Convert image to base64
      await prefs.setString('profileImage', base64Image);
      print('Profile image saved.');
    } catch (e) {
      print('Error saving profile image: $e');
    }
  }

  Future<void> _loadProfileImage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final base64Image = prefs.getString('profileImage');
      if (base64Image != null) {
        imageBytes.value = base64Decode(base64Image); // Decode base64 to bytes
        print('Profile image loaded.');
      }
    } catch (e) {
      print('Error loading profile image: $e');
    }
  }
  
}
