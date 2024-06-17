OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.073943501461261) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
cx q[0],q[1];
sdg q[0];
swap q[2],q[3];
ryy(1.073943501461261) q[1],q[3];
y q[2];
p(0.23953079346008424) q[4];
sx q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
