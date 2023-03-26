OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.3668698554569152) q1; cx q0,q1; h q1; }
gate gate_P373 q0,q1,q2,q3,q4 { p(1.531374119608527) q0; u(5.417264283241794,1.414993430113156,2.197268184074589) q0; h q2; s q2; u(5.749644941713273,1.7869057168345548,1.9261075790746485) q2; ccx q1,q3,q4; ccx q4,q3,q1; rzx(1.3668698554569152) q1,q0; cp(3.502972446673525) q3,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P373 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
