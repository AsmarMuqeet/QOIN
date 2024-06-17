OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.0449409924793054) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P235 q0,q1,q2,q3,q4 { u(2.3139433463336,5.674704134993938,0.02932742120023809) q1; s q1; rz(4.613316533351543) q1; rz(0.753052759579887) q2; h q2; u(4.9120501560102925,2.396928436891062,2.756621171923037) q2; tdg q3; h q3; x q3; ryy(2.0449409924793054) q0,q4; cx q4,q0; y q0; id q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P235 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
