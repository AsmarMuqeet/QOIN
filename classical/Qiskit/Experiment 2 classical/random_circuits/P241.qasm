OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.2384074172722395,-0.35924002945091416,0.35924002945091416) q0; }
qreg q[5];
creg c[3];
u1(1.4766566224234141) q[1];
sdg q[2];
cp(1.7251538931311576) q[3],q[0];
swap q[1],q[0];
swap q[2],q[3];
ccx q[0],q[2],q[1];
t q[3];
s q[4];
r(4.2384074172722395,1.2115562973439824) q[4];
s q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
