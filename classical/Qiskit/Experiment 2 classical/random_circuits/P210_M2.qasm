OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.08417752915714) q1; cx q0,q1; h q1; }
gate gate_P210 q0,q1,q2,q3,q4 { cu1(4.8937421739107885) q1,q0; x q0; id q1; rz(1.5405478602037492) q2; u3(5.3338045906337515,4.109569404388794,3.902576220302656) q2; y q3; x q4; rzx(2.08417752915714) q4,q3; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[2];
gate_P210 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
