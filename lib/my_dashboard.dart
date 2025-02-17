import 'package:flutter/material.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  State<MyDashboard> createState() => _MyDashboardState(); // Correct: createState() method
}

class _MyDashboardState extends State<MyDashboard> { // Correct: State class
  // ... your state variables and methods here ...
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing: 16.0, // Spacing between rows
          crossAxisSpacing: 16.0, // Spacing between columns
          childAspectRatio: 1.0, // Adjust as needed for card aspect ratio
          children: <Widget>[
            _buildDashboardCard(
              context,
              icon: Icons.home,
              title: 'Home',
              onPressed: () => _showSnackBar(context, 'Home Pressed!'),
            ),
            _buildDashboardCard(
              context,
              icon: Icons.settings,
              title: 'Settings',
              onPressed: () => _showSnackBar(context, 'Settings Pressed!'),
            ),
            _buildDashboardCard(
              context,
              icon: Icons.person,
              title: 'Profile',
              onPressed: () => _showSnackBar(context, 'Profile Pressed!'),
            ),
            _buildDashboardCard(
              context,
              icon: Icons.notifications,
              title: 'Notifications',
              onPressed: () => _showSnackBar(context, 'Notifications Pressed!'),
            ),
            _buildDashboardCard(
              context,
              icon: Icons.mail,
              title: 'Messages',
              onPressed: () => _showSnackBar(context, 'Messages Pressed!'),
            ),
            _buildDashboardCard(
              context,
              icon: Icons.help,
              title: 'Help',
              onPressed: () => _showSnackBar(context, 'Help Pressed!'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onPressed,
      }) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 48.0,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 10.0),
            Text(
              title,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Go'),
            ),
          ],
        ),
      ),
    );
  }
}