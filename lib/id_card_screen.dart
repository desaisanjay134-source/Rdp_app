import 'package:flutter/material.dart';

class IdCardScreen extends StatefulWidget {
  const IdCardScreen({super.key});
  @override
  State<IdCardScreen> createState() => _IdCardScreenState();
}

class _IdCardScreenState extends State<IdCardScreen> {
  String name = 'संजय देसाई';
  String mobile = '98XXXXXX00';
  String village = 'सावंतवाडी';
  String memberId = 'RDP-2026-0001';
  String post = 'सदस्य';

  void _edit() {
    final n = TextEditingController(text: name);
    final m = TextEditingController(text: mobile);
    final v = TextEditingController(text: village);
    final p = TextEditingController(text: post);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('माहिती बदला'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: n, decoration: const InputDecoration(labelText: 'नाव')),
              TextField(controller: m, decoration: const InputDecoration(labelText: 'मोबाईल')),
              TextField(controller: v, decoration: const InputDecoration(labelText: 'गाव / शहर')),
              TextField(controller: p, decoration: const InputDecoration(labelText: 'पद')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('रद्द')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                name = n.text;
                mobile = m.text;
                village = v.text;
                post = p.text;
              });
              Navigator.pop(context);
            },
            child: const Text('सेव्ह')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(title: const Text('माझं ID कार्ड'), backgroundColor: Colors.green[800], foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1B5E20), Color(0xFF43A047)]),
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('RDP  •  राष्ट्रवादी दलित परिषद', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 