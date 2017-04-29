#Conjuntos
set PERSONAS;
set DIAS;
set DIAS_CON_MIN_3;
set DIAS_CON_MIN_2;
#set DIAS_DESEABLES;
set DIAS_DE_FIN_SEMANA;

#vars
var y { i in PERSONAS, j in DIAS } , binary;
var DIAS_MAXIMOS_LABORABLES = 8;
# Parametros
param DIAS_DESEABLES     { i in PERSONAS };
param DIAS_NO_LABORABLES { j in DIAS_DE_FIN_SEMANA , i in PERSONAS };

#funcional
#minimize z : y["juan",3] + y["martin",5] + y["jose", 22] + y["rodrigo",30] + y["maria",2] + y["valeria",7] + y["roxane",13] + y["lidia",29] + y["celia",12] + y["arnaldo",4] + y["hernan",18] + y["karina",18] + y["guillermo",6] + y["ramon",30];

minimize z : sum { i in PERSONAS } y[i,DIAS_DESEABLES[i]];

#restricciones
s.t. trabajanExactamente8Dias{i in PERSONAS}:
    sum {j in DIAS} y[i,j] - DIAS_MAXIMOS_LABORABLES = 0 ;
s.t. diasConsecutivos{i in PERSONAS, j in DIAS: j<>30}:
    y[i,j] + y[i,j+1] <= 1;
s.t. minimo3Personas{j in DIAS_CON_MIN_3}:
    sum {i in PERSONAS} y[i,j] >= 3;
s.t. minimo2Personas{j in DIAS_CON_MIN_2}:
    sum {i in PERSONAS} y[i,j] >= 2;

	/*
s.t. restriccionesPorFinde { i in PERSONAS } :
	sum {j in DIAS_DE_FIN_SEMANA} y[i, (DIAS_NO_LABORABLES[i,j]) ] = 0;
	*/
/*
s.t. findeJuan :
#    y["juan",1] + y["juan",2] = 0;
    y["juan",1] + y["juan",DIAS_NO_LABORABLES["domingo","juan"]] = 0; #FUNCIONO!!!!!
*/
s.t. restriccionesPorFinde { j in PERSONAS } :
    sum { i in DIAS_DE_FIN_SEMANA } y[j,DIAS_NO_LABORABLES[i,j]] = 0;
#YA FUNCIONA. Ahora todos las personas no trabajan los finde elejidos.
	
	
/*
s.t. findeMartin:
    y["martin",7] + y["martin",8] + y["martin",9] = 0;
s.t. findeJose:
    y["jose",14] + y["jose",15] + y["jose",16]= 0;
s.t. findeRodrigo:
    y["rodrigo",21] + y["rodrigo",22] + y["rodrigo",23] = 0;
s.t. findeMaria:
    y["maria",28] + y["maria",29] + y["maria",30]  = 0;
s.t. findeValeria:
    y["valeria",1] + y["valeria",2] = 0;
s.t. findeRoxane:
    y["roxane",7] + y["roxane",8] + y["roxane",9] = 0;
s.t. findeLidia:
    y["lidia",14] + y["lidia",15] + y["lidia",16]= 0;
s.t. findeCelia:
    y["celia",21] + y["celia",22] + y["celia",23] = 0;
s.t. findeArnaldo:
    y["arnaldo",28] + y["arnaldo",29] + y["arnaldo",30]  = 0;
s.t. findeHernan:
    y["hernan",1] + y["hernan",2] = 0;
s.t. findeKarina:
    y["karina",7] + y["karina",8] + y["karina",9] = 0;
s.t. findeGuillermo:
    y["guillermo",14] + y["guillermo",15] + y["guillermo",16]= 0;
s.t. findeRamon:
    y["ramon",21] + y["ramon",22] + y["ramon",23] = 0;
*/
end;
