OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.6919244698707034,1.1426032389545986,-1.1426032389545986) q0; }
gate gate_P543 q0,q1,q2,q3,q4,q5,q6 { h q0; r(3.6919244698707034,2.713399565749495) q0; u1(5.6264222909525605) q1; sx q1; sxdg q2; ry(0.22567070700907702) q2; x q3; y q3; tdg q4; tdg q4; rzz(1.6735482090892029) q5,q6; rzz(5.9656328335325135) q6,q5; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P543 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
