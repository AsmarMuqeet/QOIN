OPENQASM 2.0;
include "qelib1.inc";
gate gate_P265 q0,q1,q2,q3,q4,q5,q6 { tdg q0; p(4.548122469056388) q0; rzz(4.942562742138739) q4,q1; u(3.4615118063421577,3.496778069660316,5.4561873565114345) q4; crx(4.4839255100742115) q3,q5; csx q3,q5; cu1(1.9535255734099728) q6,q2; rxx(6.065267872106426) q1,q2; z q6; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[4];
gate_P265 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
