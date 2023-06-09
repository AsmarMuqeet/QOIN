OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.271734659822794) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.8970316328871024) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(4.148859370440579,3.8013137654367144,-3.8013137654367144) q0; }
gate gate_P689 q0,q1,q2,q3,q4,q5,q6 { y q1; r(4.148859370440579,5.372110092231611) q4; rx(4.621578722754412) q4; rzx(2.8970316328871024) q3,q5; crx(2.2708455674745447) q3,q5; cswap q0,q2,q6; x q0; cu3(3.782338354928894,0.35495599266097044,1.0522644354385708) q2,q1; cu1(6.080016584434348) q0,q2; ryy(5.271734659822794) q4,q1; u(5.079193517804722,0.4513851641396517,3.531758468866509) q6; cswap q3,q6,q5; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[4];
gate_P689 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
