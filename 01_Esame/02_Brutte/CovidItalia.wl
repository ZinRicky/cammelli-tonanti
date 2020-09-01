(* ::Package:: *)

BeginPackage["CovidItalia`"];

CovidItalia::usage = "Il pacchetto CovidItalia reperisce \
dati e crea grafici a partire dalle tabelle della \
Protezione Civile sul nuovo Coronavirus.";

CovidUltimaData::usage = "CovidUltimaData[] restituisce l'ultimo \
giorno del quale il sistema ha ottenuto i dati"

CovidPositivi::usage = "CovidPositivi[] restituisce una lista con \
i numeri cumulati dei positivi a partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidPositivi[n] restituisce una lista con i numeri cumulati \
dei positivi a partire dal 24 febbraio 2020 e per n giorni.
CovidPositivi[data] restituisce una lista con i numeri cumulati \
dei positivi nel periodo tra il 24 febbraio 2020 e data. Se data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidPositivi[].";

CovidDeceduti::usage = "CovidDeceduti[] restituisce una lista con \
i numeri cumulati dei deceduti a partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidDeceduti[n] restituisce una lista con i numeri cumulati \
dei deceduti a partire dal 24 febbraio 2020 e per n giorni.
CovidDeceduti[data] restituisce una lista con i numeri cumulati \
dei deceduti nel periodo tra il 24 febbraio 2020 e data. Se data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidDeceduti[].";

CovidTamponi::usage = "CovidTamponi[] restituisce una lista con \
i numeri cumulati dei tamponi effettuati a partire dal 24 \
febbraio 2020 fino all'ultima data disponibile.
CovidTamponi[n] restituisce una lista con i numeri cumulati \
dei tamponi effettuati a partire dal 24 febbraio 2020 per n giorni.
CovidTamponi[data] restituisce una lista con i numeri cumulati \
dei tamponi effettuati nel periodo tra il 24 febbraio 2020 e \
data. Se data rappresenta una data nel futuro, il comando \[EGrave] \
equivalente a CovidTamponi[].";

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

CovidUltimaData[] := DateObject[scegliDati[1] // Last, "Day"];

CovidPositivi[] := scegliDati[12]
CovidPositivi[n_/;(IntegerQ[n] && n > 0)] := scegliDati[12][[1;;n]]
CovidPositivi[data_/;Or[DateObjectQ[data], StringQ[data]]] := 
  scegliDati[12][[1;;Max[First[DateDifference[
  DateObject["2020-02-24"], DateObject[data, "Day"]]],
  Length[scegliDati[12]]]]]

CovidDeceduti[] := scegliDati[11]
CovidDeceduti[n_/;(IntegerQ[n] && n > 0)] := scegliDati[11][[1;;n]]
CovidDeceduti[data_/;Or[DateObjectQ[data], StringQ[data]]] := 
  scegliDati[11][[1;;Max[First[DateDifference[
  DateObject["2020-02-24"], DateObject[data, "Day"]]],
  Length[scegliDati[11]]]]]

CovidTamponi[] := scegliDati[13]
CovidTamponi[n_/;(IntegerQ[n] && n > 0)] := scegliDati[13][[1;;n]]
CovidTamponi[data_/;Or[DateObjectQ[data], StringQ[data]]] := 
  scegliDati[13][[1;;Max[First[DateDifference[
  DateObject["2020-02-24"], DateObject[data, "Day"]]],
  Length[scegliDati[13]]]]]

End[];

EndPackage[];
