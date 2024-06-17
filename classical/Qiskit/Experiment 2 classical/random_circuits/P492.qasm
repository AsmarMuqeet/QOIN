OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.838443896853109,3.67191152692011,-3.67191152692011) q0; }
qreg q[5];
creg c[3];
rxx(0.9026305233754341) q[2],q[0];
r(4.838443896853109,5.2427078537150065) q[2];
cp(0.28428689659751694) q[3],q[1];
cx q[0],q[1];
u3(4.3046929476239395,2.6140187111370854,5.1261040650442835) q[3];
sx q[4];
sx q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];