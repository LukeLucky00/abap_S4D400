CLASS zcl_15_demo_11 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_11 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklaration interner tabllen
    DATA flight   TYPE z15_flight.
    DATA flights  TYPE z15_flights. " TYPE <Tabellentyp>
    DATA flights2 TYPE TABLE OF z15_flight.    " TYPE TABLE OF <Structurtype>
    DATA flights3 TYPE TABLE OF /dmo/flight.
    DATA flights4 TYPE z15_flights.


    flight-carrier_id    = 'LH'.
    flight-connection_id = '0401'.
    flight-flight_date   = sy-datlo + 50.

    " Einfügen von Datensätze
    flights = VALUE #( ( carrier_id = 'LH' connection_id = '0400' )
                       ( flight_date = sy-datlo )
                       ( )
                       ( flight_price = '777.99' carrier_id = 'UA' )
                       ( flight )
                       ( flight ) ).

    flight-flight_date -= 30.
    "Hinzufügen von Datensätzen
    APPEND flight TO flights.
    flight-flight_date -= 90.
    flights = VALUE #( BASE flights ( flight ) ).


    "Kopieren interner Tabellen
    flights2 = flights. "Da es keine Objekte sind werden die ganzen Daten kopier und nicht nur die Referenz
    flights3 = CORRESPONDING #( flights ).
    flights4 = VALUE #( FOR f IN flights ( f ) ).

    "Lesen von Datensäten
    flight = flights[ 3 ]. "per Index
    flight = flights[ carrier_id = 'LH' connection_id = '0401' ]. "per Komonete

    LOOP AT flights INTO flight WHERE connection_id > '399'.
      out->write( flight ).
    ENDLOOP.


    "Ändern von Datensätzen
    flights[ 3 ]-flight_price = '500'.
    flights[ carrier_id = 'LH' connection_id = '0401' ]-flight_price = '199.95'.


    LOOP AT flights REFERENCE INTO Data(flight2).
      flight2->currency_code = 'EUR'.
    ENDLOOP.

    "Sortieren interner Tabellen
    SORT flights2 BY carrier_id DESCENDING connection_id ASCENDING flight_date DESCENDING.



    "Löschen von Datensätzen
    DELETE flights INDEX 2.
    DELETE flights WHERE carrier_id IS INITIAL.




    out->write( flights ).
    out->write( flights2 ).
    out->write( flights3 ).
  ENDMETHOD.
ENDCLASS.
