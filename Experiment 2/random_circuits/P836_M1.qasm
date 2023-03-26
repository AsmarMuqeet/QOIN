OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.11639433548333979,1.4530299267867175,-1.4530299267867175) q0; }
gate gate_P836 q0,q1,q2,q3,q4,q5,q6 { sdg q0; r(0.11639433548333979,3.023826253581614) q0; x q1; sdg q1; t q2; rz(4.019531304921279) q3; sdg q4; z q4; x q5; ccx q5,q3,q2; u(0.539723229930555,2.447842357455427,1.232644118369483) q6; id q6; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[4];
gate_P836 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
