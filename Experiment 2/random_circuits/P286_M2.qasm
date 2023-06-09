OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.247978791316655,2.6534376976910403,-2.6534376976910403) q0; }
gate gate_P286 q0,q1,q2,q3,q4 { h q0; cz q2,q3; cu3(1.6907987670468088,1.601720707644831,2.3836974888004105) q2,q3; cy q4,q1; cp(6.148389732378771) q0,q1; rx(3.685317489265597) q0; rz(2.1859739944752232) q1; r(5.247978791316655,4.224234024485937) q4; ccx q4,q3,q2; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P286 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
