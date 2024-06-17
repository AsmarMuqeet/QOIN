OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.62007812493007,1.7040742475805652,-1.7040742475805652) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.10643970392620532) q1; cx q0,q1; h q1; }
gate gate_P526 q0,q1,q2,q3,q4 { cp(4.433529781137385) q2,q1; rx(3.00189596251819) q1; t q2; rzx(0.10643970392620532) q3,q0; r(4.62007812493007,3.274870574375462) q3; u2(3.8955434620634044,0.8113777569863063) q4; cy q4,q0; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[3];
gate_P526 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
