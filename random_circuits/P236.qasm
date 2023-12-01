OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.331921214763897,-0.037629356076335,0.037629356076335) q0; }
qreg q[5];
creg c[3];
sxdg q[1];
y q[1];
cu1(4.451884192343924) q[2],q[0];
r(1.331921214763897,1.5331669707185616) q[3];
ry(5.830927413002173) q[3];
t q[4];
ccx q[2],q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
