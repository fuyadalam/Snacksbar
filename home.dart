
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void snack(String title, String message, Color color,
      {SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      borderRadius: 12,
      margin: const EdgeInsets.all(12),
      duration: const Duration(seconds: 3),
      icon: Icon(Icons.notifications, color: color),
    );
  }

  void alertDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          'Alert',
          style: TextStyle(color: Colors.black),
        ),
        content: const Text(
          'Are you sure you want to continue?',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              Get.back();
              snack('Success', 'Confirmed successfully', Colors.green);
            },
            child: const Text(
              'Confirm',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void customDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
              const SizedBox(height: 12),
              const Text(
                'Custom Dialog',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'This is a custom GetX dialog.',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () => Get.back(),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(
      String title,
      IconData icon,
      Color color,
      VoidCallback onTap,
      ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 15),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () => Get.back(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'My App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white24),
              drawerItem(Icons.home, 'Home'),
              drawerItem(Icons.person, 'Profile'),
              drawerItem(Icons.settings, 'Settings'),
              drawerItem(Icons.info, 'About'),
              drawerItem(Icons.logout, 'Logout'),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        title: const Text(
          'Home Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              snack(
                'Notification',
                'No new notifications',
                Colors.green,
                position: SnackPosition.TOP,
              );
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WELCOME BACK',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'GetX Components',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Simple Flutter UI Design',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Snackbar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              button(
                'Top Snackbar',
                Icons.arrow_upward,
                Colors.green,
                    () => snack(
                  'Top Snackbar',
                  'Snackbar from top',
                  Colors.green,
                  position: SnackPosition.TOP,
                ),
              ),

              button(
                'Bottom Snackbar',
                Icons.arrow_downward,
                Colors.red,
                    () => snack(
                  'Bottom Snackbar',
                  'Snackbar from bottom',
                  Colors.red,
                ),
              ),

              button(
                'Success Snackbar',
                Icons.check_circle,
                Colors.green,
                    () => snack(
                  'Success',
                  'Operation completed successfully',
                  Colors.green,
                ),
              ),

              button(
                'Error Snackbar',
                Icons.error,
                Colors.red,
                    () => snack(
                  'Error',
                  'Something went wrong',
                  Colors.red,
                ),
              ),

              button(
                'Warning Snackbar',
                Icons.warning,
                Colors.orange,
                    () => snack(
                  'Warning',
                  'Please check your information',
                  Colors.orange,
                ),
              ),

              button(
                'Info Snackbar',
                Icons.info,
                Colors.black,
                    () => snack(
                  'Information',
                  'This is an information message',
                  Colors.black,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Dialog Box',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              button(
                'Alert Dialog',
                Icons.warning_amber,
                Colors.red,
                alertDialog,
              ),

              button(
                'Custom Dialog',
                Icons.dashboard,
                Colors.green,
                customDialog,
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  'Flutter + GetX',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
