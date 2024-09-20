CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA connection_counter TYPE i READ-ONLY.

    METHODS get_output RETURNING VALUE(r_output) TYPE string_table.

    METHODS constructor IMPORTING i_carrier_id    TYPE /DMO/Carrier_id
                                  i_connection_id TYPE /DMO/connection_id
                        RAISING   cx_abap_invalid_value.


  PRIVATE SECTION.

    DATA carrier_id TYPE /DMO/Carrier_id.
    DATA connection_id TYPE /DMO/connection_id.

    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.


    DATA carrier_name TYPE /dmo/carrier_name.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD get_output.
    APPEND |Carrier Id: { carrier_id }| TO r_output.
    APPEND |Connection Id: { connection_id }| TO r_output.
    APPEND |Airport from id: { airport_from_id }| TO r_output.
    APPEND |Airport to id: { airport_to_id }| TO r_output.
    APPEND |carrier name: { carrier_name }| TO r_output.
  ENDMETHOD.

  METHOD constructor.
    IF i_carrier_id IS INITIAL.
      RAISE EXCEPTION NEW cx_abap_invalid_value( value = 'carrier_id' ).
    ENDIF.

    IF i_connection_id IS INITIAL.
      RAISE EXCEPTION NEW cx_abap_invalid_value( value = 'i_connection_id' ).
    ENDIF.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    connection_counter += 1.

*    SELECT SINGLE FROM /DMO/Connection
*      FIELDS airport_from_id, airport_to_id
*      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
*      INTO ( @airport_from_id, @airport_to_id ).
*
*    IF sy-subrc <> 0.
*      RAISE EXCEPTION TYPE cx_abap_invalid_value.
*    ENDIF.

    SELECT SINGLE FROM /DMO/I_Connection
    FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
   WHERE AirlineID = @i_carrier_id
    AND ConnectionID = @i_connection_id
    INTO ( @airport_from_id, @airport_to_id, @carrier_name ).



  ENDMETHOD.

ENDCLASS.
