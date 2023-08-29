prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>29631720813958193
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'DEV'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Tasks'
,p_alias=>'TASKS'
,p_step_title=>'Time Tracker'
,p_autocomplete_on_off=>'OFF'
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
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20230829204243'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12211410596921719)
,p_plug_name=>'Tasks'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(12986570138139708)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_imp.id(12211583642921720)
,p_region_id=>wwv_flow_imp.id(12211410596921719)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'PROJECT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'NAME'
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
 p_id=>wwv_flow_imp.id(12211795564921722)
,p_card_id=>wwv_flow_imp.id(12211583642921720)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RR,7:P7_TASK_ID:&ID.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13239152706140095)
,p_plug_name=>'Time Tracker'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(13012759350139722)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12211147482921716)
,p_button_sequence=>10
,p_button_name=>'BUTTON_NEW_TASK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(13119363883139804)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create New Task'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RR,3::'
,p_button_css_classes=>'u-success'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'Y'
,p_grid_column_span=>12
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12211257613921717)
,p_name=>'Refresh Region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12211147482921716)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12211360649921718)
,p_event_id=>wwv_flow_imp.id(12211257613921717)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12211410596921719)
);
wwv_flow_imp.component_end;
end;
/
