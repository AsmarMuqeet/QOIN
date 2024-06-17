OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.868858679717657,-1.270387328389305,1.270387328389305) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.5105229667694084) q1; cx q0,q1; h q1; }
gate gate_P618 q0,q1,q2,q3,q4,q5,q6 { rzx(3.5105229667694084) q1,q0; s q0; t q1; r(5.868858679717657,0.30040899840559143) q2; id q2; csx q5,q3; u1(3.5361745965712212) q5; cu3(5.351557041021936,5.405001146253278,1.6440703639765588) q6,q4; rz(2.087418513221477) q4; csx q6,q3; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P618 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
