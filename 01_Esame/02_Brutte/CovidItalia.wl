(* ::Package:: *)

(* ::Title:: *)
(*CovidItalia*)


(* ::Subtitle:: *)
(*Dati e grafici sul CoVid-19 per l'Italia*)


BeginPackage["CovidItalia`"];


(* ::Section:: *)
(*Dichiarazioni pubbliche*)


CovidItalia::usage = "Il pacchetto CovidItalia reperisce \
dati e crea grafici a partire dalle tabelle della \
Protezione Civile sul nuovo Coronavirus.";


(* ::Subsection:: *)
(*Oggetti pseudo-atomici*)


CovidUltimaData::usage = "CovidUltimaData restituisce l'ultimo \
giorno del quale il sistema ha ottenuto i dati.";

CovidCasiTotali::usage = "CovidCasiTotali resistuisce il numero \
dei positivi cumulati registrati nel giorno CovidUltimaData.";

CovidDeceduti::usage = "CovidDeceduti resistuisce il numero dei\
deceduti cumulati registrati nel giorno CovidUltimaData.";

CovidTamponi::usage = "CovidTamponi resistuisce il numero dei\
tamponi eseguiti dall'inizio dell'epidemia fino al giorno \
CovidUltimaData.";


(* ::Subsection:: *)
(*Liste*)


CovidCasiTotaliLista::usage = "CovidCasiTotaliLista[] \
restituisce una lista con \
i numeri cumulati dei positivi a partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidCasiTotaliLista[n] restituisce una lista con i numeri \
cumulati \
dei positivi a partire dal 24 febbraio 2020 e per n giorni.
CovidCasiTotaliLista[data] restituisce una lista con i numeri \
cumulati \
dei positivi nel periodo tra il 24 febbraio 2020 e data. Se data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidCasiTotaliLista[].";

CovidPositiviLista::usage = "CovidPositiviLista[] \
restituisce una lista con \
i numeri di persone registrate come positive in un determinato \
giorno, a partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidPositiviLista[n] restituisce una lista con i numeri \
di persone registrate come positive in un determinato \
giorno, a partire dal 24 febbraio 2020 e per n giorni.
CovidPositiviLista[data] restituisce una lista con i numeri \
di persone registrate come positive in un determinato \
giorno, nel periodo tra il 24 febbraio 2020 e data. Se data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidPositiviLista[].";

CovidDecedutiLista::usage = "CovidDecedutiLista[] \
restituisce una lista con \
i numeri cumulati dei deceduti a partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidDecedutiLista[n] restituisce una lista con i numeri \
cumulati \
dei deceduti a partire dal 24 febbraio 2020 e per n giorni.
CovidDecedutiLista[data] restituisce una lista con i numeri \
cumulati \
dei deceduti nel periodo tra il 24 febbraio 2020 e data. Se data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidDecedutiLista[].";

CovidTamponiLista::usage = "CovidTamponiLista[] restituisce \
una lista con \
i numeri cumulati dei tamponi effettuati a partire dal 24 \
febbraio 2020 fino all'ultima data disponibile.
CovidTamponiLista[n] restituisce una lista con i numeri \
cumulati \
dei tamponi effettuati a partire dal 24 febbraio 2020 per n giorni.
CovidTamponiLista[data] restituisce una lista con i numeri \
cumulati \
dei tamponi effettuati nel periodo tra il 24 febbraio 2020 e \
data. Se data rappresenta una data nel futuro, il comando \[EGrave] \
equivalente a CovidTamponiLista[].";


(* ::Subsection:: *)
(*Serie temporali storiche*)


(* ::Subsection:: *)
(*Modellizzazioni sui dati*)


(* ::Subsection:: *)
(*Comandi grafici*)


(* ::Section:: *)
(*Dichiarazioni private*)


Begin["`Private`"];


(* ::Text:: *)
(*Dichiariamo come troviamo i dati: li scarichiamo dal ripostiglio GitHub della Protezione Civile. Questo oggetto \[EGrave] privato perch\[EAcute] lo scopo del pacchetto \[EGrave] di manipolarlo indirettamente.*)


covidTabella := Cases[
  Import[
    "https://raw.githubusercontent.com/\
pcm-dpc/COVID-19/master/legacy/dati-andamento-nazionale/\
dpc-covid19-ita-andamento-nazionale.csv",
    "CSV"
  ],
  {_, __}
];


(* ::Text:: *)
(*Ci diamo un modo facile per accedere ai dati di covidTabella. I numeri da usare si possono ottenere tramite*)


(* ::Program:: *)
(*{Range[Length[tabellafull[[1]]]], tabellafull[[1]]}\[Transpose]*)


scegliDati[n_] := Drop[#[[n]]& /@ covidTabella, 1];


(* ::Text:: *)
(*Diamo all'utente la possibilit\[AGrave] di controllare quanto siano aggiornati i dati a sua disposizione: creiamo un oggetto che rappresenti l'ultimo giorno di cui sono forniti i dati.*)


CovidUltimaData := DateObject[scegliDati[1] // Last, "Day"];


(* ::Subsection:: *)
(*Casi totali*)


CovidCasiTotaliLista[] := scegliDati[12]
CovidCasiTotaliLista[n_/;(IntegerQ[n] && n > 0)] := 
  scegliDati[12][[1;;n]]
CovidCasiTotaliLista[data_/;Or[DateObjectQ[data],
  StringQ[data]]] := 
  scegliDati[12][[1;;Max[First[DateDifference[
  DateObject["2020-02-24"], DateObject[data, "Day"]]],
  Length[scegliDati[12]]]]]
  
CovidCasiTotali := CovidCasiTotaliLista[] // Last


(* ::Subsection:: *)
(*Positivi*)


CovidPositiviLista[] := scegliDati[7]
CovidPositiviLista[n_/;(IntegerQ[n] && n > 0)] := 
  scegliDati[7][[1;;n]]
CovidPositiviLista[data_/;Or[DateObjectQ[data],
  StringQ[data]]] := 
  scegliDati[7][[1;;Max[First[DateDifference[
  DateObject["2020-02-24"], DateObject[data, "Day"]]],
  Length[scegliDati[7]]]]]
  
CovidPositivi := CovidPositiviLista[] // Last


(* ::Subsection:: *)
(*Deceduti*)


CovidDecedutiLista[] := scegliDati[11]
CovidDecedutiLista[n_/;(IntegerQ[n] && n > 0)] :=
  scegliDati[11][[1;;n]]
CovidDecedutiLista[data_/;Or[DateObjectQ[data],
  StringQ[data]]] := 
  scegliDati[11][[1;;Max[First[DateDifference[
  DateObject["2020-02-24"], DateObject[data, "Day"]]],
  Length[scegliDati[11]]]]]
  
CovidDeceduti := CovidDecedutiLista[] // Last


(* ::Subsection:: *)
(*Tamponi*)


CovidTamponiLista[] := scegliDati[13]
CovidTamponiLista[n_/;(IntegerQ[n] && n > 0)] :=
  scegliDati[13][[1;;n]]
CovidTamponiLista[data_/;Or[DateObjectQ[data],
  StringQ[data]]] := 
  scegliDati[13][[1;;Max[First[DateDifference[
  DateObject["2020-02-24"], DateObject[data, "Day"]]],
  Length[scegliDati[13]]]]]

CovidTamponi := CovidTamponiLista[] // Last


End[];


(* ::Section:: *)
(*Fine del pacchetto*)


EndPackage[];
