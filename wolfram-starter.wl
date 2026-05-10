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
