OPENQASM 2.0;
include "qelib1.inc";
gate gate_P220 q0,q1,q2,q3,q4 { s q0; h q2; cz q0,q2; csx q3,q1; rx(1.8465445619380985) q1; u2(2.1919782768953486,1.2241014936072683) q4; crx(5.750075333245824) q3,q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P220 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
