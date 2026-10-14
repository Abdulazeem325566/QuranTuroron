import 'package:flutter/material.dart';
import '../widgets/app_banner_ad.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int _count = 0;
  int _target = 33;
  String _dhikr = 'سُبْحَانَ اللَّهِ';

  final List<String> _azkar = [
    'سُبْحَانَ اللَّهِ',
    'الْحَمْدُ لِلَّهِ',
    'اللَّهُ أَكْبَرُ',
    'لَا إِلَهَ إِلَّا اللَّهُ',
    'أَسْتَغْفِرُ اللَّهَ',
  ];

  void _tap() {
    setState(() {
      _count++;
      if (_count >= _target) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('MashaAllah! $_target mukammal 🎉')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_count / _target).clamp(0.0, 1.0);
    return Scaffold(
      appBar: AppBar(title: const Text('Tasbeeh Counter 🔢')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _dhikr,
                    decoration: const InputDecoration(
                        labelText: 'Dhikr chunein',
                        border: OutlineInputBorder()),
                    items: _azkar
                        .map((z) => DropdownMenuItem(
                              value: z,
                              child: Text(z,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(fontSize: 18)),
                            ))
                        .toList(),
                    onChanged: (v) =>
                        setState(() => _dhikr = v ?? _azkar.first),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<int>(
                    value: _target,
                    decoration: const InputDecoration(
                        labelText: 'Hadaf (target)',
                        border: OutlineInputBorder()),
                    items: [33, 100, 500, 1000]
                        .map((t) => DropdownMenuItem(
                            value: t, child: Text('$t')))
                        .toList(),
                    onChanged: (v) => setState(() {
                      _target = v ?? 33;
                      _count = 0;
                    }),
                  ),
                  const SizedBox(height: 24),
                  Text(_dhikr,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 14,
                          backgroundColor: Colors.purple.shade100,
                          color: Colors.purple,
                        ),
                      ),
                      Text('$_count',
                          style: const TextStyle(
                              fontSize: 56, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Hadaf: $_target',
                      style: const TextStyle(
                          fontSize: 16, color: Colors.black54)),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => setState(() => _count = 0),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Dobara'),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14)),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _tap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(48),
                        ),
                        child: const Text('Dabao',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const AppBannerAd(),
        ],
      ),
    );
  }
}
