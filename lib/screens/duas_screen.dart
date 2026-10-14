import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/duas_kalimas.dart';
import '../widgets/app_banner_ad.dart';

/// Duain — Arabic + Urdu, speaker button se audio.
class DuasScreen extends StatefulWidget {
  const DuasScreen({super.key});

  @override
  State<DuasScreen> createState() => _DuasScreenState();
}

class _DuasScreenState extends State<DuasScreen> {
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
      appBar: AppBar(title: const Text('Roz ki Duain 🤲')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: duas.length,
              itemBuilder: (context, i) {
                final d = duas[i];
                return Card(
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
                              child: Text(d['title']!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0E7C61))),
                            ),
                            IconButton(
                              icon: const Icon(Icons.volume_up,
                                  color: Color(0xFF0E7C61)),
                              tooltip: 'Suno',
                              onPressed: () => _speak(d['arabic']!),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          d['arabic']!,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              fontSize: 22, height: 1.8, color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                        Text(d['urdu']!,
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
