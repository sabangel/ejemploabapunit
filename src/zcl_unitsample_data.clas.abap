CLASS zcl_unitsample_data DEFINITION
  PUBLIC
  CREATE PUBLIC
  INHERITING FROM zcl_mvc_data.

  PUBLIC SECTION.

    TYPES: BEGIN OF ty_fact_info,
             v_client   TYPE kunnr,
             v_invoice  TYPE vbeln,
             v_createby TYPE sy-uname,
           END OF ty_fact_info.

    TYPES tt_fact_info TYPE STANDARD TABLE OF ty_fact_info WITH DEFAULT KEY.

    METHODS set_client
      IMPORTING iv_client TYPE kunnr.

    METHODS get_client
      RETURNING VALUE(rv_client) TYPE kunnr.

    METHODS set_startdate
      IMPORTING iv_startdate TYPE d.

    METHODS get_startdate
      RETURNING VALUE(rv_startdate) TYPE d.

    METHODS set_enddate
      IMPORTING iv_enddate TYPE d.

    METHODS get_enddate
      RETURNING VALUE(rv_enddate) TYPE d.

    METHODS set_factinfo
      IMPORTING it_factinfo TYPE tt_fact_info.

    METHODS get_factinfo
      RETURNING VALUE(rt_factinfo) TYPE tt_fact_info.

  PRIVATE SECTION.

    DATA v_client    TYPE kunnr.
    DATA v_startdate TYPE d.
    DATA v_enddate   TYPE d.

    DATA t_fact_info TYPE tt_fact_info.

ENDCLASS.



CLASS zcl_unitsample_data IMPLEMENTATION.

  METHOD set_client.
    me->v_client = iv_client.
  ENDMETHOD.

  METHOD get_client.
    rv_client = me->v_client.
  ENDMETHOD.

  METHOD set_startdate.
    me->v_startdate = iv_startdate.
  ENDMETHOD.

  METHOD get_startdate.
    rv_startdate = me->v_startdate.
  ENDMETHOD.

  METHOD set_enddate.
    me->v_enddate = iv_enddate.
  ENDMETHOD.

  METHOD get_enddate.
    rv_enddate = me->v_enddate.
  ENDMETHOD.

  METHOD set_factinfo.
    me->t_fact_info = it_factinfo.
  ENDMETHOD.

  METHOD get_factinfo.
    rt_factinfo = me->t_fact_info.
  ENDMETHOD.

ENDCLASS.
