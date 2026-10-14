import 'package:flutter/material.dart';
import '../services/ad_service.dart';
import '../widgets/app_banner_ad.dart';
import 'duas_screen.dart';
import 'kalimas_screen.dart';
import 'asma_screen.dart';
import 'namaz_screen.dart';
import 'tasbeeh_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _open(BuildContext context, Widget screen) {
    AdService.maybeShowInterstitial();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      _HomeItem('Roz ki Duain', '🤲', Colors.teal, const DuasScreen()),
      _HomeItem('Chhe Kalimas', '📿', Colors.indigo, const KalimasScreen()),
      _HomeItem('Allah ke 99 Naam', '✨', Colors.amber.shade800, const AsmaScreen()),
      _HomeItem('Namaz Seekho', '🕌', Colors.green.shade700, const NamazScreen()),
      _HomeItem('Tasbeeh Counter', '🔢', Colors.purple, const TasbeehScreen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Muslim Kids 🌙',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
              ),
              itemCount: items.length,
              itemBuilder: (context, i) {
                final item = items[i];
                return InkWell(
                  onTap: () => _open(context, item.screen),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: item.color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: item.color.withOpacity(0.4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item.emoji,
                            style: const TextStyle(fontSize: 44)),
                        const SizedBox(height: 10),
                        Text(item.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const AppBannerAd(),
        ],
      ),
    );
  }
}

class _HomeItem {
  final String title;
  final String emoji;
  final Color color;
  final Widget screen;
  _HomeItem(this.title, this.emoji, this.color, this.screen);
}
