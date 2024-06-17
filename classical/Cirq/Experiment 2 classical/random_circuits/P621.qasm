OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.13680358313845) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
y q[0];
x q[0];
ryy(5.13680358313845) q[1],q[2];
u3(3.568481828391156,0.8563030648087744,5.062361757992989) q[1];
h q[2];
swap q[3],q[4];
cp(3.5442506245996777) q[4],q[3];
sx q[5];
rx(2.254642015277217) q[5];
rx(6.000997362166549) q[6];
rx(4.699233459187801) q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
