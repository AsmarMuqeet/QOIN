OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.696608788598148) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
cu(5.358167818084966,5.241705047965125,4.489933064806575,4.999464967587897) q[0],q[3];
u1(0.27806699244813426) q[4];
z q[4];
cu(0.9416098356116474,5.992859745211356,2.349729012360753,3.4058817610969725) q[1],q[5];
id q[1];
swap q[3],q[5];
ryy(1.696608788598148) q[6],q[2];
ccx q[6],q[2],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
