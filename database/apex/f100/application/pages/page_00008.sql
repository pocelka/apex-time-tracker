prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>29631720813958193
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'DEV'
);
wwv_flow_imp_page.create_page(
 p_id=>8
,p_name=>'Statistics'
,p_alias=>'STATISTICS'
,p_step_title=>'Statistics'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This page shows summary statistics for time tracking application.',
'<br>',
'Results from this page can be used as an input for 3rd party tools; i.e. for company related tools.'))
,p_page_component_map=>'18'
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20231031181848'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12212915179921734)
,p_plug_name=>'Last 3 Days'
,p_region_css_classes=>'last-3'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(13046053678139740)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with',
'   cte_last_3_days as (select ',
'                           trunc(te.start_dt)      as work_date,',
'                           numtodsinterval(sum(extract(day from coalesce(te.end_dt, current_timestamp) - te.start_dt)), ''day'') +',
'                           numtodsinterval(sum(extract(hour from coalesce(te.end_dt, current_timestamp) - te.start_dt)), ''hour'') +',
'                           numtodsinterval(sum(extract(minute from coalesce(te.end_dt, current_timestamp) - te.start_dt)), ''minute'') +',
'                           numtodsinterval(sum(extract(second from coalesce(te.end_dt, current_timestamp) - te.start_dt)), ''second'') as duration',
'                        from tt_time_entry te',
'                        join tt_task_list tl',
'                           on 1 = 1',
'                           and tl.id = te.task_id',
'                        where 1 = 1',
'                        and te.created_by = tt_core.get_session_user',
'                        and te.created >= current_timestamp - interval ''14'' day',
'                        and tl.reporting = ''Y''',
'                        group by ',
'                           trunc(te.start_dt))',
'select ',
'   work_date,',
'   tt_p8.seconds_to_hours(p_seconds => tt_p8.interval_to_seconds(p_interval => duration))  as duration',
'from cte_last_3_days',
'where 1 = 1',
'order by 1 desc',
'fetch first 3 rows only',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Last 3 Days'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12213979191921744)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'DEV'
,p_internal_uid=>12213979191921744
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12214065349921745)
,p_db_column_name=>'WORK_DATE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Date'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'DATE'
,p_format_mask=>'DD.MM.RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12214199269921746)
,p_db_column_name=>'DURATION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Duration'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(13335366053733380)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133354'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WORK_DATE:DURATION'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12213009122921735)
,p_plug_name=>'Last 3 Weeks'
,p_region_css_classes=>'last-3'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(13046053678139740)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with',
'   cte_last_3_weeks as (select ',
'                           to_char(te.start_dt, ''yyyy'') ',
'                           || ''.'' ||',
'                           to_char(te.start_dt, ''iw'')             as week,',
'                           min(trunc(te.start_dt))                as date_from,',
'                           max(trunc(te.start_dt))                as date_to,',
'                           numtodsinterval(sum(extract(day from coalesce(te.end_dt, current_timestamp) - te.start_dt)), ''day'') +',
'                           numtodsinterval(sum(extract(hour from coalesce(te.end_dt, current_timestamp) - te.start_dt)), ''hour'') +',
'                           numtodsinterval(sum(extract(minute from coalesce(te.end_dt, current_timestamp) - te.start_dt)), ''minute'') +',
'                           numtodsinterval(sum(extract(second from coalesce(te.end_dt, current_timestamp) - te.start_dt)), ''second'') as duration',
'                        from tt_time_entry te',
'                        join tt_task_list tl',
'                           on 1 = 1',
'                           and tl.id = te.task_id',
'                        where 1 = 1',
'                        and te.created_by = tt_core.get_session_user',
'                        and te.created >= add_months(current_timestamp, -1)',
'                        and tl.reporting = ''Y''',
'                        group by ',
'                           to_char(te.start_dt, ''yyyy'') ',
'                           || ''.'' ||',
'                           to_char(te.start_dt, ''iw''))',
'select ',
'   week ',
'   || '' ( '' || ',
'   to_char(date_from,''dd.mm.yyyy'') ',
'   || '' - '' || ',
'   to_char(date_to,''dd.mm.yyyy'') ',
'   || '' )''                             as week,',
'   tt_p8.seconds_to_hours(p_seconds => tt_p8.interval_to_seconds(p_interval => duration))  as duration',
'from cte_last_3_weeks',
'where 1 = 1',
'order by 1 desc',
'fetch first 3 rows only',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Last 3 Weeks'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12214271951921747)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_owner=>'DEV'
,p_internal_uid=>12214271951921747
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12214395723921748)
,p_db_column_name=>'WEEK'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Week'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_format_mask=>'DD.MM.RRRR'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9406596803863221)
,p_db_column_name=>'DURATION'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Duration'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(13344199642788775)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133442'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WEEK:DURATION:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12213156558921736)
,p_plug_name=>'Weekly Report'
,p_region_name=>'weekly-report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(13036261890139734)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with',
'   cte_base_data as (select',
'                        to_char(te.start_dt, ''yyyy'')',
'                        || ''.'' ||',
'                        to_char(te.start_dt, ''iw'')                         as week,',
'                        to_char(te.start_dt, ''FmDay'')                      as day_of_week,',
'                        trunc(te.start_dt)                                 as date_from,',
'                        trunc(coalesce(te.end_dt, current_timestamp))      as date_to,',
'                        tl.name',
'                        || '' (''',
'                        || tl.project',
'                        || '')''                                             as task_name,',
'                        tt_p8.interval_to_seconds(p_interval => coalesce(te.end_dt, current_timestamp) - te.start_dt) as duration',
'                     from tt_time_entry te',
'                     join tt_task_list tl',
'                        on 1 = 1',
'                        and tl.id = te.task_id',
'                     where 1 = 1',
'                     and te.created_by = tt_core.get_session_user',
'                     and te.created >= add_months(current_timestamp, -2)',
'                     and tl.reporting = ''Y''),',
'   cte_total_calculation as (select',
'                                 week,',
'                                 task_name,',
'                                 min(date_from)       as date_from,',
'                                 max(date_to)         as date_to,',
'                                 sum(duration)        as duration',
'                              from cte_base_data',
'                              where 1 = 1',
'                              group by ',
'                                 week,',
'                                 task_name),',
'   cte_time_by_day as (select',
'                           week,',
'                           day_of_week,',
'                           task_name,',
'                           sum(duration)              as duration',
'                        from cte_base_data',
'                        where 1 = 1',
'                        group by',
'                           week,',
'                           day_of_week,',
'                           task_name),',
'   cte_time_pivot as (select *',
'                        from cte_time_by_day t',
'                        pivot (sum(duration) as sum_duration for (day_of_week) in (''Monday'' as day1,',
'                                                                                   ''Tuesday'' as day2,',
'                                                                                   ''Wednesday'' as day3,',
'                                                                                   ''Thursday'' as day4,',
'                                                                                   ''Friday'' as day5,',
'                                                                                   ''Saturday'' as day6,',
'                                                                                   ''Sunday'' as day7)) )',
'select',
'   p.week,',
'   to_char(t.date_from, ''dd.mm.yyyy'')',
'   || '' - '' ||',
'   to_char(t.date_to, ''dd.mm.yyyy'')                              as from_to,',
'   p.task_name,',
'   tt_p8.seconds_to_hours(p_seconds => p.day1_sum_duration)      as mon,',
'   tt_p8.seconds_to_hours(p_seconds => p.day2_sum_duration)      as tue,',
'   tt_p8.seconds_to_hours(p_seconds => p.day3_sum_duration)      as wed,',
'   tt_p8.seconds_to_hours(p_seconds => p.day4_sum_duration)      as thu,',
'   tt_p8.seconds_to_hours(p_seconds => p.day5_sum_duration)      as fri,',
'   tt_p8.seconds_to_hours(p_seconds => p.day6_sum_duration)      as sat,',
'   tt_p8.seconds_to_hours(p_seconds => p.day7_sum_duration)      as sun,',
'   tt_p8.seconds_to_hours(p_seconds => t.duration)                as total',
'from cte_time_pivot p',
'join cte_total_calculation t',
'   on 1 = 1',
'   and t.week = p.week',
'   and t.task_name = p.task_name',
'where 1 = 1',
'order by 1 desc',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Weekly Report'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(13339974121774825)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_control_break=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'DEV'
,p_internal_uid=>13339974121774825
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13340089727774826)
,p_db_column_name=>'WEEK'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Week'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13340177715774827)
,p_db_column_name=>'FROM_TO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'From - To'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13340205876774828)
,p_db_column_name=>'TASK_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Task'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13340348487774829)
,p_db_column_name=>'MON'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Monday'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13340427167774830)
,p_db_column_name=>'TUE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tuesday'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13340545317774831)
,p_db_column_name=>'WED'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Wednesday'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13340600262774832)
,p_db_column_name=>'THU'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Thursday'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13340736602774833)
,p_db_column_name=>'FRI'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Friday'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13340850611774834)
,p_db_column_name=>'SAT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Saturday'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13340900953774835)
,p_db_column_name=>'SUN'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Sunday'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13341008624774836)
,p_db_column_name=>'TOTAL'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Total'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(13426701707554047)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'134268'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WEEK:FROM_TO:TASK_NAME:MON:TUE:WED:THU:FRI:SAT:SUN:TOTAL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13322384091590465)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--compactTitle:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(13058487800139745)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(12942774194139617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(13120839194139805)
);
wwv_flow_imp.component_end;
end;
/
