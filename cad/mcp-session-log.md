# MCP / External-Tool Session Log

V5 provenance record for artifacts generated or modified by external tools.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
|---|---|---|---|---|---|---|---|
| cindy-r1-2026-05-29 | claude-code | acoustic-violin-design-table.xlsx, family-spec.csv | cad/acoustic-violin-placeholder.scad | cad_authoring | pending_measurement | self_checked | Parametric scaffold from family-spec baseline. Not reviewed against luthier reference or measured template. Retired 2026-07-01, superseded by cad/acoustic-violin.scad. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | acoustic-violin-design-table.xlsx, family-spec.csv, design.md | cad/acoustic-violin.scad | cad_authoring | pending_measurement | self_checked | Parametric master: member-aware body envelope (bouts, ribs, plates, f-hole spacing, neck angle) from family-spec.csv baseline row; open-string paths from design.md tuning. Bowed-setup geometry (bridge crown radius, afterlength, neck projection, string spacing at bridge) is NOT in the design table and is flagged TBD_measurement, modeled generically only. OpenSCAD render check: pass (openscad -o STL, exit 0). |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | acoustic-violin-design-table.xlsx | bom.csv, sourcing.csv, cut-list.csv, validation.csv | packet_refresh | fabrication | self_checked | V5 refresh pass; tabular packet data reviewed against design table. No dimension changes made. Provenance rows added to satisfy V5 fabrication-artifact logging. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | design.md, family-spec.csv | wolfram/acoustic-violin-wolfram-model.wl | analysis_source | derived_preview | unreviewed | Wolfram packet source generated (generate_wolfram_packet.py), not executed. Source-only L2 evidence. |
