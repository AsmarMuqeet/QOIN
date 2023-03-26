OPENQASM 2.0;
include "qelib1.inc";
gate gate_P715 q0,q1,q2,q3,q4,q5,q6 { y q2; u(4.170445420127611,2.417051980753239,1.6312403162205453) q2; p(1.3296593207725305) q3; z q3; rzz(4.507342194457834) q5,q0; rzz(4.339026383799123) q5,q0; ccx q1,q4,q6; x q1; crz(0.6894401737172741) q4,q6; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P715 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
