prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>29631720813958193
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'DEV'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(13204260172139981)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(12969343130139686)
,p_default_dialog_template=>wwv_flow_imp.id(12964184253139683)
,p_error_template=>wwv_flow_imp.id(12954149413139676)
,p_printer_friendly_template=>wwv_flow_imp.id(12969343130139686)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(12954149413139676)
,p_default_button_template=>wwv_flow_imp.id(13119248135139803)
,p_default_region_template=>wwv_flow_imp.id(13046053678139740)
,p_default_chart_template=>wwv_flow_imp.id(13046053678139740)
,p_default_form_template=>wwv_flow_imp.id(13046053678139740)
,p_default_reportr_template=>wwv_flow_imp.id(13046053678139740)
,p_default_tabform_template=>wwv_flow_imp.id(13046053678139740)
,p_default_wizard_template=>wwv_flow_imp.id(13046053678139740)
,p_default_menur_template=>wwv_flow_imp.id(13058487800139745)
,p_default_listr_template=>wwv_flow_imp.id(13046053678139740)
,p_default_irr_template=>wwv_flow_imp.id(13036261890139734)
,p_default_report_template=>wwv_flow_imp.id(13084269141139763)
,p_default_label_template=>wwv_flow_imp.id(13116749938139796)
,p_default_menu_template=>wwv_flow_imp.id(13120839194139805)
,p_default_calendar_template=>wwv_flow_imp.id(13120921723139811)
,p_default_list_template=>wwv_flow_imp.id(13100680709139781)
,p_default_nav_list_template=>wwv_flow_imp.id(13112489226139790)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(13112489226139790)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(13107033244139786)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(12982205658139705)
,p_default_dialogr_template=>wwv_flow_imp.id(12979474356139704)
,p_default_option_label=>wwv_flow_imp.id(13116749938139796)
,p_default_required_label=>wwv_flow_imp.id(13118067777139798)
,p_default_navbar_list_template=>wwv_flow_imp.id(13106677855139785)
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
