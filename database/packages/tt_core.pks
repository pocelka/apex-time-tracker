create or replace package tt_core authid current_user is

   /*!
   * Core package with for time tracker application.
   */

   function is_debug_on return boolean;
   /**
   Function returns actual state of the apex debug mode.
   **/

   function get_session_user return varchar2;
   /**
   Function returns session user. This is a helper function to have cleaner code.
   **/

end tt_core;
/
