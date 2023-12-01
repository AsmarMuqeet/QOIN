OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.251837350634552) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(0.6019593437575205,-1.246263906578677,1.246263906578677) q0; }
gate gate_P471 q0,q1,q2,q3,q4 { csx q0,q2; h q2; h q2; cz q1,q3; cy q1,q0; sx q1; r(0.6019593437575205,0.32453242021621953) q4; cz q4,q3; rzx(6.251837350634552) q0,q4; sx q3; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P471 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
