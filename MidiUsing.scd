s.makeWindow
s.quit
s.boot;
(
var notes, on, off,scale;

MIDIClient.init;
MIDIIn.connectAll;

notes = Array.newClear(128);    // array has one slot per possible MIDI note
scale = Scale.chromatic.postln;
//scale.tuning_(\just);// Just intonation
scale.tuning_(\et12); // Twelve-tone equal temperament
//scale.tuning_(\mean4); // Meantone, 1/4 Syntonic Comma
//scale.tuning_(\pythagorean); // Pythagorean

//on = MIDIFunc.noteOn({ |veloc, num, chan, src|
//   notes[num] = Synth(\default, [\freq, num.midicps,
//        \amp, veloc * 0.00315]);
//});

on = MIDIFunc.noteOn({ |veloc, num, chan, src|
   notes[num] = Synth(\default, [\freq, num.keyToDegree(scale, 12).degreeToKey(scale).midicps,
        \amp, veloc * 0.00315]);
});

off = MIDIFunc.noteOff({ |veloc, num, chan, src|
    notes[num].release;
});

q = { on.free; off.free; };
)

// when done:
q.value;

