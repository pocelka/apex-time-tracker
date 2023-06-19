create or replace package tt_p7 authid current_user is

   /*!
   * Package contains routines for page 7.
   */

   procedure create_time_entry(
      p_task_id             in tt_task_list.id%type,                    -- Task for which new entry will be created.
      p_details             in tt_time_entry.additional_info%type);     -- Additional details for new entry.
   /**
   Procedure is used to handle time entries. It ends previous entry and adds new row with new entry.
   **/

end tt_p7;
/
