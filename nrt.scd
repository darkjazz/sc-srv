(
SynthDef('dusty', {arg freq, amp, rvt;
	Out.ar(0, GVerb.ar(Dust.ar(freq, amp), 100, rvt))
}).writeDefFile;

SynthDef('clear', {arg freq, amp, rvt;
	Line.kr(0, 0, rvt, doneAction: 2);
	Out.ar(0, GVerb.ar(SinOsc.ar(freq, 0, amp) * EnvGen.kr(Env.perc, timeScale: 0.2), 30, rvt))
}).writeDefFile;

f = Array.geom(13, 2000, 2**(1/7)).asInt.collect(_.nextPrime);

x = 11.collect({arg i;
	var dur, start;
	start = rrand(i+1.0, i+2.0);
	dur = rrand(3.0, 6.0);
	[start, ['s_new', 'clear', 1001 + i, 0, 0, 'freq', f.choose, 'amp', rrand(0.1, 0.4), 'rvt', dur]];
});

z = [
	[0.2, ['s_new', 'dusty', 1000, 0, 0, 'freq', 43, 'amp', 0.4, 'rvt', 7.0]]
] ++ x ++
[
	[x.last.first + x.last[1].last + 4.0, ['n_free', 1000]],
	[x.last.first + x.last[1].last + 4.0 + 0.2, ['c_set', 0, 0]]
];

w = File("/home/alo/dev/sc-srv/dusty.score", "w");
w.write(z.asCompileString);
w.close;
Score.writeFromFile("/home/alo/dev/sc-srv/dusty.score", "/home/alo/dev/sc-srv/dusty.osc");
)

0
z.do(_.postln)