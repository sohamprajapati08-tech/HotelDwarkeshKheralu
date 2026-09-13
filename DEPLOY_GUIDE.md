# Hotel Dwarkesh - 24/7 Cloud Deployment Guide (Render.com)

તમારી વેબસાઈટને ક્લાઉડ પર મૂકવા માટે (જેથી લેપટોપ બંધ હોય તો પણ આખી દુનિયામાંથી ૨૪ કલાક લાઈવ ચાલે):

### પગલું ૧: GitHub પર ફ્રી Repository બનાવો
1. [github.com/new](https://github.com/new) ખોલો (જો GitHub એકાઉન્ટ ન હોય તો ફ્રીમાં Sign Up કરો).
2. Repository name માં લખો: `hotel-dwarkesh`
3. **Public** અથવા **Private** ગમે તે પસંદ કરો.
4. નીચે લીલા બટન **"Create repository"** પર ક્લિક કરો.

### પગલું ૨: તમારા કોડને GitHub પર મોકલો (Push Code)
તમારો કોડ પહેલેથી જ Git માં સેવ થઈ ચૂક્યો છે. ફક્ત આ કમાન્ડ ચલાવો:
```bash
git remote add origin https://github.com/<YOUR_GITHUB_USERNAME>/hotel-dwarkesh.git
git branch -M main
git push -u origin main
```

### પગલું ૩: Render.com પર ૨૪ કલાક લાઈવ કરો (100% Free)
1. [render.com](https://render.com) પર જાઓ અને **"Sign in with GitHub"** કરો.
2. ઉપર જમણી બાજુ **"New +"** બટન પર ક્લિક કરી **"Web Service"** પસંદ કરો.
3. તમારી `hotel-dwarkesh` repository દેખાશે, ત્યાં **"Connect"** પર ક્લિક કરો.
4. સેટિંગ્સ આપોઆપ આવી જશે (કારણ કે આપણે `render.yaml` ફાઈલ બનાવી દીધી છે):
   - **Name**: `hotel-dwarkesh`
   - **Runtime**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `node server.js`
   - **Plan**: `Free`
5. નીચે **"Deploy Web Service"** પર ક્લિક કરો!

૨ મિનિટમાં તમને એક કાયમી લિંક મળશે (જેમ કે: `https://hotel-dwarkesh.onrender.com`).
આ લિંક પરથી કોઈ પણ ગ્રાહક ગમે ત્યારે રૂમ બુકિંગ, ફૂડ ઓર્ડર કરી શકશે અને ડેટા લાઈવ સેવ થશે!
