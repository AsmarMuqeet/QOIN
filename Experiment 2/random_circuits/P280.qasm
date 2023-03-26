OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.007380427593689) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
cp(1.609594832299891) q[1],q[2];
rz(4.464250510359594) q[2];
tdg q[3];
p(1.128247547356392) q[4];
ch q[4],q[3];
s q[5];
sxdg q[5];
cp(5.28181402298581) q[0],q[6];
p(2.881402270836578) q[0];
ryy(5.007380427593689) q[1],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
