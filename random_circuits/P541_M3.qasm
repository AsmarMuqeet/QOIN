OPENQASM 2.0;
include "qelib1.inc";
gate rzx_139921335777936(param0) q0,q1 { h q1; cx q0,q1; rz(1.2195482648997502) q1; cx q0,q1; h q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.7445181167728965) q1; cx q0,q1; h q1; }
gate gate_P541 q0,q1,q2,q3,q4,q5,q6 { u2(6.113138041883581,5.888970941115687) q0; id q0; u(2.1343726511560734,4.302590444255576,1.8110176552104893) q3; rzx(3.7445181167728965) q1,q4; cy q3,q4; rzx_139921335777936(1.2195482648997502) q5,q2; rxx(3.866261840085361) q1,q2; id q5; id q6; u1(5.2855511942033) q6; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P541 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
