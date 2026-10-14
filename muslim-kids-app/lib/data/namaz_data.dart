/// Bachon ke liye Wudu aur Namaz ke asan steps (Urdu).
final List<String> wuduSteps = [
  '1. Niyyat karo: "Main wudu karta hoon taake pak ho kar namaz parhoon."',
  '2. Bismillah parho: بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
  '3. Dono haath kalaiyon tak 3 baar dho.',
  '4. 3 baar kulli karo (munh mein pani daal kar).',
  '5. 3 baar naak mein pani charhao aur saaf karo.',
  '6. Poora chehra 3 baar dho (peshani se thori tak).',
  '7. Dono haath kohniyon tak 3 baar dho — pehle seedha, phir ulta.',
  '8. Sar ka masah karo (geele haathon se sar par phero).',
  '9. Dono paon takhnon tak 3 baar dho — pehle seedha, phir ulta.',
  '10. Dua parho: أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ',
];

final List<String> namazSteps = [
  '1. Pak kapre pehno, Qibla (Khana Kaaba) ki taraf munh karo.',
  '2. Niyyat karo — dil mein irada: kaunsi namaz parh rahe ho.',
  '3. Takbeer: dono haath kaanon tak uthao aur kaho: اللَّهُ أَكْبَرُ',
  '4. Haath bandh lo (naaf ke neeche) aur Sana parho.',
  '5. Surah Fatiha parho, phir koi chhoti surah (masalan Surah Ikhlas).',
  '6. Ruku: jhuko, ghutnon par haath rakho, 3 baar kaho: سُبْحَانَ رَبِّيَ الْعَظِيمِ',
  '7. Seedhe khare ho jao aur kaho: سَمِعَ اللَّهُ لِمَنْ حَمِدَهُ ، رَبَّنَا لَكَ الْحَمْدُ',
  '8. Sajda: maathe, naak, dono haath, ghutne aur paon zameen par — 3 baar kaho: سُبْحَانَ رَبِّيَ الْأَعْلَى',
  '9. Sajde se uth kar betho, phir dusra sajda karo.',
  '10. Dusri rakat ke baad beth kar Attahiyyat parho.',
  '11. Aakhri rakat mein Attahiyyat + Durood + Dua parho.',
  '12. Salam: pehle daayein, phir baayein — السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللَّهِ',
];

/// Namaz ke 5 waqt (bachon ke liye yaad-dahani).
final List<Map<String, String>> namazTimes = [
  {'name': 'Fajr', 'rakats': '2 Sunnat + 2 Farz', 'time': 'Subah (tuloo-e-aftab se pehle)'},
  {'name': 'Zuhr', 'rakats': '4 Sunnat + 4 Farz + 2 Sunnat + 2 Nafl', 'time': 'Dopahar'},
  {'name': 'Asr', 'rakats': '4 Sunnat (ghair muakkadah) + 4 Farz', 'time': 'Seh-pehar ke baad'},
  {'name': 'Maghrib', 'rakats': '3 Farz + 2 Sunnat + 2 Nafl', 'time': 'Ghurub-e-aftab ke foran baad'},
  {'name': 'Isha', 'rakats': '4 Sunnat + 4 Farz + 2 Sunnat + 2 Nafl + 3 Witr', 'time': 'Raat'},
];
