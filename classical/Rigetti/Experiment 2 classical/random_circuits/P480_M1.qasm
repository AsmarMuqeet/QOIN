OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.048393562283829) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.0797289763522415) q1; cx q0,q1; h q1; }
gate gate_P480 q0,q1,q2,q3,q4 { rzx(1.0797289763522415) q0,q1; ccx q2,q3,q4; ryy(6.048393562283829) q2,q1; tdg q3; cz q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P480 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
