CLASS zcl_15_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA carrier_id    TYPE /dmo/carrier_id VALUE 'LH'.
    DATA flight_prices TYPE TABLE OF /dmo/flight_price.
    DATA flights       TYPE TABLE OF /dmo/flight.

    " SQL: SELECT <spalte1>, <spalte2>, ... from <Datenbankquelle> WHERE <Bedingung>

    " Lesender Zugriff auf einen Datensatz
    SELECT SINGLE FROM /dmo/flight
      FIELDS price
      WHERE @carrier_id = @carrier_id AND connection_id = '0400' AND flight_date = '20240707'
      INTO @DATA(flight_price).

    IF sy-subrc <> 0.
      out->write( 'nix gefunden' ).
    ENDIF.

    out->write( flight_price ).

    SELECT SINGLE FROM /dmo/flight
      FIELDS *
      WHERE carrier_id = @carrier_id AND connection_id = '0400' AND flight_date = '20240707'
      INTO @DATA(flight).

    out->write( flight ).

    " Lesender Zugriff auf mehrere Datensätze

    SELECT FROM /dmo/flight
      FIELDS price
      WHERE carrier_id = @carrier_id
      INTO TABLE @flight_prices.

    SELECT FROM /dmo/flight
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO TABLE @flights.

    out->write( flight_prices ).
    out->write( flights ).
  ENDMETHOD.
ENDCLASS.
