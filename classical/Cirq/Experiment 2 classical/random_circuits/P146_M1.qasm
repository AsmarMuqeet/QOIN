OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.856964479677471) q1; cx q0,q1; h q1; }
gate ryy_139921317557008(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.9331573726474454) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.548917934065378) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P146 q0,q1,q2,q3,q4 { sx q0; ryy(5.548917934065378) q3,q1; cu3(4.807948312390429,2.9169780621857417,2.623237444426405) q1,q0; p(3.0728476889131704) q0; csx q2,q4; rz(4.089238913929798) q2; cp(0.02036620327365957) q4,q3; ryy_139921317557008(3.9331573726474454) q3,q1; h q3; rzx(4.856964479677471) q4,q2; cswap q1,q2,q0; id q1; t q2; cz q3,q0; id q4; s q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P146 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
