OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.421392914615185,-1.4667244118465232,1.4667244118465232) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.154435939295988) q1; cx q0,q1; h q1; }
gate gate_P718 q0,q1,q2,q3,q4 { sx q0; t q0; s q1; u2(3.06624287645898,2.6268208411131515) q1; rzx(0.154435939295988) q2,q3; r(1.421392914615185,0.10407191494837331) q3; s q4; cy q2,q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[0];
gate_P718 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
