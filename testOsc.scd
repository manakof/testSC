s.boot;
s.dumpOSC
b = NetAddr.new("192.168.100.121",8000);

FFT

(
r = Routine({
	loop{
		"test".postln;
		b.sendMsg("/mouse/button","no");
		0.5.wait;
	}

})
)
r.play
r.stop