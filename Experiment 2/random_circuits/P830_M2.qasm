OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.33707845580903384,-0.6244008718330236,0.6244008718330236) q0; }
gate gate_P830 q0,q1,q2,q3,q4,q5,q6 { r(0.33707845580903384,0.9463954549618729) q0; y q0; cz q2,q1; s q1; cu3(3.0338694675533113,4.949621149075415,0.7778453993650886) q4,q3; y q3; id q5; cry(5.333063209334808) q5,q4; t q6; cy q2,q6; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P830 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
