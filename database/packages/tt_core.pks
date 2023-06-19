create or replace package tt_core authid current_user is

   /*!
   * Core package with for time tracker application.
   */

   function is_debug_on return boolean;
   /**
   Function returns actual state of the apex debug mode.
   **/

end tt_core;
/
