Ruby-Version der Hausaufgabe 3 im PRG-Kurs der HAW-Hamburg - im SS11

Gearbeitet wurde mit dem Aptana RadRails Editor
(Der unterstützte allerdings im enthaltenen Ruby-Interpreter zwar mehrere Klassen, jedoch nicht mehrere Dateien in einem Projekt.
Zumindest habe ich nicht herausgefunden, wie er das tun würde.
Daher sind die beiden Klassen "Graph" und "Graphenliste" in einer Datei enthalten. 
Da "Graph" aber eh sehr wenig Quellcode enthält, hoffe ich, dass das nicht so schlimm ist.)

Zur Anwendung:
Unter den Methoden findet sich ein auskommentierter Code, der benutzt werden kann, um diese Lösung der Hausaufgabe schnell auszuprobieren.
Darin werden zwei Objekte der Klasse Graph angelegt(mit den Werten: A-B-1 und B-C-2), in ein Objekt der Klasse Graphenliste gespeichert, 
einmal ausgedruckt und dann wird die Länge von der Strecke A-B-C berechnet (Das sollte 3 ergeben).
Dieser Code kann beliebig modifiziert werden um z.B. eine Strecke zu testen, die nicht existiert. Syntax dafür:
	
	
	neuer_graph = Graph.new("Knoten 1", "Knoten 2", laenge)			- legt eine neue Kante an

  	neue_graphenliste = Graphenliste.new(graph1, graph2, ...)			- speichert die angelegten Graphen dann in eine Graphenliste

  	puts graphenliste.to_s						- druckt die Graphenliste als Array aus

  	puts g.getlength("Knoten1", "Knoten2", ...)			- sucht eine Strecke dieser Knoten und druckt dann die Laenge aus

									  Wenn die Strecke nicht vorhanden ist, wird eine Fehlermeldung ausgegeben.
	graphenliste.add(graph)						- fügt nachträglich einen Graphen in die Liste ein



Ansonsten kann der Quellcode auskommentiert gelassen werden um mit einer Eingabe zu arbeiten, die einen zunächst Graphen erstellen lässt und dann
die Liste der Graphen ausdruckt oder eine Strecke berechnet.
Dies ist bei mehrmaligen Tests etwas aufwendiger, da ich keine Speicherung der Graphen in ein Datei implementiert habe.



Erklärung der einzelnen Methoden in den Klassen:
class Graph:
	- initialize(a, b, l) erstellt einen neuen Graphen mit den Knoten a und b und der Länge l
	- (attr_accessor lässt den Zugriff auf diese drei Instanzvariablen zu)
	- to_s gibt an, wie der Graph auf der Konsole angezeigt werden kann, wenn "puts" oder "push" benutzt wird

class Graphenliste:
	- initialize(*graphen) erstellt eine neue Graphenliste mit der Instanzvariablen @graphs, 
	  die ein Array darstellt, das das Argument *graphen (auch ein Array) kopiert
	- to_s gibt hier wieder an, wie die Liste ausgedruckt werden soll. Ich habe mich entschieden, 
	  die to_s Methode von Arrays zu benutzen
	- getlength(*strecke) berechnet die Länge der (als Array) übergebenen Strecke (keine Indizes, sondern Strings)
	- add(graph) fügt einen neuen Graphen in die Liste ein
	- testlist() überprüft, ob die Graphenliste frei von Kanten ist, die die gleichen Knoten haben.
	  Dabei wird immer die erste Kante gelöscht, sodass alte Kanten überschrieben werden können.



Stephen Fuhrmann, Matrikelnr.: 2053047