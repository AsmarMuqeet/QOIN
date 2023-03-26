OPENQASM 2.0;
include "qelib1.inc";
gate gate_P565 q0,q1,q2,q3,q4,q5,q6 { y q2; sdg q2; t q3; id q3; ry(3.6655934823863223) q4; rzz(0.152707038000398) q5,q1; cp(0.5266331349882681) q4,q5; ccx q3,q5,q2; t q4; cx q6,q0; cz q0,q1; tdg q0; y q1; tdg q6; u3(3.034924880778478,2.0179200515804254,3.5860613035852285) q6; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[4];
gate_P565 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
