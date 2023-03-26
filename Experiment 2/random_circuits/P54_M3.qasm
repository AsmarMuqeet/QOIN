OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.0736608862474368) q1; cx q0,q1; h q1; }
gate gate_P54 q0,q1,q2,q3,q4 { y q0; sxdg q0; y q1; p(5.11198419025272) q1; id q2; u3(2.9716215392332863,3.1085783761729906,5.008921869302433) q3; sxdg q3; rx(1.2361305347239877) q4; rzx(1.0736608862474368) q4,q2; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P54 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
