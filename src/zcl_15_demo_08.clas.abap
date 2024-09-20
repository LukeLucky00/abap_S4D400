CLASS zcl_15_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM ZI_15_ConnectionWithCarrier
    FIELDS CarrierId, ConnectionId, AirportFromId, AirportToId, \_Flights-flight_date
    WHERE CarrierId = 'LH'
    INTO TABLE @DATA(flights).

    out->write( flights ).





  ENDMETHOD.
ENDCLASS.
