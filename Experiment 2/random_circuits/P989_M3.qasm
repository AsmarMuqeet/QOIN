OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.754757487293896) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P989 q0,q1,q2,q3,q4,q5,q6 { x q1; cz q0,q3; u3(3.261214789347587,2.107521851137257,1.1616543470199034) q0; u2(1.353902667693433,4.646447477758854) q3; cy q4,q5; cp(0.5782499888196455) q1,q5; rzz(3.1398546751356142) q2,q6; ry(2.8500643852505365) q2; ryy(5.754757487293896) q4,q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[4];
gate_P989 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
