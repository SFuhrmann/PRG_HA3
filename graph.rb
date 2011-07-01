class Graph
  
  attr_accessor :knotena, :knotenb, :laenge
  
  def initialize(a, b, l)
    @knotena = a
    @knotenb = b
    @laenge = l
  end
  
  def to_s #hier wird definiert, wie die Graphen ausgegeben werden sollen
    "(#{@knotena}, #{@knotenb}, #{@laenge})"
  end
end

class Graphenliste
  
  def initialize(*graphen)
    @graphs = graphen
    #Ab hier werden zwei Schleifen implementiert, um zu verhindern, dass es 2 Graphen mit gleichen Knoten gibt.
    #Da die Kanten hier gerichtet sind, muss nicht "ueberkreuz" ueberprueft werden.
    i = 0
    while i < @graphs.size
      j = 0
      while j < @graphs.size
        if @graphs[i].knotena == @graphs[j].knotena
          if @graphs[i].knotenb == @graphs[j].knotenb
            if i != j
              @graphs.delete_at(j)
            end
          end
        end
        j += 1
      end
      i += 1
    end 
  end
  
  def to_s #Da @graphs ein Array ist und wir die to_s Methode von den Graphen auch schon definiert haben, ist hier nichts mehr zu tun:
    puts "Knoten und Laengen der Graphen:"
    @graphs.to_s
  end
  
  def getlength(*strecke)
    i = 0 #Index für das strecke-Array
    length = 0 #Laenge auf 0 setzen
    found = 0 #gefunden-Variable zur Ueberpruefung, ob so viele Kanten gefunden wurden, wie es auch im Strecken-Array gab
    while i < (strecke.size) - 1
      j = 0 #Index für das @graphs-Array
      while j < @graphs.size
        
        if strecke[i] == @graphs[j].knotena
          if strecke[i+1] == @graphs[j].knotenb
            length += @graphs[j].laenge
            found += 1
          end
        end
        
        j += 1
      end
      i += 1
    end
    if found == strecke.size-1
      "Streckenlaenge: #{length}"
    else
      "Strecke nicht gefunden!"
    end
  end
  
  def add(graph) #hier ist eine Methode, um zu @graphs einen Graphen hinzuzufügen
    @graphs[@graphs.size] = graph
  end
  
  
  # Folgende Zeilen können zum schnellen Test ohne Eingabe genutzt werden, dazu einfach wieder "einkommentieren"
=begin
  h = Graph.new("A", "B", 1)
  f = Graph.new("B", "C", 2)
  g = Graphenliste.new(h, f)
  puts g.to_s
  puts g.getlength("A", "B", "C")
=end

  #Ansonsten folgt hier nun eine main, die mit Eingaben arbeitet
  g = Graphenliste.new()
  running = true
  while running
    puts "Neuer Graph(n), Laenge einer Strecke berechnen(l), Graphen anzeigen (d) oder beenden(q)"
    eingabe = gets.chomp
    
    if eingabe == "n"#
      puts "Knoten 1 und 2 und Laenge der Kante eingeben (je mit Enter bestaetigen):"
      h = Graph.new(gets.chomp, gets.chomp, gets.chomp.to_i)
      g.add(h)
    
    elsif eingabe == "q"
      running = false
      break
    
    elsif eingabe == "l"
      s = Array.new
      puts "Knotenpunkte eingeben und je mit Enter bestaetigen, mit \"-q\" beenden:"
      i = 0
      run = true
      while run
        puts s.to_s
        input = gets.chomp
        if input == "-q"
          run = false
        else
          s[i] = input
        end
        i += 1
      end
      puts g.getlength(*s)
    elsif eingabe == "d"
      puts g.to_s
    else
      puts "Ungueltige Eingabe! (n, q, l oder d)"
    end
    
  end

end