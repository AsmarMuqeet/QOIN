OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.536394752213754,4.255891647332533,-4.255891647332533) q0; }
gate gate_P318 q0,q1,q2,q3,q4,q5,q6 { r(5.536394752213754,5.826687974127429) q0; y q0; id q1; s q1; p(5.617204054677304) q2; p(2.5230591263630116) q2; u(4.701501052963008,5.698246675776984,5.350721000607451) q3; p(2.257225767473879) q4; t q4; p(5.406907421457419) q5; u1(2.8888565319684885) q5; y q6; swap q3,q6; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P318 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];