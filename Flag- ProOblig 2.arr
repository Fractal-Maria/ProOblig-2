use context essentials2021
fun Nordic_flag(TStripe1, Tstripe2, FStripe3, FStripe4, Background):
  frame(
    overlay-xy(rectangle(400, 25, "solid", TStripe1), 0, -111,
      overlay-xy(rectangle(25, 250, "solid", Tstripe2), -139, 0,
        overlay-xy(rectangle(50, 250, "solid", FStripe3), -125, 0,
          overlay-xy(rectangle(400, 50, "solid", FStripe4), 0, -100,
            rectangle(400, 250, "solid", Background))))))

end

#Legger farger i panekake-prinsipp. De smaleste stripene er "øverst", så det som blir under disse, som blir de tynne stripene mellom rektanglene og de innerste stripene i flagg som Norges (THIN Stripe - TStripe). Ved å gjøre alle disse rektanglene samme farge får en tilsynelatende de tykke stripene som i det danske flagget (FAT Stripe - FStripe). Fikk ikke til å sentrere rektangler rundt "stripene", så lagde det heller til en bakgrunn og lot det være ett stort rektangel som havner på bunnen i "pannekakestablen". 

#Bruker Overlay for å legge de oppå hverandre i riktig rekkefølge.

#Flaggen i rekkefølgen av Norge, Danmark, Sverige, Finland, Færøyene og Island

Nordic_flag("blue", "blue", "white", "white", "red")
Nordic_flag("white", "white","white","white", "red")
Nordic_flag("yellow", "yellow", "yellow", "yellow", "blue")
Nordic_flag("Darkblue", "Darkblue", "Darkblue", "Darkblue", "white")
Nordic_flag("red", "red", "royal-blue", "royal-blue", "white")
Nordic_flag("crimson", "crimson","white", "white", "medium-blue")

#Flagg for vidre øving, Åland - Kalmar unionen
Nordic_flag("crimson", "crimson", "gold", "gold", "blue")
Nordic_flag("crimson", "crimson", "crimson", "crimson", "gold")