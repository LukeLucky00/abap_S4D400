CLASS zcl_15_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA number1 TYPE p VALUE -8 LENGTH 16 DECIMALS 2.
    DATA number2 TYPE p VALUE 3 LENGTH 16 DECIMALS 2.
    "DATA number1 TYPE i VALUE -8.
    "DATA number2 TYPE i VALUE 3.

    DATA result TYPE p LENGTH 16 DECIMALS 2.
    result = number1 / number2.
    "DATA(result) = number1 / number2.

    DATA(output) = |{ number1 }/{ number2 }={ result }|.

    out->write( output ).


  ENDMETHOD.
ENDCLASS.
