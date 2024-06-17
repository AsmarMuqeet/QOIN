OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.2249978571237548) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
z q[1];
sx q[1];
u2(2.310887775717571,3.8680910620432996) q[2];
z q[3];
z q[3];
t q[3];
t q[3];
h q[3];
ryy(3.2249978571237548) q[4],q[0];
cy q[2],q[0];
cx q[2],q[1];
cx q[2],q[1];
csx q[1],q[2];
sxdg q[1];
ry(2.059849859055971) q[2];
ry(4.100856428890819) q[4];
cx q[4],q[0];
ry(3.297424039809627) q[0];
u2(5.254885406186495,3.3484622450254498) q[0];
rzz(1.1480491278839962) q[3],q[0];
tdg q[4];
ry(3.1950916507241547) q[4];
y q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];