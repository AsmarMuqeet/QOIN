OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.097300754506735) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P864 q0,q1,q2,q3,q4,q5,q6 { rx(5.005899797491244) q0; p(0.027694841756885878) q1; swap q1,q0; swap q0,q1; sx q0; u1(0.9685454716106485) q2; u3(2.218886511148593,1.5648182935414923,6.237945217056326) q3; y q3; s q3; u1(1.3376504825627644) q3; sxdg q5; tdg q5; rx(0.34191828787865686) q5; sxdg q5; rxx(0.44021699150018423) q6,q4; cp(3.336335233412769) q4,q2; rxx(6.1959704881627475) q4,q2; ryy(4.097300754506735) q1,q2; u(0.11506864022253892,1.6692329195241653,5.666833113993022) q4; z q6; ry(5.922026690076639) q6; sxdg q6; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P864 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
