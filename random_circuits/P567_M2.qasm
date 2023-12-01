OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.993014287740367,-0.17891765566749318,0.17891765566749318) q0; }
gate gate_P567 q0,q1,q2,q3,q4 { id q1; sx q1; y q1; sxdg q1; cu1(5.77013152911789) q3,q0; r(4.993014287740367,1.3918786711274034) q0; sxdg q0; u3(6.090279606128137,1.4496137260500142,3.8174275792001673) q0; x q3; t q3; cp(4.3823000532581595) q2,q4; t q2; s q2; x q4; ry(1.4386369865625477) q4; cswap q4,q2,q3; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P567 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
