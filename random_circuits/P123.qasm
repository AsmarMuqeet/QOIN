OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.0292028373888813) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
tdg q[2];
u2(2.972677465802848,4.263209454347656) q[3];
s q[4];
rxx(0.8347249250655795) q[4],q[2];
cu3(5.381036952184527,1.0380268515578195,3.7279140083318785) q[0],q[5];
cu3(5.601273199229239,1.326133275433879,5.872009482104992) q[0],q[5];
cx q[0],q[4];
cy q[6],q[1];
u2(6.221366145892864,1.0603887555483555) q[1];
ccx q[2],q[1],q[5];
rxx(6.274694349690131) q[3],q[6];
ryy(1.0292028373888813) q[6],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];