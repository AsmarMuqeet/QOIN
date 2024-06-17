OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.7463788843767114) q1; cx q0,q1; h q1; }
gate gate_P171 q0,q1,q2,q3,q4 { sdg q0; sxdg q0; ry(5.973152368426478) q0; u(4.673320878089934,4.696161225598784,3.7935586445354597) q1; y q2; rzz(4.7327628079167985) q2,q1; s q1; sdg q1; ry(5.625304370540351) q3; sxdg q4; rzx(1.7463788843767114) q3,q4; ry(4.594901690958469) q3; s q3; sx q3; cu3(4.199149336293213,3.6891472474806157,4.435249681104627) q4,q2; cx q2,q0; sxdg q0; t q2; tdg q4; cu1(4.515012509048939) q4,q1; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P171 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
