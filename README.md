# Acoustic Violin

Engineering documentation and parametric design table for the acoustic violin -
traditional construction reference and stave-built explorations.

Part of the [tonykoop/instrument-maker](https://github.com/tonykoop/instrument-maker) catalogue.

**Status: L2 V5 build-packet candidate**

## Readiness

L2 scaffold. This repo now includes root-mode build packet documentation for a
4-string acoustic violin reference build. It is not L3 because arching,
graduation, neck-set, soundpost, bridge setup, CAD/render evidence, and measured
prototype validation are not complete.

## Packet Contents

- `explorer.html` - studio-facing packet digest generated from the root packet.
- `design.md` - acoustic violin baseline and bowed-string assumptions.
- `bom.csv`, `sourcing.csv`, `cut-list.csv`, `validation.csv` - packet tables.
- `family-spec.csv` - L2 SolidWorks family-spec scaffold from the
  instrument-maker-v4 template. Placeholder values; replace with packet
  design-sheet values before SolidWorks import.
- `assembly-manual.md`, `risks.md`, `photo-shotlist.md` - build and review aids.
- `drawing-brief.md`, `drawings/README.md`, `cad/README.md`,
  `wolfram-starter.wl`, `wolfram/README.md` - starter technical artifacts.
- `cnc/README.md`, `images/README.md`, `data/README.md` - placeholder folders
  for future toolpaths, shop photos, and measured prototype data. Empty by
  design until a build is underway.

## String-Scale Assumptions

Baseline: 4 strings, G3-D4-A4-E5, 328 mm / 12.91 in vibrating length, standard
violin string set, and total tension verified against the manufacturer chart
before first pitch-up.

## Build Review Checklist

Before this packet moves beyond L2, review the setup geometry before the
woodwork details. Neck projection, bridge height, fingerboard scoop, stop
length, overstand, and tailpiece afterlength must agree. Arching and graduation
are intentionally left as TBDs until a reference or measured plan is selected.

CAD should preserve the centerline, outline, bridge line, f-hole placeholders,
neck projection, and string paths as master references. Plate meshes or carved
surfaces should be backed by dimensioned arching and graduation tables so the
work can be reviewed and repeated.

## Validation Boundary

This packet supports design review and prototype planning only. The following
evidence is still required before calling it L3:

- Selected arching and graduation reference.
- Neck-set drawing with projection and action targets.
- Bridge and soundpost fitting notes with photos.
- Published tension data for the selected string set.
- Open-string pitch stability after 24 hours.
- Setup measurements for scale, action, bridge fit, and soundpost position.

## Shop Notes

Fit bridge and soundpost carefully before full pitch. A poorly fitted bridge or
post can damage the top even when string tension is within the normal violin
range. Bring strings up gradually and stop if the top, bridge, or soundpost
shows unsafe movement.

## License

[CC BY 4.0](LICENSE) - see LICENSE for details.
