OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.0576008240790005,-0.8415243310712094,0.8415243310712094) q0; }
qreg q[5];
creg c[3];
rz(4.376869338364458) q[0];
rz(0.8424614638650856) q[2];
cx q[0],q[2];
r(4.0576008240790005,0.7292719957236872) q[3];
cy q[1],q[4];
y q[1];
csx q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
