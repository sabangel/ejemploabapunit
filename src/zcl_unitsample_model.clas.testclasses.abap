*"* use this source file for your ABAP unit test classes
CLASS ltcl_unitsample_model DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS process_ok FOR TESTING RAISING cx_static_check.
    METHODS process_bad FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_unitsample_model IMPLEMENTATION.

  METHOD process_ok.

    DATA(o_data) = NEW zcl_unitsample_data( ).

    DATA(o_dao_mock) = NEW lcl_dao_mock(  ).
    DATA(o_sample) = NEW zcl_unitsample_model( io_unitsample_dao = o_dao_mock  ).

    "----------------------------------------
    "Preparar entrada
    "----------------------------------------
    o_data->set_client( '0000000001' ).
    o_data->set_startdate( '20200313' ).
    o_data->set_enddate( '20200513' ).

    "----------------------------------------
    "Ejecutar método a probar
    "----------------------------------------
    o_sample->process( io_data = o_data ).

    "----------------------------------------
    "Preparar resultado esperado
    "----------------------------------------
    DATA(t_invoice_exp) = VALUE zcl_unitsample_data=>tt_fact_info(
        ( v_invoice =  '9000000001' v_client = '20000001' v_createby = 'USER1' )
        ( v_invoice =  '9000000002' v_client = '20000002' v_createby = 'USER2' )
        ( v_invoice =  '9000000003' v_client = '20000003' v_createby = 'USER3' )
    ).

    "----------------------------------------
    "Realizar comparación
    "----------------------------------------
    cl_abap_unit_assert=>assert_equals(
      act = o_data->get_factinfo(  )
      exp = t_invoice_exp
    ).

  ENDMETHOD.

  METHOD process_bad.

    DATA(o_data) = NEW zcl_unitsample_data( ).

    DATA(o_dao_mock) = NEW lcl_dao_mock(  ).
    DATA(o_sample) = NEW zcl_unitsample_model( io_unitsample_dao = o_dao_mock  ).

    "----------------------------------------
    "Preparar entrada
    "----------------------------------------
    o_data->set_client( '0000000001' ).
    o_data->set_startdate( '20200313' ).
    o_data->set_enddate( '20200213' ).

    "----------------------------------------
    "Ejecutar método a probar
    "----------------------------------------
    TRY.
        o_sample->process( io_data = o_data ).
        cl_abap_unit_assert=>fail( 'Este caso debe levanta excepción' ).
      CATCH cx_static_check INTO DATA(o_ex).
        "----------------------------------------
        "Comparar resultado esperado
        "----------------------------------------
        cl_abap_unit_assert=>assert_equals(
          act = o_ex->textid
          exp = zcx_unitsample=>bad_date
        ).
    ENDTRY.


  ENDMETHOD.

ENDCLASS.
