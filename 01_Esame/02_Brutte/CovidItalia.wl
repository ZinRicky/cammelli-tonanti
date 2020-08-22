(* ::Package:: *)

(* ::Text:: *)
(*Arbitrariamente scelgo di tenere in italiano i nomi di tutte le funzioni e di tutte le variabili.*)


BeginPackage["CovidItalia`"];

CovidItalia::usage = "Il pacchetto CovidItalia reperisce \
dati e crea grafici a partire dalle tabelle della \
Protezione Civile sul nuovo Coronavirus.";

CovidPositivi::usage = "CovidPositivi[] restituisce una lista con \
i numeri cumulati dei positivi a partire dal 24 febbraio 2020 fino \
alla data corrente.
CovidPositivi[n] restituisce una lista con i numeri cumulati \
dei positivi a partire dal 24 febbraio 2020 e per n giorni.
CovidPositivi[data] restituisce una lista con i numeri cumulti \
dei positivi nel periodo tra il 24 febbraio 2020 e data.";

Begin["`Private`"];

covidTabella := Cases[
  Import[
    "https://raw.githubusercontent.com/\
pcm-dpc/COVID-19/master/legacy/dati-andamento-nazionale/\
dpc-covid19-ita-andamento-nazionale.csv",
    "CSV"
  ],
  {_, __}
];

scegliDati[n_] := Drop[#[[n]]& /@ covidTabella, 1];

CovidPositivi[] := scegliDati[12]
CovidPositivi[n_/;(IntegerQ[n] && n > 0)] := scegliDati[12][[1;;n]]
CovidPositivi[data_/;Or[DateObjectQ[data], StringQ[data]]] := 
  scegliDati[12][[1;;First[DateDifference[DateObject["2020-02-24"], DateObject[data, "Day"]]]]]

End[];

EndPackage[];
