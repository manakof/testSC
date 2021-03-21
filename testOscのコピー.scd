OSCresponder
b = NetAddr.new("192.168.100.105", 57110);
b = NetAddr.new("172.0.0.1", 57120);   // create the NetAddr
b.sendMsg('/hello', "there");












t.sendMsg('/hello', "there");
t=NetAddr.new("192.168.0",57120);
t=NetAddr.new("172.0.0.1",57110);
r= OSCFunc({|msg time| [time,msg].postln},'/hello',n);
NetAddr

n = NetAddr.new("192.168.0.10", 7771);    // create the NetAddr
// create the OSCFunc
o = OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; }, '/goodbye', n);
o.free;    // remove the OSCFunc when you are done.
NetAddr.langPort

(
o = OSCresponderNode( n, '/hello',
		{
			arg t, r, msg;
			( "time:" + t ).postln;
			msg[1].postln;
		}
	).add;
)