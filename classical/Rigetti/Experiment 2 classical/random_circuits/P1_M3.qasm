OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.929414105863942) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx_140286653348208(param0) q0,q1 { h q1; cx q0,q1; rz(5.561054423922353) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(4.893566890358418,3.40840609946847,-3.40840609946847) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.40127535164339) q1; cx q0,q1; h q1; }
gate gate_P1 q0,q1,q2,q3,q4,q5,q6 { rz(3.198613810506165) q0; id q0; x q0; cz q3,q2; h q2; y q2; sdg q3; u(1.3169906943032277,4.3585168674742105,5.236806651973101) q3; rzx(3.40127535164339) q1,q4; r(4.893566890358418,4.979202426263367) q4; rz(5.229220624664688) q4; t q5; t q5; z q5; sdg q6; rzx_140286653348208(5.561054423922353) q1,q6; ryy(2.929414105863942) q6,q1; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P1 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
