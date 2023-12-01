OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(2.650275350932728,2.0410761022800648,-2.0410761022800648) q0; }
gate r_139921317899664(param0,param1) q0 { u3(5.639907069169876,4.122328865803726,-4.122328865803726) q0; }
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
qreg q[7];
creg c[3];
u1(3.5721467437670475) q[0];
r(2.650275350932728,3.6118724290749613) q[0];
r_139921317899664(5.639907069169876,5.693125192598623) q[0];
sdg q[1];
sxdg q[1];
h q[1];
x q[2];
tdg q[4];
z q[5];
h q[5];
cx q[6],q[3];
cp(1.71388842901585) q[2],q[6];
cu3(6.217404148585555,2.4206595297663362,0.5163686756857465) q[4],q[3];
u(3.406230920289354,3.972049166936805,2.4914065493621953) q[3];
ccx q[0],q[1],q[3];
sxdg q[1];
csx q[4],q[5];
rzz(4.471582594926474) q[6],q[2];
t q[2];
id q[2];
ccx q[5],q[6],q[4];
cx q[0],q[5];
iswap q[3],q[6];
y q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];