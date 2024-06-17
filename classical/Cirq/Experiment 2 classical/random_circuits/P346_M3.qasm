OPENQASM 2.0;
include "qelib1.inc";
gate gate_P346 q0,q1,q2,q3,q4 { rx(0.40342688295875906) q0; sdg q0; sdg q2; rzz(5.273322439089071) q1,q3; s q1; cu3(4.459649233618901,1.6564732671098477,0.901187833855056) q2,q3; rz(4.798485077129939) q4; tdg q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P346 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
