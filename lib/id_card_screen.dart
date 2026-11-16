import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdCardScreen extends StatefulWidget {
  const IdCardScreen({super.key});
  @override
  State<IdCardScreen> createState() => _IdCardScreenState();
}

class _IdCardScreenState extends State<IdCardScreen> {
  String name = '';
  String mobile = '98XXXXXX00';
  String village = 'सावंतवाडी';
  String memberId = 'RDP-2026-0001';
  String post = 'सदस्य';

@override
void initState() {
  super.initState();
  _loadName();
}

Future<void> _loadName() async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    name = prefs.getString('name')?? '';
  });
}

  void _edit() {
    final n = TextEditingController(text: name);
    final m = TextEditingController(text: mobile);
    final v = TextEditingController(text: village);
    final p = TextEditingController(text: post);
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('माहिती बदला'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: n, decoration: const InputDecoration(labelText: 'नाव')),
              TextField(controller: m, decoration: const InputDecoration(labelText: 'मोबाईल')),
              TextField(controller: v, decoration: const InputDecoration(labelText: 'गाव / तालुका')),
              TextField(controller: p, decoration: const InputDecoration(labelText: 'पद')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: const Text('रद्द')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                name = n.text;
                mobile = m.text;
                village = v.text;
                post = p.text;
              });
              Navigator.pop(c);
            },
            child: const Text('सेव्ह करा'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('माझं ID कार्ड'),
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: _edit, icon: const Icon(Icons.edit)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[800]!, Colors.green[600]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('RDP  •  राष्ट्रवादी दलित परिषद',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Text(post, style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.white,
                        child: Text(name.isNotEmpty ? name[0] : 'स',
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green[800])),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(village, style: const TextStyle(color: Colors.white70, fontSize: 15)),
                            Text('मो. $mobile', style: const TextStyle(color: Colors.white70, fontSize: 15)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('सदस्य ID: $memberId', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text('वैधता: 2026 - 2029  •  महाराष्ट्र', style: TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('तुमचे डिजिटल सदस्य ओळखपत्र येथे दिसेल.', textAlign: TextAlign.center),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _edit,
                icon: const Icon(Icons.edit),
                label: const Text('माहिती बदला'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[800], foregroundColor: Colors.white, padding: const EdgeInsets.all(14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}