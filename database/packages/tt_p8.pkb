create or replace package body tt_p8 as

   c_scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PRIVATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PUBLIC ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   function interval_to_seconds(
      p_interval     in interval day to second) return number is
   begin

      return ((extract(day from p_interval) * 24
               + extract(hour from p_interval) ) * 60
               + extract(minute from p_interval) ) * 60
               + extract(second from p_interval);


   end interval_to_seconds;
   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   function seconds_to_hours(
      p_seconds      in number) return varchar2 is

      l_hourly_format         varchar2(10);
   begin

      l_hourly_format := to_char(trunc(p_seconds / 3600), 'fm9900')
                           || ':' ||
                           to_char(trunc(mod(p_seconds, 3600) / 60), 'fm00')
                           || ':' ||
                           to_char(mod(p_seconds, 60), 'fm00');

      return nullif(l_hourly_format, '::');

   end seconds_to_hours;
   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

end tt_p8;
