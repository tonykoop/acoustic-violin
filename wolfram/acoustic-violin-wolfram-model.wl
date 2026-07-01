(* instrument-maker-v4.2 Wolfram packet source *)
ClearAll["Global`*"];

packetDir = "/mnt/c/Users/Tony/Documents/GitHub/instruments/strings/acoustic-violin";
metadata = <|
  "PacketName" -> "Acoustic Violin Design",
  "PacketPath" -> ".",
  "GeneratedOn" -> "2026-07-01",
  "Model" -> "String",
  "HasFamilySpec" -> True,
  "HasValidation" -> True,
  "HasCncPlan" -> False
|>;

familySpecPath = FileNameJoin[{packetDir, "family-spec.csv"}];
validationPath = FileNameJoin[{packetDir, "validation.csv"}];
cncPlanPath = FileNameJoin[{packetDir, "cnc", "cnc-plan.json"}];

familySpec = If[FileExistsQ[familySpecPath],
  Import[familySpecPath, "Dataset"],
  Dataset[ImportString["[{\"member_id\": \"acoustic-violin-baseline\", \"scale_label\": \"L2 scaffold\", \"target_note\": \"TBD\", \"target_hz\": \"\", \"scale_length_in\": \"12.9\", \"body_length_in\": \"14.0\", \"upper_bout_in\": \"6.6\", \"lower_bout_in\": \"8.2\", \"rib_height_in\": \"1.25\", \"top_thickness_in\": \"0.12\", \"back_thickness_in\": \"0.16\", \"f_hole_spacing_in\": \"4.2\", \"neck_angle_deg\": \"4.0\", \"notes\": \"L2 scaffold only; replace with packet design values before SolidWorks import\"}, {\"member_id\": \"acoustic-violin-variant\", \"scale_label\": \"L2 scaffold\", \"target_note\": \"TBD\", \"target_hz\": \"\", \"scale_length_in\": \"13.9\", \"body_length_in\": \"15.1\", \"upper_bout_in\": \"7.13\", \"lower_bout_in\": \"8.86\", \"rib_height_in\": \"1.35\", \"top_thickness_in\": \"0.12\", \"back_thickness_in\": \"0.16\", \"f_hole_spacing_in\": \"4.54\", \"neck_angle_deg\": \"4.32\", \"notes\": \"L2 scaffold only; replace with packet design values before SolidWorks import\"}]", "JSON"]]
];

validationData = If[FileExistsQ[validationPath],
  Import[validationPath, "Dataset"],
  Dataset[ImportString["[{\"check_id\": \"VAL-001\", \"area\": \"Scale length\", \"target\": \"328 mm / 12.91 in vibrating length\", \"method\": \"measure nut to bridge\", \"tolerance\": \"+/- 1 mm\", \"measured\": \"TBD\", \"result\": \"TBD\", \"action\": \"Reset bridge/nut position\"}, {\"check_id\": \"VAL-002\", \"area\": \"String tension\", \"target\": \"within selected set published range\", \"method\": \"manufacturer chart\", \"tolerance\": \"within published range\", \"measured\": \"TBD\", \"result\": \"TBD\", \"action\": \"Change string set\"}, {\"check_id\": \"VAL-003\", \"area\": \"Neck projection\", \"target\": \"setup-compatible bridge height\", \"method\": \"straightedge to bridge line\", \"tolerance\": \"target TBD\", \"measured\": \"TBD\", \"result\": \"TBD\", \"action\": \"Reset neck or bridge plan\"}, {\"check_id\": \"VAL-004\", \"area\": \"Action\", \"target\": \"playable G/E string height\", \"method\": \"measure at fingerboard end\", \"tolerance\": \"target TBD\", \"measured\": \"TBD\", \"result\": \"TBD\", \"action\": \"Adjust bridge/fingerboard\"}, {\"check_id\": \"VAL-005\", \"area\": \"Bridge fit\", \"target\": \"full foot contact on top\", \"method\": \"visual light-gap check\", \"tolerance\": \"no visible gap\", \"measured\": \"TBD\", \"result\": \"TBD\", \"action\": \"Refit bridge\"}, {\"check_id\": \"VAL-006\", \"area\": \"Soundpost fit\", \"target\": \"stable post without crushing top/back\", \"method\": \"inspection and tone test\", \"tolerance\": \"no slipping/buzzing\", \"measured\": \"TBD\", \"result\": \"TBD\", \"action\": \"Refit/reposition\"}]", "JSON"]]
];

frequencyFromMidi[midi_, a4_: 440] := a4*2^((midi - 69)/12);
centsError[measured_, target_] := 1200*Log[2, measured/target];
openPipeLengthIn[freq_, c_: 13552, radius_: 0] := c/(2*freq) - 2*0.6*radius;
stoppedPipeLengthIn[freq_, c_: 13552, radius_: 0] := c/(4*freq) - 0.6*radius;
helmholtzFrequency[area_, volume_, leff_, c_: 13552] :=
  (c/(2*Pi))*Sqrt[area/(volume*leff)];
cantileverFrequency[k_, thickness_, length_] := k*thickness/length^2;
stringFrequency[length_, tension_, linearDensity_] :=
  1/(2*length)*Sqrt[tension/linearDensity];

modelExplorer = Switch[metadata["Model"],
  "Helmholtz",
    Manipulate[
      helmholtzFrequency[portArea, chamberVolume, effectiveLength],
      {{portArea, 0.4, "port area (in^2)"}, 0.05, 4},
      {{chamberVolume, 40, "volume (in^3)"}, 5, 400},
      {{effectiveLength, 0.6, "effective length (in)"}, 0.05, 3}
    ],
  "OpenPipe",
    Manipulate[
      openPipeLengthIn[f, 13552, radius],
      {{f, 440, "target Hz"}, 80, 1200},
      {{radius, 0.375, "bore radius (in)"}, 0, 1.5}
    ],
  "StoppedPipe",
    Manipulate[
      stoppedPipeLengthIn[f, 13552, radius],
      {{f, 220, "target Hz"}, 40, 1000},
      {{radius, 0.375, "bore radius (in)"}, 0, 1.5}
    ],
  "CantileverBeam",
    Manipulate[
      cantileverFrequency[k, thickness, length],
      {{k, 24000, "K constant"}, 1000, 80000},
      {{thickness, 0.25, "thickness (in)"}, 0.05, 1},
      {{length, 4.5, "length (in)"}, 0.5, 24}
    ],
  _,
    Manipulate[
      frequencyFromMidi[midi],
      {{midi, 69, "MIDI note"}, 24, 96, 1}
    ]
];

audioPreview[f_: 440, seconds_: 1.5] :=
  AudioNormalize[
    AudioAdd[
      AudioGenerator[{"Sin", f}, seconds],
      .35 AudioGenerator[{"Sin", 2 f}, seconds],
      .18 AudioGenerator[{"Sin", 3 f}, seconds]
    ]
  ];

validationRows = Normal[validationData];
validationPlot = Quiet@Check[
  ListPlot[
    DeleteMissing[
      ToExpression /@ Lookup[validationRows, "Cents Error", Missing[]]
    ],
    PlotTheme -> "Scientific",
    Frame -> True,
    FrameLabel -> {{"Cents error", None}, {"Measurement row", metadata["PacketName"]}}
  ],
  "No numeric validation cents-error values yet."
];

packetNotebook[] := CreateDocument[
  {
    TextCell[metadata["PacketName"], "Title"],
    TextCell["instrument-maker v4.2 computational packet", "Subtitle"],
    TextCell["Metadata", "Section"],
    ExpressionCell[metadata, "Input"],
    TextCell["Family/design data", "Section"],
    ExpressionCell[familySpec, "Input"],
    TextCell["Model explorer", "Section"],
    ExpressionCell[modelExplorer, "Input"],
    TextCell["Audio preview", "Section"],
    ExpressionCell[audioPreview[440], "Input"],
    TextCell["Validation", "Section"],
    ExpressionCell[validationPlot, "Input"]
  },
  WindowTitle -> metadata["PacketName"]
];

packetNotebook[];
