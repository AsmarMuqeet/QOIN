OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.6651208913238478,-0.2627599353181438,0.2627599353181438) q0; }
gate gate_P58 q0,q1,q2,q3,q4 { r(1.6651208913238478,1.3080363914767528) q0; tdg q1; ccx q4,q2,q3; x q2; cz q3,q1; cx q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P58 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
