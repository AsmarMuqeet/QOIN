OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.3557617964190087) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.998618486402008) q1; cx q0,q1; h q1; }
gate gate_P370 q0,q1,q2,q3,q4 { cy q2,q0; rzx(1.998618486402008) q0,q2; cu1(5.244629181896413) q2,q0; u(4.1959501938649515,4.934646323558192,4.3156283337985135) q3; rz(0.08506054814740645) q3; id q3; ryy(3.3557617964190087) q1,q4; rxx(2.1117741837875768) q1,q4; cx q1,q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P370 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
