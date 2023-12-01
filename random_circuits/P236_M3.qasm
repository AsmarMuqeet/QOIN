OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.331921214763897,-0.037629356076335,0.037629356076335) q0; }
gate gate_P236 q0,q1,q2,q3,q4 { sxdg q1; y q1; cu1(4.451884192343924) q2,q0; r(1.331921214763897,1.5331669707185616) q3; ry(5.830927413002173) q3; t q4; ccx q2,q4,q0; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[4];
gate_P236 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
