# Proff — ishga tushirish yo‘riqnomasi

Kerak bo‘ladigan uchta bepul hisob: **GitHub**, **Supabase**, **Vercel**. Anthropic API uchun esa to‘lov kartasi kerak.

## 1. Kodni GitHub’ga yuklash
1. github.com’da yangi repozitoriya oching (nomi: `proff`).
2. “Add file → Upload files” orqali shu papkadagi hamma fayllarni (`api` papkasi bilan) yuklang.

## 2. Supabase (kirish va saqlash)
1. supabase.com’da yangi loyiha yarating.
2. **SQL Editor** ga `supabase.sql` ichidagini qo‘yib, Run bosing.
3. **Project Settings → API** dan oling: `Project URL`, `anon` kalit, `service_role` kalit.
4. `config.js` faylida `SUPABASE_URL` va `SUPABASE_ANON_KEY` ni almashtiring (GitHub’da faylni tahrirlash mumkin).
5. **Authentication → Email Templates → Magic Link** shablonida `{{ .Token }}` so‘zini qo‘shing (6 xonali kod chiqishi uchun).

## 3. Google bilan kirish
1. console.cloud.google.com → yangi loyiha → **APIs & Services → Credentials → Create OAuth client ID** (Web application).
2. “Authorized redirect URI” ga Supabase’dagi manzilni qo‘ying: **Authentication → Providers → Google** sahifasida ko‘rsatilgan `Callback URL`.
3. Google bergan `Client ID` va `Client Secret` ni Supabase’dagi Google sozlamasiga kiriting va yoqing.

## 4. Anthropic API kaliti
1. console.anthropic.com’da hisob oching, to‘lov qo‘shing va **API Key** yarating.
2. **Settings → Limits** bo‘limida oylik xarajat chegarasini qo‘ying (masalan, $20).

## 5. Vercel’ga chiqarish
1. vercel.com → **Add New → Project** → GitHub’dagi `proff` repozitoriyasini tanlang.
2. **Environment Variables** ga quyidagilarni kiriting:

| Nomi | Qiymati |
|---|---|
| `ANTHROPIC_API_KEY` | Anthropic kaliti |
| `SUPABASE_URL` | Project URL |
| `SUPABASE_ANON_KEY` | anon kalit |
| `SUPABASE_SERVICE_KEY` | service_role kalit (sir saqlang!) |
| `DAILY_LIMIT` | (ixtiyoriy) bir foydalanuvchiga kuniga xabarlar soni, standart 40 |
| `ANTHROPIC_MODEL` | (ixtiyoriy) standart `claude-sonnet-5-5`; arzonroq uchun `claude-haiku-5-5` |

3. **Deploy** bosing. Sayt manzili chiqadi.
4. Supabase → **Authentication → URL Configuration** da “Site URL” ga o‘sha manzilni yozing.

## Muhim
- `service_role` kalitni hech qachon `config.js` yoki GitHub’ga yozmang, faqat Vercel’da turadi.
- Bolalar ma’lumoti bilan ishlaganingiz uchun saytga **maxfiylik siyosati** va 13 yoshgacha bolalar uchun **ota-ona roziligini** qo‘shing.
