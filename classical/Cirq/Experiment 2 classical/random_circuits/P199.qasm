OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.7664222421903929) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
u(1.9274760224705905,1.70445418142391,2.4155213804408704) q[0];
sdg q[0];
rzx(0.7664222421903929) q[2],q[1];
cy q[3],q[4];
ccx q[1],q[2],q[3];
x q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
