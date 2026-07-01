# CAD Starter Notes

`acoustic-violin.scad` is the current parametric master (member-aware body
envelope from `family-spec.csv`; open-string paths from `design.md` tuning).
Authority: `pending_measurement` — see `visual-output-register.csv` CAD-001 and
`mcp-session-log.md`. It supersedes the retired
`acoustic-violin-placeholder.scad`.

Bowed-setup geometry that is function-critical but NOT in the design table —
bridge crown radius, afterlength (bridge-to-tailpiece), neck projection, string
spacing at bridge, fingerboard scoop — is flagged `TBD_measurement` in the scad
and modeled generically only. These MUST come from a measured setup drawing
before the master can carry fabrication authority.

Keep outline, arching, neck projection, stop length, bridge line, and string
paths as master references. Do not bury arching or graduation values in a mesh
without a dimensioned table.
