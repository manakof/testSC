s.boot;
s.makeWindow;
n = NetAddr.new("192.168.0.10",12345);
n.sendMsg('/start',143);

Synth('start-snd');
(
SynthDef('start-snd',{
	arg amp=0.5 ,freq=441;
	var source, env,pan=0,out=0;
	source = SinOsc.ar(freq,0,amp);
	env = EnvGen.kr(Env.perc(),doneAction:2);
	source = Pan2.ar(source*env,0);
	Out.ar(out,source);
}).store;
)
(
SynthDef('study-001',{
	arg amp=0.5 ,freq=500;
	var source, env,pan=0,out=0;
	source = SinOsc.ar(freq,mul:amp);
	env = EnvGen.kr(Env.perc(),doneAction:2);
	source = Pan2.ar(source*env,0);
	Out.ar(out,source);
}).store;
)

(
a=Pbind(
	\x, Pseq([1],1),
	\instrument, 'start-snd',
	\function,Pfunc({n.sendMsg('/start',0);}),
);
b = Pbind(
	\x, Pseq([1,2,3,4,5,6,7,8,9,10],1),
	\dur,1,
	\instrument, 'study-001',
	\amp,0.5,
	\freq,500,
	\function,   Pfunc({n.sendMsg('/study-001',0);}),
);
)
Ptpar([0.0,a,1.5,b],1).play();
Synth('start-snd');
