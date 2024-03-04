prompt --application/plugin_settings
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>5001822925415156
,p_default_application_id=>103
,p_default_id_offset=>26804702900711872
,p_default_owner=>'APPS'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(53039475015212258)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>3531215
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(65978376877351805)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
,p_version_scn=>3531254
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(65978650470351809)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attribute_01=>'Y'
,p_version_scn=>3531254
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(65978914545351809)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attribute_01=>'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON'
,p_attribute_02=>'VISIBLE'
,p_attribute_03=>'15'
,p_attribute_04=>'FOCUS'
,p_version_scn=>3531254
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(65979267942351809)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attribute_01=>'fa-star'
,p_attribute_04=>'#VALUE#'
,p_version_scn=>3531254
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(65979582707351809)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_attribute_02=>'N'
,p_attribute_03=>'POPUP:ITEM'
,p_attribute_04=>'default'
,p_attribute_06=>'LIST'
,p_version_scn=>3531254
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(65979859408351810)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'FULL'
,p_attribute_02=>'POPUP'
,p_version_scn=>3531254
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(65980113285351810)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_version_scn=>3531254
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(65980471070351810)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH_CB'
,p_version_scn=>3531254
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(65980792909351810)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'IG'
,p_version_scn=>3531254
);
wwv_flow_imp.component_end;
end;
/
