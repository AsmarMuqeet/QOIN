OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
sxdg q[0];
p(3.4368478636859834) q[0];
rx(5.020381226599674) q[1];
ry(2.4325562834177683) q[1];
rxx(1.8104418836760452) q[3],q[2];
sxdg q[2];
sdg q[4];
cu(3.5708166809395996,3.5561624356621864,3.275706831063337,5.97495168335589) q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];