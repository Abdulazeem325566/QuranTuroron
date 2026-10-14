import 'package:flutter/material.dart';
import '../data/namaz_data.dart';
import '../widgets/app_banner_ad.dart';

class NamazScreen extends StatelessWidget {
  const NamazScreen({super.key});

  Widget _sectionTitle(String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 8),
          Text(title,
              style: TextStyle(
                  fontSize: 19, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _stepCard(String step, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(step, style: const TextStyle(fontSize: 15, height: 1.5)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF1B7A43);
    return Scaffold(
      appBar: AppBar(title: const Text('Namaz Seekho 🕌')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _sectionTitle('5 Waqt ki Namaz', Icons.schedule, green),
                ...namazTimes.map((n) => Card(
                      color: Colors.green.shade50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        title: Text(n['name']!,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${n['rakats']}\n${n['time']}'),
                        isThreeLine: true,
                      ),
                    )),
                _sectionTitle('Wudu ke Steps', Icons.water_drop, Colors.blue),
                ...wuduSteps.map((s) => _stepCard(s, Colors.blue)),
                _sectionTitle(
                    'Namaz Parhne ka Tareeqa', Icons.mosque, Colors.teal),
                ...namazSteps.map((s) => _stepCard(s, Colors.teal)),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const AppBannerAd(),
        ],
      ),
    );
  }
}
