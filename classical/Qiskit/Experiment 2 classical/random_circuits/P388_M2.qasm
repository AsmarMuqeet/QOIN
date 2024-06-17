OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.9678924824804737,2.0883323368349327,-2.0883323368349327) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.183674692374961) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P388 q0,q1,q2,q3,q4 { swap q0,q1; ry(3.7088034186820193) q0; u3(4.386452768125694,5.068410377628285,0.5059135199805109) q0; csx q3,q2; y q2; s q2; t q3; id q3; ryy(6.183674692374961) q3,q2; tdg q4; cu3(5.556987413785745,1.0138730558747977,0.6070163905225257) q1,q4; t q1; r(0.9678924824804737,3.6591286636298292) q1; id q4; csx q4,q0; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P388 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
