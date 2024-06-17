OPENQASM 2.0;
include "qelib1.inc";
gate gate_P168 q0,q1,q2,q3,q4,q5,q6 { sdg q3; sdg q3; ry(2.301811856842494) q4; u3(2.147036586571529,1.6683220359019446,3.6985205997163435) q4; cz q5,q1; rzz(6.024037569465282) q1,q5; cswap q0,q2,q6; rx(3.198770711383952) q0; sdg q2; sdg q6; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[4];
gate_P168 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
