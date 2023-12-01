OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.891136515866814) q1; cx q0,q1; h q1; }
gate gate_P165 q0,q1,q2,q3,q4 { swap q0,q1; h q0; u(1.1531762800766145,2.761968142062423,0.9133875619668382) q3; rzx(5.891136515866814) q4,q2; cswap q1,q4,q3; p(0.4693329453875089) q2; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P165 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
