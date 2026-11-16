import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdCardScreen extends StatefulWidget {
  const IdCardScreen({super.key});
  @override
  State<IdCardScreen> createState() => _IdCardScreenState();
}

class _IdCardScreenState extends State<IdCardScreen> {
  String name = '';
  String mobile = '';
  String village = 'सावंतवाडी';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      mobile = prefs.getString('mobile') ?? '';
      village = prefs.getString('village') ?? 'सावंतवाडी';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('माझं ID कार्ड'), backgroundColor: Colors.green),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 8,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('राष्ट्रीय दिव्यांग पार्टी', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                  const SizedBox(height: 6),
                  const Text('सदस्य ओळखपत्र', style: TextStyle(fontSize: 16)),
                  const Divider(),
                  const SizedBox(height: 10),
                  Text(name.isEmpty ? 'नाव नाही' : name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('मोबाईल: $mobile', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('गाव: $village', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  const Text('सदस्य', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}