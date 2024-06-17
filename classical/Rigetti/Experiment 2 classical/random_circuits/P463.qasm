OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[5];
creg c[3];
s q[1];
x q[1];
u3(5.434098050049806,1.1675092444531143,2.205984000570219) q[2];
y q[2];
cu1(0.7223849319371858) q[3],q[0];
rx(3.3256176119943066) q[0];
u1(5.968645780114665) q[4];
dcx q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
