create or replace package body tt_p10011 as

   c_scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PRIVATE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PUBLIC ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   function get_page_help(
      p_application_id     in apex_application_pages.application_id%type,
      p_page_id            in apex_application_pages.page_id%type) return clob is

      l_help_text             apex_application_pages.help_text%type;

   begin

      select coalesce(trn.to_string,
                      ap.help_text,
                      to_clob('No help is available for this page.'))         as help_text
      into l_help_text
      from apex_application_pages ap
      left join apex_application_trans_map trnm
         on 1 = 1
         and trnm.primary_application_id = ap.application_id
         and trnm.translated_app_language = apex_util.get_session_lang
      left join apex_application_trans_repos trn
         on 1 = 1
         and trn.translated_application_id = trnm.translated_application_id
         and trn.application_id = ap.application_id
         and trn.application_page_id = ap.page_id
         and trn.internal_attribute_name = 'APEX_PAGES.HELP_TEXT'
      where 1 = 1
      and ap.application_id = p_application_id
      and ap.page_id = p_page_id;

      l_help_text := case
                        when substr(l_help_text, 1, 3) != '<p>' then '<p>'
                     end
                     || apex_application.do_substitutions(l_help_text)
                     || case
                           when substr(trim(l_help_text), -4) <> '</p>' then '</p>'
                        end;

      return l_help_text;

      exception
         when no_data_found then
            return 'No help is available for this page.';

   end get_page_help;
   --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

end tt_p10011;
/
