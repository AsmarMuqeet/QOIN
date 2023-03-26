OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.049222472399553) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(6.220282977034628,0.8463727771021183,-0.8463727771021183) q0; }
gate gate_P943 q0,q1,q2,q3,q4,q5,q6 { u3(2.516553134884208,5.742844556155014,0.4339213322017422) q1; u1(3.360393412623053) q1; x q3; r(6.220282977034628,2.417169103897015) q3; swap q1,q3; csx q4,q0; y q0; cz q2,q5; u1(2.4905872525500943) q2; ryy(2.049222472399553) q0,q2; cu1(2.9621829186193067) q4,q5; ry(5.153995504388216) q4; sdg q6; y q6; csx q5,q6; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P943 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
