s.boot;
s.quit;
s.scope(2)
s.makeWindow
s.dumpOSC
s.queryAllNodes;

(
SynthDef('saw1',{
	arg freq=100,amp=0.5,pan=0,out=0;
	var source,env;
	source = Saw.ar(freq);
	Out.ar(out,Pan2.ar(source*amp,pan));
}).store;
)
(
SynthDef('sine1',{
	arg freq=100,amp=0.5,pan=0,out=0;
	var source,env;
	source = Saw.ar(freq);
	Out.ar(out,Pan2.ar(source*amp,pan));
}).store;
)
(
SynthDef('square1',{
	arg freq=100,amp=0.5,pan=0,out=0;
	var source,env;
	source = Saw.ar(freq);
	Out.ar(out,Pan2.ar(source*amp,pan));
}).store;
)


Synth('saw1',['freq',100,\pan,0]);

(
SynthDef('env-adsr',{
	arg gate=1,a=0.5,d=0.5,s=0.5,r=0.5,out=0,in,pan=0;
	var env;
	env = EnvGen.ar(Env.adsr(a,d,s,r),gate,doneAction:2);
	Out.ar(out,Pan2.ar(In.ar(in)*env,pan));
}).store;
)
b = Bus.audio;

x = Synth('saw1',['freq',100,\pan,0,\out,b]);
d=Synth.after(x,'env-adsr',[\in,b]);
d.set('gate',0);


Env.adsr(0.1,0.3,0.5,1).test


(
SynthDef('env-perc',{
	arg gate=1,a=0.5,d=0.5,s=0.5,r=0.5,out=0,in,pan=0;
	var env;
	env = EnvGen.ar(Env.perc(),gate,doneAction:2);
	Out.ar(out,Pan2.ar(In.ar(in)*env,pan));
}).store;
)
b = Bus.audio;
d = Bus.control;

x = Synth('saw1',['freq',100,\pan,0,\out,b]);
d=Synth.after(x,'env-perc',[\in,b]);
d.set('gate',0);


Env.adsr(0.1,0.3,0.5,1).test

