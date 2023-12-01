OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.480545242411306) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
s q[0];
sx q[1];
cu3(5.20782059136801,2.0141129212305096,4.3092192941676375) q[0],q[1];
ryy(2.480545242411306) q[1],q[0];
x q[2];
sxdg q[2];
swap q[4],q[3];
cx q[4],q[3];
cz q[3],q[2];
sdg q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
