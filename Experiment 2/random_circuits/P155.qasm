OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.586957325325717) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
sdg q[0];
sxdg q[4];
rzx(5.586957325325717) q[4],q[0];
ccx q[1],q[5],q[2];
u3(1.073180589170566,2.6823586697399047,3.8328419936847653) q[1];
p(2.7669577918857615) q[5];
rxx(4.2380712546676635) q[6],q[3];
cx q[3],q[2];
x q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
