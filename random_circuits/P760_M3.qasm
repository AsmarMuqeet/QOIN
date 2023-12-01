OPENQASM 2.0;
include "qelib1.inc";
gate gate_P760 q0,q1,q2,q3,q4,q5,q6 { sx q2; rx(4.820078267871918) q3; y q3; cu1(1.816069319713552) q4,q1; cu1(5.158369586409734) q0,q5; rzz(6.075425659465402) q0,q1; csx q5,q2; z q6; cz q6,q4; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P760 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
