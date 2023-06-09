OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.274231707089214,4.359540292266179,-4.359540292266179) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.5938846968998027) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
s q[2];
h q[2];
cp(1.7098335340774005) q[4],q[0];
p(4.801416423227453) q[0];
r(3.274231707089214,5.930336619061076) q[0];
cu1(2.230818962882941) q[5],q[3];
u(0.5320502120372984,5.633896959631149,6.04494305556912) q[5];
u1(3.287398886290556) q[5];
csx q[1],q[6];
ryy(0.5938846968998027) q[3],q[1];
rx(3.52873514000765) q[3];
cz q[4],q[6];
rzz(4.509272691893459) q[4],q[2];
swap q[6],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
