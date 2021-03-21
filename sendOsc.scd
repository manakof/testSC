s.boot;
s.dumpOSC;
b = NetAddr.new("192.168.0.10",57120);
b = NetAddr.new("192.168.0.10",7771);
b = NetAddr.new("192.168.0.10",12345);

b.sendMsg('/goodby',"there");
b.sendMsg('/test',14);

(
f = { |msg, time, replyAddr, recvPort|
    if(s.addr != replyAddr,
        switch( msg[0],
			'/hello',  { s.sendMsg("this"); },
            '/Synth/stop', { s.sendMsg("/n_free", msg[1]); }
        ).value
    );
};
thisProcess.addOSCRecvFunc(f);
)

(
	n = NetAddr.new( "127.0.0.1", 7771 );
	o = OSCresponderNode.new( n, "/goodbye",
		{
			arg time, resp, msg;
			[ time, resp ].postln;
		}
	).add;
	o.remove;

)

