prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>29631720813958193
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'DEV'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(13231172614140042)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
