
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color bg = Color(0xFF0A0F14);
  static const Color card = Color(0xFF121319);
  static const Color border = Color(0xFF3A3A46);
  static const Color cyan = Color(0xFF00D9FF);
  static const Color purple = Color(0xFFA855F7);
  static const Color green = Color(0xFF00FF9D);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFB0B0C8);

  void showSnack(
      String title,
      String message,
      Color color, {
        SnackPosition position = SnackPosition.BOTTOM,
        IconData icon = Icons.notifications_active,
      }) {
    Get.rawSnackbar(
      title: title,
      message: message,
      snackPosition: position,
      backgroundColor: card,
      borderColor: color,
      borderWidth: 1.5,
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      duration: const Duration(seconds: 3),
      icon: Icon(icon, color: color),
      titleText: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: white, fontSize: 13),
      ),
    );
  }

  void showAlert() {
    Get.dialog(
      AlertDialog(
        backgroundColor: card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: border),
        ),
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Color(0xFFFFB547),
          size: 45,
        ),
        title: const Text(
          'Alert Message',
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'This is a beautiful GetX Alert Dialog.',
          textAlign: TextAlign.center,
          style: TextStyle(color: grey),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: grey),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: cyan,
              foregroundColor: bg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Get.back();
              showSnack(
                'Confirmed',
                'You clicked the confirm button!',
                green,
              );
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
      barrierDismissible: true,
    );
  }

  void showCustomDialog() {
    Get.defaultDialog(
      title: '',
      backgroundColor: card,
      radius: 20,
      content: Column(
        children: [
          const Icon(
            Icons.auto_awesome,
            color: purple,
            size: 55,
          ),
          const SizedBox(height: 15),
          const Text(
            'Custom Dialog',
            style: TextStyle(
              color: white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'This dialog is created using GetX.',
            textAlign: TextAlign.center,
            style: TextStyle(color: grey),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: purple,
                foregroundColor: white,
              ),
              onPressed: () => Get.back(),
              child: const Text('Close Dialog'),
            ),
          ),
        ],
      ),
    );
  }

  Widget actionButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.08),
              blurRadius: 15,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: color, size: 25),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 15),
      child: Row(
        children: [
          Icon(icon, color: cyan, size: 22),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              color: white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: card,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 35,
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF310B19),
                      Color(0xFF071A32),
                    ],
                  ),
                ),
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundColor: cyan,
                      child: Icon(
                        Icons.person,
                        color: bg,
                        size: 45,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'My Premium App',
                      style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Welcome to GetX UI',
                      style: TextStyle(color: grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              drawerItem(Icons.home, 'Home'),
              drawerItem(Icons.person, 'Profile'),
              drawerItem(Icons.settings, 'Settings'),
              drawerItem(Icons.favorite, 'Favourite'),
              const Spacer(),
              const Divider(color: border),
              drawerItem(Icons.logout, 'Logout'),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        iconTheme: const IconThemeData(color: white),
        title: const Text(
          'Premium UI',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSnack(
                'Notifications',
                'You have no new notifications.',
                cyan,
                position: SnackPosition.TOP,
              );
            },
            icon: const Icon(Icons.notifications_none, color: cyan),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A0F10),
              Color(0xFF0A0F14),
              Color(0xFF001B30),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: border),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF321018),
                        Color(0xFF101A32),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'WELCOME BACK',
                        style: TextStyle(
                          color: cyan,
                          letterSpacing: 2,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'GetX UI Components',
                        style: TextStyle(
                          color: white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Explore different buttons, snackbars and dialogs.',
                        style: TextStyle(
                          color: grey,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: cyan.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: cyan),
                        ),
                        child: const Text(
                          'GETX FRAMEWORK',
                          style: TextStyle(
                            color: cyan,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                sectionTitle('Snackbar Examples', Icons.notifications_active),

                actionButton(
                  title: 'Top Snackbar',
                  subtitle: 'Snackbar from the top',
                  icon: Icons.vertical_align_top,
                  color: cyan,
                  onTap: () {
                    showSnack(
                      'Top Snackbar',
                      'This snackbar appears at the top.',
                      cyan,
                      position: SnackPosition.TOP,
                    );
                  },
                ),

                const SizedBox(height: 12),

                actionButton(
                  title: 'Bottom Snackbar',
                  subtitle: 'Snackbar from the bottom',
                  icon: Icons.vertical_align_bottom,
                  color: purple,
                  onTap: () {
                    showSnack(
                      'Bottom Snackbar',
                      'This snackbar appears at the bottom.',
                      purple,
                    );
                  },
                ),

                const SizedBox(height: 12),

                actionButton(
                  title: 'Success Snackbar',
                  subtitle: 'Successful operation message',
                  icon: Icons.check_circle,
                  color: green,
                  onTap: () {
                    showSnack(
                      'Success!',
                      'Your operation completed successfully.',
                      green,
                      icon: Icons.check_circle,
                    );
                  },
                ),

                const SizedBox(height: 12),

                actionButton(
                  title: 'Error Snackbar',
                  subtitle: 'Error notification message',
                  icon: Icons.error,
                  color: Colors.redAccent,
                  onTap: () {
                    showSnack(
                      'Error!',
                      'Something went wrong. Please try again.',
                      Colors.redAccent,
                      icon: Icons.error,
                    );
                  },
                ),

                const SizedBox(height: 12),

                actionButton(
                  title: 'Warning Snackbar',
                  subtitle: 'Warning notification message',
                  icon: Icons.warning_amber,
                  color: const Color(0xFFFFB547),
                  onTap: () {
                    showSnack(
                      'Warning!',
                      'Please check your information.',
                      const Color(0xFFFFB547),
                      icon: Icons.warning_amber,
                    );
                  },
                ),

                const SizedBox(height: 12),

                actionButton(
                  title: 'Info Snackbar',
                  subtitle: 'General information message',
                  icon: Icons.info,
                  color: cyan,
                  onTap: () {
                    showSnack(
                      'Information',
                      'This is an information message.',
                      cyan,
                      icon: Icons.info,
                    );
                  },
                ),

                sectionTitle('Dialog Examples', Icons.dashboard_customize),

                actionButton(
                  title: 'Alert Dialog',
                  subtitle: 'Open a confirmation alert dialog',
                  icon: Icons.warning_amber_rounded,
                  color: const Color(0xFFFFB547),
                  onTap: showAlert,
                ),

                const SizedBox(height: 12),

                actionButton(
                  title: 'Custom Dialog',
                  subtitle: 'Open a custom designed dialog',
                  icon: Icons.web_asset,
                  color: purple,
                  onTap: showCustomDialog,
                ),

                const SizedBox(height: 25),

                Center(
                  child: Text(
                    'DESIGNED WITH FLUTTER & GETX',
                    style: TextStyle(
                      color: grey.withOpacity(0.7),
                      fontSize: 11,
                      letterSpacing: 2,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: cyan),
      title: Text(
        title,
        style: const TextStyle(
          color: white,
          fontSize: 14,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: grey,
        size: 14,
      ),
      onTap: () {
        Get.back();
      },
    );
  }
}
