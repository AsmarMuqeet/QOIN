OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3414831460607237) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P641 q0,q1,q2,q3,q4,q5,q6 { sx q1; sxdg q2; cp(1.1682886066760403) q3,q0; sxdg q0; cx q3,q1; ry(1.2906437845786982) q4; ryy(1.3414831460607237) q5,q6; cry(4.203339423709516) q4,q5; cz q6,q2; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[3];
gate_P641 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
