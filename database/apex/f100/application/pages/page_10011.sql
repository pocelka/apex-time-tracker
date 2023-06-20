prompt --application/pages/page_10011
begin
--   Manifest
--     PAGE: 10011
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.0'
,p_default_workspace_id=>29631720813958193
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'DEV'
);
wwv_flow_imp_page.create_page(
 p_id=>10011
,p_name=>'Help'
,p_alias=>'PAGE_HELP'
,p_page_mode=>'MODAL'
,p_step_title=>'Help'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(13230251399140035)
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'25'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20230619133352'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13240921447140117)
,p_plug_name=>'Search Dialog'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(12979474356139704)
,p_plug_display_sequence=>10
,p_function_body_language=>'PLSQL'
,p_plug_source=>'return tt_p10011.get_page_help(p_application_id => :APP_ID, p_page_id => :P10011_PAGE_ID);'
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13241391663140118)
,p_name=>'P10011_PAGE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13240921447140117)
,p_display_as=>'NATIVE_HIDDEN'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp.component_end;
end;
/
