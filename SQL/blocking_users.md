-- #################################################
-- Get a list of blocking users
-- #################################################

    SELECT
      spid
    , loginame
    , nt_username
    , hostname
    , program_name
    , blocked
    , datediff(ss, last_batch, getdate()) duration
    , waitresource
    , db_name(dbid) as Db
    , status
    , cmd
    , login_time
    , (SELECT text
        FROM sys.dm_exec_sql_text(sql_handle)) AS sql_text
    FROM
        sys.sysprocesses
    WHERE
    (blocked > 0) or (waitresource != '')
    
    UNION

    SELECT
        spid
    , loginame
    , nt_username
    , hostname
    , program_name
    , blocked
    , datediff(ss, last_batch, getdate()) duration
    , waitresource
    , db_name(dbid) as Db
    , status
    , cmd
    , login_time
    , (select text
        from sys.dm_exec_sql_text(sql_handle)) AS sql_text
    FROM
        sys.sysprocesses
    WHERE
spid in (SELECT blocked
    FROM sys.sysprocesses
    WHERE blocked > 0)
