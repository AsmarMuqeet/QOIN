OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.545238352998517) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P470 q0,q1,q2,q3,q4 { u(3.465739428403506,5.907413412201861,5.155280001708241) q0; y q1; u3(3.282036073381288,5.947780180249257,0.16268674205019135) q3; cy q1,q3; ryy(4.545238352998517) q4,q2; rzz(1.1366501507067108) q0,q2; sx q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P470 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
