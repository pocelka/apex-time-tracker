set define '&'
set verify off

prompt
prompt
prompt Un-Installing Time Tracker components
prompt

spool uninstall.log

whenever sqlerror exit failure rollback
whenever oserror exit failure rollback

accept ws char prompt 'Provide APEX workspace name : '
accept app char prompt 'Provide application name : '


declare
   l_workspace_id       apex_workspaces.workspace_id%type;
   l_application_id     apex_applications.application_id%type;
begin

   select
      ws.workspace_id,
      app.application_id
   into
      l_workspace_id,
      l_application_id
   from
      apex_workspaces      ws,
      apex_applications    app
   where 1 = 1
   and app.workspace = upper('&ws')
   and app.application_name = '&app'
   and app.workspace = ws.workspace;

   apex_application_install.set_workspace_id(l_workspace_id);
   apex_application_install.remove_application(l_application_id);

end;
/

drop package tt_core;
drop package tt_p7;
drop package tt_p8;
drop package tt_p10011;

drop table tt_time_entry;
drop table tt_task_list;

spool off
