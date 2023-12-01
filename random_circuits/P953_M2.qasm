OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.890785697003504,-0.7108371148332407,0.7108371148332407) q0; }
gate gate_P953 q0,q1,q2,q3,q4 { sx q0; r(3.890785697003504,0.8599592119616558) q0; z q1; u1(4.727775788058872) q1; sdg q2; x q2; swap q3,q4; cx q4,q3; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P953 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
