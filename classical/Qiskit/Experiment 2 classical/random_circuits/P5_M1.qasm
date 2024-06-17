OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.9126455359876616,-0.834214534494086,0.834214534494086) q0; }
gate gate_P5 q0,q1,q2,q3,q4 { u(1.8391465348324836,4.504462330641069,1.7978934427059174) q0; tdg q1; y q1; ry(1.932949557189312) q3; h q3; cy q2,q4; swap q0,q4; r(0.9126455359876616,0.7365817923008106) q2; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P5 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
