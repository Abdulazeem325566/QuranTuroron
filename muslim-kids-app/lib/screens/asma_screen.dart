import 'package:flutter/material.dart';
import '../data/asma_data.dart';
import '../widgets/app_banner_ad.dart';

class AsmaScreen extends StatelessWidget {
  const AsmaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Allah ke 99 Naam ✨')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: asmaUlHusna.length,
              itemBuilder: (context, i) {
                final name = asmaUlHusna[i];
                return Card(
                  color: Colors.amber.shade50,
                  margin: const EdgeInsets.only(bottom: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber.shade800,
                      child: Text('${i + 1}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    title: Text(
                      name[0],
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(name[1],
                        style: const TextStyle(fontSize: 14)),
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
