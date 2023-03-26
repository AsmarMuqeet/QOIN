OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate gate_P463 q0,q1,q2,q3,q4 { s q1; x q1; u3(5.434098050049806,1.1675092444531143,2.205984000570219) q2; y q2; cu1(0.7223849319371858) q3,q0; rx(3.3256176119943066) q0; u1(5.968645780114665) q4; dcx q4,q3; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P463 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
