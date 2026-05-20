# CNC

Placeholder. No toolpaths, G-code, or fixture drawings exist yet for the
acoustic violin build.

Before any machining can be claimed as authority, the packet needs reviewed
CAD/DXF for outline, neck set, bridge line, and f-hole placeholders. Until
that exists, this folder is intentionally empty and the L2-scaffold readiness
banner in `README.md` and `capstone-manifest.json` stands.

Expected artifacts once machining begins:

- `operations.csv` — machine, fixture, tool, feed, speed, depth-of-cut per op.
- `setup-sheet.md` — workholding and zero-set notes per operation.
- Fixture drawings or STEP exports under this folder.
- `cnc-plan.json` if a structured plan is generated.

Do not commit G-code, NC, or other machine-specific output to this folder
until a reviewed setup sheet exists.
