OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.0109302957882846) q1; cx q0,q1; h q1; }
gate gate_P252 q0,q1,q2,q3,q4 { z q1; s q2; h q2; tdg q2; rzx(2.0109302957882846) q0,q3; rxx(4.743131321773111) q1,q0; u2(6.098111976306415,1.6448076357141097) q0; u1(1.0017004100768594) q1; sx q4; crx(3.253587454300566) q3,q4; cu3(4.193372023490083,0.5344707231507055,1.2227625013761654) q4,q3; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[1];
gate_P252 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
