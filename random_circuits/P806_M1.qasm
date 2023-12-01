OPENQASM 2.0;
include "qelib1.inc";
gate gate_P806 q0,q1,q2,q3,q4 { csx q2,q0; z q2; cu1(6.218851785037704) q3,q1; cx q1,q0; u3(0.07340896990192637,5.7483178946627715,3.5949975747298137) q3; s q4; u1(6.053347959165431) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[1];
gate_P806 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
