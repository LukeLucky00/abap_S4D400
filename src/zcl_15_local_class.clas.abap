CLASS zcl_15_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_local_class IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA connection  TYPE REF TO lcl_connection.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA connections TYPE TABLE OF REF TO lcl_connection.

    TRY.
        connection = NEW #( i_carrier_id = 'LH' i_connection_id = '0400' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO DATA(x).
        out->write( x->get_text(  ) ).
    ENDTRY.

    TRY.
        connection = NEW #( i_carrier_id = 'UA' i_connection_id = '1537' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO x.
        out->write( x->get_text(  ) ).
    ENDTRY.

    TRY.
        connection = NEW #( i_carrier_id = 'LH' i_connection_id = '0401' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO x.
        out->write( x->get_text(  ) ).
    ENDTRY.

    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.


    "out->write( lcl_connection=>connection_counter ).






  ENDMETHOD.
ENDCLASS.
