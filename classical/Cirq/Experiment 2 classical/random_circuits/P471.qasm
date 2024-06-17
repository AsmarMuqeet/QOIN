OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.6019593437575205,-1.246263906578677,1.246263906578677) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.251837350634552) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
csx q[0],q[2];
h q[2];
h q[2];
cz q[1],q[3];
cy q[1],q[0];
sx q[1];
r(0.6019593437575205,0.32453242021621953) q[4];
cz q[4],q[3];
rzx(6.251837350634552) q[0],q[4];
sx q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
