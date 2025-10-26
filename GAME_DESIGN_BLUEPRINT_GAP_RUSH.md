# GAME DESIGN BLUEPRINT — GAP RUSH

## ⚙️ Overview
**Tagline:** “Find the gap or face the wall.”  
**Genre:** Hyper-casual reflex & precision arcade game  
**Engine:** Flutter + Flame  
**Monetization:** Ad-driven (rewarded + interstitial + banner)  
**Target Audience:** Gen Z / Mobile casual players  
**Session Length:** 10–25 seconds average  

---

## 1. Core Premise
You control a puck sliding horizontally at the bottom.  
Rising walls each contain one opening (gap).  
Align with the opening before the wall hits you.  
One miss = instant game over.

- **Goal:** Survive as long as possible; every cleared wall = +1 score.  
- **Control:** Drag or swipe left/right (single finger).  
- **Fail condition:** Collide with a solid wall segment.

---

## 2. Gameplay Flow

| Phase | Player Action | System Reaction |
|-------|----------------|----------------|
| **Start** | Tap “Play” → puck resets bottom center | First wall spawns with slow speed |
| **Active Loop** | Player drags puck to align | Walls ascend; score increments |
| **Speed Ramp** | Survive longer → speed ↑, gap width ↓ | Add visual tension (screen shake, pitch ↑) |
| **Fail** | Puck collides | Explosion FX + SFX + vibration; show score & “Revive?” |

---

## 3. Difficulty Curve

| Range | Modifier Introduction |
|--------|-----------------------|
| Walls 1–5 | Fixed gaps, large width (training) |
| 6–15 | Slight speed ramp |
| 16–30 | Moving gaps (slide horizontally) |
| 31–45 | Split bars (two offset segments) |
| 46–60 | Fake gap (closes late) + “Wind” drift |
| 61+ | Randomized combinations; Mirror control 3% chance |

---

## 4. Visual Style
- **Theme:** Neon-minimalism on dark background (#000 / #111)  
- **Colors:** Dynamic gradient hue-shift with speed  
- **Puck:** Glowing disc with particle trail (unlockable variants)  
- **Bars:** Solid rectangles with soft inner glow; moving gaps pulse subtly  
- **UI:** Crisp sans-serif; score centered top; minimal overlays  

---

## 5. Audio & Feel
- **Base track:** Heartbeat/metronome; BPM scales with speed  
- **SFX:** `swish` pass, `bling` perfect, `thud` fail  
- **Juice:**  
  - 60 ms hit-pause on each clear  
  - 1–2 px screen shake on fail  
  - Haptic vibration on collision  
- **Perfect streak FX:** Slight slow-mo + color bloom every 5th perfect  

---

## 6. Monetization & Retention

| Feature | Type | Notes |
|----------|------|-------|
| **Rewarded Ad Revive** | Optional | Once per run; major revenue driver |
| **Rewarded “Double Coins”** | Optional | Post-run; greed mechanic |
| **Interstitial on Game Over** | Soft | Every 2–3 runs, frequency-capped |
| **Banner Ads** | Passive | Home/Shop screens only |
| **Remove Ads IAP** | $2.99 | Disables interstitials/banners |
| **Cosmetics Store** | IAP / Coins | Trails, puck skins, bar themes |
| **Daily Missions** | Retention | “Hit 3 perfects”, “Score 30”, etc. |
| **Leaderboards** | Social | Global / friends / daily |

---

## 7. MVP Build Plan (10-Day Sprint)

| Day | Deliverable |
|-----|--------------|
| 1–2 | Core movement, collisions, scoring, basic UI |
| 3–4 | Wall generator + speed ramp |
| 5–6 | Visual polish, SFX, pause, perfect detection |
| 7–8 | Ads integration (rewarded, interstitial, banner) |
| 9 | Cosmetics framework + leaderboards |
| 10 | QA, difficulty tuning, analytics hooks |

---

## 8. KPI Targets (Soft Launch)

| Metric | Target |
|---------|--------|
| D1 Retention | ≥ 35 % |
| Avg Session Length | > 60 s (Day 3+) |
| Revive Ad Opt-In | ≥ 25 % |
| CPI (UA benchmark) | < $0.30 |

---

## 9. Tech Stack

| Layer | Tool |
|-------|------|
| Engine | Flutter + Flame |
| Ads | Google Mobile Ads SDK (+ Mediation) |
| Analytics | Firebase Analytics + Remote Config |
| Storage | Shared Preferences |
| Leaderboard | Game Center / Play Games |
| Build | Flutter 3.24+, Android 13+/iOS 15+ |

---

## 10. Expansion Hooks (Post-MVP)
- **Daily Seed Challenge:** same wall pattern globally per day  
- **Ghost Replay:** replay best/friend run overlay  
- **Greed Gem:** shiny center coin bait (risk-reward)  
- **Theme Packs:** “Retro Wave”, “Cyber Snow”, “Desert Heat”  
- **Event Weeks:** “Mirror Mayhem”, “Windstorm”, “Fake Friday”  

---

## 11. Behavioral Hooks (Psychology)
- Short, high-reward sessions → “one more try” loop  
- Progressive difficulty ramp → flow state maintenance  
- Perfect combo streak → dopamine surge  
- Variable reinforcement via rare modifiers  
- FOMO through daily challenges & leaderboards  

---

## 12. Future Monetization Expansion
- Limited-time ad-only cosmetics (“Watch 10 rewardeds → Aurora Trail”)  
- Battle Pass–style “Season Pass” for cosmetics  
- Brand-collab skins or bar themes (sponsorship)  

---

## 13. Compliance & UX Guardrails
- No interstitials during gameplay or right after rewarded ads  
- Clear close buttons; no deceptive UI  
- Frequency cap interstitials ≥ 90 s apart  
- General-audience rating (not directed to kids)  

---

## 14. Production Notes
- Runs at 60 fps on low-end Androids (budget GPU)  
- Optimize textures (< 512 × 512)  
- Use fixed timestep for consistency  
- Min APK size < 30 MB  

---

## 15. Next Steps
1. Build playable grey-box prototype (Flame)  
2. Integrate AdsManager stub + analytics events  
3. Tune difficulty & polish “feel”  
4. Conduct closed alpha (20–30 users)  
5. Iterate based on retention & ad opt-in metrics  

---

**Prepared by:**  
*Hash Include — Simple Addictive Mobile Game Project*  
*Lead Developer:* Anas Abdul Latheef  
*Date:* 2025-10-26
