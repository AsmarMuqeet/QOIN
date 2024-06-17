OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.6599529742702441,3.4062365503589502,-3.4062365503589502) q0; }
gate gate_P402 q0,q1,q2,q3,q4,q5,q6 { r(1.6599529742702441,4.977032877153847) q1; sxdg q2; cp(0.318747535170195) q1,q2; swap q3,q5; ccx q0,q4,q6; u2(2.5125245657038993,3.021746343329566) q0; crx(3.313556181416937) q3,q4; crz(4.918939588911081) q6,q5; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P402 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
