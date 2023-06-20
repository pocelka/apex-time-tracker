create or replace package tt_p8 authid current_user is

   /*!
   * Package contains routines for page 8.
   */

   function interval_to_seconds(
      p_interval  in interval day to second) return number;       -- Interval to be converted.
   /**
   Converts interval into the seconds. This function is used for pivot sum as for intervals is not supported aggregation.
   **/

   function seconds_to_hours(
      p_seconds   in number) return varchar2;                     -- Seconds to be converted.
   /**
   Converts seconds to format hh:mm:ss.
   **/

end tt_p8;
