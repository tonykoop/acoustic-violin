# Acoustic Violin Build Packet Print Packet

Generated: 2026-05-09
Packet folder: `/tmp/acoustic-violin-codex-gina-r2-build-packet`

## File Map

| File | Purpose |
| --- | --- |
| `design.md` | Project intent, catalog metadata, assumptions, and validation plan. |
| `bom.csv` | Starter bill of materials with part categories, quantities, drawing refs, and notes. |
| `sourcing.csv` | Supplier/search tracker with specs, price/date fields, lead time, substitutes, and risks. |
| `cut-list.csv` | Rough/final stock sizes, material, grain/orientation, operations, yield, and offcuts. |
| `drawing-brief.md` | Manufacturing drawing and technical product sketch brief. |
| `assembly-manual.md` | Shop-facing sequence, tools, fixtures, safety, tuning, finishing, and maintenance notes. |
| `validation.csv` | Target/measured values, tolerance, environment, result, and tuning/build action log. |
| `supplier-rfq.md` | Supplier email/request-for-quote starter. |
| `visual-bom-brief.md` | Art direction for an image-forward visual BOM. |
| `wolfram-starter.wl` | Wolfram starter for physics, optimization, visualization, and validation. |
| `README.md` | Project artifact. |
| `photo-shotlist.md` | Project artifact. |
| `risks.md` | Project artifact. |

<div class="page-break"></div>

## design.md

Project intent, catalog metadata, assumptions, and validation plan.

# Acoustic Violin Design

## Intent

Create an honest L2 acoustic violin packet that captures the standard setup
geometry and the open engineering gaps before any claim of build readiness.

## Readiness

L2 scaffold. Use for design review, drawing planning, and sourcing review. Do
not treat this as a final luthiery method or validated arching plan.

## Governing Model

Open strings use Mersenne-Taylor. Body response is not reduced to a simple
closed-form model in this packet; arching, graduation, bridge, soundpost, and
air/body modes must be validated empirically.

```text
f = (1 / (2 L)) * sqrt(T / mu)
```

## Baseline Assumptions

| Parameter | Baseline | Notes |
| --- | ---: | --- |
| Scale length | 328 mm / 12.91 in | Standard violin vibrating length |
| Tuning | G3-D4-A4-E5 | A4 = 440 Hz reference |
| String set | Standard 4-string violin set | Use published tensions |
| Body length | about 14 in / 356 mm | Exact outline TBD from drawing |
| Top/back | Spruce top, maple back | Graduation not finalized |
| Neck angle/projection | TBD from setup drawing | Critical to bridge height/action |
| Target total tension | about 45-55 lbf | Verify with selected string set |

## Tension And Setup Notes

- Fit bridge and soundpost under low tension, then bring strings up gradually.
- Check neck projection before final bridge height.
- Record action, bridge foot fit, soundpost location, and open-string pitch
  stability.

## Known Gaps

- No arching/graduation map.
- No neck-set drawing.
- No soundpost/bridge fitting evidence.
- No live sourceability check.
- No acoustic measurements.

<div class="page-break"></div>

## bom.csv

Starter bill of materials with part categories, quantities, drawing refs, and notes.

| item | qty | unit | material_or_spec | estimated_cost_usd | notes |
| --- | --- | --- | --- | --- | --- |
| Top plate | 1 | ea | spruce violin top blank or prototype plate | 90 | Graduation TBD |
| Back plate | 1 | ea | maple back blank or prototype plate | 110 | One-piece or two-piece |
| Rib/lining/block stock | 1 | set | maple ribs, spruce blocks/linings | 45 | Bending method TBD |
| Neck blank | 1 | ea | maple violin neck blank | 55 | Scroll detail optional for prototype |
| Fingerboard | 1 | ea | ebony or composite violin fingerboard | 35 | Final scoop/setup TBD |
| Bridge blank | 1 | ea | violin bridge blank | 12 | Must be fitted to top |
| Soundpost | 1 | ea | spruce soundpost stock | 5 | Fit and position are validation items |
| Tailpiece/chinrest/endpin | 1 | set | standard violin fittings | 45 | Compatibility TBD |
| Pegs or tuners | 4 | ea | violin pegs or geared pegs | 35 | Pegbox geometry must match |
| String set | 1 | set | standard violin G-D-A-E set with published tension | 45 | Tension evidence required |
| Finish/adhesive | 1 | lot | hide glue or prototype adhesive; varnish system TBD | 45 | Traditional methods TBD |

<div class="page-break"></div>

## sourcing.csv

Supplier/search tracker with specs, price/date fields, lead time, substitutes, and risks.

| item | required_spec | search_terms | supplier_candidates | date_checked | unit_price_usd | lead_time | substitution_risk | notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Violin strings | 4/4 violin set with published tensions | 4/4 violin strings tension chart | string manufacturers; music suppliers | TBD | TBD | TBD | Low | Use actual tension values |
| Bridge blank | 4/4 violin bridge blank | violin bridge blank 4/4 | luthier suppliers | TBD | TBD | TBD | Low | Quality affects setup |
| Soundpost stock | straight spruce soundpost dowel | violin soundpost stock spruce | luthier suppliers | TBD | TBD | TBD | Low | Fit is more important than cost |
| Tonewood plates | spruce top and maple back suitable for violin | violin tonewood spruce top maple back | luthier tonewood suppliers | TBD | TBD | TBD | Medium | Prototype may use lower grade |
| Fittings | tailpiece, chinrest, endpin, pegs/geared pegs | violin fittings set 4/4 | luthier suppliers; music suppliers | TBD | TBD | TBD | Medium | Peg/tuner choice affects pegbox |

<div class="page-break"></div>

## cut-list.csv

Rough/final stock sizes, material, grain/orientation, operations, yield, and offcuts.

| part | qty | rough_dimensions_in | final_dimensions_in | material | grain_or_orientation | operation | notes |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Top plate | 1 | 0.75 x 8.5 x 15.0 | arched/graduated TBD | spruce | quarter-sawn centerline | join, carve/CNC, graduate | Arching map required |  |
| Back plate | 1 | 0.75 x 8.5 x 15.0 | arched/graduated TBD | maple | quarter-sawn centerline | join, carve/CNC, graduate | Graduation TBD |  |
| Ribs | 6 | 0.060 x 1.5 x variable | profile TBD | maple | long grain lengthwise | bend or laminate | Mold required |  |
| Blocks/linings | 1 | set | TBD | TBD | spruce/willow/lining stock | stable | shape and glue | Corner block plan TBD |
| Neck | 1 | 2.0 x 2.5 x 11.0 | violin neck profile TBD | maple | quarter grain preferred | saw, carve, fit | Projection critical |  |
| Fingerboard | 1 | 0.35 x 1.75 x 11.0 | scoop/profile TBD | ebony/composite | long grain | plane and fit | Final setup after neck set |  |

<div class="page-break"></div>

## drawing-brief.md

Manufacturing drawing and technical product sketch brief.

# Acoustic Violin Drawing Brief

Required first drawings:

- Full outline with centerline, f-hole placeholders, bridge line, and stop.
- Side setup drawing with nut, fingerboard projection, bridge, and tailpiece.
- Plate arching/graduation placeholder map with TBDs visible.
- Rib garland and block layout.
- Neck/pegbox/fingerboard interface detail.

<div class="page-break"></div>

## assembly-manual.md

Shop-facing sequence, tools, fixtures, safety, tuning, finishing, and maintenance notes.

# Acoustic Violin Assembly Manual

1. Choose the outline, arching, and graduation references before cutting.
2. Prepare plates, ribs, blocks, linings, neck, and fingerboard.
3. Build the rib garland on a mold or documented fixture.
4. Carve or CNC rough plates, then hand-finish critical arching and graduation.
5. Close the body with reversible or documented adhesive.
6. Fit neck angle/projection before final fingerboard work.
7. Fit pegs/tuners, nut, bridge, soundpost, tailpiece, and strings.
8. Bring strings to pitch gradually and log setup measurements.

Safety: string and bridge forces are lower than a harp but still require eye
protection and careful first pitch-up.

<div class="page-break"></div>

## validation.csv

Target/measured values, tolerance, environment, result, and tuning/build action log.

| check_id | area | target | method | tolerance | measured | result | action |
| --- | --- | --- | --- | --- | --- | --- | --- |
| VAL-001 | Scale length | 328 mm / 12.91 in vibrating length | measure nut to bridge | +/- 1 mm | TBD | TBD | Reset bridge/nut position |
| VAL-002 | String tension | within selected set published range | manufacturer chart | within published range | TBD | TBD | Change string set |
| VAL-003 | Neck projection | setup-compatible bridge height | straightedge to bridge line | target TBD | TBD | TBD | Reset neck or bridge plan |
| VAL-004 | Action | playable G/E string height | measure at fingerboard end | target TBD | TBD | TBD | Adjust bridge/fingerboard |
| VAL-005 | Bridge fit | full foot contact on top | visual light-gap check | no visible gap | TBD | TBD | Refit bridge |
| VAL-006 | Soundpost fit | stable post without crushing top/back | inspection and tone test | no slipping/buzzing | TBD | TBD | Refit/reposition |

<div class="page-break"></div>

## supplier-rfq.md

Supplier email/request-for-quote starter.

# Supplier RFQ Draft

Hello,

Please quote materials for a 4/4 acoustic violin prototype: spruce top blank,
maple back/neck/rib stock, bridge blank, soundpost stock, standard fittings,
and a 4-string set with published tension data.

Please include dimensions, grade, unit price, minimum order quantity, lead time,
and substitution options.

<div class="page-break"></div>

## visual-bom-brief.md

Art direction for an image-forward visual BOM.

# Visual BOM Brief

Show the violin as assembled and as an exploded plate/rib/neck/fittings view.
Call out top, back, ribs, blocks, linings, neck, fingerboard, bridge, soundpost,
tailpiece, chinrest, pegs/tuners, strings, adhesive, and finish.

<div class="page-break"></div>

## wolfram-starter.wl

Wolfram starter for physics, optimization, visualization, and validation.

```wolfram
(* Acoustic violin open-string starter. Values are first-pass assumptions. *)
ClearAll["Global`*"];
a4 = 440;
freqFromMidi[m_] := a4*2^((m - 69)/12);
scaleLengthIn = 12.91;
tuning = <|"G3" -> 55, "D4" -> 62, "A4" -> 69, "E5" -> 76|>;

Dataset[
  KeyValueMap[
    <|"string" -> #1, "frequencyHz" -> N[freqFromMidi[#2]],
      "scaleLengthIn" -> scaleLengthIn|> &,
    tuning
  ]
]
```

<div class="page-break"></div>

## README.md

Project artifact.

# Acoustic Violin

Engineering documentation and parametric design table for the acoustic violin -
traditional construction reference and stave-built explorations.

Part of the [tonykoop/instrument-maker](https://github.com/tonykoop/instrument-maker) catalogue.

## Readiness

L2 scaffold. This repo now includes root-mode build packet documentation for a
4-string acoustic violin reference build. It is not L3 because arching,
graduation, neck-set, soundpost, bridge setup, CAD/render evidence, and measured
prototype validation are not complete.

## Packet Contents

- `design.md` - acoustic violin baseline and bowed-string assumptions.
- `bom.csv`, `sourcing.csv`, `cut-list.csv`, `validation.csv` - packet tables.
- `assembly-manual.md`, `risks.md`, `photo-shotlist.md` - build and review aids.
- `drawing-brief.md`, `drawings/README.md`, `cad/README.md`,
  `wolfram-starter.wl`, `wolfram/README.md` - starter technical artifacts.

## String-Scale Assumptions

Baseline: 4 strings, G3-D4-A4-E5, 328 mm / 12.91 in vibrating length, standard
violin string set, and total tension verified against the manufacturer chart
before first pitch-up.

## License

[CC BY 4.0](LICENSE) - see LICENSE for details.

<div class="page-break"></div>

## photo-shotlist.md

Project artifact.

# Photo Shotlist

- Plate blanks with grain orientation.
- Rib mold or garland setup.
- Arching/graduation checks.
- Neck projection straightedge before glue.
- Bridge foot fit and soundpost fit.
- First string-up with action and tuner readings.

<div class="page-break"></div>

## risks.md

Project artifact.

# Acoustic Violin Risks

- Arching and graduation are not validated and can dominate tone and structure.
- Neck projection errors can make the instrument unplayable.
- Soundpost and bridge fitting require care; poor fit can damage the top.
- Live sourcing and price checks are still missing.
- Remain at L2 until setup, CAD, and measured acoustic evidence exist.
