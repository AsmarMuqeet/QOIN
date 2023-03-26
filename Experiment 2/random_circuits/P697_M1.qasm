OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.2700355089307456) q1; cx q0,q1; h q1; }
gate gate_P697 q0,q1,q2,q3,q4,q5,q6 { rx(4.25522610548465) q0; id q1; u3(2.8310554323656922,5.828597296669054,6.094166425066065) q1; rzz(6.2081419310426575) q4,q2; swap q0,q2; s q5; sx q5; rzx(2.2700355089307456) q3,q6; t q3; ch q4,q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[4];
gate_P697 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
