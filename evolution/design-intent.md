# Design Intent — acoustic-violin rev A

- Master CAD: `cad/acoustic-violin.scad` (sha256: b09702d766462d00835893182115ee799be94479a08a48ce0d4707c3a834c62b), driven by `acoustic-violin-design-table.xlsx` (sha256: 1c5d534bb710743558036a3fc90acaca56bae73031bdaa25de53f48ad3e06ea3) via `family-spec.csv`.
- Function: Four-string acoustic violin (G3-D4-A4-E5, A4=440 Hz). Steel/synthetic-core strings carry ~45-55 lbf total static tension from tailpiece over an arched bridge to the nut across a 328 mm / 12.91 in vibrating length. Downbearing through the bridge feet couples the strings to an arched spruce top braced by a bass bar and coupled to a maple back through a soundpost; the body is the resonating chamber. Bowed excitation, not plucked.
- Environment: indoor instrument; solid-wood arched plates move with humidity (record RH at setup). String pull plus bridge downbearing is a sustained structural load on the top, bass bar, soundpost, and neck-set.
- Target qty: 1 (prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Scale (vibrating) length | 328 mm / 12.91 in | ±1 mm (validation.csv VAL-001) | intonation | design.md baseline / family-spec scale_length_in |
| Total string tension | ~45-55 lbf | within selected-set published range | structure + tone; over-tension damages top | design.md baseline / validation.csv VAL-002 |
| Neck projection | TBD_measurement | straightedge to bridge-line working range | sets bridge height / action / playability | design.md (measurement_required); validation.csv VAL-003 |
| Bridge fit + height | TBD_measurement | full-foot contact, no light gap | tone transfer; ill fit damages top | validation.csv VAL-005; README setup gates |
| Afterlength (bridge→tailpiece) | scale/6 (assumption) | TBD from setup drawing | tailpiece/string break angle, tone | scad TBD_measurement param |
| Soundpost position/fit | TBD_measurement | stable, no top/back crush | structure + tone | validation.csv VAL-006 |
| Top / back thickness | 0.12 in / 0.16 in | graduation map TBD | structure vs. tone | family-spec.csv baseline |

## Incidental (free for DFM)

- Body outline styling (bout curves, C-bout waist), scroll/pegbox cosmetics, f-hole styling, purfling, non-mating surface finish and varnish color.

## Must-nots (DFM may never violate)

- Bridge crown radius, afterlength, neck projection, and string spacing at bridge stay measurement-gated (`TBD_measurement`); never treat the generic scad placeholders as fabrication dimensions.
- Do not bring strings to full pitch before bridge and soundpost are fitted and neck projection is verified — ill fit can damage the top even within normal violin tension (risks.md / README shop notes).
- Do not thin the top/back below a validated graduation/arching map — plates are the load path and the tone driver (risks.md).
- Do not size the build from placeholder tension rows — use the selected string set's published tension data (validation.csv VAL-002).

## Material intent

- Preferred: spruce arched top, maple back/ribs/neck, ebony fingerboard, per bom.csv. Standard 4-string violin set with published tension.
- Acceptable subs: per sourcing.csv (spec-first; live prices unverified).
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable. Arching, graduation, neck-set, and setup evidence remain the open L3 gates.
