OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(2.741968332438588,2.281858522858918,-2.281858522858918) q0; }
gate gate_P726 q0,q1,q2,q3,q4 { sdg q0; tdg q0; u(2.6521015260253735,3.7927292364410023,3.695080477809671) q2; p(4.557042607432183) q2; t q2; u3(3.9388139250977754,2.1631206781458916,1.7540814999121834) q2; ccx q1,q4,q3; h q1; cu(2.3260620336967097,0.4530315170836716,2.5134173631338528,2.4142298262046524) q1,q0; rx(6.16576296049617) q1; u1(1.1027134549780302) q3; s q3; cx q0,q3; r(2.741968332438588,3.8526548496538147) q4; rx(2.9569692443011153) q4; x q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P726 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];