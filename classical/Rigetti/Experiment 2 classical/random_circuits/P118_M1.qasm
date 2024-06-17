OPENQASM 2.0;
include "qelib1.inc";
gate gate_P118 q0,q1,q2,q3,q4,q5,q6 { cp(4.468964548442108) q2,q0; z q0; p(5.745630952158502) q3; cy q3,q2; cy q1,q4; u1(5.0120449301368115) q1; u3(5.3191701223666925,4.719413719739886,3.2689463995828327) q5; ch q4,q5; id q6; id q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[4];
gate_P118 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
