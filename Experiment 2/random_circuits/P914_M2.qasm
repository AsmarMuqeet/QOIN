OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(2.819649493884273,0.42026812458177765,-0.42026812458177765) q0; }
gate gate_P914 q0,q1,q2,q3,q4,q5,q6 { y q2; cu1(5.3955649739373115) q3,q1; r(2.819649493884273,1.9910644513766742) q1; u1(2.470992666331568) q4; cu3(5.54248265075191,1.6983791302692055,0.4665618940611784) q0,q5; cy q0,q4; ccx q5,q2,q3; rz(1.2681131535892605) q6; ry(2.642063820688851) q6; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P914 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
