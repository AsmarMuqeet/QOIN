OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.8110821165013182,-1.489554905495735,1.489554905495735) q0; }
gate r_139921316942128(param0,param1) q0 { u3(3.0063510760733307,1.7426525694719142,-1.7426525694719142) q0; }
qreg q[7];
creg c[3];
t q[1];
u3(4.926284624661552,1.7351802899193969,0.40744461109997815) q[2];
x q[3];
cp(1.9788627061143802) q[3],q[1];
y q[4];
u2(1.6957364433367295,2.8342579269276738) q[4];
r(0.8110821165013182,0.08124142129916152) q[5];
r_139921316942128(3.0063510760733307,3.3134488962668107) q[5];
cy q[0],q[6];
h q[0];
cp(5.938573780725485) q[6],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];