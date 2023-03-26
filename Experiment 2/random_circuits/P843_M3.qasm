OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.564296093304559) q1; cx q0,q1; h q1; }
gate gate_P843 q0,q1,q2,q3,q4,q5,q6 { t q1; sx q2; cu(5.945883530982252,5.839258297003309,1.4167026772935156,0.36849829298509823) q2,q1; tdg q3; h q3; id q4; rzx(5.564296093304559) q0,q5; u2(5.790878731243143,4.016661433243755) q5; sdg q6; ccx q4,q0,q6; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[2];
gate_P843 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
