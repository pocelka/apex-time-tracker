prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 103
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>5001822925415156
,p_default_application_id=>103
,p_default_id_offset=>26804702900711872
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(65981057712351813)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>3531379
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(66269157637352238)
,p_build_option_name=>'Feature: About Page'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>3531379
,p_feature_identifier=>'APPLICATION_ABOUT_PAGE'
,p_build_option_comment=>'About this application page.'
);
wwv_flow_imp.component_end;
end;
/
