OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.9990242846014165,3.039182574897466,-3.039182574897466) q0; }
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.124331853104001) q1; cx q0,q1; h q1; }
gate gate_P747 q0,q1,q2,q3,q4,q5,q6 { sxdg q2; u2(2.1192360089618947,0.4054119970022083) q4; cswap q3,q1,q5; id q1; sdg q1; sxdg q3; rzx(3.124331853104001) q5,q4; dcx q3,q4; tdg q5; cu1(0.3723079155887953) q0,q6; cy q0,q2; r(0.9990242846014165,4.6099789016923625) q0; id q2; u3(6.161989353874613,0.4721967969646842,2.0066003782375694) q6; u3(2.318262891109292,0.7468180334525054,5.442437814923911) q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[4];
gate_P747 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
