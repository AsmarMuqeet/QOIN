OPENQASM 2.0;
include "qelib1.inc";
gate gate_P200 q0,q1,q2,q3,q4 { cu1(0.2811626045511688) q1,q3; rx(1.335558771421726) q1; u(4.16490903846245,2.406096670740198,0.9910607044765136) q3; ccx q0,q4,q2; rx(2.2883235063564173) q0; rx(0.8692742062626678) q2; ccx q3,q1,q0; rx(2.3944153089438496) q4; csx q4,q2; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[3];
gate_P200 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
