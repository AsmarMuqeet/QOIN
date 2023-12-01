OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.7237613509182736,0.24771404094782978,-0.24771404094782978) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.2203320563871023) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P325 q0,q1,q2,q3,q4 { y q1; sdg q1; rz(4.409778441021613) q2; ryy(1.2203320563871023) q0,q3; r(3.7237613509182736,1.8185103677427263) q3; u(0.4023687002476065,0.8072220938877276,3.1416958656262572) q4; cswap q4,q2,q0; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P325 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
