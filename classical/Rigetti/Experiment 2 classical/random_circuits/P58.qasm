OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.6651208913238478,-0.2627599353181438,0.2627599353181438) q0; }
qreg q[5];
creg c[3];
r(1.6651208913238478,1.3080363914767528) q[0];
tdg q[1];
ccx q[4],q[2],q[3];
x q[2];
cz q[3],q[1];
cx q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
