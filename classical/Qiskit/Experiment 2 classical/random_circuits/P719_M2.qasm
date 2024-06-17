OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.08948500538180766) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.7981107253769594) q1; cx q0,q1; h q1; }
gate gate_P719 q0,q1,q2,q3,q4,q5,q6 { cx q3,q1; rzz(1.1248586513665046) q0,q4; cz q1,q4; rzx(0.7981107253769594) q2,q5; ryy(0.08948500538180766) q2,q5; ry(6.0254982524527705) q6; ccx q0,q6,q3; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[1];
gate_P719 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
