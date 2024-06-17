OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.2700355089307456) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
rx(4.25522610548465) q[0];
id q[1];
u3(2.8310554323656922,5.828597296669054,6.094166425066065) q[1];
rzz(6.2081419310426575) q[4],q[2];
swap q[0],q[2];
s q[5];
sx q[5];
rzx(2.2700355089307456) q[3],q[6];
t q[3];
ch q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
