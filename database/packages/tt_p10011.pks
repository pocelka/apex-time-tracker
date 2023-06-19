create or replace package tt_p10011 authid current_user is

   /*!
   * Package contains routines for page 10011.
   */

   function get_page_help(
      p_application_id     in apex_application_pages.application_id%type,              -- Application ID for which we are getting help.
      p_page_id            in apex_application_pages.page_id%type) return clob;        -- Page for which we are getting help.
   /**
   Returns page help text if it exists. If application is running in non-English language and translation exists function
   returns translated text instead.
   **/

end tt_p10011;
/
