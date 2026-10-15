---
name: Clinical Practice Desktop
colors:
  surface: '#f8f9ff'
  surface-dim: '#cbdbf5'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e5eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d3e4fe'
  on-surface: '#0b1c30'
  on-surface-variant: '#3e4947'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#6e7977'
  outline-variant: '#bdc9c6'
  surface-tint: '#006a63'
  primary: '#005c55'
  on-primary: '#ffffff'
  primary-container: '#0f766e'
  on-primary-container: '#a3faef'
  inverse-primary: '#80d5cb'
  secondary: '#0051d5'
  on-secondary: '#ffffff'
  secondary-container: '#316bf3'
  on-secondary-container: '#fefcff'
  tertiary: '#005f29'
  on-tertiary: '#ffffff'
  tertiary-container: '#087a38'
  on-tertiary-container: '#a3ffb2'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#9cf2e8'
  primary-fixed-dim: '#80d5cb'
  on-primary-fixed: '#00201d'
  on-primary-fixed-variant: '#00504a'
  secondary-fixed: '#dbe1ff'
  secondary-fixed-dim: '#b4c5ff'
  on-secondary-fixed: '#00174b'
  on-secondary-fixed-variant: '#003ea8'
  tertiary-fixed: '#95f8a7'
  tertiary-fixed-dim: '#79db8d'
  on-tertiary-fixed: '#00210a'
  on-tertiary-fixed-variant: '#005323'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
typography:
  headline-xl:
    fontFamily: Cairo
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 38px
  headline-lg:
    fontFamily: Cairo
    fontSize: 22px
    fontWeight: '700'
    lineHeight: 32px
  headline-md:
    fontFamily: Cairo
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 28px
  headline-sm:
    fontFamily: Cairo
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Cairo
    fontSize: 15px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Cairo
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 22px
  body-sm:
    fontFamily: Cairo
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 18px
  label-lg:
    fontFamily: Cairo
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
  label-md:
    fontFamily: Cairo
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 18px
  label-sm:
    fontFamily: Cairo
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 16px
  numeric-data:
    fontFamily: Cairo
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 16px
  margin: 24px
  space-xs: 4px
  space-sm: 8px
  space-md: 16px
  space-lg: 24px
  space-xl: 32px
---

## Brand & Style

This design system is tailored for an intensive clinical desktop environment running at 1440×900 resolution on Windows workstations. The brand aesthetic balances clinical precision with an atmosphere of psychological calm, minimizing cognitive fatigue for physicians, receptionists, and medical staff during long shifts.

The design philosophy combines Modern Utilitarianism with Tonal Layering:
- **Calm & Clinical:** Interfaces employ soft slate-blues, crisp clinical whites, and balanced teal primaries that instill trust without inducing sterility.
- **High Information Density & Legibility:** Optimized for high-throughput daily interactions—patient queues, lab reports, prescription pads, and multi-field clinical notes.
- **RTL-First Architecture:** Engineered natively for Right-to-Left (RTL) Arabic typography and medical workflows, honoring eastern Arabic-Indic numbering (`٠١٢٣٤٥٦٧٨٩`) and localized Egyptian financial conventions (`١٬٢٥٠ ج.م.`).

## Colors

The palette uses a crisp, high-legibility structure mapped to distinct clinical roles and operational states:

### Core Palette
- **Canvas / Background (`#F4F7F9`):** A soft, low-glare slate-gray that reduces monitor eye strain across 10-hour clinic shifts.
- **Surface Layer (`#FFFFFF`):** High-clarity white for active patient cards, data tables, and input panels.
- **Surface Variant (`#EAF0F3`):** Tinted foundational tier used for persistent toolbars, collapsed side panels, and table headers.
- **Subtle Border (`#D9E2E8`):** Restrained structural separation between clinical modules without adding visual noise.
- **Primary Accent (`#0F766E`):** Deep surgical teal; represents active focus, key affirmative triggers, and in-consultation states. Paired with `#D5F0EC` (Primary Container) and pure white `#FFFFFF` for readable contrast.
- **Neutral Foregrounds:** High-contrast `#14232B` (Text Primary) for diagnostic observations and vital signs; `#5A6B75` (Text Secondary) for metadata, units, and timestamps.

### Clinical Status & Semantic Mapping
- **Booked (`محجوز`):** Information Blue (`#2563EB`) on `#EFF6FF` container.
- **Waiting (`منتظر`):** Warm Amber (`#B45309`) on `#FEF3C7` container for pending patient triage.
- **In Consultation (`في الكشف`):** Clinical Teal (`#0F766E`) on `#D5F0EC` container.
- **Done (`تم`):** Forest Green (`#15803D`) on `#DCFCE7` container.
- **Cancelled (`ملغي`):** Muted Slate (`#64748B`) on `#F1F5F9` container.
- **No-Show (`لم يحضر`):** Deep Crimson (`#B91C1C`) on `#FEE2E2` container.
- **Urgent (`عاجل`):** Pure `#B91C1C` text and outline with `#FEF2F2` tint, signaling immediate clinical escalation.

## Typography

The design system exclusively utilizes **Cairo** to deliver exceptional legibility in Arabic desktop software. Cairo’s open counters, clear terminals, and balanced x-height ensure medical prescriptions, dosages, and patient names remain unambiguous on standard Windows DPI displays.

### Typographic Rules:
1. **RTL Flow & Alignment:** Text defaults to right-aligned (`text-align: right; direction: rtl;`). Medical values accompanied by unit tokens (e.g., `١٢٠/٨٠ ملم زئبق` or `٣٧٫٢ °م`) retain their structural grouping with explicit non-breaking spaces.
2. **Numeric Rendering:** Always format appointment times, quantities, queue tickets, and financial summaries using Arabic-Indic glyphs (`٠ ١ ٢ ٣ ٤ ٥ ٦ ٧ ٨ ٩`). Financial figures strictly display the Egyptian currency suffix: `١٬٢٥٠ ج.م.`.
3. **Leading Adjustments:** Arabic type demands slightly more vertical clearance than Latin type. The `lineHeight` specifications provide ample headroom to prevent diacritics and ascenders/descenders from clipping within dense clinical tables.

## Layout & Spacing

The layout is grounded in a rigorous **8px baseline grid** configured for a 1440×900 fixed-desktop canvas. The shell conforms to a tri-column workflow layout:

- **Primary Navigation Pane (Right side):** Fixed 240px width containing doctor schedule switcher, queue manager, and clinic settings.
- **Workspace Canvas (Center):** Fluid operational canvas (spanning minimum 820px) utilizing a 12-column sub-grid with 16px gutters and 24px margins.
- **Diagnostic & Patient Context Flyout (Left side):** Collapsible 356px contextual drawer housing active patient vitals, timeline, and allergy warnings.

All component paddings and margins derive from standard 8px steps (`4px`, `8px`, `16px`, `24px`, `32px`). Table row heights are set strictly to `48px` (comfortable) or `40px` (dense review mode) to ensure predictable scanning speeds.

## Elevation & Depth

To maximize visual clarity in clinical settings, this design system minimizes heavy dropped shadows, relying instead on **surface tonal tiers** and **crisp 1px borders** (`#D9E2E8`).

1. **Tier 0 (Base Canvas):** `#F4F7F9` background; no depth.
2. **Tier 1 (Static Cards & Containers):** `#FFFFFF` fill bounded by a continuous `1px solid #D9E2E8` border. Elevation is indicated by luminance difference, not shadow.
3. **Tier 2 (Interactive Hover & Dropdowns):** Subtle tinted ambient shadow: `0 4px 12px -2px rgba(20, 35, 43, 0.06), 0 2px 4px -1px rgba(20, 35, 43, 0.04)`.
4. **Tier 3 (Modals & Emergency Alerts):** Floating diagnostic overlays use an assertive barrier: `0 12px 32px -4px rgba(20, 35, 43, 0.14)` with a translucent `#14232B` backdrop overlay at 35% opacity.

## Shapes

The geometric personality balances modern softness with structured, clinical discipline:

- **Cards & Primary Modules:** Fixed `12px` corner radius. This gives medical record containers, lab cards, and appointment listings a refined, approachable profile.
- **Controls & Form Fields:** Strict `10px` corner radius across input boxes, buttons, search bars, and dropdown selects.
- **Status Badges & Chips:** Compact `8px` corner radius for standard tags, or full circular capsules (`9999px`) for numeric queue counters.

## Components

### Buttons
- **Primary Button:** Filled `#0F766E` with `#FFFFFF` text. Height `40px`, corner radius `10px`, padding `0 20px`. Hover: `#0D665F`. Active: `#0B5650`.
- **Secondary / Surface Button:** `#EAF0F3` background with `#0F766E` text and a subtle `#D9E2E8` border.
- **Danger Action Button:** Outline or solid `#B91C1C` for irreversible clinical actions (e.g., delete patient history, cancel surgery).

### Status Chips (شارات الحالة)
Structured with `10px` vertical alignment, `4px 10px` inner padding, Cairo SemiBold `12px`:
- **محجوز (Booked):** Text `#2563EB`, background `#EFF6FF`, border `1px solid #BFDBFE`.
- **منتظر (Arrived/Waiting):** Text `#B45309`, background `#FEF3C7`, border `1px solid #FDE68A`.
- **في الكشف (In Consultation):** Text `#0F766E`, background `#D5F0EC`, border `1px solid #99F6E4`.
- **تم (Done):** Text `#15803D`, background `#DCFCE7`, border `1px solid #BBF7D0`.
- **ملغي (Cancelled):** Text `#64748B`, background `#F1F5F9`, border `1px solid #E2E8F0`.
- **لم يحضر (No-show):** Text `#B91C1C`, background `#FEE2E2`, border `1px solid #FECACA`.
- **عاجل (Urgent):** High-priority badge. Bold `#B91C1C` border (`1.5px`), `#FEF2F2` background, accompanied by a right-aligned warning marker icon.

### Form Inputs & Medical Fields
- Inputs feature a `40px` height, `10px` radius, `#FFFFFF` background, and `1px solid #D9E2E8` border.
- Text labels reside above the field, right-aligned, styled with Cairo SemiBold `13px` in `#14232B`.
- Focus state: `1.5px solid #0F766E` with a soft teal ring `rgba(15, 118, 110, 0.15)`.

### Cards & Patient Queue Tile
- Patient tiles feature `#FFFFFF` surface, `12px` border radius, and `1px solid #D9E2E8`.
- Layout places patient avatar and identity metadata on the right, status chip and scheduled time (`٠٩:٣٠ ص`) centered, and quick diagnostic triggers on the left.

### Diagnostic Prescription List
- Alternating zebra rows using `#FFFFFF` and `#F8FAFC`.
- Pinned header using `#EAF0F3` with right-aligned Cairo Medium `12px` text.
- Integrated quick-action stepper controls for medication dosage, frequency, and duration.