OPENQASM 2.0;
include "qelib1.inc";
gate gate_P380 q0,q1,q2,q3,q4 { u3(2.332788207250946,5.5026533454690085,4.7636180996836535) q0; p(3.9561283214415743) q0; u1(2.576123601462128) q0; ry(6.084229300441425) q1; u1(5.261315074268481) q2; rz(4.740396145469144) q3; ccx q1,q2,q3; cx q3,q1; y q4; x q4; cx q4,q2; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[4];
gate_P380 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
