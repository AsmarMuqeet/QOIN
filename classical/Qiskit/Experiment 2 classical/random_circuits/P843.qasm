OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.564296093304559) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
t q[1];
sx q[2];
cu(5.945883530982252,5.839258297003309,1.4167026772935156,0.36849829298509823) q[2],q[1];
tdg q[3];
h q[3];
id q[4];
rzx(5.564296093304559) q[0],q[5];
u2(5.790878731243143,4.016661433243755) q[5];
sdg q[6];
ccx q[4],q[0],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
