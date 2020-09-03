(* ::Package:: *)

(* ::Title:: *)
(*CovidItalia*)


(* ::Subtitle:: *)
(*Dati e grafici sul CoVid-19 per l'Italia*)


BeginPackage["CovidItalia`"];


(* ::Section:: *)
(*Dichiarazioni pubbliche*)


(* ::Text:: *)
(*Ovvero ci\[OGrave] che l'utente visualizza quando esegue ?comando.*)


CovidItalia::usage = "Il pacchetto CovidItalia reperisce \
dati e crea grafici a partire dalle tabelle della \
Protezione Civile sul nuovo Coronavirus.";


(* ::Subsection::Closed:: *)
(*Oggetti pseudo-atomici*)


CovidUltimaData::usage = "CovidUltimaData restituisce l'ultimo \
giorno del quale il sistema ha ottenuto i dati.";

CovidCasiTotali::usage = "CovidCasiTotali resistuisce il numero \
dei positivi cumulati registrati nel giorno CovidUltimaData.";

CovidPositivi::usage = "CovidPositivi restituisce il numero \
delle persone registrate come positive nel giorno \
CovidUltimaData.";

CovidNuoviPositivi::usage = "CovidNuoviPositivi restituisce \
il numero delle positive risultate positive nel giorno \
CovidUltimaData rispetto al giorno precedente.";

CovidDeceduti::usage = "CovidDeceduti resistuisce il numero dei\
deceduti cumulati registrati nel giorno CovidUltimaData.";

CovidTamponi::usage = "CovidTamponi resistuisce il numero dei\
tamponi eseguiti dall'inizio dell'epidemia fino al giorno \
CovidUltimaData.";


(* ::Subsection::Closed:: *)
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
dei positivi nel periodo tra il 24 febbraio 2020 e data. Se \
data \
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

CovidNuoviPositiviLista::usage = "CovidNuoviPositiviLista[] \
restituisce una lista con \
i numeri di persone registrate come positive in un determinato \
giorno rispetto al precedente, a partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidNuoviPositiviLista[n] restituisce una lista con i numeri \
di persone registrate come positive in un determinato \
giorno rispetto al precedente, \
a partire dal 24 febbraio 2020 e per n giorni.
CovidNuoviPositiviLista[data] restituisce una lista con \
i numeri \
di persone registrate come positive in un determinato \
giorno rispetto al precedente, \
nel periodo tra il 24 febbraio 2020 e data. Se data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidNuoviPositiviLista[].";

CovidDecedutiLista::usage = "CovidDecedutiLista[] \
restituisce una lista con \
i numeri cumulati dei deceduti a partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidDecedutiLista[n] restituisce una lista con i numeri \
cumulati \
dei deceduti a partire dal 24 febbraio 2020 e per n giorni.
CovidDecedutiLista[data] restituisce una lista con i numeri \
cumulati \
dei deceduti nel periodo tra il 24 febbraio 2020 e data. Se \
data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidDecedutiLista[].";

CovidTamponiLista::usage = "CovidTamponiLista[] restituisce \
una lista con \
i numeri cumulati dei tamponi effettuati a partire dal 24 \
febbraio 2020 fino all'ultima data disponibile.
CovidTamponiLista[n] restituisce una lista con i numeri \
cumulati \
dei tamponi effettuati a partire dal 24 febbraio 2020 \
per n giorni.
CovidTamponiLista[data] restituisce una lista con i numeri \
cumulati \
dei tamponi effettuati nel periodo tra il 24 febbraio 2020 e \
data. Se data rappresenta una data nel futuro, il comando \[EGrave] \
equivalente a CovidTamponiLista[].";


(* ::Subsection::Closed:: *)
(*Serie temporali storiche*)


CovidCasiTotaliSerie::usage = "CovidCasiTotaliSerie[] \
restituisce un oggetto TimeSeries con \
i numeri cumulati dei positivi a partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidCasiTotaliSerie[n] restituisce un oggetto TimeSeries con \
i numeri cumulati \
dei positivi a partire dal 24 febbraio 2020 e per n giorni.
CovidCasiTotaliSerie[data] restituisce \
un oggetto TimeSeries con \
i numeri cumulati \
dei positivi nel periodo tra il 24 febbraio 2020 e data. \
Se data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidCasiTotaliSerie[].";

CovidPositiviSerie::usage = "CovidPositiviSerie[] \
restituisce un oggetto TimeSeries con \
i numeri di persone registrate come positive in un determinato \
giorno a partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidPositiviSerie[n] restituisce un oggetto TimeSeries con \
i numeri di persone registrate come positive in un determinato \
giorno a partire dal 24 febbraio 2020 e per n giorni.
CovidPositiviSerie[data] restituisce un oggetto \
TimeSeries con \
i numeri di persone registrate come positive in un determinato \
giorno nel periodo tra il 24 febbraio 2020 e data. Se data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidPositiviSerie[].";

CovidNuoviPositiviSerie::usage = "CovidNuoviPositiviSerie[] \
restituisce un oggetto TimeSeries con \
i numeri di persone registrate come positive in un determinato \
giorno rispetto al precedentea partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidNuoviPositiviSerie[n] restituisce un oggetto TimeSeries \
con i numeri di persone registrate come positive \
in un determinato \
giorno rispetto al precedente \
a partire dal 24 febbraio 2020 e per n giorni.
CovidNuoviPositiviSerie[data] restituisce un oggetto \
TimeSeries con \
i numeri di persone registrate come positive in un determinato \
giorno rispetto al precedente \
nel periodo tra il 24 febbraio 2020 e data. Se data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidCasiTotaliSerie[].";

CovidDecedutiSerie::usage = "CovidDecedutiSerie[] \
restituisce un oggetto TimeSeries con \
i numeri cumulati dei deceduti a partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidDecedutiSerie[n] restituisce un oggetto TimeSeries con \
i numeri cumulati \
dei deceduti a partire dal 24 febbraio 2020 e per n giorni.
CovidDecedutiSerie[data] restituisce un oggetto TimeSeries con \
i numeri cumulati \
dei deceduti nel periodo tra il 24 febbraio 2020 e data. \
Se data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidDecedutiSerie[].";

CovidTamponiSerie::usage = "CovidTamponiSerie[] \
restituisce un oggetto TimeSeries con \
i numeri cumulati dei tamponi effettuati \
a partire dal 24 febbraio 2020 \
fino all'ultima data disponibile.
CovidTamponiSerie[n] restituisce un oggetto TimeSeries con \
i numeri cumulati \
dei tamponi effettuati a partire dal 24 febbraio 2020 \
e per n giorni.
CovidTamponiSerie[data] restituisce un oggetto TimeSeries con \
i numeri cumulati \
dei tamponi effettuati nel periodo tra il \
24 febbraio 2020 e data. Se data \
rappresenta una data nel futuro, il comando \[EGrave] equivalente a \
CovidTamponiSerie[].";


(* ::Subsection::Closed:: *)
(*Modellizzazioni sui dati*)


(* ::Text:: *)
(*Per mancanza di tempo non proponiamo modellizzazioni dei tamponi n\[EAcute] dei deceduti. Modellizziamo solo i casi totali e i nuovi positivi, perch\[EAcute] \[EGrave] facile inquadrarli con una logistica e la sua derivata \[LongDash] o con una somma di logistiche, visto che dai dati \[EGrave] evidente l'effetto "martello-danza" ipotizzato in questo articolo.*)


CovidCasiTotaliListaStabilizza::usage = "
CovidCasiTotaliListaStabilizza[x] restituisce una lista del \
tipo CovidCasiTotaliLista[x] aggiustato con una media mobile \
di cinque giorni.";

CovidCasiTotaliSerieStabilizza::usage = "
CovidCasiTotaliSerieStabilizza[x] restituisce un oggetto \
TimeSeries del \
tipo CovidCasiTotaliSerie[x] aggiustato con una media mobile \
di cinque giorni.";

CovidNuoviPositiviListaStabilizza::usage = "
CovidNuoviPositiviListaStabilizza[x] restituisce una lista del \
tipo CovidNuoviPositiviLista[x] aggiustato con una media mobile \
di cinque giorni.";

CovidNuoviPositiviListaStabilizza::usage = "
CovidNuoviPositiviSerieStabilizza[x] restituisce un oggetto \
TimeSeries del \
tipo CovidNuoviPositiviSerie[x] aggiustato con una media mobile \
di cinque giorni.";


CovidCasiTotaliModello::usage = "CovidCasiTotaliModello \
restituisce una funzione pura ottenuta applicando il modello \
logistico a CovidCasiTotaliLista.";

CovidNuoviPositiviModello::usage = "CovidNuoviPositiviModello \
restituisce una funzione pura ottenuta derivando il modello \
logistico CovidCasiTotaliModello.";


CovidCasiTotaliModello2::usage = "CovidCasiTotaliModello2 \
restituisce una funzione pura ottenuta applicando il modello \
di somma di due logistiche a CovidCasiTotaliLista.";

CovidNuoviPositiviModello2::usage = "CovidNuoviPositiviModello2 \
restituisce una funzione pura ottenuta derivando il modello \
di somma di due logistiche CovidCasiTotaliModello2.";


(* ::Subsection::Closed:: *)
(*Comandi grafici*)


(* ::Text:: *)
(*Assumendo che l'utente pu\[OGrave] accedere a liste e TimeSeries per creare i suoi grafici direttamente, prevediamo solo comandi grafici che aggreghino i dati, le medie mobili e i modelli.*)


CovidItaliaPlot::usage = "CovidItaliaPlot[1] restituisce due \
grafici con casi totali e nuovi positivi, completi di dati \
grezzi e modellizzazione logistica.
CovidItaliaPlot[2] restituisce due \
grafici con casi totali e nuovi positivi, completi di dati \
grezzi e modellizzazione come somma \
di due logistiche.";


(* ::Section:: *)
(*Dichiarazioni private*)


Begin["`Private`"];


(* ::Subsection::Closed:: *)
(*Utilit\[AGrave]*)


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
(*TableForm[*)
(* {*)
(*  Range[Length[covidTabella[[1]]]], covidTabella[[1]]*)
(* }\[Transpose],*)
(* TableHeadings -> {None, {"n", "Descrizione"}}*)
(*]*)


scegliDati[n_] := Drop[#[[n]]& /@ covidTabella, 1];


(* ::Text:: *)
(*Diamo all'utente la possibilit\[AGrave] di controllare quanto siano aggiornati i dati a sua disposizione: creiamo un oggetto che rappresenti l'ultimo giorno di cui sono forniti i dati.*)


CovidUltimaData := DateObject[scegliDati[1] // Last, "Day"];


(* ::Text:: *)
(*Per generare le serie storiche, ci generiamo tutte le date di cui si hanno i dati.*)


listaDate := DateObject[#, "Day"]& /@ scegliDati[1];


(* ::Text:: *)
(*Creiamo una funzione generica che, a partire dalle liste, generi le serie temporali.*)


listaAdSerie[lista_] := TimeSeries[lista, {listaDate}]
listaAdSerie[lista_, n_/;(IntegerQ[n] && n > 0)] :=
  TimeSeries[lista[[1;;n]], {listaDate[[1;;n]]}]
listaAdSerie[lista_, data_/;Or[DateObjectQ[data],
  StringQ[data]]] := 
  Module[
    {
      data0 = DateObject[data, "Day"],
      n
    },
    If[
      data0 <= CovidUltimaData,
      (
        n = Position[listaDate, data0][[1, 1]];
        listaAdSerie[lista, n]
      ),
      listaAdSerie[lista]
    ]
  ]


(* ::Text:: *)
(*Creiamo una funzione che lisci i dati dei casi totali e dei nuovi positivi facendo una media a cinque giorni.*)


lisciaLista[lista_] := Join[
  {0, 0, 0, 0}, MovingAverage[lista, 5]
]


(* ::Subsection::Closed:: *)
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


CovidCasiTotaliSerie[x___] :=
  listaAdSerie[CovidCasiTotaliLista[], x]


CovidCasiTotaliListaStabilizza[x___] :=
  lisciaLista[CovidCasiTotaliLista[x]]

CovidCasiTotaliSerieStabilizza[x___] :=
  listaAdSerie[CovidCasiTotaliListaStabilizza[x]]


CovidCasiTotaliModello := Function[
  {y},
  Normal[
    NonlinearModelFit[
      CovidCasiTotaliLista[], \[FormalK]/(1 + \[FormalQ] E^(-\[FormalR] x)), {\[FormalK], \[FormalQ], \[FormalR]}, x
    ]
  ] /. x :> y
]


CovidCasiTotaliModello2 := Function[
  {y},
  Normal[
    NonlinearModelFit[
      CovidCasiTotaliLista[],
      \[FormalK]/(1 + \[FormalQ] E^(-\[FormalR] x)) + \[FormalH]/(1 + \[FormalP] E^(-\[FormalT] x)), {\[FormalK], \[FormalQ], \[FormalR], \[FormalH], \[FormalP], \[FormalT]}, x
    ]
  ] /. x -> y
]


(* ::Subsection::Closed:: *)
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


CovidPositiviSerie[x___] :=
  listaAdSerie[CovidPositiviLista[], x]


(* ::Subsection::Closed:: *)
(*Nuovi positivi*)


CovidNuoviPositiviLista[] := scegliDati[9]
CovidNuoviPositiviLista[n_/;(IntegerQ[n] && n > 0)] := 
  scegliDati[9][[1;;n]]
CovidNuoviPositiviLista[data_/;Or[DateObjectQ[data],
  StringQ[data]]] := 
  scegliDati[9][[1;;Max[First[DateDifference[
  DateObject["2020-02-24"], DateObject[data, "Day"]]],
  Length[scegliDati[9]]]]]
  
CovidNuoviPositivi := CovidNuoviPositiviLista[] // Last


CovidNuoviPositiviSerie[x___] :=
  listaAdSerie[CovidNuoviPositiviLista[], x]


CovidCasiTotaliSerie[x___] :=
  listaAdSerie[CovidCasiTotaliLista[], x]


CovidNuoviPositiviListaStabilizza[x___] :=
  lisciaLista[CovidNuoviPositiviLista[x]]

CovidNuoviPositiviSerieStabilizza[x___] :=
  listaAdSerie[CovidNuoviPositiviListaStabilizza[x]]


CovidNuoviPositiviModello := CovidCasiTotaliModello'

CovidNuoviPositiviModello2 := CovidCasiTotaliModello2'


(* ::Subsection::Closed:: *)
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


CovidDecedutiSerie[x___] :=
  listaAdSerie[CovidDecedutiLista[], x]


(* ::Subsection::Closed:: *)
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


CovidTamponiSerie[x___] :=
  listaAdSerie[CovidTamponiLista[], x]


(* ::Subsection:: *)
(*Comandi grafici*)


CovidItaliaPlot[1] := GraphicsRow[{
  Show[
    ListLinePlot[
      CovidCasiTotaliLista[],
      PlotMarkers -> None,
      PlotStyle -> {Gray}
    ],
    (*ListLinePlot[
      CovidCasiTotaliListaStabilizza[],
      PlotStyle \[Rule] {Thick, Hue[0.5,0.59,0.84,0.84]}
    ],*)
    Plot[
      Evaluate@CovidCasiTotaliModello[x],
      {x, 0, Length[CovidCasiTotaliLista[]]},
      PlotStyle -> {Red, Dashed, Thick}
    ],
    PlotRange -> Full,
    PlotLabel -> "Casi totali"
  ],
  Show[
    ListLinePlot[
      CovidNuoviPositiviLista[],
      PlotMarkers -> None,
      PlotStyle -> {Gray}
    ],
    (*ListLinePlot[
      CovidNuoviPositiviListaStabilizza[],
      PlotStyle \[Rule] {Thick, Hue[0.5,0.59,0.84,0.84]}
    ],*)
    Plot[
      Evaluate@CovidNuoviPositiviModello[x],
      {x, 0, Length[CovidCasiTotaliLista[]]},
      PlotStyle -> {Red, Dashed, Thick}
    ],
    PlotRange -> Full,
    PlotLabel -> "Nuovi positivi"
  ]
}, ImageSize -> Full]


CovidItaliaPlot[2] := GraphicsRow[{
  Show[
    ListLinePlot[
      CovidCasiTotaliLista[],
      PlotMarkers->None,
      PlotStyle -> {Gray}
    ],
   (* ListLinePlot[
      CovidCasiTotaliListaStabilizza[],
      PlotStyle \[Rule] {Thick, Hue[0.5,0.59,0.84,0.84]}
    ],*)
    Plot[
      Evaluate@CovidCasiTotaliModello2[x],
      {x, 0, Length[CovidCasiTotaliLista[]]},
      PlotStyle -> {Red, Dashed, Thick}
    ],
    PlotRange -> Full,
    PlotLabel -> "Casi totali"
  ],
  Show[
    ListLinePlot[
      CovidNuoviPositiviLista[],
      PlotStyle -> {Gray, Thick}
    ],
    (*ListLinePlot[
      CovidNuoviPositiviListaStabilizza[],
      PlotStyle \[Rule] {Thick, Hue[0.5,0.59,0.84,0.84]}
    ],*)
    Plot[
      Evaluate@CovidNuoviPositiviModello2[x],
      {x, 0, Length[CovidCasiTotaliLista[]]},
      PlotStyle -> {Red, Dashed, Thick}
    ],
    PlotRange -> Full,
    PlotLabel -> "Nuovi positivi"
  ]
}, ImageSize -> Full]


(* ::Subsection::Closed:: *)
(*Fine dichiarazioni*)


End[];


(* ::Section:: *)
(*Fine del pacchetto*)


EndPackage[];
