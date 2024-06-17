OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.154435939295988) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(1.421392914615185,-1.4667244118465232,1.4667244118465232) q0; }
qreg q[5];
creg c[3];
sx q[0];
t q[0];
s q[1];
u2(3.06624287645898,2.6268208411131515) q[1];
rzx(0.154435939295988) q[2],q[3];
r(1.421392914615185,0.10407191494837331) q[3];
s q[4];
cy q[2],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
