OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
u1(0.8066519838618145) q[0];
sxdg q[0];
sx q[1];
id q[2];
cx q[2],q[1];
rz(5.378317395733125) q[1];
z q[1];
y q[2];
u3(5.905193470371214,5.96327634265891,4.445461003297248) q[2];
s q[3];
id q[4];
swap q[4],q[3];
cswap q[3],q[0],q[4];
sdg q[0];
cry(1.7468557659421136) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];