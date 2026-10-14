import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/duas_kalimas.dart';
import '../widgets/app_banner_ad.dart';

class KalimasScreen extends StatefulWidget {
  const KalimasScreen({super.key});

  @override
  State<KalimasScreen> createState() => _KalimasScreenState();
}

class _KalimasScreenState extends State<KalimasScreen> {
  final FlutterTts _tts = FlutterTts();

  Future<void> _speak(String arabic) async {
    try {
      await _tts.setLanguage('ar-SA');
      await _tts.setSpeechRate(0.4);
      await _tts.speak(arabic);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Audio is device par available nahi')),
        );
      }
    }
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chhe Kalimas 📿')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: kalimas.length,
              itemBuilder: (context, i) {
                final k = kalimas[i];
                return Card(
                  color: Colors.indigo.shade50,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(k['name']!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo)),
                            ),
                            IconButton(
                              icon: const Icon(Icons.volume_up,
                                  color: Colors.indigo),
                              tooltip: 'Suno',
                              onPressed: () => _speak(k['arabic']!),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          k['arabic']!,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              fontSize: 21, height: 1.9, color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                        Text(k['urdu']!,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black54)),
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
