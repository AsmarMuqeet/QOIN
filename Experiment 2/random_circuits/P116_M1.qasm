OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.128812542968136,1.8016505515626777,-1.8016505515626777) q0; }
gate gate_P116 q0,q1,q2,q3,q4 { r(5.128812542968136,3.3724468783575743) q0; rx(5.579277135370129) q0; u2(5.258482788315061,2.4534627377945477) q1; h q2; swap q1,q2; sx q3; u2(3.5392319564454238,2.4615446139109003) q3; s q4; id q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P116 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
