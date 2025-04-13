import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),

      routes: {
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Management'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Disaster Type:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Disaster Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildDisasterButton(
                  context,
                  'Earthquake',
                  Icons.landscape,
                  Colors.orange,
                ),
                _buildDisasterButton(
                  context,
                  'Flood',
                  Icons.water_damage,
                  Colors.blue,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SecondPage())
                  ),
                ),
                _buildDisasterButton(
                  context,
                  'Fire',
                  Icons.local_fire_department,
                  Colors.red,
                ),
                _buildDisasterButton(
                  context,
                  'Cyclone',
                  Icons.air,
                  Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisasterButton(
      BuildContext context,
      String title,
      IconData icon,
      Color color, {
        VoidCallback? onTap,
      }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int currentIndex = 0;

  // List of pages to display for each tab
  final List<Widget> _pages = [
    const HomeTab(),
    const StatusTab(),
    const ImportantTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle(currentIndex)),
      ),
      body: _pages[currentIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle), label: 'Status'),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement_outlined), label: 'Important'),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  // Helper method to change app bar title based on tab
  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Status Updates';
      case 2:
        return 'Important Alerts';
      default:
        return 'Flood Safety';
    }
  }
}

// Define your tab pages as separate widgets
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Column(
              children: [
                Icon(Icons.home, size: 50),
                SizedBox(height: 10),
                Text(
                  'Flood Relief Dashboard',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Supply Request Section
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.medical_services, color: Colors.blue),
              title: Text('Request Medical Supplies'),
              subtitle: Text('Request essential medicines and first aid support'),
              onTap: () {
                // Future navigation or dialog
              },
            ),
          ),

          const SizedBox(height: 16),

          // Rescue Helicopter Section
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.flight, color: Colors.green),
              title: Text('Nearby Rescue Helicopters'),
              subtitle: Text('Find available air rescue units nearby'),
              onTap: () {
                // Future navigation or feature logic
              },
            ),
          ),

          const SizedBox(height: 16),

          // SOS Signal Section
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.sos, color: Colors.red),
              title: Text('Send SOS Signal'),
              subtitle: Text('Send an emergency alert with your location'),
              onTap: () {
                // Future SOS logic
              },
            ),
          ),
        ],
      ),
    );
  }
}


class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for now — replace with live data when available
    final bool helicopterAssigned = true;
    final String currentLocation = "Near Sector 12, Riverfront";
    final List<String> helicopterQueue = [
      "Helicopter #2 - Awaiting clearance",
      "Helicopter #3 - In maintenance",
      "Helicopter #4 - Refueling",
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Column(
              children: [
                Icon(Icons.check_circle, size: 50, color: Colors.green),
                SizedBox(height: 20),
                Text(
                  'Current Status',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Live status of assigned helicopters and pending queue'),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // 🚁 Assigned Helicopter Section
          Card(
            color: Colors.green[50],
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.flight_takeoff, color: Colors.green),
              title: const Text('Assigned Helicopter'),
              subtitle: helicopterAssigned
                  ? Text('Currently near: $currentLocation')
                  : const Text('No helicopter assigned yet'),
              trailing: const Icon(Icons.location_on),
            ),
          ),

          const SizedBox(height: 20),

          // 🛫 Queue Section
          Card(
            color: Colors.orange[50],
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  leading: Icon(Icons.schedule, color: Colors.orange),
                  title: Text('Helicopter Queue'),
                  subtitle: Text('Pending or unavailable helicopters'),
                ),
                const Divider(),
                ...helicopterQueue.map((status) => ListTile(
                  leading: const Icon(Icons.airplanemode_inactive),
                  title: Text(status),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class ImportantTab extends StatelessWidget {
  const ImportantTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Column(
              children: [
                Icon(Icons.warning, size: 50, color: Colors.red),
                SizedBox(height: 20),
                Text('Emergency Alerts',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Critical info, safety tips, and feedback'),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // 1. Chat via Bluetooth/WiFi
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.bluetooth, color: Colors.blue),
              title: const Text('Chat Nearby (Bluetooth/WiFi)'),
              subtitle: const Text('Connect with people around you without internet'),
              onTap: () {
                // Future navigation or placeholder
              },
            ),
          ),

          const SizedBox(height: 16),

          // 2. Real-Time Alerts
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.cloud_sync, color: Colors.deepOrange),
              title: const Text('Live Weather & Danger Alerts'),
              subtitle: const Text('Stay updated on sudden changes or risks'),
              onTap: () {
                // Future integration with weather API
              },
            ),
          ),

          const SizedBox(height: 16),

          // 3. Tips for Survival
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.lightbulb, color: Colors.amber),
              title: const Text('Survival Tips'),
              subtitle: const Text('Quick guides for staying safe during disasters'),
              onTap: () {
                // Link to a survival tips screen
              },
            ),
          ),

          const SizedBox(height: 16),

          // 4. Feedback
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.feedback, color: Colors.green),
              title: const Text('Share Your Feedback'),
              subtitle: const Text('Tell us how we did after the disaster'),
              onTap: () {
                // Navigate to feedback form
              },
            ),
          ),
        ],
      ),
    );
  }
}
