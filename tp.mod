#Conjuntos
set PERSONAS;
set DIAS;
set DIAS_CON_MIN_3;
set DIAS_CON_MIN_2;
#set FINDE_1;
#set FINDE_2;
#set FINDE_3;
#set FINDE_4;
#set FINDE_5;

#vars
var y{i in PERSONAS, j in DIAS} binary;

#funcional
minimize z: y[1,3] + y[2,5] + y[3, 22] + y[4,30] + y[5,2] + y[6,7] + y[7,13] + y[8,29] + y[9,12] + y[10,4] + y[11,18] + y[12,18] + y[13,6] + y[14,30];

#restricciones
s.t. trabajanExactamente8Dias{i in PERSONAS}:
    sum {j in DIAS} y[i,j] = 8;
s.t. diasConsecutivos{i in PERSONAS, j in DIAS: j<>'30'}:
    y[i,j] + y[i,j+1] <= 1;
s.t. minimo3Personas{j in DIAS_CON_MIN_3}:
    sum {i in PERSONAS} y[i,j] >= 3;
s.t. minimo2Personas{j in DIAS_CON_MIN_2}:
    sum {i in PERSONAS} y[i,j] >= 2;
s.t. findeJuan:
    y[0,1] + y[0,2] = 0;
s.t. findeMartin:
    y[1,7] + y[1,8] + y[1,9] = 0;
s.t. findeJose:
    y[2,14] + y[2,15] + y[2,16]= 0;
s.t. findeRodrigo:
    y[3,21] + y[3,22] + y[3,23] = 0;
s.t. findeMaria:
    y[4,28] + y[4,29] + y[4,30]  = 0;
s.t. findeValeria:
    y[5,1] + y[5,2] = 0;
s.t. findeRoxane:
    y[6,7] + y[6,8] + y[6,9] = 0;
s.t. findeLidia:
    y[7,14] + y[7,15] + y[7,16]= 0;
s.t. findeCelia:
    y[8,21] + y[8,22] + y[8,23] = 0;
s.t. findeArnaldo:
    y[9,28] + y[9,29] + y[9,30]  = 0;
s.t. findeHernan:
    y[10,1] + y[10,2] = 0;
s.t. findeKarina:
    y[11,7] + y[11,8] + y[11,9] = 0;
s.t. findeGuillermo:
    y[12,14] + y[12,15] + y[12,16]= 0;
s.t. findeRamon:
    y[13,21] + y[13,22] + y[13,23] = 0;

end;
