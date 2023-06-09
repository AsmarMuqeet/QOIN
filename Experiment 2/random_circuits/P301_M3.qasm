OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.7235826047310598,4.539551793509362,-4.539551793509362) q0; }
gate gate_P301 q0,q1,q2,q3,q4 { r(1.7235826047310598,6.110348120304258) q1; z q2; cu(3.612608062628119,5.847945162377591,2.8584265763640526,2.9831333838905154) q2,q1; ry(2.5893998761008064) q3; rz(5.229062804135598) q3; cx q0,q4; t q0; t q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P301 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
