OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate gate_P337 q0,q1,q2,q3,q4,q5,q6 { s q0; sx q0; s q1; sx q1; cp(3.7521978946112347) q4,q3; y q5; x q5; cu3(5.377765774045369,3.589554261670654,3.325738901693188) q6,q2; cu3(3.8640593689571334,5.051574842552111,2.91816310615731) q3,q2; iswap q4,q6; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P337 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
