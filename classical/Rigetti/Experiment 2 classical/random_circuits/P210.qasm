OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.08417752915714) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
cu1(4.8937421739107885) q[1],q[0];
x q[0];
id q[1];
rz(1.5405478602037492) q[2];
u3(5.3338045906337515,4.109569404388794,3.902576220302656) q[2];
y q[3];
x q[4];
rzx(2.08417752915714) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
