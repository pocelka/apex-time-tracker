prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 103
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>5001822925415156
,p_default_application_id=>103
,p_default_id_offset=>26804702900711872
,p_default_owner=>'APPS'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(66270078852352245)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
