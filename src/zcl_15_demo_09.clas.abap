CLASS zcl_15_demo_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_09 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_flight,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             flight_date   TYPE /dmo/flight_date,
             flight_price  TYPE /dmo/flight_price,
             currency_code TYPE /dmo/currency_code,
           END OF ty_flight.

    " Deklaration einer Struktur (variablen)Ï
    DATA flight TYPE ty_flight.

    " Zugriff auf die Strukturkomponenten ('-')
    flight-carrier_id    = 'LH'.
    flight-connection_id = '0400'.
    flight-flight_date   = cl_abap_context_info=>get_system_date( ).
*  flight-flight_price  = .
*  flight-currency_code = ''.

    " base nimmt ein basis wert
    flight = VALUE #( BASE flight
                      flight_price  = '734.99'
                      currency_code = 'EUR' ).

*    out->write( flight-carrier_id ).
*    out->write( flight-connection_id ).
*    out->write( flight-flight_date ).
    out->write( flight ).
  ENDMETHOD.
ENDCLASS.
