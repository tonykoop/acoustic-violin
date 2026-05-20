# Data

Placeholder. No measured prototype data exists yet for this build.

Until a build is underway, structured tables that already exist at the repo
root carry the packet's planning data:

- `family-spec.csv` — L2 SolidWorks family-spec scaffold (placeholder values).
- `bom.csv`, `cut-list.csv`, `sourcing.csv` — material/sourcing planning.
- `validation.csv` — measurement protocol (no measured values yet).

Future measured-data files should land here with these stable names:

- `string-tension-verification.csv` — published string tensions vs. computed totals at pitch.
- `setup-measurements.csv` — neck projection, bridge height, action, scale length, fingerboard scoop, overstand, afterlength.
- `bridge-soundpost-fit.csv` — fit notes, photos, and acceptance criteria.
- `open-string-stability.csv` — pitch drift over 24 hours after first pitch-up.
- `audio-measurements.csv` — open-string spectra, sustain, and any modal test data.

Per `capstone-manifest.json.release_gate.required_before_public`, none of the
acoustic, setup, or string-tension data has been collected yet. Do not back-fill
this folder with synthetic, generated, or estimated values.
