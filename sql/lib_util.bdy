﻿create or replace package body lib_util is

  -- LibORA PL/SQL Library
  -- Author  : Taras Lyuklyanchuk
  -- Created : 26.11.2014 11:37:59  
  -- Purpose : PL/SQL Utillity Functions

  cursor c_user(p_user_id integer) is
    select t.* from all_users t where t.user_id = p_user_id;

  function this_user return all_users%rowtype is
  begin
  
    for q in c_user(userenv('schemaid')) loop
      return q;
    end loop;
  
    return null;
  end;

  function this_schema return varchar2 is
  begin
  
    return this_user().username;
  end;

  function this_sid return integer is
  begin
    return userenv('sid');
  end;

  function this_sessionid return integer is
  begin
    return userenv('sessionid');
  end;

  function server_db_name return varchar2 is
  begin
    return sys_context('userenv', 'db_name');
  end;

  function server_host_name return varchar2 is
  begin
    return sys_context('userenv', 'server_host');
  end;

  function server_host_address return varchar2 is
  begin
    return utl_inaddr.get_host_address(server_host_name);
  end;

  function remote_os_user return varchar2 is
  begin
    return sys_context('userenv', 'os_user');
  end;

  function remote_terminal return varchar2 is
  begin
    return sys_context('userenv', 'terminal');
  end;

  function remote_host_name return varchar2 is
  begin
    return sys_context('userenv', 'host');
  end;

  function remote_host_address return varchar2 is
  begin
    return sys_context('userenv', 'ip_address');
  end;

  procedure sleep(ms integer) is
  begin
    dbms_lock.sleep(ms / 1000);
  end;

end;
/

