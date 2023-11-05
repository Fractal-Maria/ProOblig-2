use context essentials2021
include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source

ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"

#(Kap 8.1.2 Dealing with Missing Entries) For å skape en verdi der det mangler og gjøre tabellen lesbar for Pyret og mulig å manipulere da "" ikke er en verdi, men "0" er en verdi. 

kWh-wealthy-consumer-data =
  load-table: komponent, energi
    source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer 
    sanitize komponent using string-sanitizer
end

#Sanert tabell

print(kWh-wealthy-consumer-data)

#Funksjon for å gjøre string til tall fra kolonnen "energi" (B) gir "bil" en verdi, i dette tilfellet "0". (Kap 5.4 Documenting Functiones)
fun energi-to-number(str :: String) -> Number:
  doc: "if str is not a numeric string, default to 0."
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end
where:
energi-to-number("") is 0
energi-to-number("48") is 48
end

#Tabell hvor det er tall og ikke string, (B)

transformed-table = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

print(transformed-table)

#Funksjonen for å utføre beregningen av energiforbruket for bilbruken i tabellen (1.1.8 Functiones)
fun car-energi-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel):
(distance-travelled-per-day / 
                            distance-per-unit-of-fuel) * 
                                        energy-per-unit-of-fuel
where:
  car-energi-per-day(15, 5, 6) is 18
end

distance-travelled-per-day = 15
distance-per-unit-of-fuel = 5
energy-per-unit-of-fuel = 6


#Beregne det totale energiforbruket for en typisk innbygger i et industriland. bruker funksjonen sum sammen med funskjonen car-energi-per-day.
total-energi-car = sum(transformed-table, "energi") + car-energi-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel)

total-energi-car

#visualisering av data fra tabellen
bar-chart(transformed-table, "komponent", "energi")

# Ny funksjon for å få vist korret energiforbruk for bil i visualiseringen, (kap 1.1.8 Functions)
fun energi-to-number-with-car(str :: String) -> Number:
   cases(Option) string-to-number(str):
    | some(a) => a
    | none => car-energi-per-day(15, 5, 6)
  end
where:
energi-to-number("") is 0
energi-to-number("48") is 48
end

#Siste utgave av 
transformed-table-with-car = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number-with-car)

print(transformed-table-with-car)

#Siste utgave av visualisering av bilforbruket
bar-chart(transformed-table-with-car, "komponent", "energi")