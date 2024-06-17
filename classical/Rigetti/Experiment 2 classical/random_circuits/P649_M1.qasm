OPENQASM 2.0;
include "qelib1.inc";
gate gate_P649 q0,q1,q2,q3,q4 { u1(0.8066519838618145) q0; sxdg q0; sx q1; id q2; cx q2,q1; rz(5.378317395733125) q1; z q1; y q2; u3(5.905193470371214,5.96327634265891,4.445461003297248) q2; s q3; id q4; swap q4,q3; cswap q3,q0,q4; sdg q0; cry(1.7468557659421136) q4,q3; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[2];
gate_P649 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
