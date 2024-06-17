OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.34239382518118294,1.5075456427891067,-1.5075456427891067) q0; }
gate gate_P545 q0,q1,q2,q3,q4,q5,q6 { rz(5.260946039936238) q0; cx q3,q1; r(0.34239382518118294,3.0783419695840033) q1; swap q2,q4; ccx q2,q4,q0; cy q6,q5; rzz(4.849345265188584) q3,q6; sdg q5; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[3];
gate_P545 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
