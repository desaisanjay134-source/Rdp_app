import 'package:flutter/material.dart';
import 'id_card_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static const _news = [
    (
      'सावंतवाडी जिल्हा बैठक यशस्वी संपन्न',
      'दिव्यांग कल्याणासाठी नवीन उपक्रमांवर चर्चा',
    ),
    (
      'दिव्यांगांसाठी मोफत आरोग्य शिबिर',
      'स्थळ: सावंतवाडी, जिल्हा परिषद कार्यालय',
    ),
  ];

  void _openPage(String title, String description, IconData icon) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => FeatureScreen(
          title: title,
          description: description,
          icon: icon,
        ),
      ),
    );
  }

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
              child: Text(
                'RDP',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'राष्ट्रीय दिव्यांग पार्टी',
                style: TextStyle(
                  color: Color(0xFF1A237E),
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
      body: _buildSelectedPage(),
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

  Widget _buildSelectedPage() {
    switch (index) {
      case 1:
        return _sectionPage(
          'माझे जिल्हा सदस्य',
          'जिल्ह्यातील सदस्यांची माहिती येथे उपलब्ध होईल.',
          Icons.group,
        );
      case 2:
        return const RegistrationPage();
      case 3:
        return _newsPage();
      case 4:
        return _sectionPage(
          'प्रोफाइल',
          'तुमची सदस्य माहिती आणि खाते सेटिंग्ज येथे दिसतील.',
          Icons.person,
        );
      default:
        return _homePage();
    }
  }

  Widget _homePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'नमस्कार,',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B5E20),
            ),
          ),
          const Text(
            'सावंतवाडी',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              menuCard(
                Colors.orange,
                Icons.credit_card,
                'माझं ID कार्ड',
                'डिजिटल आयडी पहा',
                () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const IdCardScreen(),
    ),
  );
},
),
              menuCard(
                Colors.green,
                Icons.person_add,
                'नवीन सदस्य जोडा',
                'नवा सदस्य नोंदणी करा',
                () => setState(() => index = 2),
              ),
              menuCard(
                Colors.teal,
                Icons.group,
                'माझे जिल्हा सदस्य',
                'जिल्हा सदस्यांची यादी',
                () => setState(() => index = 1),
              ),
              menuCard(
                const Color(0xFF2E7D32),
                Icons.message,
                'WhatsApp Broadcast',
                'बातम्या पाठवा',
                () => _openPage(
                  'WhatsApp Broadcast',
                  'पक्षाच्या बातम्या आणि सूचना सदस्यांपर्यंत पोहोचवा.',
                  Icons.message,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'पक्षाच्या बातम्या',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          for (final item in _news)
            newsCard(
              item.$1,
              item.$2,
              () => _openPage(item.$1, item.$2, Icons.article),
            ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => setState(() => index = 2),
              child: const Text(
                'सदस्य बना - मोफत',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _newsPage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'पक्षाच्या बातम्या',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        for (final item in _news)
          newsCard(
            item.$1,
            item.$2,
            () => _openPage(item.$1, item.$2, Icons.article),
          ),
      ],
    );
  }

  Widget _sectionPage(String title, String description, IconData icon) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget menuCard(
    Color color,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.white, size: 32),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget newsCard(String title, String subtitle, VoidCallback onTap) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 50,
          height: 50,
          color: Colors.orange.shade100,
          child: const Icon(Icons.article, color: Colors.orange),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'नवीन सदस्य नोंदणी',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'पूर्ण नाव',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'नाव भरा' : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'मोबाइल क्रमांक',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == null || value.trim().length < 10
                  ? 'वैध मोबाइल क्रमांक भरा'
                  : null,
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', _nameController.text.trim());
await prefs.setString('mobile', _mobileController.text.trim());
await prefs.setString('village', _villageController.text.trim());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('नोंदणीची माहिती जतन केली.'),
                    ),
                  );
                }
              },
              child: const Text('नोंदणी करा'),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureScreen extends StatelessWidget {
  const FeatureScreen({
    required this.title,
    required this.description,
    required this.icon,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 64, color: Colors.green),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(description, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
