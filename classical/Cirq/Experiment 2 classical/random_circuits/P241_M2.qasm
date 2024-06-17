OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.2384074172722395,-0.35924002945091416,0.35924002945091416) q0; }
gate gate_P241 q0,q1,q2,q3,q4 { u1(1.4766566224234141) q1; sdg q2; cp(1.7251538931311576) q3,q0; swap q1,q0; swap q2,q3; ccx q0,q2,q1; t q3; s q4; r(4.2384074172722395,1.2115562973439824) q4; s q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[0];
gate_P241 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
