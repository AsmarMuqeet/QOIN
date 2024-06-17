OPENQASM 2.0;
include "qelib1.inc";
gate gate_P502 q0,q1,q2,q3,q4,q5,q6 { sdg q0; u2(4.179428544014033,0.34619838207252024) q3; z q4; cz q4,q3; cp(3.8591254520902822) q2,q5; cy q2,q0; sdg q5; csx q1,q6; u2(3.392016018112484,1.7544784470517583) q1; rz(3.2148636315506574) q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[4];
gate_P502 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
