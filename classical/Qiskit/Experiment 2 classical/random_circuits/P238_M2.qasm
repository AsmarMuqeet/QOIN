OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.1835449480874765) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(2.757097857865128,0.403298922675112,-0.403298922675112) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.30960745160886) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P238 q0,q1,q2,q3,q4 { p(0.5645557200809073) q1; u2(1.8671472507555318,5.6060230163545155) q1; id q2; ccx q3,q4,q0; ccx q3,q2,q0; s q0; csx q2,q3; ryy(1.30960745160886) q0,q2; sx q0; ry(5.015250619401083) q2; r(2.757097857865128,1.9740952494700086) q3; s q3; rx(3.4635051353295756) q4; rxx(3.0055828836445584) q4,q1; u1(0.7462113267067463) q1; sxdg q4; rzx(4.1835449480874765) q4,q1; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P238 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
