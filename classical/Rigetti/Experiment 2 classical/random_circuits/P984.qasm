OPENQASM 2.0;
include "qelib1.inc";
gate r_139921315557872(param0,param1) q0 { u3(5.079863853961488,1.6176538425405815,-1.6176538425405815) q0; }
gate r(param0,param1) q0 { u3(3.087977566917386,3.1384690923391467,-3.1384690923391467) q0; }
qreg q[5];
creg c[3];
sxdg q[1];
t q[1];
cswap q[0],q[2],q[3];
r_139921315557872(5.079863853961488,3.188450169335478) q[0];
r(3.087977566917386,4.709265419134043) q[3];
id q[4];
cu1(1.730623928712768) q[4],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];