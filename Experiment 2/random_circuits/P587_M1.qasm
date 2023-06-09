OPENQASM 2.0;
include "qelib1.inc";
gate gate_P587 q0,q1,q2,q3,q4 { id q1; y q1; h q1; sxdg q1; sx q2; p(6.089417281332517) q2; h q2; u2(6.1906762514718725,3.0699623032113212) q2; sxdg q2; cy q3,q0; u3(4.454691169316658,1.0455479411703668,5.6421611364852975) q0; u1(0.07815228621023004) q3; rzz(4.452908895316641) q3,q0; h q0; u2(0.523059192287517,5.788280351219857) q0; u(2.266850321690678,2.5638302726829214,3.6083130104661665) q3; tdg q4; id q4; h q4; h q4; ccx q3,q1,q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P587 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
