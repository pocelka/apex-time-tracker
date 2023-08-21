create or replace package body tt_p7 as

   c_scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PRIVATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PUBLIC ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   procedure create_time_entry(
      p_task_id      in tt_task_list.id%type,
      p_details      in tt_time_entry.additional_info%type) is

      l_params          logger.tab_param;
      l_scope           logger_logs.scope%type := c_scope_prefix || 'create_time_entry';

   begin

      --I want to log debug messages only when debug mode is enabled in apex development page.
      if (tt_core.is_debug_on) then
         logger.append_param(l_params, 'p_task_id', p_task_id);
         logger.append_param(l_params, 'p_details', p_details);

         logger.log('debug', l_scope, null, l_params);
      end if;

      update tt_time_entry t
      set t.end_dt = current_timestamp
      where 1 = 1
      and t.end_dt is null
      and t.created_by = tt_core.get_session_user;

      insert into tt_time_entry(
         task_id,
         additional_info)
      values (
         p_task_id,
         p_details);

      commit;

      exception
         when others then
            logger.log_error('Unhandled Exception', l_scope, null, l_params);
            raise;
   end create_time_entry;
   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

end tt_p7;
/
