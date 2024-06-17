OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.0576008240790005,-0.8415243310712094,0.8415243310712094) q0; }
gate gate_P418 q0,q1,q2,q3,q4 { rz(4.376869338364458) q0; rz(0.8424614638650856) q2; cx q0,q2; r(4.0576008240790005,0.7292719957236872) q3; cy q1,q4; y q1; csx q4,q3; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P418 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
