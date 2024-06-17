OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.2557307881575093) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P628 q0,q1,q2,q3,q4,q5,q6 { rz(4.859299418965412) q0; h q0; sxdg q0; rx(1.743784704674718) q2; ry(4.196647141820314) q2; p(0.9470272764892399) q3; y q3; rxx(6.095527546497842) q1,q4; cz q5,q6; cswap q4,q1,q6; ryy(3.2557307881575093) q2,q1; id q4; rz(1.4523480490652005) q5; csx q5,q3; rz(5.589728100117335) q6; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P628 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
