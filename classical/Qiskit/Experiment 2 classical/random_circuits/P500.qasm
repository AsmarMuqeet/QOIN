OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.3947219742223678) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[7];
creg c[3];
x q[0];
h q[2];
u1(4.895082075710661) q[4];
cu1(5.8761328088576565) q[5],q[3];
ccx q[5],q[2],q[3];
ryy(2.3947219742223678) q[6],q[1];
cu(5.109489706755117,3.5585858472977248,3.9215460740437633,5.663403406430574) q[1],q[0];
dcx q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
