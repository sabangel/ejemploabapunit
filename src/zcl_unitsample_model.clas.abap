CLASS zcl_unitsample_model DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_mvc_model.
    ALIASES process FOR zif_mvc_model~process.

    METHODS constructor
      IMPORTING io_unitsample_dao TYPE REF TO zif_unitsample_dao OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA o_dao TYPE REF TO zif_unitsample_dao.

ENDCLASS.



CLASS zcl_unitsample_model IMPLEMENTATION.

  METHOD zif_mvc_model~process.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Consulta facturas abiertas de un cliente en un rango de fechas
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA(o_data) = CAST zcl_unitsample_data( io_data ).

    DATA t_fec_range TYPE RANGE OF d.
    t_fec_range = VALUE #( ( sign = 'I' option = 'EQ' low = o_data->get_startdate(  )  high = o_data->get_enddate( ) ) ).

    DATA(t_result) = me->o_dao->find_invoices( iv_type = 'L' iv_client = o_data->get_client(  ) iv_date_range = t_fec_range ).

    DATA t_factinfo  TYPE zcl_unitsample_data=>tt_fact_info.
    LOOP AT t_result INTO DATA(s_result).
      APPEND VALUE #( v_client = s_result-kunrg v_invoice = s_result-vbeln  v_createby = s_result-ernam ) TO t_factinfo.
    ENDLOOP.

    o_data->set_factinfo( t_factinfo ).

  ENDMETHOD.

  METHOD constructor.

    IF io_unitsample_dao IS SUPPLIED.
      me->o_dao = io_unitsample_dao.
    ELSE.
      me->o_dao = NEW zcl_unitsample_dao(  ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
