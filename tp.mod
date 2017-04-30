#Conjuntos
set PERSONAS;
set DIAS;
set DIAS_CON_MIN_3;
set DIAS_CON_MIN_2;
set DIAS_DE_FIN_SEMANA;
set FINES_DE_SEMANA;

#vars
var y { i in PERSONAS, j in DIAS } , binary;
var DIAS_MAXIMOS_LABORABLES = 8;

# Parametros
param DIAS_DESEABLES     { i in PERSONAS };

#Opcion por dias no laborales obligatoriamente
# param DIAS_NO_LABORABLES { j in DIAS_DE_FIN_SEMANA , i in PERSONAS };

#Opcion por FDS no laborales obligatoriamente
param FINDESEMANA_NUMERO 		{ i in FINES_DE_SEMANA, j in DIAS_DE_FIN_SEMANA };
param FINDESEMANA_NO_LABORABLE  { i in PERSONAS };

#funcional
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
#Opcion para que se retrinjan por dias no laborales obligatoriamente (cualquier dia del mes)
s.t. restriccionesPorFinde { j in PERSONAS } :
    sum { i in DIAS_DE_FIN_SEMANA } y[j,DIAS_NO_LABORABLES[i,j]] = 0;
*/
#Opcion para que se retrinjan por FDS no laborales obligatoriamente (unicamente, vie, sab y dom)
s.t. restriccionesPorFinde { j in PERSONAS } :
	sum { i in DIAS_DE_FIN_SEMANA } y[j,FINDESEMANA_NUMERO[FINDESEMANA_NO_LABORABLE[j],i]] = 0;
	
	
	
end;
