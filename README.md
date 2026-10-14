# Muslim Kids 🌙 — Duas, Kalimas, Asma ul Husna, Namaz & Tasbeeh

Bachon ke liye Islami learning app (Flutter). AdMob ads pehle se lage hue hain (test IDs — asli IDs lagana zaroori hai).

## Features (v1)
- 🤲 16 Roz ki Duain — Arabic + Urdu tarjuma + sunne ka button (device TTS)
- 📿 Chhe Kalimas — Arabic + Urdu tarjuma + audio
- ✨ Allah ke 99 Naam — Urdu matlab ke saath
- 🕌 Namaz Seekho — 5 waqt ki namaz, wudu ke steps, namaz ka tareeqa
- 🔢 Tasbeeh Counter — dhikr select, target (33/100/500/1000), progress
- 📢 AdMob: banner (har screen neeche) + interstitial (har 3rd section par)

## Code ko GitHub par dalna
```bash
cd muslim-kids-app
git init
git add .
git commit -m "Muslim Kids v1"
git branch -M main
git remote add origin https://github.com/APKA-USERNAME/muslim-kids-app.git
git push -u origin main
```
(Ya mujhe repo ka access dein, main push kar doon ga.)

## Cloud mein AAB banana (koi install nahi chahiye)
1. GitHub repo mein `.github/workflows/build_aab.yml` pehle se hai.
2. Har `main` par push par Actions automatically **release AAB** banayega.
3. Actions tab → workflow run → **Artifacts** se `muslim-kids-aab` download karein.

### Signing (Play Store ke liye LAZMI)
Release AAB ko sign karna hota hai, warna Play Store reject kar dega:
```bash
keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```
Phir `android/key.properties` banayein:
```properties
storePassword=APKA-PASSWORD
keyPassword=APKA-PASSWORD
keyAlias=upload
storeFile=../upload-keystore.jks
```
⚠️ `upload-keystore.jks` aur `key.properties` kabhi GitHub par NA dalein (`.gitignore` mein hain). Keystore ka backup mehfooz rakhein — gum ho gaya to app update nahi ho sakegi!

GitHub Actions mein signing ke liye repository **Secrets** mein keystore (base64) + passwords dalein aur workflow mein signing step lagayein.

## Play Store par upload
1. **Play Console** account banayein — $25 one-time fee (play.google.com/console).
2. **Create app** → naam "Muslim Kids", package `com.muslimkids.app`.
3. **App content** forms poore karein: Data Safety (Ads = Yes), Ads declaration, target audience (bachon ki app hai to "child-directed" ka khayal rakhein).
4. **Privacy policy** ka link dein (neeche dekhein).
5. Production track mein AAB upload → review → publish (review mein 1-7 din lag sakte hain).

## AdMob — test IDs se asli IDs tak
Abhi code mein **Google ki TEST IDs** hain — inse koi kamai nahi hoti.
1. **apps.admob.com** par account banayein, details + payment poore karein (approval: 24h–2 weeks).
2. Apni app add karein (Play Store link ke saath behtar hai).
3. **Banner** aur **Interstitial** ad units banayein.
4. `lib/services/ad_service.dart` mein dono IDs badlein.
5. `android/app/src/main/AndroidManifest.xml` mein `APPLICATION_ID` (App ID) badlein.
6. Dobara AAB banayein aur update publish karein.
7. ⚠️ **Apne ads par khud click NA karein** — account suspend ho jayega. Testing ke liye test IDs hi rakhein jab tak sab verify na ho jaye.

## Privacy Policy
`privacy_policy.html` is repo mein hai. Ise kahin host karein (masalan GitHub Pages — Settings → Pages → `docs/` folder) aur Play Console mein uska link dein. AdMob wala section pehle se likha hai.

## Agle versions ke ideas (v2)
- 🔊 Har dua ki recorded audio (khud record karke assets mein)
- 🎨 Rang-birange bachon wale illustrations
- 🏆 Roz ka streak / stars (bachon ko motivate karne ke liye)
- 🌍 English language toggle
