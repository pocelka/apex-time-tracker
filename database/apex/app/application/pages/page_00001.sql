prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>5001822925415156
,p_default_application_id=>103
,p_default_id_offset=>26804702900711872
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Tasks'
,p_alias=>'TASKS'
,p_step_title=>'Time Tracker'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.actions.add([',
'   {',
'      name: "submit",',
'      action: (event, element, args) => {',
'         apex.items.P1_TASK_ID.value = args.id;',
'         apex.event.trigger(document, ''submit-task'');',
'      }',
'   }',
']);'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This page has two purposes: <br>',
'',
'    <ul>',
'        <li>User can create new task in case existing list is not complete.</li>',
'        <li>User can select a card with the task to be logged. Once selected user will be redirected to another view to provide additional details if needed.</li>',
'    </ul>',
'</p>'))
,p_page_component_map=>'13'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20240221200539'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(65250316835133922)
,p_plug_name=>'Tasks'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(66025476376351911)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  -- data',
'  id,                            -- primary key',
'  null,                          -- secondary key if needed',
'  name,                          -- title',
'  project,                       -- subtitle',
'  desc_text,                     -- card body text',
'  null as card_secondary_text,   -- card secondary text, positioned near bottom',
'',
'  -- ui and other attributes',
'  icon_image,                    -- icon class, e.g. fa-cloud',
'  null as badge,                 -- badge, can be a small text',
'  null as image_url              -- image url, url or blob columns',
'from tt_task_list',
'where 1 = 1',
'and active = ''Y''',
'and created_by = tt_core.get_session_user',
'order by',
'    project,',
'    name',
';'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(65250489881133923)
,p_region_id=>wwv_flow_imp.id(65250316835133922)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'PROJECT'
,p_body_adv_formatting=>false
,p_body_column_name=>'DESC_TEXT'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'DYNAMIC_CLASS'
,p_icon_class_column_name=>'ICON_IMAGE'
,p_icon_css_classes=>'fa-apex'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(65250701803133925)
,p_card_id=>wwv_flow_imp.id(65250489881133923)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$submit?id=&ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(65250053721133919)
,p_button_sequence=>20
,p_button_name=>'BUTTON_NEW_TASK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(66158270121352007)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create New Task'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RR,3::'
,p_button_css_classes=>'u-success'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'Y'
,p_grid_column_span=>12
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25628791400492720)
,p_name=>'P1_TASK_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(65250163852133920)
,p_name=>'Refresh Region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(65250053721133919)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(65250266888133921)
,p_event_id=>wwv_flow_imp.id(65250163852133920)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(65250316835133922)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25628567773492718)
,p_name=>'submit-task'
,p_event_sequence=>20
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'submit-task'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25628857246492721)
,p_event_id=>wwv_flow_imp.id(25628567773492718)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Mark Time'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   tt_p1.create_time_entry(p_task_id => :P1_TASK_ID);',
'end;'))
,p_attribute_02=>'P1_TASK_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25628926362492722)
,p_event_id=>wwv_flow_imp.id(25628567773492718)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Display processed message'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess("Time entered!");'
);
wwv_flow_imp.component_end;
end;
/
