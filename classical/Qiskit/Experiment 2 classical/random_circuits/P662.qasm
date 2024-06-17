OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.6399041260314922) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.391872078040627) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
ryy(1.6399041260314922) q[0],q[1];
p(0.0965313730203274) q[0];
h q[3];
rzx(4.391872078040627) q[4],q[2];
cswap q[1],q[2],q[4];
y q[5];
h q[6];
cswap q[6],q[3],q[5];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
