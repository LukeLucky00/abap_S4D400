CLASS zcl_15_exercise_5_6 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_exercise_5_6 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA op TYPE c LENGTH 1 VALUE '/'.
    DATA number1 TYPE i VALUE 1.
    DATA number2 TYPE i VALUE 1.
    DATA result TYPE p LENGTH 16 DECIMALS 2.
    DATA output TYPE c LENGTH 20.




    CASE op.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '/'.
        TRY.
            result = number1 / number2.
          CATCH cx_sy_zerodivide INTO DATA(x).
            output = |Fehler: { x->get_text(  ) }|.
        ENDTRY.
      WHEN '*'.
        result = number1 * number2.
      WHEN OTHERS.
        out->write( 'Falscher Wert für op' ).
        EXIT.
    ENDCASE.

    IF output IS INITIAL.
      output = |{ number1 } { op } { number2 } = { result }|.
    ENDIF.


    out->write( output ).



    DATA max_count TYPE i VALUE 20.
    DATA numbers TYPE TABLE OF i.

    DO max_count TIMES.
      IF sy-index <= 2.
        APPEND sy-index - 1 TO numbers.
      ELSE.
        APPEND ( numbers[ sy-index - 1 ] + numbers[ sy-index - 2 ] ) TO numbers.
      ENDIF.
    ENDDO.

    out->write( numbers ).




  ENDMETHOD.
ENDCLASS.
