OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.3947219742223678) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P500 q0,q1,q2,q3,q4,q5,q6 { x q0; h q2; u1(4.895082075710661) q4; cu1(5.8761328088576565) q5,q3; ccx q5,q2,q3; ryy(2.3947219742223678) q6,q1; cu(5.109489706755117,3.5585858472977248,3.9215460740437633,5.663403406430574) q1,q0; dcx q4,q6; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[2];
gate_P500 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
