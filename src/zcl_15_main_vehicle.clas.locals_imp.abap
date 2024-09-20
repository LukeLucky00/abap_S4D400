CLASS lcl_vehicle DEFINITION.

  PUBLIC SECTION.
    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i.

    "! Beschleunbrakeigt das Fahrzeug um den eingehenden Wert
    "! @parameter value |eingehender Wert (Default 50)
    METHODS accelerate IMPORTING !value TYPE i DEFAULT 50.

    "! Bremst das Fahrzeug um den eingehenden Wert ab
    "! @parameter value | eingehender Wert (Default 50)
    "! @raising cx_abap_invalid_value | Wenn eingehender Wert größer als spped_in_kmh
    METHODS brake IMPORTING !value TYPE i DEFAULT 50 "Wenn nicht anderes Übergeben wird, wird default um 50kmh gebremst
                  RAISING   cx_abap_invalid_value.

    METHODS to_string RETURNING VALUE(dummy) TYPE string.

    METHODS constructor IMPORTING make  TYPE string "default 'LH'
                                  model TYPE string. "optional

  PRIVATE SECTION.

ENDCLASS.


CLASS lcl_vehicle IMPLEMENTATION.
  METHOD accelerate.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW cx_abap_invalid_value( ).
    ENDIF.
    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD to_string.
*  string = |{ make }, { model } ({ speed_in_kmh }kmh)|.
    RETURN |{ make }, { model } ({ speed_in_kmh }kmh)|. "Nur auf neueren Systeme
  ENDMETHOD.

  METHOD constructor.
    me->make = make.
    me->model = model.
  ENDMETHOD.


ENDCLASS.
