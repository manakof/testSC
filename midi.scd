s.boot;

(
var notes, on, off;

MIDIClient.init;
MIDIIn.connectAll;

notes = Array.newClear(128);    // array has one slot per possible MIDI note

on = MIDIFunc.noteOn({ |veloc, num, chan, src|
    notes[num] = Synth(\default, [\freq, num.midicps,
        \amp, veloc * 0.00315]);
	("velo :"+ veloc).postln;
	("num :"+ num).postln;
	("chan :"+ chan).postln;
	("src :"+ src).postln;

});

off = MIDIFunc.noteOff({ |veloc, num, chan, src|
    notes[num].release;
});

q = { on.free; off.free; };

)
// when done:
q.value;
MIDIClient.sources
m.latency = 0.01
(
MIDIClient.init;
m = MIDIOut.newByName("Steinberg UR22mkII ", "Port1");
m.latency = 0.0;
MIDIIn.connectAll;
MIDIFunc.noteOn( {| veloc,num,chan,src|
switch(num,
		36,{m.noteOn(0, 20, 60)},
		37,{m.noteOn(1, 61, 60)},
		38,{m.noteOn(2, 61, 60)},
		39,{m.noteOn(3, 61, 60)},
		40,{m.noteOn(4, 61, 60)},
		41,{m.noteOn(5, 61, 60)},
		42,{m.noteOn(6, 61, 60)}
	)
});
)
m.noteOff(3, 61, 60);
m.allNotesOff(0);


Pattern
s.boot;
(
p = Pbind(
	\dur,1,
	\f,Pfunc({m.noteOn(0)})
);
)






MIDIIn.connect; // 1 port midi interface
MIDIIn.sysex = { arg uid, packet; [uid,packet].postln };
MIDIIn.sysrt = { arg src, chan, val;  [src, chan, val].postln; };
MIDIIn.smpte = { arg src, chan, val;  [src, chan, val].postln; };

m.sysex(Int8Array[ 16rf0, 0, 0, 27, 11, 0,16rf7])

m.smpte(24, 16)
m.midiClock
m.start
m.continue
m.stop
