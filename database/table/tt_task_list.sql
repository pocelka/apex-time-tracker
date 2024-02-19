-- drop objects
declare
   l_cnt    pls_integer;
begin
   select count(*) into l_cnt from user_tables where table_name = upper('tt_task_list');

   if (l_cnt > 0) then
      execute immediate 'drop table tt_task_list cascade constraints purge';
   end if;
end;
/

-- create tables
create table tt_task_list (
   id                number generated by default on null as identity,
   created           timestamp with time zone default current_timestamp not null,
   created_by        varchar2(255 char) default coalesce(sys_context('APEXSESSION', 'APP_USER'),
                                                         regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'),
                                                         sys_context('userenv','session_user')) not null,
   name              varchar2(100 char) not null,
   project           varchar2(50 char),
   desc_text         varchar2(500 char),
   icon_image        varchar2(100 char),
   active            varchar2(1 char) default 'Y' not null,
   reporting         varchar2(1 char) default 'Y' not null
)
;

alter table tt_task_list add constraint tt_task_list_id__pk primary key (id);

comment on table tt_task_list is 'Contains list of tasks.';

comment on column tt_task_list.id is 'Surrogate key.';
comment on column tt_task_list.created is 'Date when record was inserted.';
comment on column tt_task_list.created_by is 'Who created the record.';
comment on column tt_task_list.name is 'Task name displayed in apex application.';
comment on column tt_task_list.project is 'Name of the project to which task belongs.';
comment on column tt_task_list.desc_text is 'Short description.';
comment on column tt_task_list.icon_image is 'Contains text representation for Oracle Apex icon.';
comment on column tt_task_list.active is 'Indication whether task should be displayed in cards or not.';
comment on column tt_task_list.reporting is 'Indication whether task task should be displayed in reports or not..';