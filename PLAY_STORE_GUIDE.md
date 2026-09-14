# Hotel Dwarkesh - Google Play Store Deployment Master Guide 🚀

આ માર્ગદર્શિકા તમારી **Hotel Dwarkesh** વેબસાઈટને એન્ડ્રોઇડ એપ (Android App Bundle - `.aab`) માં કન્વર્ટ કરીને **Google Play Store** પર લાઈવ મૂકવા માટેની સંપૂર્ણ સ્ટેપ-બાય-સ્ટેપ ગાઈડ છે.

---

## 📦 ૧. આપણે પ્રોજેક્ટમાં તૈયાર કરેલી ફાઈલો (Prepared Assets)

તમારી વેબસાઈટને એપ બનાવવા માટે ગૂગલના તમામ નિયમો અનુસાર નીચે મુજબની ફાઈલો તૈયાર કરી દેવામાં આવી છે:

1. **`manifest.json`** - એપનું નામ, કલર થીમ (`#0B0F19`), આઇકોન્સ અને મોબાઇલ સેટિંગ્સ.
2. **`sw.js`** - સર્વિસ વર્કર (ફાસ્ટ લોડિંગ અને ઑફલાઇન કેશિંગ માટે).
3. **`privacy-policy.html`** - ગૂગલ પ્લે પોલિસી મુજબ તૈયાર કરેલું પ્રાઈવસી પોલિસી પેજ (લાઈવ URL: `https://your-domain.com/privacy-policy`).
4. **`terms-conditions.html`** - હોટેલ બુકિંગ અને કેન્સલેશન નિયમો.
5. **`icons/icon-512.png`** - પ્લે સ્ટોર માટે રોયલ 512x512 હાઈ-ડેફિનેશન એપ આઇકોન.
6. **`icons/icon-192.png`** - મોબાઈલ હોમસ્ક્રીન માટે 192x192 આઇકોન.
7. **`icons/feature-graphic.png`** - પ્લે સ્ટોર લિસ્ટિંગ માટે 1024x500 લક્ઝરી ફીચર બેનર.
8. **`hotel-dwarkesh.keystore`** - પ્લે સ્ટોર માટે ક્રિપ્ટોગ્રાફિક સાઇનિંગ કી (Digital Signing Certificate).
9. **`.well-known/assetlinks.json`** - Digital Asset Links જેથી એપમાં કોઈ પણ બ્રાઉઝર કે URL બાર ન દેખાય.

---

## 🔑 ૨. Keystore વિગતો (તમારી સુરક્ષિત સાઇનિંગ કી)

આ કી દ્વારા તમારી એપ સાઇન થયેલી છે:
- **Keystore File:** `hotel-dwarkesh.keystore`
- **Alias:** `dwarkesh`
- **Password:** `dwarkesh2026`
- **SHA-256 Fingerprint:** `7B:C0:4F:3B:C7:77:8C:BC:BA:04:62:98:6F:3B:1E:71:97:68:50:72:42:B4:8D:BF:54:C8:A4:A9:3B:A1:49:7C`

*(નોંધ: `generate-keystore.bat` ફાઇલ પણ પ્રોજેક્ટમાં રાખી છે, જેથી ભવિષ્યમાં જરૂર પડે તો ડબલ ક્લિક કરીને ફરી કી બનાવી શકાય).*

---

## 🛠️ ૩. વેબસાઈટમાંથી `.aab` (Android App Bundle) ફાઇલ બનાવવાની ૨ સરળ રીતો

ગૂગલ પ્લે સ્ટોર હવે સાદી `.apk` ને બદલે **`.aab` (Android App Bundle)** સ્વીકારે છે. તે બનાવવાના ૨ સરળ રસ્તા છે:

### 🌟 રીત ૧: PWABuilder (સૌથી સરળ - ૧ મિનિટમાં ઓનલાઇન)
કોઈપણ સોફ્ટવેર ઇન્સ્ટોલ કર્યા વગર સીધા બ્રાઉઝરમાંથી `.aab` ડાઉનલોડ કરો:
1. તમારી વેબસાઈટને Render પર લાઈવ કરો (દા.ત. `https://hotel-dwarkesh.onrender.com`).
2. બ્રાઉઝરમાં [pwabuilder.com](https://www.pwabuilder.com) ખોલો.
3. બોક્સમાં તમારી લાઈવ સાઈટની લિંક નાખીને **"Start"** પર ક્લિક કરો.
4. આપણું `manifest.json` અને `sw.js` પરફેક્ટ હોવાથી ગ્રીન સ્કોર આવશે.
5. **"Package for Stores"** બટન પર ક્લિક કરો -> **"Google Play"** પસંદ કરો.
6. **"Signing Options"** માં આપણી `hotel-dwarkesh.keystore` ફાઇલ સિલેક્ટ કરો (અથવા PWABuilder ને નવી કી બનાવવા દો).
7. **"Generate"** પર ક્લિક કરો -> તમને સીધી પ્લે સ્ટોર માટે તૈયાર **`app-release.aab`** ડાઉનલોડ કરવા મળશે!

---

### 🌟 રીત ૨: Google Bubblewrap CLI (ઓફિશિયલ ડેવલપર રીત)
જો કમાન્ડ લાઇનથી બનાવવી હોય:
1. કમાન્ડ પ્રોમ્પ્ટ (CMD) માં આ કમાન્ડ ચલાવો:
   ```cmd
   npm install -g @bubblewrap/cli
   ```
2. તમારી લાઈવ સાઈટ માટે પ્રોજેક્ટ બનાવો:
   ```cmd
   bubblewrap init --manifest="https://your-domain.com/manifest.json"
   ```
3. બિલ્ડ કમાન્ડ ચલાવો:
   ```cmd
   bubblewrap build
   ```
4. આનાથી તમારા ફોલ્ડરમાં **`app-release-signed.aab`** ફાઇલ તૈયાર થઈ જશે!

---

## 📱 ૪. Google Play Console પર એપ પબ્લિશ કરવાના પગલાં

### પગલું ૧: ગૂગલ પ્લે ડેવલપર એકાઉન્ટ
1. [play.google.com/console](https://play.google.com/console) પર જાઓ.
2. તમારા જીમેલ એકાઉન્ટથી લોગિન કરો અને $25 (વન-ટાઈમ) ફી ભરીને એકાઉન્ટ વેરિફાય કરો.

### પગલું ૨: નવી એપ બનાવો (Create App)
- **App Name:** `Hotel Dwarkesh - Luxury Stay & Dining`
- **Default Language:** `Gujarati (gu-IN)` અથવા `English (United States)`
- **App or Game:** `App`
- **Free or Paid:** `Free`
- **Declarations:** ટર્મ્સ એન્ડ કન્ડિશન્સ સ્વીકારીને **Create App** કરો.

### પગલું ૩: સ્ટોર લિસ્ટિંગ (Store Listing)
ત્યાં નીચે મુજબની વિગતો અને આપણા બનાવેલા ફોટા અપલોડ કરો:
- **Short Description (૮૦ અક્ષરો):**
  > બુક કરો લક્ઝરી રૂમ્સ અને માણો શુદ્ધ કાઠિયાવાડી-ગુજરાતી ભોજન હોટેલ દ્વારકેશ ખેરાલુ ખાતે.
- **Full Description:**
  > Hotel Dwarkesh Kheralu provides luxurious AC rooms, 24/7 guest hospitality, pure vegetarian Kathiyawadi, Gujarati & Punjabi dining on Ambaji Highway. Features online room booking, instant menu ordering, and secure digital payments via Razorpay.
- **App Icon:** `icons/icon-512.png` અપલોડ કરો.
- **Feature Graphic:** `icons/feature-graphic.png` અપલોડ કરો.
- **Phone Screenshots:** તમારી સાઈટ/એપના ૨ થી ૪ મોબાઈલ સ્ક્રીનશોટ મૂકો.

### પગલું ૪: App Content (ગૂગલ પોલિસી સેટઅપ)
ગૂગલ પ્લે કન્સોલમાં ડાબી બાજુ **"App content"** માં જઈને આ જવાબો ભરો:
1. **Privacy Policy:** તમારી લાઈવ લિંક નાખો:
   `https://your-domain.com/privacy-policy` (આપણે બનાવેલું પેજ).
2. **Ads:** "No, my app does not contain ads" સિલેક્ટ કરો.
3. **App Access:** "All functionality is available without special access" અથવા જો લોગિન હોય તો ટેસ્ટ આઈડી/પાસવર્ડ આપો.
4. **Content Rating:** એક સામાન્ય પ્રશ્નાવલી આવશે, જેમાં હિંસા કે એડલ્ટ કન્ટેન્ટ નથી એટલે "All Ages (3+)" રેટિંગ મળી જશે.
5. **Target Audience:** 18 and over પસંદ કરો.
6. **Data Safety:**
   - Personal Info: Name, Phone number, Email (ફોર એકાઉન્ટ & બુકિંગ).
   - Financial Info: Razorpay handles payments (No credit card info stored by app).

### પગલું ૫: Closed Testing (૨૦ ટેસ્ટર્સ નિયમ)
> [!NOTE]
> ૧૩ નવેમ્બર ૨૦૨૩ પછી બનેલા પર્સનલ એકાઉન્ટ્સ માટે ગૂગલનો નિયમ છે કે પ્રોડક્શન લાઈવ કરતાં પહેલાં **૨૦ મિત્રો/ટેસ્ટર્સ** ના જીમેલ આઈડી Closed Testing માં એડ કરી તેમને ૧૪ દિવસ એપ ઇન્સ્ટોલ રાખવી પડે છે.

1. પ્લે કન્સોલમાં **Testing > Closed testing** માં જાઓ.
2. **Create new track** -> તમારા ૨૦ મિત્રોના જીમેલ આઈડી એક Email List માં એડ કરો.
3. **Create Release** પર ક્લિક કરી તમારી `.aab` ફાઇલ અપલોડ કરો.
4. Release Name આપો: `1.0.0`.
5. **Review and rollout** પર ક્લિક કરો.
6. તમારા ટેસ્ટર્સને ટેસ્ટિંગ લિંક મોકલો જેથી તેઓ પ્લે સ્ટોરમાંથી એપ ઇન્સ્ટોલ કરી લે.

### પગલું ૬: Production (પબ્લિક લાઈવ)
- ૧૪ દિવસ પૂર્ણ થયા પછી અથવા જો તમારું ઓર્ગેનાઇઝેશન ایکાઉન્ટ હોય તો સીધું **Production** માં જઈને **"Apply for Production"** કરો.
- ગૂગલની ટીમ ૨-૪ દિવસમાં રિવ્યૂ કરીને એપને આખી દુનિયા માટે Google Play Store પર લાઈવ કરી દેશે! 🎉
