OPENQASM 2.0;
include "qelib1.inc";
gate gate_P358 q0,q1,q2,q3,q4 { u(3.8191480153777912,2.909396310933484,1.5524202196111643) q2; rz(2.033329014215326) q2; ccx q3,q0,q1; cp(0.2952849499410575) q0,q3; t q4; rxx(1.1401613375798962) q4,q1; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P358 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
