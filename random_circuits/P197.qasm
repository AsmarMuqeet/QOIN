OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.300928235920151) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
ccx q[3],q[0],q[1];
csx q[0],q[1];
p(1.311144961349012) q[0];
s q[1];
cu1(1.3819558775607654) q[4],q[2];
u1(0.7017049118394639) q[2];
ryy(2.300928235920151) q[4],q[3];
rzz(1.0191454696658775) q[3],q[2];
y q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
