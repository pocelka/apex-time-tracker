prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 103
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>5001822925415156
,p_default_application_id=>103
,p_default_id_offset=>26804702900711872
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(66243166410352184)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(66008249368351889)
,p_default_dialog_template=>wwv_flow_imp.id(66003090491351886)
,p_error_template=>wwv_flow_imp.id(65993055651351879)
,p_printer_friendly_template=>wwv_flow_imp.id(66008249368351889)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(65993055651351879)
,p_default_button_template=>wwv_flow_imp.id(66158154373352006)
,p_default_region_template=>wwv_flow_imp.id(66084959916351943)
,p_default_chart_template=>wwv_flow_imp.id(66084959916351943)
,p_default_form_template=>wwv_flow_imp.id(66084959916351943)
,p_default_reportr_template=>wwv_flow_imp.id(66084959916351943)
,p_default_tabform_template=>wwv_flow_imp.id(66084959916351943)
,p_default_wizard_template=>wwv_flow_imp.id(66084959916351943)
,p_default_menur_template=>wwv_flow_imp.id(66097394038351948)
,p_default_listr_template=>wwv_flow_imp.id(66084959916351943)
,p_default_irr_template=>wwv_flow_imp.id(66075168128351937)
,p_default_report_template=>wwv_flow_imp.id(66123175379351966)
,p_default_label_template=>wwv_flow_imp.id(66155656176351999)
,p_default_menu_template=>wwv_flow_imp.id(66159745432352008)
,p_default_calendar_template=>wwv_flow_imp.id(66159827961352014)
,p_default_list_template=>wwv_flow_imp.id(66139586947351984)
,p_default_nav_list_template=>wwv_flow_imp.id(66151395464351993)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(66151395464351993)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(66145939482351989)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(66021111896351908)
,p_default_dialogr_template=>wwv_flow_imp.id(66018380594351907)
,p_default_option_label=>wwv_flow_imp.id(66155656176351999)
,p_default_required_label=>wwv_flow_imp.id(66156974015352001)
,p_default_navbar_list_template=>wwv_flow_imp.id(66145584093351988)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/23.1/')
,p_files_version=>66
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
