OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.0736608862474368) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
y q[0];
sxdg q[0];
y q[1];
p(5.11198419025272) q[1];
id q[2];
u3(2.9716215392332863,3.1085783761729906,5.008921869302433) q[3];
sxdg q[3];
rx(1.2361305347239877) q[4];
rzx(1.0736608862474368) q[4],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
