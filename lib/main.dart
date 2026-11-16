import 'package:flutter/material.dart';

void main() {
  runApp(const RDPApp());
}

class RDPApp extends StatelessWidget {
  const RDPApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rashtriya Divyang Party',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: false),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              child: Text('RDP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text('राष्ट्रीय दिव्यांग पार्टी', style: TextStyle(color: Color(0xFF1A237E), fontWeight: FontWeight.bold, fontSize: 17)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('नमस्कार,', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20))),
            const Text('सावंतवाडी', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54)),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                menuCard(Colors.orange, Icons.credit_card, 'माझं ID कार्ड', 'डिजिटल आयडी पहा'),
                menuCard(Colors.green, Icons.person_add, 'नवीन सदस्य जोडा', 'नवा सदस्य नोंदणी करा'),
                menuCard(Colors.teal, Icons.group, 'माझे जिल्हा सदस्य', 'जिल्हा सदस्यांची यादी'),
                menuCard(const Color(0xFF2E7D32), Icons.message, 'WhatsApp Broadcast', 'बातम्या पाठवा'),
              ],
            ),
            const SizedBox(height: 20),
            const Text('पक्षाच्या बातम्या', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            newsCard('सावंतवाडी जिल्हा बैठक यशस्वी संपन्न', 'दिव्यांग कल्याणासाठी नवीन योजना जाहीर'),
            newsCard('दिव्यांगांसाठी मोफत आरोग्य शिबिर', 'स्थळ: सावंतवाडी, जिल्हा परिषद हॉल'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: () {},
                child: const Text('सदस्य बना - मोफत', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'मुख्यपृष्ठ'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'सदस्य'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'नोंदणी'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'बातम्या'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'प्रोफाइल'),
        ],
      ),
    );
  }

  Widget menuCard(Color c, IconData icon, String title, String sub) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(sub, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget newsCard(String title, String sub) {
    return Card(
      child: ListTile(
        leading: Container(width: 50, height: 50, color: Colors.orange.shade100, child: const Icon(Icons.article, color: Colors.orange)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(sub, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}
