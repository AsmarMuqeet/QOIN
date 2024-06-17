OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
s q[0];
ccx q[3],q[1],q[2];
id q[1];
y q[2];
cy q[2],q[1];
u1(1.7543220143035037) q[1];
u1(4.537341702035659) q[1];
h q[2];
u2(5.9176831321199375,3.286934267743167) q[2];
sx q[3];
sx q[3];
x q[3];
u(3.667060560749706,2.7579916892413476,1.8111184395767965) q[4];
cz q[4],q[0];
rzz(3.9918004280374917) q[4],q[0];
cp(0.24274057934968116) q[4],q[0];
cu1(0.49325550441311594) q[3],q[0];
rx(0.526319687859075) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];