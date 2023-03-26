OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.960693569801725,1.6962324980389503,-1.6962324980389503) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.48142557910115513) q1; cx q0,q1; h q1; }
gate gate_P671 q0,q1,q2,q3,q4 { sx q1; h q2; sxdg q2; rzx(0.48142557910115513) q3,q0; sxdg q0; r(4.960693569801725,3.267028824833847) q3; p(1.4002899811978222) q4; rzz(1.4471560784079176) q1,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P671 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
