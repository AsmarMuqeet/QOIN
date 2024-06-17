OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.5706270589299937) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.961573068663228) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P445 q0,q1,q2,q3,q4,q5,q6 { id q0; sdg q0; cu3(2.7917317985011416,2.5426029867136313,5.978248610835032) q2,q1; ryy(5.961573068663228) q4,q3; rzz(2.7235285903908677) q2,q3; rx(4.130552856746831) q5; s q5; sx q5; sdg q6; cswap q4,q6,q1; cx q1,q2; p(6.153452048724634) q1; cx q4,q3; cz q3,q2; rzx(0.5706270589299937) q4,q5; swap q6,q0; cy q0,q6; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P445 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
