OPENQASM 2.0;
include "qelib1.inc";
gate gate_P320 q0,q1,q2,q3,q4,q5,q6 { u1(1.216553100499833) q0; cy q3,q1; t q1; rz(4.3932881146916625) q3; sxdg q4; u1(5.937070725178732) q4; p(5.429692587239146) q5; cz q6,q2; cp(1.332399203698745) q2,q0; cu3(1.5100652230011178,1.296118076071633,1.9150603996904718) q6,q5; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[3];
gate_P320 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
