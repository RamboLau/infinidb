-- Copyright (c) 2007, 2013, Oracle and/or its affiliates. All rights reserved.
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; version 2 of the License.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA

--
-- The system tables of MySQL Server
--

create database mysql;
use mysql;

set sql_mode='';
set storage_engine=myisam;

CREATE TABLE IF NOT EXISTS db (   Host char(60) binary DEFAULT '' NOT NULL, Db char(64) binary DEFAULT '' NOT NULL, User char(16) binary DEFAULT '' NOT NULL, Select_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Insert_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Update_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Delete_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Create_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Drop_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Grant_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, References_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Index_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Alter_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Create_tmp_table_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Lock_tables_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Create_view_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Show_view_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Create_routine_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Alter_routine_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Execute_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Event_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Trigger_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, PRIMARY KEY Host (Host,Db,User), KEY User (User) ) engine=MyISAM CHARACTER SET utf8 COLLATE utf8_bin comment='Database privileges';

-- Remember for later if db table already existed
set @had_db_table= @@warning_count != 0;

CREATE TABLE IF NOT EXISTS user (   Host char(60) binary DEFAULT '' NOT NULL, User char(16) binary DEFAULT '' NOT NULL, Password char(41) character set latin1 collate latin1_bin DEFAULT '' NOT NULL, Select_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Insert_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Update_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Delete_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Create_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Drop_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Reload_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Shutdown_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Process_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, File_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Grant_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, References_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Index_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Alter_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Show_db_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Super_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Create_tmp_table_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Lock_tables_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Execute_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Repl_slave_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Repl_client_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Create_view_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Show_view_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Create_routine_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Alter_routine_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Create_user_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Event_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Trigger_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, Create_tablespace_priv enum('N','Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, ssl_type enum('','ANY','X509', 'SPECIFIED') COLLATE utf8_general_ci DEFAULT '' NOT NULL, ssl_cipher BLOB NOT NULL, x509_issuer BLOB NOT NULL, x509_subject BLOB NOT NULL, max_questions int(11) unsigned DEFAULT 0  NOT NULL, max_updates int(11) unsigned DEFAULT 0  NOT NULL, max_connections int(11) unsigned DEFAULT 0  NOT NULL, max_user_connections int(11) unsigned DEFAULT 0  NOT NULL, plugin char(64) DEFAULT '', authentication_string TEXT, password_expired ENUM('N', 'Y') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, PRIMARY KEY Host (Host,User) ) engine=MyISAM CHARACTER SET utf8 COLLATE utf8_bin comment='Users and global privileges';

-- Remember for later if user table already existed
set @had_user_table= @@warning_count != 0;


CREATE TABLE IF NOT EXISTS func (  name char(64) binary DEFAULT '' NOT NULL, ret tinyint(1) DEFAULT '0' NOT NULL, dl char(128) DEFAULT '' NOT NULL, type enum ('function','aggregate') COLLATE utf8_general_ci NOT NULL, PRIMARY KEY (name) ) engine=MyISAM CHARACTER SET utf8 COLLATE utf8_bin   comment='User defined functions';


CREATE TABLE IF NOT EXISTS plugin ( name varchar(64) DEFAULT '' NOT NULL, dl varchar(128) DEFAULT '' NOT NULL, PRIMARY KEY (name) ) engine=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci comment='MySQL plugins';


CREATE TABLE IF NOT EXISTS servers ( Server_name char(64) NOT NULL DEFAULT '', Host char(64) NOT NULL DEFAULT '', Db char(64) NOT NULL DEFAULT '', Username char(64) NOT NULL DEFAULT '', Password char(64) NOT NULL DEFAULT '', Port INT(4) NOT NULL DEFAULT '0', Socket char(64) NOT NULL DEFAULT '', Wrapper char(64) NOT NULL DEFAULT '', Owner char(64) NOT NULL DEFAULT '', PRIMARY KEY (Server_name)) CHARACTER SET utf8 comment='MySQL Foreign Servers table';


CREATE TABLE IF NOT EXISTS tables_priv ( Host char(60) binary DEFAULT '' NOT NULL, Db char(64) binary DEFAULT '' NOT NULL, User char(16) binary DEFAULT '' NOT NULL, Table_name char(64) binary DEFAULT '' NOT NULL, Grantor char(77) DEFAULT '' NOT NULL, Timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, Table_priv set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') COLLATE utf8_general_ci DEFAULT '' NOT NULL, Column_priv set('Select','Insert','Update','References') COLLATE utf8_general_ci DEFAULT '' NOT NULL, PRIMARY KEY (Host,Db,User,Table_name), KEY Grantor (Grantor) ) engine=MyISAM CHARACTER SET utf8 COLLATE utf8_bin   comment='Table privileges';

CREATE TABLE IF NOT EXISTS columns_priv ( Host char(60) binary DEFAULT '' NOT NULL, Db char(64) binary DEFAULT '' NOT NULL, User char(16) binary DEFAULT '' NOT NULL, Table_name char(64) binary DEFAULT '' NOT NULL, Column_name char(64) binary DEFAULT '' NOT NULL, Timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, Column_priv set('Select','Insert','Update','References') COLLATE utf8_general_ci DEFAULT '' NOT NULL, PRIMARY KEY (Host,Db,User,Table_name,Column_name) ) engine=MyISAM CHARACTER SET utf8 COLLATE utf8_bin   comment='Column privileges';


CREATE TABLE IF NOT EXISTS help_topic ( help_topic_id int unsigned not null, name char(64) not null, help_category_id smallint unsigned not null, description text not null, example text not null, url text not null, primary key (help_topic_id), unique index (name) ) engine=MyISAM CHARACTER SET utf8 comment='help topics';


CREATE TABLE IF NOT EXISTS help_category ( help_category_id smallint unsigned not null, name  char(64) not null, parent_category_id smallint unsigned null, url text not null, primary key (help_category_id), unique index (name) ) engine=MyISAM CHARACTER SET utf8 comment='help categories';


CREATE TABLE IF NOT EXISTS help_relation ( help_topic_id int unsigned not null references help_topic, help_keyword_id  int unsigned not null references help_keyword, primary key (help_keyword_id, help_topic_id) ) engine=MyISAM CHARACTER SET utf8 comment='keyword-topic relation';


CREATE TABLE IF NOT EXISTS help_keyword (   help_keyword_id  int unsigned not null, name char(64) not null, primary key (help_keyword_id), unique index (name) ) engine=MyISAM CHARACTER SET utf8 comment='help keywords';


CREATE TABLE IF NOT EXISTS time_zone_name (   Name char(64) NOT NULL, Time_zone_id int unsigned NOT NULL, PRIMARY KEY Name (Name) ) engine=MyISAM CHARACTER SET utf8   comment='Time zone names';


CREATE TABLE IF NOT EXISTS time_zone (   Time_zone_id int unsigned NOT NULL auto_increment, Use_leap_seconds enum('Y','N') COLLATE utf8_general_ci DEFAULT 'N' NOT NULL, PRIMARY KEY TzId (Time_zone_id) ) engine=MyISAM CHARACTER SET utf8   comment='Time zones';


CREATE TABLE IF NOT EXISTS time_zone_transition (   Time_zone_id int unsigned NOT NULL, Transition_time bigint signed NOT NULL, Transition_type_id int unsigned NOT NULL, PRIMARY KEY TzIdTranTime (Time_zone_id, Transition_time) ) engine=MyISAM CHARACTER SET utf8   comment='Time zone transitions';


CREATE TABLE IF NOT EXISTS time_zone_transition_type (   Time_zone_id int unsigned NOT NULL, Transition_type_id int unsigned NOT NULL, Offset int signed DEFAULT 0 NOT NULL, Is_DST tinyint unsigned DEFAULT 0 NOT NULL, Abbreviation char(8) DEFAULT '' NOT NULL, PRIMARY KEY TzIdTrTId (Time_zone_id, Transition_type_id) ) engine=MyISAM CHARACTER SET utf8   comment='Time zone transition types';


CREATE TABLE IF NOT EXISTS time_zone_leap_second (   Transition_time bigint signed NOT NULL, Correction int signed NOT NULL, PRIMARY KEY TranTime (Transition_time) ) engine=MyISAM CHARACTER SET utf8   comment='Leap seconds information for time zones';


CREATE TABLE IF NOT EXISTS proc (db char(64) collate utf8_bin DEFAULT '' NOT NULL, name char(64) DEFAULT '' NOT NULL, type enum('FUNCTION','PROCEDURE') NOT NULL, specific_name char(64) DEFAULT '' NOT NULL, language enum('SQL') DEFAULT 'SQL' NOT NULL, sql_data_access enum( 'CONTAINS_SQL', 'NO_SQL', 'READS_SQL_DATA', 'MODIFIES_SQL_DATA') DEFAULT 'CONTAINS_SQL' NOT NULL, is_deterministic enum('YES','NO') DEFAULT 'NO' NOT NULL, security_type enum('INVOKER','DEFINER') DEFAULT 'DEFINER' NOT NULL, param_list blob NOT NULL, returns longblob DEFAULT '' NOT NULL, body longblob NOT NULL, definer char(77) collate utf8_bin DEFAULT '' NOT NULL, created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, modified timestamp NOT NULL DEFAULT '0000-00-00 00:00:00', sql_mode set( 'REAL_AS_FLOAT', 'PIPES_AS_CONCAT', 'ANSI_QUOTES', 'IGNORE_SPACE', 'NOT_USED', 'ONLY_FULL_GROUP_BY', 'NO_UNSIGNED_SUBTRACTION', 'NO_DIR_IN_CREATE', 'POSTGRESQL', 'ORACLE', 'MSSQL', 'DB2', 'MAXDB', 'NO_KEY_OPTIONS', 'NO_TABLE_OPTIONS', 'NO_FIELD_OPTIONS', 'MYSQL323', 'MYSQL40', 'ANSI', 'NO_AUTO_VALUE_ON_ZERO', 'NO_BACKSLASH_ESCAPES', 'STRICT_TRANS_TABLES', 'STRICT_ALL_TABLES', 'NO_ZERO_IN_DATE', 'NO_ZERO_DATE', 'INVALID_DATES', 'ERROR_FOR_DIVISION_BY_ZERO', 'TRADITIONAL', 'NO_AUTO_CREATE_USER', 'HIGH_NOT_PRECEDENCE', 'NO_ENGINE_SUBSTITUTION', 'PAD_CHAR_TO_FULL_LENGTH') DEFAULT '' NOT NULL, comment text collate utf8_bin NOT NULL, character_set_client char(32) collate utf8_bin, collation_connection char(32) collate utf8_bin, db_collation char(32) collate utf8_bin, body_utf8 longblob, PRIMARY KEY (db,name,type)) engine=MyISAM character set utf8 comment='Stored Procedures';

CREATE TABLE IF NOT EXISTS procs_priv ( Host char(60) binary DEFAULT '' NOT NULL, Db char(64) binary DEFAULT '' NOT NULL, User char(16) binary DEFAULT '' NOT NULL, Routine_name char(64) COLLATE utf8_general_ci DEFAULT '' NOT NULL, Routine_type enum('FUNCTION','PROCEDURE') NOT NULL, Grantor char(77) DEFAULT '' NOT NULL, Proc_priv set('Execute','Alter Routine','Grant') COLLATE utf8_general_ci DEFAULT '' NOT NULL, Timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, PRIMARY KEY (Host,Db,User,Routine_name,Routine_type), KEY Grantor (Grantor) ) engine=MyISAM CHARACTER SET utf8 COLLATE utf8_bin   comment='Procedure privileges';

-- Create general_log if CSV is enabled.
SET @have_csv = (SELECT support FROM information_schema.engines WHERE engine = 'CSV');
SET @str = IF (@have_csv = 'YES', 'CREATE TABLE IF NOT EXISTS general_log (event_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, user_host MEDIUMTEXT NOT NULL, thread_id BIGINT(21) UNSIGNED NOT NULL, server_id INTEGER UNSIGNED NOT NULL, command_type VARCHAR(64) NOT NULL, argument MEDIUMTEXT NOT NULL) engine=CSV CHARACTER SET utf8 comment="General log"', 'SET @dummy = 0');

PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

-- Create slow_log if CSV is enabled.

SET @str = IF (@have_csv = 'YES', 'CREATE TABLE IF NOT EXISTS slow_log (start_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, user_host MEDIUMTEXT NOT NULL, query_time TIME NOT NULL, lock_time TIME NOT NULL, rows_sent INTEGER NOT NULL, rows_examined INTEGER NOT NULL, db VARCHAR(512) NOT NULL, last_insert_id INTEGER NOT NULL, insert_id INTEGER NOT NULL, server_id INTEGER UNSIGNED NOT NULL, sql_text MEDIUMTEXT NOT NULL, thread_id BIGINT(21) UNSIGNED NOT NULL) engine=CSV CHARACTER SET utf8 comment="Slow log"', 'SET @dummy = 0');

PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

CREATE TABLE IF NOT EXISTS event ( db char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '', name char(64) CHARACTER SET utf8 NOT NULL default '', body longblob NOT NULL, definer char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '', execute_at DATETIME default NULL, interval_value int(11) default NULL, interval_field ENUM('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') default NULL, created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, modified TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00', last_executed DATETIME default NULL, starts DATETIME default NULL, ends DATETIME default NULL, status ENUM('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL default 'ENABLED', on_completion ENUM('DROP','PRESERVE') NOT NULL default 'DROP', sql_mode  set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') DEFAULT '' NOT NULL, comment char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '', originator INTEGER UNSIGNED NOT NULL, time_zone char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM', character_set_client char(32) collate utf8_bin, collation_connection char(32) collate utf8_bin, db_collation char(32) collate utf8_bin, body_utf8 longblob, PRIMARY KEY (db, name) ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT 'Events';


CREATE TABLE IF NOT EXISTS ndb_binlog_index (Position BIGINT UNSIGNED NOT NULL, File VARCHAR(255) NOT NULL, epoch BIGINT UNSIGNED NOT NULL, inserts INT UNSIGNED NOT NULL, updates INT UNSIGNED NOT NULL, deletes INT UNSIGNED NOT NULL, schemaops INT UNSIGNED NOT NULL, orig_server_id INT UNSIGNED NOT NULL, orig_epoch BIGINT UNSIGNED NOT NULL, gci INT UNSIGNED NOT NULL, PRIMARY KEY(epoch, orig_server_id, orig_epoch)) ENGINE=MYISAM;

SET @sql_mode_orig=@@SESSION.sql_mode;
SET SESSION sql_mode='NO_ENGINE_SUBSTITUTION';

SET @create_innodb_table_stats="CREATE TABLE IF NOT EXISTS innodb_table_stats (
	database_name			VARCHAR(64) NOT NULL,
	table_name			VARCHAR(64) NOT NULL,
	last_update			TIMESTAMP NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	n_rows				BIGINT UNSIGNED NOT NULL,
	clustered_index_size		BIGINT UNSIGNED NOT NULL,
	sum_of_other_index_sizes	BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (database_name, table_name)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0";

SET @create_innodb_index_stats="CREATE TABLE IF NOT EXISTS innodb_index_stats (
	database_name			VARCHAR(64) NOT NULL,
	table_name			VARCHAR(64) NOT NULL,
	index_name			VARCHAR(64) NOT NULL,
	last_update			TIMESTAMP NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	/* there are at least:
	stat_name='size'
	stat_name='n_leaf_pages'
	stat_name='n_diff_pfx%' */
	stat_name			VARCHAR(64) NOT NULL,
	stat_value			BIGINT UNSIGNED NOT NULL,
	sample_size			BIGINT UNSIGNED,
	stat_description		VARCHAR(1024) NOT NULL,
	PRIMARY KEY (database_name, table_name, index_name, stat_name)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0";

set @have_innodb= (select count(engine) from information_schema.engines where engine='INNODB' and support != 'NO');

SET @str=IF(@have_innodb <> 0, @create_innodb_table_stats, "SET @dummy = 0");
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_innodb <> 0, @create_innodb_index_stats, "SET @dummy = 0");
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET SESSION sql_mode=@sql_mode_orig;

SET @cmd="CREATE TABLE IF NOT EXISTS slave_relay_log_info (
  Number_of_lines INTEGER UNSIGNED NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.', 
  Relay_log_name TEXT CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the current relay log file.', 
  Relay_log_pos BIGINT UNSIGNED NOT NULL COMMENT 'The relay log position of the last executed event.', 
  Master_log_name TEXT CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log file from which the events in the relay log file were read.', 
  Master_log_pos BIGINT UNSIGNED NOT NULL COMMENT 'The master log position of the last executed event.', 
  Sql_delay INTEGER NOT NULL COMMENT 'The number of seconds that the slave must lag behind the master.', 
  Number_of_workers INTEGER UNSIGNED NOT NULL,
  Id INTEGER UNSIGNED NOT NULL COMMENT 'Internal Id that uniquely identifies this record.',  
  PRIMARY KEY(Id)) DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT 'Relay Log Information'";

SET @str=IF(@have_innodb <> 0, CONCAT(@cmd, ' ENGINE= INNODB;'), CONCAT(@cmd, ' ENGINE= MYISAM;'));
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @cmd= "CREATE TABLE IF NOT EXISTS slave_master_info (
  Number_of_lines INTEGER UNSIGNED NOT NULL COMMENT 'Number of lines in the file.', 
  Master_log_name TEXT CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.', 
  Master_log_pos BIGINT UNSIGNED NOT NULL COMMENT 'The master log position of the last read event.', 
  Host CHAR(64) CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The host name of the master.', 
  User_name TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The user name used to connect to the master.', 
  User_password TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The password used to connect to the master.', 
  Port INTEGER UNSIGNED NOT NULL COMMENT 'The network port used to connect to the master.', 
  Connect_retry INTEGER UNSIGNED NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.', 
  Enabled_ssl BOOLEAN NOT NULL COMMENT 'Indicates whether the server supports SSL connections.', 
  Ssl_ca TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Authority (CA) certificate.', 
  Ssl_capath TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path to the Certificate Authority (CA) certificates.', 
  Ssl_cert TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL certificate file.', 
  Ssl_cipher TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the cipher in use for the SSL connection.', 
  Ssl_key TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL key file.', 
  Ssl_verify_server_cert BOOLEAN NOT NULL COMMENT 'Whether to verify the server certificate.', 
  Heartbeat FLOAT NOT NULL COMMENT '', 
  Bind TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Displays which interface is employed when connecting to the MySQL server', 
  Ignored_server_ids TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs', 
  Uuid TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The master server uuid.', 
  Retry_count BIGINT UNSIGNED NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.', 
  Ssl_crl TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Revocation List (CRL)', 
  Ssl_crlpath TEXT CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path used for Certificate Revocation List (CRL) files', 
  Enabled_auto_position BOOLEAN NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.', 
  PRIMARY KEY(Host, Port)) DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT 'Master Information'";

SET @str=IF(@have_innodb <> 0, CONCAT(@cmd, ' ENGINE= INNODB;'), CONCAT(@cmd, ' ENGINE= MYISAM;'));
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @cmd= "CREATE TABLE IF NOT EXISTS slave_worker_info (
  Id INTEGER UNSIGNED NOT NULL, 
  Relay_log_name TEXT CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
  Relay_log_pos BIGINT UNSIGNED NOT NULL, 
  Master_log_name TEXT CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
  Master_log_pos BIGINT UNSIGNED NOT NULL, 
  Checkpoint_relay_log_name TEXT CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
  Checkpoint_relay_log_pos BIGINT UNSIGNED NOT NULL, 
  Checkpoint_master_log_name TEXT CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
  Checkpoint_master_log_pos BIGINT UNSIGNED NOT NULL, 
  Checkpoint_seqno INT UNSIGNED NOT NULL, 
  Checkpoint_group_size INTEGER UNSIGNED NOT NULL, 
  Checkpoint_group_bitmap BLOB NOT NULL, 
  PRIMARY KEY(Id)) DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT 'Worker Information'";

SET @str=IF(@have_innodb <> 0, CONCAT(@cmd, ' ENGINE= INNODB;'), CONCAT(@cmd, ' ENGINE= MYISAM;'));
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- PERFORMANCE SCHEMA INSTALLATION
-- Note that this script is also reused by mysql_upgrade,
-- so we have to be very careful here to not destroy any
-- existing database named 'performance_schema' if it
-- can contain user data.
-- In case of downgrade, it's ok to drop unknown tables
-- from a future version, as long as they belong to the
-- performance schema engine.
--

set @have_old_pfs= (select count(*) from information_schema.schemata where schema_name='performance_schema');

SET @cmd="SET @broken_tables = (select count(*) from information_schema.tables"
  " where engine != \'PERFORMANCE_SCHEMA\' and table_schema=\'performance_schema\')";

-- Work around for bug#49542
SET @str = IF(@have_old_pfs = 1, @cmd, 'SET @broken_tables = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @cmd="SET @broken_views = (select count(*) from information_schema.views"
  " where table_schema='performance_schema')";

-- Work around for bug#49542
SET @str = IF(@have_old_pfs = 1, @cmd, 'SET @broken_views = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @broken_routines = (select count(*) from mysql.proc where db='performance_schema');

SET @broken_events = (select count(*) from mysql.event where db='performance_schema');

SET @broken_pfs= (select @broken_tables + @broken_views + @broken_routines + @broken_events);

--
-- The performance schema database.
-- Only drop and create the database if this is safe (no broken_pfs).
-- This database is created, even in --without-perfschema builds,
-- so that the database name is always reserved by the MySQL implementation.
--

SET @cmd= "DROP DATABASE IF EXISTS performance_schema";

SET @str = IF(@broken_pfs = 0, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @cmd= "CREATE DATABASE performance_schema character set utf8";

SET @str = IF(@broken_pfs = 0, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- From this point, only create the performance schema tables
-- if the server is built with performance schema
--

set @have_pfs= (select count(engine) from information_schema.engines where engine='PERFORMANCE_SCHEMA' and support != 'NO');

--
-- TABLE COND_INSTANCES
--

SET @cmd="CREATE TABLE performance_schema.cond_instances("
  "NAME VARCHAR(128) not null,"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_WAITS_CURRENT
--

SET @cmd="CREATE TABLE performance_schema.events_waits_current("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_ID BIGINT unsigned not null,"
  "END_EVENT_ID BIGINT unsigned,"
  "EVENT_NAME VARCHAR(128) not null,"
  "SOURCE VARCHAR(64),"
  "TIMER_START BIGINT unsigned,"
  "TIMER_END BIGINT unsigned,"
  "TIMER_WAIT BIGINT unsigned,"
  "SPINS INTEGER unsigned,"
  "OBJECT_SCHEMA VARCHAR(64),"
  "OBJECT_NAME VARCHAR(512),"
  "INDEX_NAME VARCHAR(64),"
  "OBJECT_TYPE VARCHAR(64),"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned not null,"
  "NESTING_EVENT_ID BIGINT unsigned,"
  "NESTING_EVENT_TYPE ENUM('STATEMENT', 'STAGE', 'WAIT'),"
  "OPERATION VARCHAR(32) not null,"
  "NUMBER_OF_BYTES BIGINT,"
  "FLAGS INTEGER unsigned"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_WAITS_HISTORY
--

SET @cmd="CREATE TABLE performance_schema.events_waits_history("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_ID BIGINT unsigned not null,"
  "END_EVENT_ID BIGINT unsigned,"
  "EVENT_NAME VARCHAR(128) not null,"
  "SOURCE VARCHAR(64),"
  "TIMER_START BIGINT unsigned,"
  "TIMER_END BIGINT unsigned,"
  "TIMER_WAIT BIGINT unsigned,"
  "SPINS INTEGER unsigned,"
  "OBJECT_SCHEMA VARCHAR(64),"
  "OBJECT_NAME VARCHAR(512),"
  "INDEX_NAME VARCHAR(64),"
  "OBJECT_TYPE VARCHAR(64),"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned not null,"
  "NESTING_EVENT_ID BIGINT unsigned,"
  "NESTING_EVENT_TYPE ENUM('STATEMENT', 'STAGE', 'WAIT'),"
  "OPERATION VARCHAR(32) not null,"
  "NUMBER_OF_BYTES BIGINT,"
  "FLAGS INTEGER unsigned"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_WAITS_HISTORY_LONG
--

SET @cmd="CREATE TABLE performance_schema.events_waits_history_long("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_ID BIGINT unsigned not null,"
  "END_EVENT_ID BIGINT unsigned,"
  "EVENT_NAME VARCHAR(128) not null,"
  "SOURCE VARCHAR(64),"
  "TIMER_START BIGINT unsigned,"
  "TIMER_END BIGINT unsigned,"
  "TIMER_WAIT BIGINT unsigned,"
  "SPINS INTEGER unsigned,"
  "OBJECT_SCHEMA VARCHAR(64),"
  "OBJECT_NAME VARCHAR(512),"
  "INDEX_NAME VARCHAR(64),"
  "OBJECT_TYPE VARCHAR(64),"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned not null,"
  "NESTING_EVENT_ID BIGINT unsigned,"
  "NESTING_EVENT_TYPE ENUM('STATEMENT', 'STAGE', 'WAIT'),"
  "OPERATION VARCHAR(32) not null,"
  "NUMBER_OF_BYTES BIGINT,"
  "FLAGS INTEGER unsigned"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_WAITS_SUMMARY_BY_INSTANCE
--

SET @cmd="CREATE TABLE performance_schema.events_waits_summary_by_instance("
  "EVENT_NAME VARCHAR(128) not null,"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_WAITS_SUMMARY_BY_HOST_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_waits_summary_by_host_by_event_name("
  "HOST CHAR(60) collate utf8_bin default null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_WAITS_SUMMARY_BY_USER_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_waits_summary_by_user_by_event_name("
  "USER CHAR(16) collate utf8_bin default null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_WAITS_SUMMARY_BY_ACCOUNT_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_waits_summary_by_account_by_event_name("
  "USER CHAR(16) collate utf8_bin default null,"
  "HOST CHAR(60) collate utf8_bin default null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_WAITS_SUMMARY_BY_THREAD_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_waits_summary_by_thread_by_event_name("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_WAITS_SUMMARY_GLOBAL_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_waits_summary_global_by_event_name("
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE FILE_INSTANCES
--

SET @cmd="CREATE TABLE performance_schema.file_instances("
  "FILE_NAME VARCHAR(512) not null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "OPEN_COUNT INTEGER unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE FILE_SUMMARY_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.file_summary_by_event_name("
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "COUNT_READ BIGINT unsigned not null,"
  "SUM_TIMER_READ BIGINT unsigned not null,"
  "MIN_TIMER_READ BIGINT unsigned not null,"
  "AVG_TIMER_READ BIGINT unsigned not null,"
  "MAX_TIMER_READ BIGINT unsigned not null,"
  "SUM_NUMBER_OF_BYTES_READ BIGINT not null,"
  "COUNT_WRITE BIGINT unsigned not null,"
  "SUM_TIMER_WRITE BIGINT unsigned not null,"
  "MIN_TIMER_WRITE BIGINT unsigned not null,"
  "AVG_TIMER_WRITE BIGINT unsigned not null,"
  "MAX_TIMER_WRITE BIGINT unsigned not null,"
  "SUM_NUMBER_OF_BYTES_WRITE BIGINT not null,"
  "COUNT_MISC BIGINT unsigned not null,"
  "SUM_TIMER_MISC BIGINT unsigned not null,"
  "MIN_TIMER_MISC BIGINT unsigned not null,"
  "AVG_TIMER_MISC BIGINT unsigned not null,"
  "MAX_TIMER_MISC BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE FILE_SUMMARY_BY_INSTANCE
--

SET @cmd="CREATE TABLE performance_schema.file_summary_by_instance("
  "FILE_NAME VARCHAR(512) not null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "COUNT_READ BIGINT unsigned not null,"
  "SUM_TIMER_READ BIGINT unsigned not null,"
  "MIN_TIMER_READ BIGINT unsigned not null,"
  "AVG_TIMER_READ BIGINT unsigned not null,"
  "MAX_TIMER_READ BIGINT unsigned not null,"
  "SUM_NUMBER_OF_BYTES_READ BIGINT not null,"
  "COUNT_WRITE BIGINT unsigned not null,"
  "SUM_TIMER_WRITE BIGINT unsigned not null,"
  "MIN_TIMER_WRITE BIGINT unsigned not null,"
  "AVG_TIMER_WRITE BIGINT unsigned not null,"
  "MAX_TIMER_WRITE BIGINT unsigned not null,"
  "SUM_NUMBER_OF_BYTES_WRITE BIGINT not null,"
  "COUNT_MISC BIGINT unsigned not null,"
  "SUM_TIMER_MISC BIGINT unsigned not null,"
  "MIN_TIMER_MISC BIGINT unsigned not null,"
  "AVG_TIMER_MISC BIGINT unsigned not null,"
  "MAX_TIMER_MISC BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;


--
-- TABLE SOCKET_INSTANCES
--

SET @cmd="CREATE TABLE performance_schema.socket_instances("
  "EVENT_NAME VARCHAR(128) not null,"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned not null,"
  "THREAD_ID BIGINT unsigned,"
  "SOCKET_ID INTEGER not null,"
  "IP VARCHAR(64) not null,"
  "PORT INTEGER not null,"
  "STATE ENUM('IDLE','ACTIVE') not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE SOCKET_SUMMARY_BY_INSTANCE
--

SET @cmd="CREATE TABLE performance_schema.socket_summary_by_instance("
  "EVENT_NAME VARCHAR(128) not null,"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "COUNT_READ BIGINT unsigned not null,"
  "SUM_TIMER_READ BIGINT unsigned not null,"
  "MIN_TIMER_READ BIGINT unsigned not null,"
  "AVG_TIMER_READ BIGINT unsigned not null,"
  "MAX_TIMER_READ BIGINT unsigned not null,"
  "SUM_NUMBER_OF_BYTES_READ BIGINT unsigned not null,"
  "COUNT_WRITE BIGINT unsigned not null,"
  "SUM_TIMER_WRITE BIGINT unsigned not null,"
  "MIN_TIMER_WRITE BIGINT unsigned not null,"
  "AVG_TIMER_WRITE BIGINT unsigned not null,"
  "MAX_TIMER_WRITE BIGINT unsigned not null,"
  "SUM_NUMBER_OF_BYTES_WRITE BIGINT unsigned not null,"
  "COUNT_MISC BIGINT unsigned not null,"
  "SUM_TIMER_MISC BIGINT unsigned not null,"
  "MIN_TIMER_MISC BIGINT unsigned not null,"
  "AVG_TIMER_MISC BIGINT unsigned not null,"
  "MAX_TIMER_MISC BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE SOCKET_SUMMARY_BY_INSTANCE
--

SET @cmd="CREATE TABLE performance_schema.socket_summary_by_event_name("
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "COUNT_READ BIGINT unsigned not null,"
  "SUM_TIMER_READ BIGINT unsigned not null,"
  "MIN_TIMER_READ BIGINT unsigned not null,"
  "AVG_TIMER_READ BIGINT unsigned not null,"
  "MAX_TIMER_READ BIGINT unsigned not null,"
  "SUM_NUMBER_OF_BYTES_READ BIGINT unsigned not null,"
  "COUNT_WRITE BIGINT unsigned not null,"
  "SUM_TIMER_WRITE BIGINT unsigned not null,"
  "MIN_TIMER_WRITE BIGINT unsigned not null,"
  "AVG_TIMER_WRITE BIGINT unsigned not null,"
  "MAX_TIMER_WRITE BIGINT unsigned not null,"
  "SUM_NUMBER_OF_BYTES_WRITE BIGINT unsigned not null,"
  "COUNT_MISC BIGINT unsigned not null,"
  "SUM_TIMER_MISC BIGINT unsigned not null,"
  "MIN_TIMER_MISC BIGINT unsigned not null,"
  "AVG_TIMER_MISC BIGINT unsigned not null,"
  "MAX_TIMER_MISC BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE HOST_CACHE
--

SET @cmd="CREATE TABLE performance_schema.host_cache("
  "IP VARCHAR(64) not null,"
  "HOST VARCHAR(255) collate utf8_bin,"
  "HOST_VALIDATED ENUM ('YES', 'NO') not null,"
  "SUM_CONNECT_ERRORS BIGINT not null,"
  "COUNT_HOST_BLOCKED_ERRORS BIGINT not null,"
  "COUNT_NAMEINFO_TRANSIENT_ERRORS BIGINT not null,"
  "COUNT_NAMEINFO_PERMANENT_ERRORS BIGINT not null,"
  "COUNT_FORMAT_ERRORS BIGINT not null,"
  "COUNT_ADDRINFO_TRANSIENT_ERRORS BIGINT not null,"
  "COUNT_ADDRINFO_PERMANENT_ERRORS BIGINT not null,"
  "COUNT_FCRDNS_ERRORS BIGINT not null,"
  "COUNT_HOST_ACL_ERRORS BIGINT not null,"
  "COUNT_NO_AUTH_PLUGIN_ERRORS BIGINT not null,"
  "COUNT_AUTH_PLUGIN_ERRORS BIGINT not null,"
  "COUNT_HANDSHAKE_ERRORS BIGINT not null,"
  "COUNT_PROXY_USER_ERRORS BIGINT not null,"
  "COUNT_PROXY_USER_ACL_ERRORS BIGINT not null,"
  "COUNT_AUTHENTICATION_ERRORS BIGINT not null,"
  "COUNT_SSL_ERRORS BIGINT not null,"
  "COUNT_MAX_USER_CONNECTIONS_ERRORS BIGINT not null,"
  "COUNT_MAX_USER_CONNECTIONS_PER_HOUR_ERRORS BIGINT not null,"
  "COUNT_DEFAULT_DATABASE_ERRORS BIGINT not null,"
  "COUNT_INIT_CONNECT_ERRORS BIGINT not null,"
  "COUNT_LOCAL_ERRORS BIGINT not null,"
  "COUNT_UNKNOWN_ERRORS BIGINT not null,"
  "FIRST_SEEN TIMESTAMP(0) NOT NULL default 0,"
  "LAST_SEEN TIMESTAMP(0) NOT NULL default 0,"
  "FIRST_ERROR_SEEN TIMESTAMP(0) null default 0,"
  "LAST_ERROR_SEEN TIMESTAMP(0) null default 0"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE MUTEX_INSTANCES
--

SET @cmd="CREATE TABLE performance_schema.mutex_instances("
  "NAME VARCHAR(128) not null,"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned not null,"
  "LOCKED_BY_THREAD_ID BIGINT unsigned"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE OBJECTS_SUMMARY_GLOBAL_BY_TYPE
--

SET @cmd="CREATE TABLE performance_schema.objects_summary_global_by_type("
  "OBJECT_TYPE VARCHAR(64),"
  "OBJECT_SCHEMA VARCHAR(64),"
  "OBJECT_NAME VARCHAR(64),"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE PERFORMANCE_TIMERS
--

SET @cmd="CREATE TABLE performance_schema.performance_timers("
  "TIMER_NAME ENUM ('CYCLE', 'NANOSECOND', 'MICROSECOND', 'MILLISECOND', 'TICK') not null,"
  "TIMER_FREQUENCY BIGINT,"
  "TIMER_RESOLUTION BIGINT,"
  "TIMER_OVERHEAD BIGINT"
  ") ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE RWLOCK_INSTANCES
--

SET @cmd="CREATE TABLE performance_schema.rwlock_instances("
  "NAME VARCHAR(128) not null,"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned not null,"
  "WRITE_LOCKED_BY_THREAD_ID BIGINT unsigned,"
  "READ_LOCKED_BY_COUNT INTEGER unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE SETUP_ACTORS
--

SET @cmd="CREATE TABLE performance_schema.setup_actors("
  "HOST CHAR(60) collate utf8_bin default '%' not null,"
  "USER CHAR(16) collate utf8_bin default '%' not null,"
  "ROLE CHAR(16) collate utf8_bin default '%' not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE SETUP_CONSUMERS
--

SET @cmd="CREATE TABLE performance_schema.setup_consumers("
  "NAME VARCHAR(64) not null,"
  "ENABLED ENUM ('YES', 'NO') not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE SETUP_INSTRUMENTS
--

SET @cmd="CREATE TABLE performance_schema.setup_instruments("
  "NAME VARCHAR(128) not null,"
  "ENABLED ENUM ('YES', 'NO') not null,"
  "TIMED ENUM ('YES', 'NO') not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE SETUP_OBJECTS
--

SET @cmd="CREATE TABLE performance_schema.setup_objects("
  "OBJECT_TYPE ENUM ('TABLE') not null default 'TABLE',"
  "OBJECT_SCHEMA VARCHAR(64) default '%',"
  "OBJECT_NAME VARCHAR(64) not null default '%',"
  "ENABLED ENUM ('YES', 'NO') not null default 'YES',"
  "TIMED ENUM ('YES', 'NO') not null default 'YES'"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE SETUP_TIMERS
--

SET @cmd="CREATE TABLE performance_schema.setup_timers("
  "NAME VARCHAR(64) not null,"
  "TIMER_NAME ENUM ('CYCLE', 'NANOSECOND', 'MICROSECOND', 'MILLISECOND', 'TICK') not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE TABLE_IO_WAITS_SUMMARY_BY_INDEX_USAGE
--

SET @cmd="CREATE TABLE performance_schema.table_io_waits_summary_by_index_usage("
  "OBJECT_TYPE VARCHAR(64),"
  "OBJECT_SCHEMA VARCHAR(64),"
  "OBJECT_NAME VARCHAR(64),"
  "INDEX_NAME VARCHAR(64),"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "COUNT_READ BIGINT unsigned not null,"
  "SUM_TIMER_READ BIGINT unsigned not null,"
  "MIN_TIMER_READ BIGINT unsigned not null,"
  "AVG_TIMER_READ BIGINT unsigned not null,"
  "MAX_TIMER_READ BIGINT unsigned not null,"
  "COUNT_WRITE BIGINT unsigned not null,"
  "SUM_TIMER_WRITE BIGINT unsigned not null,"
  "MIN_TIMER_WRITE BIGINT unsigned not null,"
  "AVG_TIMER_WRITE BIGINT unsigned not null,"
  "MAX_TIMER_WRITE BIGINT unsigned not null,"
  "COUNT_FETCH BIGINT unsigned not null,"
  "SUM_TIMER_FETCH BIGINT unsigned not null,"
  "MIN_TIMER_FETCH BIGINT unsigned not null,"
  "AVG_TIMER_FETCH BIGINT unsigned not null,"
  "MAX_TIMER_FETCH BIGINT unsigned not null,"
  "COUNT_INSERT BIGINT unsigned not null,"
  "SUM_TIMER_INSERT BIGINT unsigned not null,"
  "MIN_TIMER_INSERT BIGINT unsigned not null,"
  "AVG_TIMER_INSERT BIGINT unsigned not null,"
  "MAX_TIMER_INSERT BIGINT unsigned not null,"
  "COUNT_UPDATE BIGINT unsigned not null,"
  "SUM_TIMER_UPDATE BIGINT unsigned not null,"
  "MIN_TIMER_UPDATE BIGINT unsigned not null,"
  "AVG_TIMER_UPDATE BIGINT unsigned not null,"
  "MAX_TIMER_UPDATE BIGINT unsigned not null,"
  "COUNT_DELETE BIGINT unsigned not null,"
  "SUM_TIMER_DELETE BIGINT unsigned not null,"
  "MIN_TIMER_DELETE BIGINT unsigned not null,"
  "AVG_TIMER_DELETE BIGINT unsigned not null,"
  "MAX_TIMER_DELETE BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE TABLE_IO_WAITS_SUMMARY_BY_TABLE
--

SET @cmd="CREATE TABLE performance_schema.table_io_waits_summary_by_table("
  "OBJECT_TYPE VARCHAR(64),"
  "OBJECT_SCHEMA VARCHAR(64),"
  "OBJECT_NAME VARCHAR(64),"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "COUNT_READ BIGINT unsigned not null,"
  "SUM_TIMER_READ BIGINT unsigned not null,"
  "MIN_TIMER_READ BIGINT unsigned not null,"
  "AVG_TIMER_READ BIGINT unsigned not null,"
  "MAX_TIMER_READ BIGINT unsigned not null,"
  "COUNT_WRITE BIGINT unsigned not null,"
  "SUM_TIMER_WRITE BIGINT unsigned not null,"
  "MIN_TIMER_WRITE BIGINT unsigned not null,"
  "AVG_TIMER_WRITE BIGINT unsigned not null,"
  "MAX_TIMER_WRITE BIGINT unsigned not null,"
  "COUNT_FETCH BIGINT unsigned not null,"
  "SUM_TIMER_FETCH BIGINT unsigned not null,"
  "MIN_TIMER_FETCH BIGINT unsigned not null,"
  "AVG_TIMER_FETCH BIGINT unsigned not null,"
  "MAX_TIMER_FETCH BIGINT unsigned not null,"
  "COUNT_INSERT BIGINT unsigned not null,"
  "SUM_TIMER_INSERT BIGINT unsigned not null,"
  "MIN_TIMER_INSERT BIGINT unsigned not null,"
  "AVG_TIMER_INSERT BIGINT unsigned not null,"
  "MAX_TIMER_INSERT BIGINT unsigned not null,"
  "COUNT_UPDATE BIGINT unsigned not null,"
  "SUM_TIMER_UPDATE BIGINT unsigned not null,"
  "MIN_TIMER_UPDATE BIGINT unsigned not null,"
  "AVG_TIMER_UPDATE BIGINT unsigned not null,"
  "MAX_TIMER_UPDATE BIGINT unsigned not null,"
  "COUNT_DELETE BIGINT unsigned not null,"
  "SUM_TIMER_DELETE BIGINT unsigned not null,"
  "MIN_TIMER_DELETE BIGINT unsigned not null,"
  "AVG_TIMER_DELETE BIGINT unsigned not null,"
  "MAX_TIMER_DELETE BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE TABLE_LOCK_WAITS_SUMMARY_BY_TABLE
--

SET @cmd="CREATE TABLE performance_schema.table_lock_waits_summary_by_table("
  "OBJECT_TYPE VARCHAR(64),"
  "OBJECT_SCHEMA VARCHAR(64),"
  "OBJECT_NAME VARCHAR(64),"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "COUNT_READ BIGINT unsigned not null,"
  "SUM_TIMER_READ BIGINT unsigned not null,"
  "MIN_TIMER_READ BIGINT unsigned not null,"
  "AVG_TIMER_READ BIGINT unsigned not null,"
  "MAX_TIMER_READ BIGINT unsigned not null,"
  "COUNT_WRITE BIGINT unsigned not null,"
  "SUM_TIMER_WRITE BIGINT unsigned not null,"
  "MIN_TIMER_WRITE BIGINT unsigned not null,"
  "AVG_TIMER_WRITE BIGINT unsigned not null,"
  "MAX_TIMER_WRITE BIGINT unsigned not null,"
  "COUNT_READ_NORMAL BIGINT unsigned not null,"
  "SUM_TIMER_READ_NORMAL BIGINT unsigned not null,"
  "MIN_TIMER_READ_NORMAL BIGINT unsigned not null,"
  "AVG_TIMER_READ_NORMAL BIGINT unsigned not null,"
  "MAX_TIMER_READ_NORMAL BIGINT unsigned not null,"
  "COUNT_READ_WITH_SHARED_LOCKS BIGINT unsigned not null,"
  "SUM_TIMER_READ_WITH_SHARED_LOCKS BIGINT unsigned not null,"
  "MIN_TIMER_READ_WITH_SHARED_LOCKS BIGINT unsigned not null,"
  "AVG_TIMER_READ_WITH_SHARED_LOCKS BIGINT unsigned not null,"
  "MAX_TIMER_READ_WITH_SHARED_LOCKS BIGINT unsigned not null,"
  "COUNT_READ_HIGH_PRIORITY BIGINT unsigned not null,"
  "SUM_TIMER_READ_HIGH_PRIORITY BIGINT unsigned not null,"
  "MIN_TIMER_READ_HIGH_PRIORITY BIGINT unsigned not null,"
  "AVG_TIMER_READ_HIGH_PRIORITY BIGINT unsigned not null,"
  "MAX_TIMER_READ_HIGH_PRIORITY BIGINT unsigned not null,"
  "COUNT_READ_NO_INSERT BIGINT unsigned not null,"
  "SUM_TIMER_READ_NO_INSERT BIGINT unsigned not null,"
  "MIN_TIMER_READ_NO_INSERT BIGINT unsigned not null,"
  "AVG_TIMER_READ_NO_INSERT BIGINT unsigned not null,"
  "MAX_TIMER_READ_NO_INSERT BIGINT unsigned not null,"
  "COUNT_READ_EXTERNAL BIGINT unsigned not null,"
  "SUM_TIMER_READ_EXTERNAL BIGINT unsigned not null,"
  "MIN_TIMER_READ_EXTERNAL BIGINT unsigned not null,"
  "AVG_TIMER_READ_EXTERNAL BIGINT unsigned not null,"
  "MAX_TIMER_READ_EXTERNAL BIGINT unsigned not null,"
  "COUNT_WRITE_ALLOW_WRITE BIGINT unsigned not null,"
  "SUM_TIMER_WRITE_ALLOW_WRITE BIGINT unsigned not null,"
  "MIN_TIMER_WRITE_ALLOW_WRITE BIGINT unsigned not null,"
  "AVG_TIMER_WRITE_ALLOW_WRITE BIGINT unsigned not null,"
  "MAX_TIMER_WRITE_ALLOW_WRITE BIGINT unsigned not null,"
  "COUNT_WRITE_CONCURRENT_INSERT BIGINT unsigned not null,"
  "SUM_TIMER_WRITE_CONCURRENT_INSERT BIGINT unsigned not null,"
  "MIN_TIMER_WRITE_CONCURRENT_INSERT BIGINT unsigned not null,"
  "AVG_TIMER_WRITE_CONCURRENT_INSERT BIGINT unsigned not null,"
  "MAX_TIMER_WRITE_CONCURRENT_INSERT BIGINT unsigned not null,"
  "COUNT_WRITE_DELAYED BIGINT unsigned not null,"
  "SUM_TIMER_WRITE_DELAYED BIGINT unsigned not null,"
  "MIN_TIMER_WRITE_DELAYED BIGINT unsigned not null,"
  "AVG_TIMER_WRITE_DELAYED BIGINT unsigned not null,"
  "MAX_TIMER_WRITE_DELAYED BIGINT unsigned not null,"
  "COUNT_WRITE_LOW_PRIORITY BIGINT unsigned not null,"
  "SUM_TIMER_WRITE_LOW_PRIORITY BIGINT unsigned not null,"
  "MIN_TIMER_WRITE_LOW_PRIORITY BIGINT unsigned not null,"
  "AVG_TIMER_WRITE_LOW_PRIORITY BIGINT unsigned not null,"
  "MAX_TIMER_WRITE_LOW_PRIORITY BIGINT unsigned not null,"
  "COUNT_WRITE_NORMAL BIGINT unsigned not null,"
  "SUM_TIMER_WRITE_NORMAL BIGINT unsigned not null,"
  "MIN_TIMER_WRITE_NORMAL BIGINT unsigned not null,"
  "AVG_TIMER_WRITE_NORMAL BIGINT unsigned not null,"
  "MAX_TIMER_WRITE_NORMAL BIGINT unsigned not null,"
  "COUNT_WRITE_EXTERNAL BIGINT unsigned not null,"
  "SUM_TIMER_WRITE_EXTERNAL BIGINT unsigned not null,"
  "MIN_TIMER_WRITE_EXTERNAL BIGINT unsigned not null,"
  "AVG_TIMER_WRITE_EXTERNAL BIGINT unsigned not null,"
  "MAX_TIMER_WRITE_EXTERNAL BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE THREADS
--

SET @cmd="CREATE TABLE performance_schema.threads("
  "THREAD_ID BIGINT unsigned not null,"
  "NAME VARCHAR(128) not null,"
  "TYPE VARCHAR(10) not null,"
  "PROCESSLIST_ID BIGINT unsigned,"
  "PROCESSLIST_USER VARCHAR(16),"
  "PROCESSLIST_HOST VARCHAR(60),"
  "PROCESSLIST_DB VARCHAR(64),"
  "PROCESSLIST_COMMAND VARCHAR(16),"
  "PROCESSLIST_TIME BIGINT,"
  "PROCESSLIST_STATE VARCHAR(64),"
  "PROCESSLIST_INFO LONGTEXT,"
  "PARENT_THREAD_ID BIGINT unsigned,"
  "ROLE VARCHAR(64),"
  "INSTRUMENTED ENUM ('YES', 'NO') not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STAGES_CURRENT
--

SET @cmd="CREATE TABLE performance_schema.events_stages_current("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_ID BIGINT unsigned not null,"
  "END_EVENT_ID BIGINT unsigned,"
  "EVENT_NAME VARCHAR(128) not null,"
  "SOURCE VARCHAR(64),"
  "TIMER_START BIGINT unsigned,"
  "TIMER_END BIGINT unsigned,"
  "TIMER_WAIT BIGINT unsigned,"
  "NESTING_EVENT_ID BIGINT unsigned,"
  "NESTING_EVENT_TYPE ENUM('STATEMENT', 'STAGE', 'WAIT')"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STAGES_HISTORY
--

SET @cmd="CREATE TABLE performance_schema.events_stages_history("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_ID BIGINT unsigned not null,"
  "END_EVENT_ID BIGINT unsigned,"
  "EVENT_NAME VARCHAR(128) not null,"
  "SOURCE VARCHAR(64),"
  "TIMER_START BIGINT unsigned,"
  "TIMER_END BIGINT unsigned,"
  "TIMER_WAIT BIGINT unsigned,"
  "NESTING_EVENT_ID BIGINT unsigned,"
  "NESTING_EVENT_TYPE ENUM('STATEMENT', 'STAGE', 'WAIT')"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STAGES_HISTORY_LONG
--

SET @cmd="CREATE TABLE performance_schema.events_stages_history_long("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_ID BIGINT unsigned not null,"
  "END_EVENT_ID BIGINT unsigned,"
  "EVENT_NAME VARCHAR(128) not null,"
  "SOURCE VARCHAR(64),"
  "TIMER_START BIGINT unsigned,"
  "TIMER_END BIGINT unsigned,"
  "TIMER_WAIT BIGINT unsigned,"
  "NESTING_EVENT_ID BIGINT unsigned,"
  "NESTING_EVENT_TYPE ENUM('STATEMENT', 'STAGE', 'WAIT')"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STAGES_SUMMARY_BY_THREAD_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_stages_summary_by_thread_by_event_name("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STAGES_SUMMARY_BY_HOST_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_stages_summary_by_host_by_event_name("
  "HOST CHAR(60) collate utf8_bin default null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STAGES_SUMMARY_BY_USER_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_stages_summary_by_user_by_event_name("
  "USER CHAR(16) collate utf8_bin default null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STAGES_SUMMARY_BY_ACCOUNT_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_stages_summary_by_account_by_event_name("
  "USER CHAR(16) collate utf8_bin default null,"
  "HOST CHAR(60) collate utf8_bin default null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STAGES_SUMMARY_GLOBAL_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_stages_summary_global_by_event_name("
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STATEMENTS_CURRENT
--

SET @cmd="CREATE TABLE performance_schema.events_statements_current("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_ID BIGINT unsigned not null,"
  "END_EVENT_ID BIGINT unsigned,"
  "EVENT_NAME VARCHAR(128) not null,"
  "SOURCE VARCHAR(64),"
  "TIMER_START BIGINT unsigned,"
  "TIMER_END BIGINT unsigned,"
  "TIMER_WAIT BIGINT unsigned,"
  "LOCK_TIME bigint unsigned not null,"
  "SQL_TEXT LONGTEXT,"
  "DIGEST VARCHAR(32),"
  "DIGEST_TEXT LONGTEXT,"
  "CURRENT_SCHEMA VARCHAR(64),"
  "OBJECT_TYPE VARCHAR(64),"
  "OBJECT_SCHEMA VARCHAR(64),"
  "OBJECT_NAME VARCHAR(64),"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned,"
  "MYSQL_ERRNO INTEGER,"
  "RETURNED_SQLSTATE VARCHAR(5),"
  "MESSAGE_TEXT VARCHAR(128),"
  "ERRORS BIGINT unsigned not null,"
  "WARNINGS BIGINT unsigned not null,"
  "ROWS_AFFECTED BIGINT unsigned not null,"
  "ROWS_SENT BIGINT unsigned not null,"
  "ROWS_EXAMINED BIGINT unsigned not null,"
  "CREATED_TMP_DISK_TABLES BIGINT unsigned not null,"
  "CREATED_TMP_TABLES BIGINT unsigned not null,"
  "SELECT_FULL_JOIN BIGINT unsigned not null,"
  "SELECT_FULL_RANGE_JOIN BIGINT unsigned not null,"
  "SELECT_RANGE BIGINT unsigned not null,"
  "SELECT_RANGE_CHECK BIGINT unsigned not null,"
  "SELECT_SCAN BIGINT unsigned not null,"
  "SORT_MERGE_PASSES BIGINT unsigned not null,"
  "SORT_RANGE BIGINT unsigned not null,"
  "SORT_ROWS BIGINT unsigned not null,"
  "SORT_SCAN BIGINT unsigned not null,"
  "NO_INDEX_USED BIGINT unsigned not null,"
  "NO_GOOD_INDEX_USED BIGINT unsigned not null,"
  "NESTING_EVENT_ID BIGINT unsigned,"
  "NESTING_EVENT_TYPE ENUM('STATEMENT', 'STAGE', 'WAIT')"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STATEMENTS_HISTORY
--

SET @cmd="CREATE TABLE performance_schema.events_statements_history("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_ID BIGINT unsigned not null,"
  "END_EVENT_ID BIGINT unsigned,"
  "EVENT_NAME VARCHAR(128) not null,"
  "SOURCE VARCHAR(64),"
  "TIMER_START BIGINT unsigned,"
  "TIMER_END BIGINT unsigned,"
  "TIMER_WAIT BIGINT unsigned,"
  "LOCK_TIME bigint unsigned not null,"
  "SQL_TEXT LONGTEXT,"
  "DIGEST VARCHAR(32),"
  "DIGEST_TEXT LONGTEXT,"
  "CURRENT_SCHEMA VARCHAR(64),"
  "OBJECT_TYPE VARCHAR(64),"
  "OBJECT_SCHEMA VARCHAR(64),"
  "OBJECT_NAME VARCHAR(64),"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned,"
  "MYSQL_ERRNO INTEGER,"
  "RETURNED_SQLSTATE VARCHAR(5),"
  "MESSAGE_TEXT VARCHAR(128),"
  "ERRORS BIGINT unsigned not null,"
  "WARNINGS BIGINT unsigned not null,"
  "ROWS_AFFECTED BIGINT unsigned not null,"
  "ROWS_SENT BIGINT unsigned not null,"
  "ROWS_EXAMINED BIGINT unsigned not null,"
  "CREATED_TMP_DISK_TABLES BIGINT unsigned not null,"
  "CREATED_TMP_TABLES BIGINT unsigned not null,"
  "SELECT_FULL_JOIN BIGINT unsigned not null,"
  "SELECT_FULL_RANGE_JOIN BIGINT unsigned not null,"
  "SELECT_RANGE BIGINT unsigned not null,"
  "SELECT_RANGE_CHECK BIGINT unsigned not null,"
  "SELECT_SCAN BIGINT unsigned not null,"
  "SORT_MERGE_PASSES BIGINT unsigned not null,"
  "SORT_RANGE BIGINT unsigned not null,"
  "SORT_ROWS BIGINT unsigned not null,"
  "SORT_SCAN BIGINT unsigned not null,"
  "NO_INDEX_USED BIGINT unsigned not null,"
  "NO_GOOD_INDEX_USED BIGINT unsigned not null,"
  "NESTING_EVENT_ID BIGINT unsigned,"
  "NESTING_EVENT_TYPE ENUM('STATEMENT', 'STAGE', 'WAIT')"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STATEMENTS_HISTORY_LONG
--

SET @cmd="CREATE TABLE performance_schema.events_statements_history_long("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_ID BIGINT unsigned not null,"
  "END_EVENT_ID BIGINT unsigned,"
  "EVENT_NAME VARCHAR(128) not null,"
  "SOURCE VARCHAR(64),"
  "TIMER_START BIGINT unsigned,"
  "TIMER_END BIGINT unsigned,"
  "TIMER_WAIT BIGINT unsigned,"
  "LOCK_TIME bigint unsigned not null,"
  "SQL_TEXT LONGTEXT,"
  "DIGEST VARCHAR(32),"
  "DIGEST_TEXT LONGTEXT,"
  "CURRENT_SCHEMA VARCHAR(64),"
  "OBJECT_TYPE VARCHAR(64),"
  "OBJECT_SCHEMA VARCHAR(64),"
  "OBJECT_NAME VARCHAR(64),"
  "OBJECT_INSTANCE_BEGIN BIGINT unsigned,"
  "MYSQL_ERRNO INTEGER,"
  "RETURNED_SQLSTATE VARCHAR(5),"
  "MESSAGE_TEXT VARCHAR(128),"
  "ERRORS BIGINT unsigned not null,"
  "WARNINGS BIGINT unsigned not null,"
  "ROWS_AFFECTED BIGINT unsigned not null,"
  "ROWS_SENT BIGINT unsigned not null,"
  "ROWS_EXAMINED BIGINT unsigned not null,"
  "CREATED_TMP_DISK_TABLES BIGINT unsigned not null,"
  "CREATED_TMP_TABLES BIGINT unsigned not null,"
  "SELECT_FULL_JOIN BIGINT unsigned not null,"
  "SELECT_FULL_RANGE_JOIN BIGINT unsigned not null,"
  "SELECT_RANGE BIGINT unsigned not null,"
  "SELECT_RANGE_CHECK BIGINT unsigned not null,"
  "SELECT_SCAN BIGINT unsigned not null,"
  "SORT_MERGE_PASSES BIGINT unsigned not null,"
  "SORT_RANGE BIGINT unsigned not null,"
  "SORT_ROWS BIGINT unsigned not null,"
  "SORT_SCAN BIGINT unsigned not null,"
  "NO_INDEX_USED BIGINT unsigned not null,"
  "NO_GOOD_INDEX_USED BIGINT unsigned not null,"
  "NESTING_EVENT_ID BIGINT unsigned,"
  "NESTING_EVENT_TYPE ENUM('STATEMENT', 'STAGE', 'WAIT')"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STATEMENTS_SUMMARY_BY_THREAD_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_statements_summary_by_thread_by_event_name("
  "THREAD_ID BIGINT unsigned not null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "SUM_LOCK_TIME BIGINT unsigned not null,"
  "SUM_ERRORS BIGINT unsigned not null,"
  "SUM_WARNINGS BIGINT unsigned not null,"
  "SUM_ROWS_AFFECTED BIGINT unsigned not null,"
  "SUM_ROWS_SENT BIGINT unsigned not null,"
  "SUM_ROWS_EXAMINED BIGINT unsigned not null,"
  "SUM_CREATED_TMP_DISK_TABLES BIGINT unsigned not null,"
  "SUM_CREATED_TMP_TABLES BIGINT unsigned not null,"
  "SUM_SELECT_FULL_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_FULL_RANGE_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_RANGE BIGINT unsigned not null,"
  "SUM_SELECT_RANGE_CHECK BIGINT unsigned not null,"
  "SUM_SELECT_SCAN BIGINT unsigned not null,"
  "SUM_SORT_MERGE_PASSES BIGINT unsigned not null,"
  "SUM_SORT_RANGE BIGINT unsigned not null,"
  "SUM_SORT_ROWS BIGINT unsigned not null,"
  "SUM_SORT_SCAN BIGINT unsigned not null,"
  "SUM_NO_INDEX_USED BIGINT unsigned not null,"
  "SUM_NO_GOOD_INDEX_USED BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STATEMENTS_SUMMARY_BY_HOST_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_statements_summary_by_host_by_event_name("
  "HOST CHAR(60) collate utf8_bin default null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "SUM_LOCK_TIME BIGINT unsigned not null,"
  "SUM_ERRORS BIGINT unsigned not null,"
  "SUM_WARNINGS BIGINT unsigned not null,"
  "SUM_ROWS_AFFECTED BIGINT unsigned not null,"
  "SUM_ROWS_SENT BIGINT unsigned not null,"
  "SUM_ROWS_EXAMINED BIGINT unsigned not null,"
  "SUM_CREATED_TMP_DISK_TABLES BIGINT unsigned not null,"
  "SUM_CREATED_TMP_TABLES BIGINT unsigned not null,"
  "SUM_SELECT_FULL_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_FULL_RANGE_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_RANGE BIGINT unsigned not null,"
  "SUM_SELECT_RANGE_CHECK BIGINT unsigned not null,"
  "SUM_SELECT_SCAN BIGINT unsigned not null,"
  "SUM_SORT_MERGE_PASSES BIGINT unsigned not null,"
  "SUM_SORT_RANGE BIGINT unsigned not null,"
  "SUM_SORT_ROWS BIGINT unsigned not null,"
  "SUM_SORT_SCAN BIGINT unsigned not null,"
  "SUM_NO_INDEX_USED BIGINT unsigned not null,"
  "SUM_NO_GOOD_INDEX_USED BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STATEMENTS_SUMMARY_BY_USER_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_statements_summary_by_user_by_event_name("
  "USER CHAR(16) collate utf8_bin default null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "SUM_LOCK_TIME BIGINT unsigned not null,"
  "SUM_ERRORS BIGINT unsigned not null,"
  "SUM_WARNINGS BIGINT unsigned not null,"
  "SUM_ROWS_AFFECTED BIGINT unsigned not null,"
  "SUM_ROWS_SENT BIGINT unsigned not null,"
  "SUM_ROWS_EXAMINED BIGINT unsigned not null,"
  "SUM_CREATED_TMP_DISK_TABLES BIGINT unsigned not null,"
  "SUM_CREATED_TMP_TABLES BIGINT unsigned not null,"
  "SUM_SELECT_FULL_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_FULL_RANGE_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_RANGE BIGINT unsigned not null,"
  "SUM_SELECT_RANGE_CHECK BIGINT unsigned not null,"
  "SUM_SELECT_SCAN BIGINT unsigned not null,"
  "SUM_SORT_MERGE_PASSES BIGINT unsigned not null,"
  "SUM_SORT_RANGE BIGINT unsigned not null,"
  "SUM_SORT_ROWS BIGINT unsigned not null,"
  "SUM_SORT_SCAN BIGINT unsigned not null,"
  "SUM_NO_INDEX_USED BIGINT unsigned not null,"
  "SUM_NO_GOOD_INDEX_USED BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STATEMENTS_SUMMARY_BY_ACCOUNT_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_statements_summary_by_account_by_event_name("
  "USER CHAR(16) collate utf8_bin default null,"
  "HOST CHAR(60) collate utf8_bin default null,"
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "SUM_LOCK_TIME BIGINT unsigned not null,"
  "SUM_ERRORS BIGINT unsigned not null,"
  "SUM_WARNINGS BIGINT unsigned not null,"
  "SUM_ROWS_AFFECTED BIGINT unsigned not null,"
  "SUM_ROWS_SENT BIGINT unsigned not null,"
  "SUM_ROWS_EXAMINED BIGINT unsigned not null,"
  "SUM_CREATED_TMP_DISK_TABLES BIGINT unsigned not null,"
  "SUM_CREATED_TMP_TABLES BIGINT unsigned not null,"
  "SUM_SELECT_FULL_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_FULL_RANGE_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_RANGE BIGINT unsigned not null,"
  "SUM_SELECT_RANGE_CHECK BIGINT unsigned not null,"
  "SUM_SELECT_SCAN BIGINT unsigned not null,"
  "SUM_SORT_MERGE_PASSES BIGINT unsigned not null,"
  "SUM_SORT_RANGE BIGINT unsigned not null,"
  "SUM_SORT_ROWS BIGINT unsigned not null,"
  "SUM_SORT_SCAN BIGINT unsigned not null,"
  "SUM_NO_INDEX_USED BIGINT unsigned not null,"
  "SUM_NO_GOOD_INDEX_USED BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STATEMENTS_SUMMARY_GLOBAL_BY_EVENT_NAME
--

SET @cmd="CREATE TABLE performance_schema.events_statements_summary_global_by_event_name("
  "EVENT_NAME VARCHAR(128) not null,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "SUM_LOCK_TIME BIGINT unsigned not null,"
  "SUM_ERRORS BIGINT unsigned not null,"
  "SUM_WARNINGS BIGINT unsigned not null,"
  "SUM_ROWS_AFFECTED BIGINT unsigned not null,"
  "SUM_ROWS_SENT BIGINT unsigned not null,"
  "SUM_ROWS_EXAMINED BIGINT unsigned not null,"
  "SUM_CREATED_TMP_DISK_TABLES BIGINT unsigned not null,"
  "SUM_CREATED_TMP_TABLES BIGINT unsigned not null,"
  "SUM_SELECT_FULL_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_FULL_RANGE_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_RANGE BIGINT unsigned not null,"
  "SUM_SELECT_RANGE_CHECK BIGINT unsigned not null,"
  "SUM_SELECT_SCAN BIGINT unsigned not null,"
  "SUM_SORT_MERGE_PASSES BIGINT unsigned not null,"
  "SUM_SORT_RANGE BIGINT unsigned not null,"
  "SUM_SORT_ROWS BIGINT unsigned not null,"
  "SUM_SORT_SCAN BIGINT unsigned not null,"
  "SUM_NO_INDEX_USED BIGINT unsigned not null,"
  "SUM_NO_GOOD_INDEX_USED BIGINT unsigned not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE HOSTS
--

SET @cmd="CREATE TABLE performance_schema.hosts("
  "HOST CHAR(60) collate utf8_bin default null,"
  "CURRENT_CONNECTIONS bigint not null,"
  "TOTAL_CONNECTIONS bigint not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE USERS
--

SET @cmd="CREATE TABLE performance_schema.users("
  "USER CHAR(16) collate utf8_bin default null,"
  "CURRENT_CONNECTIONS bigint not null,"
  "TOTAL_CONNECTIONS bigint not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE ACCOUNTS
--

SET @cmd="CREATE TABLE performance_schema.accounts("
  "USER CHAR(16) collate utf8_bin default null,"
  "HOST CHAR(60) collate utf8_bin default null,"
  "CURRENT_CONNECTIONS bigint not null,"
  "TOTAL_CONNECTIONS bigint not null"
  ")ENGINE=PERFORMANCE_SCHEMA;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE EVENTS_STATEMENTS_SUMMARY_BY_DIGEST
--

SET @cmd="CREATE TABLE performance_schema.events_statements_summary_by_digest("
  "SCHEMA_NAME VARCHAR(64),"
  "DIGEST VARCHAR(32),"
  "DIGEST_TEXT LONGTEXT,"
  "COUNT_STAR BIGINT unsigned not null,"
  "SUM_TIMER_WAIT BIGINT unsigned not null,"
  "MIN_TIMER_WAIT BIGINT unsigned not null,"
  "AVG_TIMER_WAIT BIGINT unsigned not null,"
  "MAX_TIMER_WAIT BIGINT unsigned not null,"
  "SUM_LOCK_TIME BIGINT unsigned not null,"
  "SUM_ERRORS BIGINT unsigned not null,"
  "SUM_WARNINGS BIGINT unsigned not null,"
  "SUM_ROWS_AFFECTED BIGINT unsigned not null,"
  "SUM_ROWS_SENT BIGINT unsigned not null,"
  "SUM_ROWS_EXAMINED BIGINT unsigned not null,"
  "SUM_CREATED_TMP_DISK_TABLES BIGINT unsigned not null,"
  "SUM_CREATED_TMP_TABLES BIGINT unsigned not null,"
  "SUM_SELECT_FULL_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_FULL_RANGE_JOIN BIGINT unsigned not null,"
  "SUM_SELECT_RANGE BIGINT unsigned not null,"
  "SUM_SELECT_RANGE_CHECK BIGINT unsigned not null,"
  "SUM_SELECT_SCAN BIGINT unsigned not null,"
  "SUM_SORT_MERGE_PASSES BIGINT unsigned not null,"
  "SUM_SORT_RANGE BIGINT unsigned not null,"
  "SUM_SORT_ROWS BIGINT unsigned not null,"
  "SUM_SORT_SCAN BIGINT unsigned not null,"
  "SUM_NO_INDEX_USED BIGINT unsigned not null,"
  "SUM_NO_GOOD_INDEX_USED BIGINT unsigned not null,"
  "FIRST_SEEN TIMESTAMP(0) NOT NULL default 0,"
  "LAST_SEEN TIMESTAMP(0) NOT NULL default 0"
  ")ENGINE=PERFORMANCE_SCHEMA;";


SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE SESSION_CONNECT_ATTRS
--

SET @cmd="CREATE TABLE performance_schema.session_connect_attrs("
  "PROCESSLIST_ID INT NOT NULL,"
  "ATTR_NAME VARCHAR(32) NOT NULL,"
  "ATTR_VALUE VARCHAR(1024),"
  "ORDINAL_POSITION INT"
  ")ENGINE=PERFORMANCE_SCHEMA CHARACTER SET utf8 COLLATE utf8_bin;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

--
-- TABLE SESSION_ACCOUNT_CONNECT_ATTRS
--

SET @cmd="CREATE TABLE performance_schema.session_account_connect_attrs "
         " LIKE performance_schema.session_connect_attrs;";

SET @str = IF(@have_pfs = 1, @cmd, 'SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

CREATE TABLE IF NOT EXISTS proxies_priv (Host char(60) binary DEFAULT '' NOT NULL, User char(16) binary DEFAULT '' NOT NULL, Proxied_host char(60) binary DEFAULT '' NOT NULL, Proxied_user char(16) binary DEFAULT '' NOT NULL, With_grant BOOL DEFAULT 0 NOT NULL, Grantor char(77) DEFAULT '' NOT NULL, Timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, PRIMARY KEY Host (Host,User,Proxied_host,Proxied_user), KEY Grantor (Grantor) ) engine=MyISAM CHARACTER SET utf8 COLLATE utf8_bin comment='User proxy privileges';

-- Remember for later if proxies_priv table already existed
set @had_proxies_priv_table= @@warning_count != 0;

#
# SQL commands for creating the tables in MySQL Server which
# are used by the NDBINFO storage engine to access system
# information and statistics from MySQL Cluster
#
# Only create objects if NDBINFO is supported
SELECT @have_ndbinfo:= COUNT(*) FROM information_schema.engines WHERE engine='NDBINFO' AND support IN ('YES', 'DEFAULT');

# Only create objects if version >= 7.1
SET @str=IF(@have_ndbinfo,'SELECT @have_ndbinfo:= (@@ndbinfo_version >= (7 << 16) | (1 << 8)) || @ndbinfo_skip_version_check','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# Only create objects if ndbinfo namespace is free
SET @str=IF(@have_ndbinfo,'SET @@ndbinfo_show_hidden=TRUE','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'SELECT @have_ndbinfo:= COUNT(*) = 0 FROM information_schema.tables WHERE table_schema = @@ndbinfo_database AND LEFT(table_name, LENGTH(@@ndbinfo_table_prefix)) = @@ndbinfo_table_prefix AND engine != "ndbinfo"','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'SET @@ndbinfo_show_hidden=default','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE DATABASE IF NOT EXISTS `ndbinfo`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# Set NDBINFO in offline mode during (re)create of tables
# and views to avoid errors caused by no such table or
# different table definition in NDB
SET @str=IF(@have_ndbinfo,'SET @@global.ndbinfo_offline=TRUE','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# Drop any old views in ndbinfo
SET @str=IF(@have_ndbinfo,'DROP VIEW IF EXISTS ndbinfo.transporters','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'DROP VIEW IF EXISTS ndbinfo.logspaces','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'DROP VIEW IF EXISTS ndbinfo.logbuffers','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'DROP VIEW IF EXISTS ndbinfo.resources','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'DROP VIEW IF EXISTS ndbinfo.counters','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'DROP VIEW IF EXISTS ndbinfo.nodes','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'DROP VIEW IF EXISTS ndbinfo.memoryusage','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'DROP VIEW IF EXISTS ndbinfo.diskpagebuffer','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# Drop any old lookup tables in ndbinfo
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS ndbinfo.blocks','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS ndbinfo.config_params','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.ndb$tables
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS `ndbinfo`.`ndb$tables`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`ndb$tables` (`table_id` INT UNSIGNED,`table_name` VARCHAR(512),`comment` VARCHAR(512)) COMMENT="metadata for tables available through ndbinfo" ENGINE=NDBINFO','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.ndb$columns
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS `ndbinfo`.`ndb$columns`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`ndb$columns` (`table_id` INT UNSIGNED,`column_id` INT UNSIGNED,`column_name` VARCHAR(512),`column_type` INT UNSIGNED,`comment` VARCHAR(512)) COMMENT="metadata for columns available through ndbinfo " ENGINE=NDBINFO','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.ndb$test
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS `ndbinfo`.`ndb$test`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`ndb$test` (`node_id` INT UNSIGNED,`block_number` INT UNSIGNED,`block_instance` INT UNSIGNED,`counter` INT UNSIGNED,`counter2` BIGINT UNSIGNED) COMMENT="for testing" ENGINE=NDBINFO','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.ndb$pools
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS `ndbinfo`.`ndb$pools`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`ndb$pools` (`node_id` INT UNSIGNED,`block_number` INT UNSIGNED,`block_instance` INT UNSIGNED,`pool_name` VARCHAR(512),`used` BIGINT UNSIGNED COMMENT "currently in use",`total` BIGINT UNSIGNED COMMENT "total allocated",`high` BIGINT UNSIGNED COMMENT "in use high water mark",`entry_size` BIGINT UNSIGNED COMMENT "size in bytes of each object",`config_param1` INT UNSIGNED COMMENT "config param 1 affecting pool",`config_param2` INT UNSIGNED COMMENT "config param 2 affecting pool",`config_param3` INT UNSIGNED COMMENT "config param 3 affecting pool",`config_param4` INT UNSIGNED COMMENT "config param 4 affecting pool") COMMENT="pool usage" ENGINE=NDBINFO','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.ndb$transporters
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS `ndbinfo`.`ndb$transporters`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`ndb$transporters` (`node_id` INT UNSIGNED,`remote_node_id` INT UNSIGNED,`connection_status` INT UNSIGNED) COMMENT="transporter status" ENGINE=NDBINFO','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.ndb$logspaces
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS `ndbinfo`.`ndb$logspaces`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`ndb$logspaces` (`node_id` INT UNSIGNED,`log_type` INT UNSIGNED COMMENT "0 = REDO, 1 = DD-UNDO",`log_id` INT UNSIGNED,`log_part` INT UNSIGNED,`total` BIGINT UNSIGNED COMMENT "total allocated",`used` BIGINT UNSIGNED COMMENT "currently in use",`high` BIGINT UNSIGNED COMMENT "in use high water mark") COMMENT="logspace usage" ENGINE=NDBINFO','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.ndb$logbuffers
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS `ndbinfo`.`ndb$logbuffers`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`ndb$logbuffers` (`node_id` INT UNSIGNED,`log_type` INT UNSIGNED COMMENT "0 = REDO, 1 = DD-UNDO",`log_id` INT UNSIGNED,`log_part` INT UNSIGNED,`total` BIGINT UNSIGNED COMMENT "total allocated",`used` BIGINT UNSIGNED COMMENT "currently in use",`high` BIGINT UNSIGNED COMMENT "in use high water mark") COMMENT="logbuffer usage" ENGINE=NDBINFO','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.ndb$resources
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS `ndbinfo`.`ndb$resources`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`ndb$resources` (`node_id` INT UNSIGNED,`resource_id` INT UNSIGNED,`reserved` INT UNSIGNED COMMENT "reserved for this resource",`used` INT UNSIGNED COMMENT "currently in use",`max` INT UNSIGNED COMMENT "max available",`high` INT UNSIGNED COMMENT "in use high water mark") COMMENT="resources usage (a.k.a superpool)" ENGINE=NDBINFO','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.ndb$counters
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS `ndbinfo`.`ndb$counters`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`ndb$counters` (`node_id` INT UNSIGNED,`block_number` INT UNSIGNED,`block_instance` INT UNSIGNED,`counter_id` INT UNSIGNED,`val` BIGINT UNSIGNED COMMENT "monotonically increasing since process start") COMMENT="monotonic counters" ENGINE=NDBINFO','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.ndb$nodes
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS `ndbinfo`.`ndb$nodes`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`ndb$nodes` (`node_id` INT UNSIGNED,`uptime` BIGINT UNSIGNED COMMENT "time in seconds that node has been running",`status` INT UNSIGNED COMMENT "starting/started/stopped etc.",`start_phase` INT UNSIGNED COMMENT "start phase if node is starting",`config_generation` INT UNSIGNED COMMENT "configuration generation number") COMMENT="node status" ENGINE=NDBINFO','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.ndb$diskpagebuffer
SET @str=IF(@have_ndbinfo,'DROP TABLE IF EXISTS `ndbinfo`.`ndb$diskpagebuffer`','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`ndb$diskpagebuffer` (`node_id` INT UNSIGNED,`block_instance` INT UNSIGNED,`pages_written` BIGINT UNSIGNED COMMENT "Pages written to disk",`pages_written_lcp` BIGINT UNSIGNED COMMENT "Pages written by local checkpoint",`pages_read` BIGINT UNSIGNED COMMENT "Pages read from disk",`log_waits` BIGINT UNSIGNED COMMENT "Page writes waiting for log to be written to disk",`page_requests_direct_return` BIGINT UNSIGNED COMMENT "Page in buffer and no requests waiting for it",`page_requests_wait_queue` BIGINT UNSIGNED COMMENT "Page in buffer, but some requests are already waiting for it",`page_requests_wait_io` BIGINT UNSIGNED COMMENT "Page not in buffer, waiting to be read from disk") COMMENT="disk page buffer info" ENGINE=NDBINFO','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.blocks
SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`blocks` (block_number INT UNSIGNED PRIMARY KEY, block_name VARCHAR(512))','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'INSERT INTO `ndbinfo`.`blocks` VALUES (254, "CMVMI"), (248, "DBACC"), (250, "DBDICT"), (246, "DBDIH"), (247, "DBLQH"), (245, "DBTC"), (249, "DBTUP"), (253, "NDBFS"), (251, "NDBCNTR"), (252, "QMGR"), (255, "TRIX"), (244, "BACKUP"), (256, "DBUTIL"), (257, "SUMA"), (258, "DBTUX"), (259, "TSMAN"), (260, "LGMAN"), (261, "PGMAN"), (262, "RESTORE"), (263, "DBINFO"), (264, "DBSPJ")','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.config_params
SET @str=IF(@have_ndbinfo,'CREATE TABLE `ndbinfo`.`config_params` (param_number INT UNSIGNED PRIMARY KEY, param_name VARCHAR(512))','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

SET @str=IF(@have_ndbinfo,'INSERT INTO `ndbinfo`.`config_params` VALUES (179, "MaxNoOfSubscriptions"), (180, "MaxNoOfSubscribers"), (181, "MaxNoOfConcurrentSubOperations"), (5, "HostName"), (3, "NodeId"), (101, "NoOfReplicas"), (103, "MaxNoOfAttributes"), (102, "MaxNoOfTables"), (149, "MaxNoOfOrderedIndexes"), (150, "MaxNoOfUniqueHashIndexes"), (110, "MaxNoOfConcurrentIndexOperations"), (105, "MaxNoOfTriggers"), (109, "MaxNoOfFiredTriggers"), (100, "MaxNoOfSavedMessages"), (177, "LockExecuteThreadToCPU"), (178, "LockMaintThreadsToCPU"), (176, "RealtimeScheduler"), (114, "LockPagesInMainMemory"), (123, "TimeBetweenWatchDogCheck"), (174, "SchedulerExecutionTimer"), (175, "SchedulerSpinTimer"), (141, "TimeBetweenWatchDogCheckInitial"), (124, "StopOnError"), (107, "MaxNoOfConcurrentOperations"), (151, "MaxNoOfLocalOperations"), (152, "MaxNoOfLocalScans"), (153, "BatchSizePerLocalScan"), (106, "MaxNoOfConcurrentTransactions"), (108, "MaxNoOfConcurrentScans"), (111, "TransactionBufferMemory"), (113, "IndexMemory"), (112, "DataMemory"), (154, "UndoIndexBuffer"), (155, "UndoDataBuffer"), (156, "RedoBuffer"), (157, "LongMessageBuffer"), (160, "DiskPageBufferMemory"), (198, "SharedGlobalMemory"), (115, "StartPartialTimeout"), (116, "StartPartitionedTimeout"), (117, "StartFailureTimeout"), (118, "HeartbeatIntervalDbDb"), (119, "HeartbeatIntervalDbApi"), (120, "TimeBetweenLocalCheckpoints"), (121, "TimeBetweenGlobalCheckpoints"), (170, "TimeBetweenEpochs"), (171, "TimeBetweenEpochsTimeout"), (182, "MaxBufferedEpochs"), (126, "NoOfFragmentLogFiles"), (140, "FragmentLogFileSize"), (189, "InitFragmentLogFiles"), (190, "DiskIOThreadPool"), (159, "MaxNoOfOpenFiles"), (162, "InitialNoOfOpenFiles"), (129, "TimeBetweenInactiveTransactionAbortCheck"), (130, "TransactionInactiveTimeout"), (131, "TransactionDeadlockDetectionTimeout"), (148, "Diskless"), (122, "ArbitrationTimeout"), (142, "Arbitration"), (7, "DataDir"), (125, "FileSystemPath"), (250, "LogLevelStartup"), (251, "LogLevelShutdown"), (252, "LogLevelStatistic"), (253, "LogLevelCheckpoint"), (254, "LogLevelNodeRestart"), (255, "LogLevelConnection"), (259, "LogLevelCongestion"), (258, "LogLevelError"), (256, "LogLevelInfo"), (158, "BackupDataDir"), (163, "DiskSyncSize"), (164, "DiskCheckpointSpeed"), (165, "DiskCheckpointSpeedInRestart"), (133, "BackupMemory"), (134, "BackupDataBufferSize"), (135, "BackupLogBufferSize"), (136, "BackupWriteSize"), (139, "BackupMaxWriteSize"), (161, "StringMemory"), (169, "MaxAllocate"), (166, "MemReportFrequency"), (167, "BackupReportFrequency"), (184, "StartupStatusReportFrequency"), (168, "ODirect"), (172, "CompressedBackup"), (173, "CompressedLCP"), (9, "TotalSendBufferMemory"), (202, "ReservedSendBufferMemory"), (185, "Nodegroup"), (186, "MaxNoOfExecutionThreads"), (188, "__ndbmt_lqh_workers"), (187, "__ndbmt_lqh_threads"), (191, "__ndbmt_classic"), (193, "FileSystemPathDD"), (194, "FileSystemPathDataFiles"), (195, "FileSystemPathUndoFiles"), (196, "InitialLogfileGroup"), (197, "InitialTablespace"), (605, "MaxLCPStartDelay"), (606, "BuildIndexThreads"), (607, "HeartbeatOrder"), (608, "DictTrace"), (609, "MaxStartFailRetries"), (610, "StartFailRetryDelay")','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.transporters
SET @str=IF(@have_ndbinfo,'CREATE OR REPLACE DEFINER=`root@localhost` SQL SECURITY INVOKER VIEW `ndbinfo`.`transporters` AS SELECT node_id, remote_node_id,  CASE connection_status  WHEN 0 THEN "CONNECTED"  WHEN 1 THEN "CONNECTING"  WHEN 2 THEN "DISCONNECTED"  WHEN 3 THEN "DISCONNECTING"  ELSE NULL  END AS status FROM ndbinfo.ndb$transporters','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.logspaces
SET @str=IF(@have_ndbinfo,'CREATE OR REPLACE DEFINER=`root@localhost` SQL SECURITY INVOKER VIEW `ndbinfo`.`logspaces` AS SELECT node_id,  CASE log_type  WHEN 0 THEN "REDO"  WHEN 1 THEN "DD-UNDO"  ELSE NULL  END AS log_type, log_id, log_part, total, used FROM ndbinfo.ndb$logspaces','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.logbuffers
SET @str=IF(@have_ndbinfo,'CREATE OR REPLACE DEFINER=`root@localhost` SQL SECURITY INVOKER VIEW `ndbinfo`.`logbuffers` AS SELECT node_id,  CASE log_type  WHEN 0 THEN "REDO"  WHEN 1 THEN "DD-UNDO"  ELSE "<unknown>"  END AS log_type, log_id, log_part, total, used FROM ndbinfo.ndb$logbuffers','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.resources
SET @str=IF(@have_ndbinfo,'CREATE OR REPLACE DEFINER=`root@localhost` SQL SECURITY INVOKER VIEW `ndbinfo`.`resources` AS SELECT node_id,  CASE resource_id  WHEN 0 THEN "RESERVED"  WHEN 1 THEN "DISK_OPERATIONS"  WHEN 2 THEN "DISK_RECORDS"  WHEN 3 THEN "DATA_MEMORY"  WHEN 4 THEN "JOBBUFFER"  WHEN 5 THEN "FILE_BUFFERS"  WHEN 6 THEN "TRANSPORTER_BUFFERS"  ELSE "<unknown>"  END AS resource_name, reserved, used, max FROM ndbinfo.ndb$resources','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.counters
SET @str=IF(@have_ndbinfo,'CREATE OR REPLACE DEFINER=`root@localhost` SQL SECURITY INVOKER VIEW `ndbinfo`.`counters` AS SELECT node_id, b.block_name, block_instance, counter_id, CASE counter_id  WHEN 1 THEN "ATTRINFO"  WHEN 2 THEN "TRANSACTIONS"  WHEN 3 THEN "COMMITS"  WHEN 4 THEN "READS"  WHEN 5 THEN "SIMPLE_READS"  WHEN 6 THEN "WRITES"  WHEN 7 THEN "ABORTS"  WHEN 8 THEN "TABLE_SCANS"  WHEN 9 THEN "RANGE_SCANS"  WHEN 10 THEN "OPERATIONS"  WHEN 11 THEN "READS_RECEIVED"  WHEN 12 THEN "LOCAL_READS_SENT"  WHEN 13 THEN "REMOTE_READS_SENT"  WHEN 14 THEN "READS_NOT_FOUND"  WHEN 15 THEN "TABLE_SCANS_RECEIVED"  WHEN 16 THEN "LOCAL_TABLE_SCANS_SENT"  WHEN 17 THEN "RANGE_SCANS_RECEIVED"  WHEN 18 THEN "LOCAL_RANGE_SCANS_SENT"  WHEN 19 THEN "REMOTE_RANGE_SCANS_SENT"  WHEN 20 THEN "SCAN_BATCHES_RETURNED"  WHEN 21 THEN "SCAN_ROWS_RETURNED"  WHEN 22 THEN "PRUNED_RANGE_SCANS_RECEIVED"  WHEN 23 THEN "CONST_PRUNED_RANGE_SCANS_RECEIVED"  ELSE "<unknown>"  END AS counter_name, val FROM ndbinfo.ndb$counters c, ndbinfo.blocks b WHERE c.block_number = b.block_number','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.nodes
SET @str=IF(@have_ndbinfo,'CREATE OR REPLACE DEFINER=`root@localhost` SQL SECURITY INVOKER VIEW `ndbinfo`.`nodes` AS SELECT node_id, uptime, CASE status  WHEN 0 THEN "NOTHING"  WHEN 1 THEN "CMVMI"  WHEN 2 THEN "STARTING"  WHEN 3 THEN "STARTED"  WHEN 4 THEN "SINGLEUSER"  WHEN 5 THEN "STOPPING_1"  WHEN 6 THEN "STOPPING_2"  WHEN 7 THEN "STOPPING_3"  WHEN 8 THEN "STOPPING_4"  ELSE "<unknown>"  END AS status, start_phase, config_generation FROM ndbinfo.ndb$nodes','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.memoryusage
SET @str=IF(@have_ndbinfo,'CREATE OR REPLACE DEFINER=`root@localhost` SQL SECURITY INVOKER VIEW `ndbinfo`.`memoryusage` AS SELECT node_id,  pool_name AS memory_type,  SUM(used*entry_size) AS used,  SUM(used) AS used_pages,  SUM(total*entry_size) AS total,  SUM(total) AS total_pages FROM ndbinfo.ndb$pools WHERE block_number IN (248, 254) AND   (pool_name = "Index memory" OR pool_name = "Data memory") GROUP BY node_id, memory_type','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# ndbinfo.diskpagebuffer
SET @str=IF(@have_ndbinfo,'CREATE OR REPLACE SQL SECURITY INVOKER VIEW `ndbinfo`.`diskpagebuffer` AS SELECT node_id, block_instance, pages_written, pages_written_lcp, pages_read, log_waits, page_requests_direct_return, page_requests_wait_queue, page_requests_wait_io FROM ndbinfo.ndb$diskpagebuffer','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;

# Finally turn off offline mode
SET @str=IF(@have_ndbinfo,'SET @@global.ndbinfo_offline=FALSE','SET @dummy = 0');
PREPARE stmt FROM @str;
EXECUTE stmt;
DROP PREPARE stmt;
-- Copyright (c) 2007, 2013, Oracle and/or its affiliates. All rights reserved.
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; version 2 of the License.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA

--
-- The inital data for system tables of MySQL Server
--

-- When setting up a "cross bootstrap" database (e.g., creating data on a Unix
-- host which will later be included in a Windows zip file), any lines
-- containing "@current_hostname" are filtered out by mysql_install_db.

-- Get the hostname, if the hostname has any wildcard character like "_" or "%" 
-- add escape character in front of wildcard character to convert "_" or "%" to
-- a plain character
SELECT LOWER( REPLACE((SELECT REPLACE(@@hostname,'_','\_')),'%','\%') )INTO @current_hostname;


-- Fill "db" table with default grants for anyone to
-- access database 'test' and 'test_%' if "db" table didn't exist
CREATE TEMPORARY TABLE tmp_db LIKE db;
INSERT INTO tmp_db VALUES ('%','test','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N','Y','Y');
INSERT INTO tmp_db VALUES ('%','test\_%','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N','Y','Y');
INSERT INTO db SELECT * FROM tmp_db WHERE @had_db_table=0;
DROP TABLE tmp_db;


-- Fill "user" table with default users allowing root access
-- from local machine if "user" table didn't exist before
CREATE TEMPORARY TABLE tmp_user LIKE user;
INSERT INTO tmp_user VALUES ('localhost','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'','','N');
REPLACE INTO tmp_user SELECT @current_hostname,'root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'','','N' FROM dual WHERE @current_hostname != 'localhost';
REPLACE INTO tmp_user VALUES ('127.0.0.1','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'','','N');
REPLACE INTO tmp_user VALUES ('::1','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'','','N');
INSERT INTO tmp_user (host,user) VALUES ('localhost','');
INSERT INTO tmp_user (host,user) SELECT @current_hostname,'' FROM dual WHERE @current_hostname != 'localhost';
INSERT INTO user SELECT * FROM tmp_user WHERE @had_user_table=0;
DROP TABLE tmp_user;

CREATE TEMPORARY TABLE tmp_proxies_priv LIKE proxies_priv;
INSERT INTO tmp_proxies_priv VALUES ('localhost', 'root', '', '', TRUE, '', now());
REPLACE INTO tmp_proxies_priv SELECT @current_hostname, 'root', '', '', TRUE, '', now() FROM DUAL WHERE LOWER (@current_hostname) != 'localhost';
INSERT INTO  proxies_priv SELECT * FROM tmp_proxies_priv WHERE @had_proxies_priv_table=0;
DROP TABLE tmp_proxies_priv;
-- Copyright (c) 2003, 2014, Oracle and/or its affiliates. All rights reserved.
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; version 2 of the License.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

-- DO NOT EDIT THIS FILE. It is generated automatically.

-- File generation date: 2014-03-14
-- MySQL series: 5.6
-- Document repository revision: 38087

-- To use this file, load its contents into the mysql database. For example,
-- with the mysql client program, process the file like this, where
-- file_name is the name of this file:

--     mysql -u root -p mysql < file_name

set names 'utf8';

delete from help_topic;
delete from help_category;
delete from help_keyword;
delete from help_relation;

insert into help_category (help_category_id,name,parent_category_id,url) values (1,'Geographic',0,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (2,'Polygon properties',35,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (3,'WKT',35,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (4,'Numeric Functions',39,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (5,'Plugins',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (6,'MBR',35,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (7,'Control flow functions',39,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (8,'Transactions',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (9,'Help Metadata',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (10,'Account Management',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (11,'Point properties',35,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (12,'Encryption Functions',39,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (13,'LineString properties',35,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (14,'Miscellaneous Functions',39,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (15,'Logical operators',39,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (16,'Functions and Modifiers for Use with GROUP BY',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (17,'Information Functions',39,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (18,'Storage Engines',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (19,'Comparison operators',39,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (20,'Bit Functions',39,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (21,'Table Maintenance',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (22,'User-Defined Functions',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (23,'Data Types',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (24,'Compound Statements',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (25,'Geometry constructors',35,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (26,'GeometryCollection properties',1,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (27,'Administration',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (28,'Data Manipulation',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (29,'Utility',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (30,'Language Structure',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (31,'Geometry relations',35,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (32,'Date and Time Functions',39,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (33,'WKB',35,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (34,'Procedures',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (35,'Geographic Features',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (36,'Contents',0,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (37,'Geometry properties',35,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (38,'String Functions',39,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (39,'Functions',36,'');
insert into help_category (help_category_id,name,parent_category_id,url) values (40,'Data Definition',36,'');

insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (0,28,'JOIN','MySQL supports the following JOIN syntaxes for the table_references\npart of SELECT statements and multiple-table DELETE and UPDATE\nstatements:\n\ntable_references:\n    escaped_table_reference [, escaped_table_reference] ...\n\nescaped_table_reference:\n    table_reference\n  | { OJ table_reference }\n\ntable_reference:\n    table_factor\n  | join_table\n\ntable_factor:\n    tbl_name [PARTITION (partition_names)] \n        [[AS] alias] [index_hint_list]\n  | table_subquery [AS] alias\n  | ( table_references )\n\njoin_table:\n    table_reference [INNER | CROSS] JOIN table_factor [join_condition]\n  | table_reference STRAIGHT_JOIN table_factor\n  | table_reference STRAIGHT_JOIN table_factor ON conditional_expr\n  | table_reference {LEFT|RIGHT} [OUTER] JOIN table_reference join_condition\n  | table_reference NATURAL [{LEFT|RIGHT} [OUTER]] JOIN table_factor\n\njoin_condition:\n    ON conditional_expr\n  | USING (column_list)\n\nindex_hint_list:\n    index_hint [, index_hint] ...\n\nindex_hint:\n    USE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] ([index_list])\n  | IGNORE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)\n  | FORCE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)\n\nindex_list:\n    index_name [, index_name] ...\n\nA table reference is also known as a join expression.\n\nIn MySQL 5.6.2 and later, a table reference (when it refers to a\npartitioned table) may contain a PARTITION option, including a\ncomma-separated list of partitions, subpartitions, or both. This option\nfollows the name of the table and precedes any alias declaration. The\neffect of this option is that rows are selected only from the listed\npartitions or subpartitions---in other words, any partitions or\nsubpartitions not named in the list are ignored For more information,\nsee http://dev.mysql.com/doc/refman/5.6/en/partitioning-selection.html.\n\nThe syntax of table_factor is extended in comparison with the SQL\nStandard. The latter accepts only table_reference, not a list of them\ninside a pair of parentheses.\n\nThis is a conservative extension if we consider each comma in a list of\ntable_reference items as equivalent to an inner join. For example:\n\nSELECT * FROM t1 LEFT JOIN (t2, t3, t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nis equivalent to:\n\nSELECT * FROM t1 LEFT JOIN (t2 CROSS JOIN t3 CROSS JOIN t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nIn MySQL, JOIN, CROSS JOIN, and INNER JOIN are syntactic equivalents\n(they can replace each other). In standard SQL, they are not\nequivalent. INNER JOIN is used with an ON clause, CROSS JOIN is used\notherwise.\n\nIn general, parentheses can be ignored in join expressions containing\nonly inner join operations. MySQL also supports nested joins (see\nhttp://dev.mysql.com/doc/refman/5.6/en/nested-join-optimization.html).\n\nIndex hints can be specified to affect how the MySQL optimizer makes\nuse of indexes. For more information, see\nhttp://dev.mysql.com/doc/refman/5.6/en/index-hints.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/join.html\n\n','SELECT left_tbl.*\n  FROM left_tbl LEFT JOIN right_tbl ON left_tbl.id = right_tbl.id\n  WHERE right_tbl.id IS NULL;\n','http://dev.mysql.com/doc/refman/5.6/en/join.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (1,38,'HEX','Syntax:\nHEX(str), HEX(N)\n\nFor a string argument str, HEX() returns a hexadecimal string\nrepresentation of str where each byte of each character in str is\nconverted to two hexadecimal digits. (Multi-byte characters therefore\nbecome more than two digits.) The inverse of this operation is\nperformed by the UNHEX() function.\n\nFor a numeric argument N, HEX() returns a hexadecimal string\nrepresentation of the value of N treated as a longlong (BIGINT) number.\nThis is equivalent to CONV(N,10,16). The inverse of this operation is\nperformed by CONV(HEX(N),16,10).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT 0x616263, HEX(\'abc\'), UNHEX(HEX(\'abc\'));\n        -> \'abc\', 616263, \'abc\'\nmysql> SELECT HEX(255), CONV(HEX(255),16,10);\n        -> \'FF\', 255\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (2,31,'CONTAINS','Contains(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 completely contains g2. This\ntests the opposite relationship as Within().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (3,37,'SRID','SRID(g)\n\nReturns an integer indicating the Spatial Reference System ID for the\ngeometry value g.\n\nIn MySQL, the SRID value is just an integer associated with the\ngeometry value. All calculations are done assuming Euclidean (planar)\ngeometry.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SELECT SRID(GeomFromText(\'LineString(1 1,2 2)\',101));\n+-----------------------------------------------+\n| SRID(GeomFromText(\'LineString(1 1,2 2)\',101)) |\n+-----------------------------------------------+\n|                                           101 |\n+-----------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (4,27,'SHOW CONTRIBUTORS','Syntax:\nSHOW CONTRIBUTORS\n\nThe SHOW CONTRIBUTORS statement displays information about the people\nwho contribute to MySQL source or to causes that we support. For each\ncontributor, it displays Name, Location, and Comment values.\n\nThis statement is removed as of MySQL 5.6.8.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-contributors.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-contributors.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (5,16,'VARIANCE','Syntax:\nVARIANCE(expr)\n\nReturns the population standard variance of expr. This is an extension\nto standard SQL. The standard SQL function VAR_POP() can be used\ninstead.\n\nVARIANCE() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (6,40,'DROP SERVER','Syntax:\nDROP SERVER [ IF EXISTS ] server_name\n\nDrops the server definition for the server named server_name. The\ncorresponding row in the mysql.servers table is deleted. This statement\nrequires the SUPER privilege.\n\nDropping a server for a table does not affect any FEDERATED tables that\nused this connection information when they were created. See [HELP\nCREATE SERVER].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-server.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-server.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (7,27,'SHOW AUTHORS','Syntax:\nSHOW AUTHORS\n\nThe SHOW AUTHORS statement displays information about the people who\nwork on MySQL. For each author, it displays Name, Location, and Comment\nvalues.\n\nThis statement is removed as of MySQL 5.6.8.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-authors.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-authors.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (8,38,'CONCAT','Syntax:\nCONCAT(str1,str2,...)\n\nReturns the string that results from concatenating the arguments. May\nhave one or more arguments. If all arguments are nonbinary strings, the\nresult is a nonbinary string. If the arguments include any binary\nstrings, the result is a binary string. A numeric argument is converted\nto its equivalent nonbinary string form.\n\nCONCAT() returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT CONCAT(\'My\', \'S\', \'QL\');\n        -> \'MySQL\'\nmysql> SELECT CONCAT(\'My\', NULL, \'QL\');\n        -> NULL\nmysql> SELECT CONCAT(14.3);\n        -> \'14.3\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (9,35,'GEOMETRY HIERARCHY','Geometry is the base class. It is an abstract class. The instantiable\nsubclasses of Geometry are restricted to zero-, one-, and\ntwo-dimensional geometric objects that exist in two-dimensional\ncoordinate space. All instantiable geometry classes are defined so that\nvalid instances of a geometry class are topologically closed (that is,\nall defined geometries include their boundary).\n\nThe base Geometry class has subclasses for Point, Curve, Surface, and\nGeometryCollection:\n\no Point represents zero-dimensional objects.\n\no Curve represents one-dimensional objects, and has subclass\n  LineString, with sub-subclasses Line and LinearRing.\n\no Surface is designed for two-dimensional objects and has subclass\n  Polygon.\n\no GeometryCollection has specialized zero-, one-, and two-dimensional\n  collection classes named MultiPoint, MultiLineString, and\n  MultiPolygon for modeling geometries corresponding to collections of\n  Points, LineStrings, and Polygons, respectively. MultiCurve and\n  MultiSurface are introduced as abstract superclasses that generalize\n  the collection interfaces to handle Curves and Surfaces.\n\nGeometry, Curve, Surface, MultiCurve, and MultiSurface are defined as\nnoninstantiable classes. They define a common set of methods for their\nsubclasses and are included for extensibility.\n\nPoint, LineString, Polygon, GeometryCollection, MultiPoint,\nMultiLineString, and MultiPolygon are instantiable classes.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/gis-geometry-class-hierarchy.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/gis-geometry-class-hierarchy.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (10,38,'CHAR FUNCTION','Syntax:\nCHAR(N,... [USING charset_name])\n\nCHAR() interprets each argument N as an integer and returns a string\nconsisting of the characters given by the code values of those\nintegers. NULL values are skipped.\nBy default, CHAR() returns a binary string. To produce a string in a\ngiven character set, use the optional USING clause:\n\nmysql> SELECT CHARSET(CHAR(0x65)), CHARSET(CHAR(0x65 USING utf8));\n+---------------------+--------------------------------+\n| CHARSET(CHAR(0x65)) | CHARSET(CHAR(0x65 USING utf8)) |\n+---------------------+--------------------------------+\n| binary              | utf8                           |\n+---------------------+--------------------------------+\n\nIf USING is given and the result string is illegal for the given\ncharacter set, a warning is issued. Also, if strict SQL mode is\nenabled, the result from CHAR() becomes NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT CHAR(77,121,83,81,\'76\');\n        -> \'MySQL\'\nmysql> SELECT CHAR(77,77.3,\'77.3\');\n        -> \'MMM\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (11,27,'SHOW CREATE TRIGGER','Syntax:\nSHOW CREATE TRIGGER trigger_name\n\nThis statement shows the CREATE TRIGGER statement that creates the\nnamed trigger.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-create-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-create-trigger.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (12,27,'SHOW CREATE PROCEDURE','Syntax:\nSHOW CREATE PROCEDURE proc_name\n\nThis statement is a MySQL extension. It returns the exact string that\ncan be used to re-create the named stored procedure. A similar\nstatement, SHOW CREATE FUNCTION, displays information about stored\nfunctions (see [HELP SHOW CREATE FUNCTION]).\n\nTo use either statement, you must be the owner of the routine or have\nSELECT access to the mysql.proc table. If you do not have privileges\nfor the routine itself, the value displayed for the Create Procedure or\nCreate Function field will be NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-create-procedure.html\n\n','mysql> SHOW CREATE PROCEDURE test.simpleproc\\G\n*************************** 1. row ***************************\n           Procedure: simpleproc\n            sql_mode:\n    Create Procedure: CREATE PROCEDURE `simpleproc`(OUT param1 INT)\n                      BEGIN\n                      SELECT COUNT(*) INTO param1 FROM t;\n                      END\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\nmysql> SHOW CREATE FUNCTION test.hello\\G\n*************************** 1. row ***************************\n            Function: hello\n            sql_mode:\n     Create Function: CREATE FUNCTION `hello`(s CHAR(20))\n                      RETURNS CHAR(50)\n                      RETURN CONCAT(\'Hello, \',s,\'!\')\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.6/en/show-create-procedure.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (13,24,'OPEN','Syntax:\nOPEN cursor_name\n\nThis statement opens a previously declared cursor. For an example, see\nhttp://dev.mysql.com/doc/refman/5.6/en/cursors.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/open.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/open.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (14,31,'ST_INTERSECTS','ST_Intersects(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially intersects g2.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (15,38,'LOWER','Syntax:\nLOWER(str)\n\nReturns the string str with all characters changed to lowercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nmysql> SELECT LOWER(\'QUADRATICALLY\');\n        -> \'quadratically\'\n\nLOWER() (and UPPER()) are ineffective when applied to binary strings\n(BINARY, VARBINARY, BLOB). To perform lettercase conversion, convert\nthe string to a nonbinary string:\n\nmysql> SET @str = BINARY \'New York\';\nmysql> SELECT LOWER(@str), LOWER(CONVERT(@str USING latin1));\n+-------------+-----------------------------------+\n| LOWER(@str) | LOWER(CONVERT(@str USING latin1)) |\n+-------------+-----------------------------------+\n| New York    | new york                          |\n+-------------+-----------------------------------+\n\nFor Unicode character sets, LOWER() and UPPER() work accounting to\nUnicode Collation Algorithm (UCA) 5.2.0 for xxx_unicode_520_ci\ncollations and for language-specific collations that are derived from\nthem. For other Unicode collations, LOWER() and UPPER() work accounting\nto Unicode Collation Algorithm (UCA) 4.0.0. See\nhttp://dev.mysql.com/doc/refman/5.6/en/charset-unicode-sets.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (16,40,'CREATE TRIGGER','Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    TRIGGER trigger_name\n    trigger_time trigger_event\n    ON tbl_name FOR EACH ROW\n    trigger_body\n\ntrigger_time: { BEFORE | AFTER }\n\ntrigger_event: { INSERT | UPDATE | DELETE }\n\nThis statement creates a new trigger. A trigger is a named database\nobject that is associated with a table, and that activates when a\nparticular event occurs for the table. The trigger becomes associated\nwith the table named tbl_name, which must refer to a permanent table.\nYou cannot associate a trigger with a TEMPORARY table or a view.\n\nTrigger names exist in the schema namespace, meaning that all triggers\nmust have unique names within a schema. Triggers in different schemas\ncan have the same name.\n\nThis section describes CREATE TRIGGER syntax. For additional\ndiscussion, see\nhttp://dev.mysql.com/doc/refman/5.6/en/trigger-syntax.html.\n\nCREATE TRIGGER requires the TRIGGER privilege for the table associated\nwith the trigger. The statement might also require the SUPER privilege,\ndepending on the DEFINER value, as described later in this section. If\nbinary logging is enabled, CREATE TRIGGER might require the SUPER\nprivilege, as described in\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-programs-logging.html.\n\nThe DEFINER clause determines the security context to be used when\nchecking access privileges at trigger activation time, as described\nlater in this section.\n\ntrigger_time is the trigger action time. It can be BEFORE or AFTER to\nindicate that the trigger activates before or after each row to be\nmodified.\n\ntrigger_event indicates the kind of operation that activates the\ntrigger. These trigger_event values are permitted:\n\no INSERT: The trigger activates whenever a new row is inserted into the\n  table; for example, through INSERT, LOAD DATA, and REPLACE\n  statements.\n\no UPDATE: The trigger activates whenever a row is modified; for\n  example, through UPDATE statements.\n\no DELETE: The trigger activates whenever a row is deleted from the\n  table; for example, through DELETE and REPLACE statements. DROP TABLE\n  and TRUNCATE TABLE statements on the table do not activate this\n  trigger, because they do not use DELETE. Dropping a partition does\n  not activate DELETE triggers, either.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/create-trigger.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (17,32,'MONTH','Syntax:\nMONTH(date)\n\nReturns the month for date, in the range 1 to 12 for January to\nDecember, or 0 for dates such as \'0000-00-00\' or \'2008-00-00\' that have\na zero month part.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT MONTH(\'2008-02-03\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (18,27,'SHOW TRIGGERS','Syntax:\nSHOW TRIGGERS [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TRIGGERS lists the triggers currently defined for tables in a\ndatabase (the default database unless a FROM clause is given). This\nstatement returns results only for databases and tables for which you\nhave the TRIGGER privilege. The LIKE clause, if present, indicates\nwhich table names to match (not trigger names) and causes the statement\nto display triggers for those tables. The WHERE clause can be given to\nselect rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html.\n\nFor the trigger ins_sum as defined in\nhttp://dev.mysql.com/doc/refman/5.6/en/triggers.html, the output of\nthis statement is as shown here:\n\nmysql> SHOW TRIGGERS LIKE \'acc%\'\\G\n*************************** 1. row ***************************\n             Trigger: ins_sum\n               Event: INSERT\n               Table: account\n           Statement: SET @sum = @sum + NEW.amount\n              Timing: BEFORE\n             Created: NULL\n            sql_mode: NO_ENGINE_SUBSTITUTION\n             Definer: me@localhost\ncharacter_set_client: utf8\ncollation_connection: utf8_general_ci\n  Database Collation: latin1_swedish_ci\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-triggers.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-triggers.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (19,13,'ISCLOSED','IsClosed(ls)\n\nReturns 1 if the LineString value ls is closed (that is, its\nStartPoint() and EndPoint() values are the same) and is simple (does\nnot pass through the same point more than once). Returns 0 if ls is not\nclosed, and -1 if it is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @ls1 = \'LineString(1 1,2 2,3 3,2 2)\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SET @ls2 = \'LineString(1 1,2 2,3 3,1 1)\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT IsClosed(GeomFromText(@ls1));\n+------------------------------+\n| IsClosed(GeomFromText(@ls1)) |\n+------------------------------+\n|                            0 |\n+------------------------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT IsClosed(GeomFromText(@ls2));\n+------------------------------+\n| IsClosed(GeomFromText(@ls2)) |\n+------------------------------+\n|                            1 |\n+------------------------------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (20,38,'REGEXP','Syntax:\nexpr REGEXP pat, expr RLIKE pat\n\nPerforms a pattern match of a string expression expr against a pattern\npat. The pattern can be an extended regular expression, the syntax for\nwhich is discussed later in this section. Returns 1 if expr matches\npat; otherwise it returns 0. If either expr or pat is NULL, the result\nis NULL. RLIKE is a synonym for REGEXP, provided for mSQL\ncompatibility.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\n*Note*: Because MySQL uses the C escape syntax in strings (for example,\n"\\n" to represent the newline character), you must double any "\\" that\nyou use in your REGEXP strings.\n\nREGEXP is not case sensitive, except when used with binary strings.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/regexp.html\n\n','mysql> SELECT \'Monty!\' REGEXP \'.*\';\n        -> 1\nmysql> SELECT \'new*\\n*line\' REGEXP \'new\\\\*.\\\\*line\';\n        -> 1\nmysql> SELECT \'a\' REGEXP \'A\', \'a\' REGEXP BINARY \'A\';\n        -> 1  0\nmysql> SELECT \'a\' REGEXP \'^[a-d]\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/regexp.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (21,24,'IF STATEMENT','Syntax:\nIF search_condition THEN statement_list\n    [ELSEIF search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND IF\n\nThe IF statement for stored programs implements a basic conditional\nconstruct.\n\n*Note*: There is also an IF() function, which differs from the IF\nstatement described here. See\nhttp://dev.mysql.com/doc/refman/5.6/en/control-flow-functions.html. The\nIF statement can have THEN, ELSE, and ELSEIF clauses, and it is\nterminated with END IF.\n\nIf the search_condition evaluates to true, the corresponding THEN or\nELSEIF clause statement_list executes. If no search_condition matches,\nthe ELSE clause statement_list executes.\n\nEach statement_list consists of one or more SQL statements; an empty\nstatement_list is not permitted.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/if.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/if.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (22,12,'VALIDATE_PASSWORD_STRENGTH','Syntax:\nVALIDATE_PASSWORD_STRENGTH(str)\n\nGiven an argument representing a cleartext password, this function\nreturns an integer to indicate how strong the password is. The return\nvalue ranges from 0 (weak) to 100 (strong).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (23,31,'WITHIN','Within(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially within g2. This\ntests the opposite relationship as Contains().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (24,27,'SHOW PLUGINS','Syntax:\nSHOW PLUGINS\n\nSHOW PLUGINS displays information about server plugins. Plugin\ninformation is also available in the INFORMATION_SCHEMA.PLUGINS table.\nSee http://dev.mysql.com/doc/refman/5.6/en/plugins-table.html.\n\nExample of SHOW PLUGINS output:\n\nmysql> SHOW PLUGINS\\G\n*************************** 1. row ***************************\n   Name: binlog\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 2. row ***************************\n   Name: CSV\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 3. row ***************************\n   Name: MEMORY\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 4. row ***************************\n   Name: MyISAM\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n...\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-plugins.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-plugins.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (25,8,'PREPARE','Syntax:\nPREPARE stmt_name FROM preparable_stmt\n\nThe PREPARE statement prepares a SQL statement and assigns it a name,\nstmt_name, by which to refer to the statement later. The prepared\nstatement is executed with EXECUTE and released with DEALLOCATE\nPREPARE. For examples, see\nhttp://dev.mysql.com/doc/refman/5.6/en/sql-syntax-prepared-statements.h\ntml.\n\nStatement names are not case sensitive. preparable_stmt is either a\nstring literal or a user variable that contains the text of the SQL\nstatement. The text must represent a single statement, not multiple\nstatements. Within the statement, ? characters can be used as parameter\nmarkers to indicate where data values are to be bound to the query\nlater when you execute it. The ? characters should not be enclosed\nwithin quotation marks, even if you intend to bind them to string\nvalues. Parameter markers can be used only where data values should\nappear, not for SQL keywords, identifiers, and so forth.\n\nIf a prepared statement with the given name already exists, it is\ndeallocated implicitly before the new statement is prepared. This means\nthat if the new statement contains an error and cannot be prepared, an\nerror is returned and no statement with the given name exists.\n\nThe scope of a prepared statement is the session within which it is\ncreated, which as several implications:\n\no A prepared statement created in one session is not available to other\n  sessions.\n\no When a session ends, whether normally or abnormally, its prepared\n  statements no longer exist. If auto-reconnect is enabled, the client\n  is not notified that the connection was lost. For this reason,\n  clients may wish to disable auto-reconnect. See\n  http://dev.mysql.com/doc/refman/5.6/en/auto-reconnect.html.\n\no A prepared statement created within a stored program continues to\n  exist after the program finishes executing and can be executed\n  outside the program later.\n\no A statement prepared in stored program context cannot refer to stored\n  procedure or function parameters or local variables because they go\n  out of scope when the program ends and would be unavailable were the\n  statement to be executed later outside the program. As a workaround,\n  refer instead to user-defined variables, which also have session\n  scope; see\n  http://dev.mysql.com/doc/refman/5.6/en/user-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/prepare.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/prepare.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (26,8,'LOCK','Syntax:\nLOCK TABLES\n    tbl_name [[AS] alias] lock_type\n    [, tbl_name [[AS] alias] lock_type] ...\n\nlock_type:\n    READ [LOCAL]\n  | [LOW_PRIORITY] WRITE\n\nUNLOCK TABLES\n\nMySQL enables client sessions to acquire table locks explicitly for the\npurpose of cooperating with other sessions for access to tables, or to\nprevent other sessions from modifying tables during periods when a\nsession requires exclusive access to them. A session can acquire or\nrelease locks only for itself. One session cannot acquire locks for\nanother session or release locks held by another session.\n\nLocks may be used to emulate transactions or to get more speed when\nupdating tables. This is explained in more detail later in this\nsection.\n\nLOCK TABLES explicitly acquires table locks for the current client\nsession. Table locks can be acquired for base tables or views. You must\nhave the LOCK TABLES privilege, and the SELECT privilege for each\nobject to be locked.\n\nFor view locking, LOCK TABLES adds all base tables used in the view to\nthe set of tables to be locked and locks them automatically. If you\nlock a table explicitly with LOCK TABLES, any tables used in triggers\nare also locked implicitly, as described in\nhttp://dev.mysql.com/doc/refman/5.6/en/lock-tables-and-triggers.html.\n\nUNLOCK TABLES explicitly releases any table locks held by the current\nsession. LOCK TABLES implicitly releases any table locks held by the\ncurrent session before acquiring new locks.\n\nAnother use for UNLOCK TABLES is to release the global read lock\nacquired with the FLUSH TABLES WITH READ LOCK statement, which enables\nyou to lock all tables in all databases. See [HELP FLUSH]. (This is a\nvery convenient way to get backups if you have a file system such as\nVeritas that can take snapshots in time.)\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/lock-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/lock-tables.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (27,27,'SHOW BINARY LOGS','Syntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [HELP PURGE BINARY LOGS], that shows\nhow to determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-binary-logs.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-binary-logs.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (28,25,'POLYGON','Polygon(ls1,ls2,...)\n\nConstructs a Polygon value from a number of LineString or WKB\nLineString arguments. If any argument does not represent a LinearRing\n(that is, not a closed and simple LineString), the return value is\nNULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (29,32,'MINUTE','Syntax:\nMINUTE(time)\n\nReturns the minute for time, in the range 0 to 59.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT MINUTE(\'2008-02-03 10:05:03\');\n        -> 5\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (30,38,'MID','Syntax:\nMID(str,pos,len)\n\nMID(str,pos,len) is a synonym for SUBSTRING(str,pos,len).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (31,17,'CONNECTION_ID','Syntax:\nCONNECTION_ID()\n\nReturns the connection ID (thread ID) for the connection. Every\nconnection has an ID that is unique among the set of currently\nconnected clients.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','mysql> SELECT CONNECTION_ID();\n        -> 23786\n','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (32,38,'FROM_BASE64()','Syntax:\nFROM_BASE64(str)\n\nTakes a string encoded with the base-64 encoded rules used by\nTO_BASE64() and returns the decoded result as a binary string. The\nresult is NULL if the argument is NULL or not a valid base-64 string.\nSee the description of TO_BASE64() for details about the encoding and\ndecoding rules.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT TO_BASE64(\'abc\'), FROM_BASE64(TO_BASE64(\'abc\'));\n        -> \'JWJj\', \'abc\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (33,28,'DELETE','Syntax:\nDELETE is a DML statement that removes rows from a table.\n\nSingle-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name\n    [PARTITION (partition_name,...)]\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nThe DELETE statement deletes rows from tbl_name and returns the number\nof deleted rows. To check the number of deleted rows, call the\nROW_COUNT() function described in\nhttp://dev.mysql.com/doc/refman/5.6/en/information-functions.html.\n\nMain Clauses\n\nThe conditions in the optional WHERE clause identify which rows to\ndelete. With no WHERE clause, all rows are deleted.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe deleted. It is specified as described in\nhttp://dev.mysql.com/doc/refman/5.6/en/select.html.\n\nIf the ORDER BY clause is specified, the rows are deleted in the order\nthat is specified. The LIMIT clause places a limit on the number of\nrows that can be deleted. These clauses apply to single-table deletes,\nbut not multi-table deletes.\n\nMultiple-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    tbl_name[.*] [, tbl_name[.*]] ...\n    FROM table_references\n    [WHERE where_condition]\n\nOr:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    FROM tbl_name[.*] [, tbl_name[.*]] ...\n    USING table_references\n    [WHERE where_condition]\n\nPrivileges\n\nYou need the DELETE privilege on a table to delete rows from it. You\nneed only the SELECT privilege for any columns that are only read, such\nas those named in the WHERE clause.\n\nPerformance\n\nWhen you do not need to know the number of deleted rows, the TRUNCATE\nTABLE statement is a faster way to empty a table than a DELETE\nstatement with no WHERE clause. Unlike DELETE, TRUNCATE TABLE cannot be\nused within a transaction or if you have a lock on the table. See [HELP\nTRUNCATE TABLE] and [HELP LOCK].\n\nThe speed of delete operations may also be affected by factors\ndiscussed in http://dev.mysql.com/doc/refman/5.6/en/delete-speed.html.\n\nTo ensure that a given DELETE statement does not take too much time,\nthe MySQL-specific LIMIT row_count clause for DELETE specifies the\nmaximum number of rows to be deleted. If the number of rows to delete\nis larger than the limit, repeat the DELETE statement until the number\nof affected rows is less than the LIMIT value.\n\nSubqueries\n\nCurrently, you cannot delete from a table and select from the same\ntable in a subquery.\n\nPartitioned Tables\n\nBeginning with MySQL 5.6.2, DELETE supports explicit partition\nselection using the PARTITION option, which takes a comma-separated\nlist of the names of one or more partitions or subpartitions (or both)\nfrom which to select rows to be dropped. Partitions not included in the\nlist are ignored. Given a partitioned table t with a partition named\np0, executing the statement DELETE FROM t PARTITION (p0) has the same\neffect on the table as executing ALTER TABLE t TRUNCATE PARTITION (p0);\nin both cases, all rows in partition p0 are dropped.\n\nPARTITION can be used along with a WHERE condition, in which case the\ncondition is tested only on rows in the listed partitions. For example,\nDELETE FROM t PARTITION (p0) WHERE c < 5 deletes rows only from\npartition p0 for which the condition c < 5 is true; rows in any other\npartitions are not checked and thus not affected by the DELETE.\n\nThe PARTITION option can also be used in multiple-table DELETE\nstatements. You can use up to one such option per table named in the\nFROM option.\n\nSee http://dev.mysql.com/doc/refman/5.6/en/partitioning-selection.html,\nfor more information and examples.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/delete.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/delete.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (34,24,'CLOSE','Syntax:\nCLOSE cursor_name\n\nThis statement closes a previously opened cursor. For an example, see\nhttp://dev.mysql.com/doc/refman/5.6/en/cursors.html.\n\nAn error occurs if the cursor is not open.\n\nIf not closed explicitly, a cursor is closed at the end of the BEGIN\n... END block in which it was declared.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/close.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/close.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (35,38,'REPLACE FUNCTION','Syntax:\nREPLACE(str,from_str,to_str)\n\nReturns the string str with all occurrences of the string from_str\nreplaced by the string to_str. REPLACE() performs a case-sensitive\nmatch when searching for from_str.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT REPLACE(\'www.mysql.com\', \'w\', \'Ww\');\n        -> \'WwWwWw.mysql.com\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (36,29,'USE','Syntax:\nUSE db_name\n\nThe USE db_name statement tells MySQL to use the db_name database as\nthe default (current) database for subsequent statements. The database\nremains the default until the end of the session or another USE\nstatement is issued:\n\nUSE db1;\nSELECT COUNT(*) FROM mytable;   # selects from db1.mytable\nUSE db2;\nSELECT COUNT(*) FROM mytable;   # selects from db2.mytable\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/use.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/use.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (37,7,'CASE OPERATOR','Syntax:\nCASE value WHEN [compare_value] THEN result [WHEN [compare_value] THEN\nresult ...] [ELSE result] END\n\nCASE WHEN [condition] THEN result [WHEN [condition] THEN result ...]\n[ELSE result] END\n\nThe first version returns the result where value=compare_value. The\nsecond version returns the result for the first condition that is true.\nIf there was no matching result value, the result after ELSE is\nreturned, or NULL if there is no ELSE part.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/control-flow-functions.html\n\n','mysql> SELECT CASE 1 WHEN 1 THEN \'one\'\n    ->     WHEN 2 THEN \'two\' ELSE \'more\' END;\n        -> \'one\'\nmysql> SELECT CASE WHEN 1>0 THEN \'true\' ELSE \'false\' END;\n        -> \'true\'\nmysql> SELECT CASE BINARY \'B\'\n    ->     WHEN \'a\' THEN 1 WHEN \'b\' THEN 2 END;\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/control-flow-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (38,27,'SHOW MASTER STATUS','Syntax:\nSHOW MASTER STATUS\n\nThis statement provides status information about the binary log files\nof the master. It requires either the SUPER or REPLICATION CLIENT\nprivilege.\n\nExample:\n\nmysql> SHOW MASTER STATUS\\G\n*************************** 1. row ***************************\n             File: master-bin.000002\n         Position: 1307\n     Binlog_Do_DB: test\n Binlog_Ignore_DB: manual, mysql\nExecuted_Gtid_Set: 3E11FA47-71CA-11E1-9E33-C80AA9429562:1-5\n1 row in set (0.00 sec)\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-master-status.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-master-status.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (39,35,'SPATIAL','For MyISAM tables, MySQL can create spatial indexes using syntax\nsimilar to that for creating regular indexes, but extended with the\nSPATIAL keyword. Currently, columns in spatial indexes must be declared\nNOT NULL. The following examples demonstrate how to create spatial\nindexes:\n\no With CREATE TABLE:\n\nCREATE TABLE geom (g GEOMETRY NOT NULL, SPATIAL INDEX(g)) ENGINE=MyISAM;\n\no With ALTER TABLE:\n\nALTER TABLE geom ADD SPATIAL INDEX(g);\n\no With CREATE INDEX:\n\nCREATE SPATIAL INDEX sp_index ON geom (g);\n\nFor MyISAM tables, SPATIAL INDEX creates an R-tree index. For storage\nengines that support nonspatial indexing of spatial columns, the engine\ncreates a B-tree index. A B-tree index on spatial values will be useful\nfor exact-value lookups, but not for range scans.\n\nFor more information on indexing spatial columns, see [HELP CREATE\nINDEX].\n\nTo drop spatial indexes, use ALTER TABLE or DROP INDEX:\n\no With ALTER TABLE:\n\nALTER TABLE geom DROP INDEX g;\n\no With DROP INDEX:\n\nDROP INDEX sp_index ON geom;\n\nExample: Suppose that a table geom contains more than 32,000\ngeometries, which are stored in the column g of type GEOMETRY. The\ntable also has an AUTO_INCREMENT column fid for storing object ID\nvalues.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-indexes.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-indexes.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (40,32,'TO_SECONDS','Syntax:\nTO_SECONDS(expr)\n\nGiven a date or datetime expr, returns a the number of seconds since\nthe year 0. If expr is not a valid date or datetime value, returns\nNULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT TO_SECONDS(950501);\n        -> 62966505600\nmysql> SELECT TO_SECONDS(\'2009-11-29\');\n        -> 63426672000\nmysql> SELECT TO_SECONDS(\'2009-11-29 13:43:32\');\n        -> 63426721412\nmysql> SELECT TO_SECONDS( NOW() );\n        -> 63426721458\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (41,32,'TIMESTAMPDIFF','Syntax:\nTIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2)\n\nReturns datetime_expr2 - datetime_expr1, where datetime_expr1 and\ndatetime_expr2 are date or datetime expressions. One expression may be\na date and the other a datetime; a date value is treated as a datetime\nhaving the time part \'00:00:00\' where necessary. The unit for the\nresult (an integer) is given by the unit argument. The legal values for\nunit are the same as those listed in the description of the\nTIMESTAMPADD() function.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMPDIFF(MONTH,\'2003-02-01\',\'2003-05-01\');\n        -> 3\nmysql> SELECT TIMESTAMPDIFF(YEAR,\'2002-05-01\',\'2001-01-01\');\n        -> -1\nmysql> SELECT TIMESTAMPDIFF(MINUTE,\'2003-02-01\',\'2003-05-01 12:05:55\');\n        -> 128885\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (42,38,'REVERSE','Syntax:\nREVERSE(str)\n\nReturns the string str with the order of the characters reversed.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT REVERSE(\'abc\');\n        -> \'cba\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (43,19,'ISNULL','Syntax:\nISNULL(expr)\n\nIf expr is NULL, ISNULL() returns 1, otherwise it returns 0.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT ISNULL(1+1);\n        -> 0\nmysql> SELECT ISNULL(1/0);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (44,23,'BINARY','BINARY(M)\n\nThe BINARY type is similar to the CHAR type, but stores binary byte\nstrings rather than nonbinary character strings. M represents the\ncolumn length in bytes.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (45,23,'BLOB DATA TYPE','A BLOB is a binary large object that can hold a variable amount of\ndata. The four BLOB types are TINYBLOB, BLOB, MEDIUMBLOB, and LONGBLOB.\nThese differ only in the maximum length of the values they can hold.\nThe four TEXT types are TINYTEXT, TEXT, MEDIUMTEXT, and LONGTEXT. These\ncorrespond to the four BLOB types and have the same maximum lengths and\nstorage requirements. See\nhttp://dev.mysql.com/doc/refman/5.6/en/storage-requirements.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/blob.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/blob.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (46,17,'CURRENT_USER','Syntax:\nCURRENT_USER, CURRENT_USER()\n\nReturns the user name and host name combination for the MySQL account\nthat the server used to authenticate the current client. This account\ndetermines your access privileges. The return value is a string in the\nutf8 character set.\n\nThe value of CURRENT_USER() can differ from the value of USER().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\nmysql> SELECT * FROM mysql.user;\nERROR 1044: Access denied for user \'\'@\'localhost\' to\ndatabase \'mysql\'\nmysql> SELECT CURRENT_USER();\n        -> \'@localhost\'\n','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (47,19,'<=','Syntax:\n<=\n\nLess than or equal:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 0.1 <= 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (48,27,'SHOW PROFILES','Syntax:\nSHOW PROFILES\n\nThe SHOW PROFILES statement, together with SHOW PROFILE, displays\nprofiling information that indicates resource usage for statements\nexecuted during the course of the current session. For more\ninformation, see [HELP SHOW PROFILE].\n\n*Note*: These statements are deprecated as of MySQL 5.6.7 and will be\nremoved in a future MySQL release. Use the Performance Schema instead;\nsee http://dev.mysql.com/doc/refman/5.6/en/performance-schema.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-profiles.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-profiles.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (49,28,'UPDATE','Syntax:\nSingle-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_reference\n    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_references\n    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...\n    [WHERE where_condition]\n\nFor the single-table syntax, the UPDATE statement updates columns of\nexisting rows in the named table with new values. The SET clause\nindicates which columns to modify and the values they should be given.\nEach value can be given as an expression, or the keyword DEFAULT to set\na column explicitly to its default value. The WHERE clause, if given,\nspecifies the conditions that identify which rows to update. With no\nWHERE clause, all rows are updated. If the ORDER BY clause is\nspecified, the rows are updated in the order that is specified. The\nLIMIT clause places a limit on the number of rows that can be updated.\n\nFor the multiple-table syntax, UPDATE updates rows in each table named\nin table_references that satisfy the conditions. Each matching row is\nupdated once, even if it matches the conditions multiple times. For\nmultiple-table syntax, ORDER BY and LIMIT cannot be used.\n\nFor partitioned tables, both the single-single and multiple-table forms\nof this statement support the use of a PARTITION option as part of a\ntable reference. This option takes a list of one or more partitions or\nsubpartitions (or both). Only the partitions (or subpartitions) listed\nare checked for matches, and a row that is not in any of these\npartitions or subpartitions is not updated, whether it satisfies the\nwhere_condition or not.\n\n*Note*: Unlike the case when using PARTITION with an INSERT or REPLACE\nstatement, an otherwise valid UPDATE ... PARTITION statement is\nconsidered successful even if no rows in the listed partitions (or\nsubpartitions) match the where_condition.\n\nSee http://dev.mysql.com/doc/refman/5.6/en/partitioning-selection.html,\nfor more information and examples.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe updated. For expression syntax, see\nhttp://dev.mysql.com/doc/refman/5.6/en/expressions.html.\n\ntable_references and where_condition are specified as described in\nhttp://dev.mysql.com/doc/refman/5.6/en/select.html.\n\nYou need the UPDATE privilege only for columns referenced in an UPDATE\nthat are actually updated. You need only the SELECT privilege for any\ncolumns that are read but not modified.\n\nThe UPDATE statement supports the following modifiers:\n\no With the LOW_PRIORITY keyword, execution of the UPDATE is delayed\n  until no other clients are reading from the table. This affects only\n  storage engines that use only table-level locking (such as MyISAM,\n  MEMORY, and MERGE).\n\no With the IGNORE keyword, the update statement does not abort even if\n  errors occur during the update. Rows for which duplicate-key\n  conflicts occur are not updated. Rows for which columns are updated\n  to values that would cause data conversion errors are updated to the\n  closest valid values instead.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/update.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/update.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (50,24,'CASE STATEMENT','Syntax:\nCASE case_value\n    WHEN when_value THEN statement_list\n    [WHEN when_value THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nOr:\n\nCASE\n    WHEN search_condition THEN statement_list\n    [WHEN search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nThe CASE statement for stored programs implements a complex conditional\nconstruct.\n\n*Note*: There is also a CASE expression, which differs from the CASE\nstatement described here. See\nhttp://dev.mysql.com/doc/refman/5.6/en/control-flow-functions.html. The\nCASE statement cannot have an ELSE NULL clause, and it is terminated\nwith END CASE instead of END.\n\nFor the first syntax, case_value is an expression. This value is\ncompared to the when_value expression in each WHEN clause until one of\nthem is equal. When an equal when_value is found, the corresponding\nTHEN clause statement_list executes. If no when_value is equal, the\nELSE clause statement_list executes, if there is one.\n\nThis syntax cannot be used to test for equality with NULL because NULL\n= NULL is false. See\nhttp://dev.mysql.com/doc/refman/5.6/en/working-with-null.html.\n\nFor the second syntax, each WHEN clause search_condition expression is\nevaluated until one is true, at which point its corresponding THEN\nclause statement_list executes. If no search_condition is equal, the\nELSE clause statement_list executes, if there is one.\n\nIf no when_value or search_condition matches the value tested and the\nCASE statement contains no ELSE clause, a Case not found for CASE\nstatement error results.\n\nEach statement_list consists of one or more SQL statements; an empty\nstatement_list is not permitted.\n\nTo handle situations where no value is matched by any WHEN clause, use\nan ELSE containing an empty BEGIN ... END block, as shown in this\nexample. (The indentation used here in the ELSE clause is for purposes\nof clarity only, and is not otherwise significant.)\n\nDELIMITER |\n\nCREATE PROCEDURE p()\n  BEGIN\n    DECLARE v INT DEFAULT 1;\n\n    CASE v\n      WHEN 2 THEN SELECT v;\n      WHEN 3 THEN SELECT 0;\n      ELSE\n        BEGIN\n        END;\n    END CASE;\n  END;\n  |\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/case.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/case.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (51,8,'EXECUTE STATEMENT','Syntax:\nEXECUTE stmt_name\n    [USING @var_name [, @var_name] ...]\n\nAfter preparing a statement with PREPARE, you execute it with an\nEXECUTE statement that refers to the prepared statement name. If the\nprepared statement contains any parameter markers, you must supply a\nUSING clause that lists user variables containing the values to be\nbound to the parameters. Parameter values can be supplied only by user\nvariables, and the USING clause must name exactly as many variables as\nthe number of parameter markers in the statement.\n\nYou can execute a given prepared statement multiple times, passing\ndifferent variables to it or setting the variables to different values\nbefore each execution.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/execute.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/execute.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (52,40,'DROP INDEX','Syntax:\nDROP INDEX index_name ON tbl_name\n    [algorithm_option | lock_option] ...\n\nalgorithm_option:\n    ALGORITHM [=] {DEFAULT|INPLACE|COPY}\n\nlock_option:\n    LOCK [=] {DEFAULT|NONE|SHARED|EXCLUSIVE}\n\nDROP INDEX drops the index named index_name from the table tbl_name.\nThis statement is mapped to an ALTER TABLE statement to drop the index.\nSee [HELP ALTER TABLE].\n\nTo drop a primary key, the index name is always PRIMARY, which must be\nspecified as a quoted identifier because PRIMARY is a reserved word:\n\nDROP INDEX `PRIMARY` ON t;\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-index.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-index.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (53,4,'ABS','Syntax:\nABS(X)\n\nReturns the absolute value of X.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT ABS(2);\n        -> 2\nmysql> SELECT ABS(-32);\n        -> 32\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (54,14,'IS_IPV4','Syntax:\nIS_IPV4(expr)\n\nReturns 1 if the argument is a valid IPv4 address specified as a\nstring, 0 otherwise.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> SELECT IS_IPV4(\'10.0.5.9\'), IS_IPV4(\'10.0.5.256\');\n        -> 1, 0\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (55,33,'POLYFROMWKB','PolyFromWKB(wkb[,srid]), PolygonFromWKB(wkb[,srid])\n\nConstructs a POLYGON value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (56,38,'NOT LIKE','Syntax:\nexpr NOT LIKE pat [ESCAPE \'escape_char\']\n\nThis is the same as NOT (expr LIKE pat [ESCAPE \'escape_char\']).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-comparison-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-comparison-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (57,38,'SPACE','Syntax:\nSPACE(N)\n\nReturns a string consisting of N space characters.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT SPACE(6);\n        -> \'      \'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (58,16,'MAX','Syntax:\nMAX([DISTINCT] expr)\n\nReturns the maximum value of expr. MAX() may take a string argument; in\nsuch cases, it returns the maximum string value. See\nhttp://dev.mysql.com/doc/refman/5.6/en/mysql-indexes.html. The DISTINCT\nkeyword can be used to find the maximum of the distinct values of expr,\nhowever, this produces the same result as omitting DISTINCT.\n\nMAX() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (59,22,'CREATE FUNCTION UDF','Syntax:\nCREATE [AGGREGATE] FUNCTION function_name RETURNS {STRING|INTEGER|REAL|DECIMAL}\n    SONAME shared_library_name\n\nA user-defined function (UDF) is a way to extend MySQL with a new\nfunction that works like a native (built-in) MySQL function such as\nABS() or CONCAT().\n\nfunction_name is the name that should be used in SQL statements to\ninvoke the function. The RETURNS clause indicates the type of the\nfunction\'s return value. DECIMAL is a legal value after RETURNS, but\ncurrently DECIMAL functions return string values and should be written\nlike STRING functions.\n\nshared_library_name is the basename of the shared object file that\ncontains the code that implements the function. The file must be\nlocated in the plugin directory. This directory is given by the value\nof the plugin_dir system variable. For more information, see\nhttp://dev.mysql.com/doc/refman/5.6/en/udf-compiling.html.\n\nTo create a function, you must have the INSERT privilege for the mysql\ndatabase. This is necessary because CREATE FUNCTION adds a row to the\nmysql.func system table that records the function\'s name, type, and\nshared library name. If you do not have this table, you should run the\nmysql_upgrade command to create it. See\nhttp://dev.mysql.com/doc/refman/5.6/en/mysql-upgrade.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-function-udf.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/create-function-udf.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (60,23,'TIMESTAMP','TIMESTAMP[(fsp)]\n\nA timestamp. The range is \'1970-01-01 00:00:01.000000\' UTC to\n\'2038-01-19 03:14:07.999999\' UTC. TIMESTAMP values are stored as the\nnumber of seconds since the epoch (\'1970-01-01 00:00:00\' UTC). A\nTIMESTAMP cannot represent the value \'1970-01-01 00:00:00\' because that\nis equivalent to 0 seconds from the epoch and the value 0 is reserved\nfor representing \'0000-00-00 00:00:00\', the "zero" TIMESTAMP value.\n\nAs of MySQL 5.6.4, an optional fsp value in the range from 0 to 6 may\nbe given to specify fractional seconds precision. A value of 0\nsignifies that there is no fractional part. If omitted, the default\nprecision is 0.\n\nThe way the server handles TIMESTAMP definitions depends on the value\nof the explicit_defaults_for_timestamp system variable (see\nhttp://dev.mysql.com/doc/refman/5.6/en/server-system-variables.html).\nBy default, explicit_defaults_for_timestamp is disabled and the server\nhandles TIMESTAMP as follows:\n\nUnless specified otherwise, the first TIMESTAMP column in a table is\ndefined to be automatically set to the date and time of the most recent\nmodification if not explicitly assigned a value. This makes TIMESTAMP\nuseful for recording the timestamp of an INSERT or UPDATE operation.\nYou can also set any TIMESTAMP column to the current date and time by\nassigning it a NULL value, unless it has been defined with the NULL\nattribute to permit NULL values.\n\nAutomatic initialization and updating to the current date and time can\nbe specified using DEFAULT CURRENT_TIMESTAMP and ON UPDATE\nCURRENT_TIMESTAMP column definition clauses. By default, the first\nTIMESTAMP column has these properties, as previously noted. As of MySQL\n5.6.5, any TIMESTAMP column in a table can be defined to have these\nproperties. Before 5.6.5, at most one TIMESTAMP column per table can\nhave them, but it is possible to suppress them for the first column and\ninstead assign them to a different TIMESTAMP column. See\nhttp://dev.mysql.com/doc/refman/5.6/en/timestamp-initialization.html.\n\nIf explicit_defaults_for_timestamp is enabled, there is no automatic\nassignment of the DEFAULT CURRENT_TIMESTAMP or ON UPDATE\nCURRENT_TIMESTAMP attributes to any TIMESTAMP column. They must be\nincluded explicitly in the column definition. Also, any TIMESTAMP not\nexplicitly declared as NOT NULL permits NULL values.\n\nexplicit_defaults_for_timestamp is available as of MySQL 5.6.6. Before\n5.6.6, the server handles TIMESTAMP as discussed for\nexplicit_defaults_for_timestamp disabled. Those behaviors, while they\nremain the default, are nonstandard and are deprecated as of 5.6.6. For\ndiscussion regarding upgrading to an installation with\nexplicit_defaults_for_timestamp enabled, see\nhttp://dev.mysql.com/doc/refman/5.6/en/upgrading-from-previous-series.h\ntml.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (61,27,'CACHE INDEX','Syntax:\nCACHE INDEX\n  tbl_index_list [, tbl_index_list] ...\n  [PARTITION (partition_list | ALL)]\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [[INDEX|KEY] (index_name[, index_name] ...)]\n\npartition_list:\n  partition_name[, partition_name][, ...]\n\nThe CACHE INDEX statement assigns table indexes to a specific key\ncache. It is used only for MyISAM tables. After the indexes have been\nassigned, they can be preloaded into the cache if desired with LOAD\nINDEX INTO CACHE.\n\nThe following statement assigns indexes from the tables t1, t2, and t3\nto the key cache named hot_cache:\n\nmysql> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/cache-index.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/cache-index.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (62,12,'COMPRESS','Syntax:\nCOMPRESS(string_to_compress)\n\nCompresses a string and returns the result as a binary string. This\nfunction requires MySQL to have been compiled with a compression\nlibrary such as zlib. Otherwise, the return value is always NULL. The\ncompressed string can be uncompressed with UNCOMPRESS().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','mysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',1000)));\n        -> 21\nmysql> SELECT LENGTH(COMPRESS(\'\'));\n        -> 0\nmysql> SELECT LENGTH(COMPRESS(\'a\'));\n        -> 13\nmysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',16)));\n        -> 15\n','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (63,28,'HANDLER','Syntax:\nHANDLER tbl_name OPEN [ [AS] alias]\n\nHANDLER tbl_name READ index_name { = | <= | >= | < | > } (value1,value2,...)\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ { FIRST | NEXT }\n    [ WHERE where_condition ] [LIMIT ... ]\n\nHANDLER tbl_name CLOSE\n\nThe HANDLER statement provides direct access to table storage engine\ninterfaces. It is available for InnoDB and MyISAM tables.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/handler.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/handler.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (64,9,'HELP_DATE','This help information was generated from the MySQL 5.6 Reference Manual\non: 2014-03-14\n','','');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (65,40,'RENAME TABLE','Syntax:\nRENAME TABLE tbl_name TO new_tbl_name\n    [, tbl_name2 TO new_tbl_name2] ...\n\nThis statement renames one or more tables.\n\nThe rename operation is done atomically, which means that no other\nsession can access any of the tables while the rename is running. For\nexample, if you have an existing table old_table, you can create\nanother table new_table that has the same structure but is empty, and\nthen replace the existing table with the empty one as follows (assuming\nthat backup_table does not already exist):\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/rename-table.html\n\n','CREATE TABLE new_table (...);\nRENAME TABLE old_table TO backup_table, new_table TO old_table;\n','http://dev.mysql.com/doc/refman/5.6/en/rename-table.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (66,23,'BOOLEAN','BOOL, BOOLEAN\n\nThese types are synonyms for TINYINT(1). A value of zero is considered\nfalse. Nonzero values are considered true:\n\nmysql> SELECT IF(0, \'true\', \'false\');\n+------------------------+\n| IF(0, \'true\', \'false\') |\n+------------------------+\n| false                  |\n+------------------------+\n\nmysql> SELECT IF(1, \'true\', \'false\');\n+------------------------+\n| IF(1, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nmysql> SELECT IF(2, \'true\', \'false\');\n+------------------------+\n| IF(2, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nHowever, the values TRUE and FALSE are merely aliases for 1 and 0,\nrespectively, as shown here:\n\nmysql> SELECT IF(0 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(0 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| true                           |\n+--------------------------------+\n\nmysql> SELECT IF(1 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(1 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| true                          |\n+-------------------------------+\n\nmysql> SELECT IF(2 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(2 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| false                         |\n+-------------------------------+\n\nmysql> SELECT IF(2 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(2 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| false                          |\n+--------------------------------+\n\nThe last two statements display the results shown because 2 is equal to\nneither 1 nor 0.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (67,4,'MOD','Syntax:\nMOD(N,M), N % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT MOD(234, 10);\n        -> 4\nmysql> SELECT 253 % 7;\n        -> 1\nmysql> SELECT MOD(29,9);\n        -> 2\nmysql> SELECT 29 MOD 9;\n        -> 2\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (68,29,'HELP STATEMENT','Syntax:\nHELP \'search_string\'\n\nThe HELP statement returns online information from the MySQL Reference\nmanual. Its proper operation requires that the help tables in the mysql\ndatabase be initialized with help topic information (see\nhttp://dev.mysql.com/doc/refman/5.6/en/server-side-help-support.html).\n\nThe HELP statement searches the help tables for the given search string\nand displays the result of the search. The search string is not case\nsensitive.\n\nThe search string can contain the the wildcard characters "%" and "_".\nThese have the same meaning as for pattern-matching operations\nperformed with the LIKE operator. For example, HELP \'rep%\' returns a\nlist of topics that begin with rep.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/help.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/help.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (69,38,'UCASE','Syntax:\nUCASE(str)\n\nUCASE() is a synonym for UPPER().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (70,27,'SHOW BINLOG EVENTS','Syntax:\nSHOW BINLOG EVENTS\n   [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\n\nShows the events in the binary log. If you do not specify \'log_name\',\nthe first binary log is displayed.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-binlog-events.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-binlog-events.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (71,33,'MPOLYFROMWKB','MPolyFromWKB(wkb[,srid]), MultiPolygonFromWKB(wkb[,srid])\n\nConstructs a MULTIPOLYGON value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (72,24,'ITERATE','Syntax:\nITERATE label\n\nITERATE can appear only within LOOP, REPEAT, and WHILE statements.\nITERATE means "start the loop again."\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/iterate.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/iterate.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (73,28,'DO','Syntax:\nDO expr [, expr] ...\n\nDO executes the expressions but does not return any results. In most\nrespects, DO is shorthand for SELECT expr, ..., but has the advantage\nthat it is slightly faster when you do not care about the result.\n\nDO is useful primarily with functions that have side effects, such as\nRELEASE_LOCK().\n\nExample: This SELECT statement pauses, but also produces a result set:\n\nmysql> SELECT SLEEP(5);\n+----------+\n| SLEEP(5) |\n+----------+\n|        0 |\n+----------+\n1 row in set (5.02 sec)\n\nDO, on the other hand, pauses without producing a result set.:\n\nmysql> DO SLEEP(5);\nQuery OK, 0 rows affected (4.99 sec)\n\nThis could be useful, for example in a stored function or trigger,\nwhich prohibit statements that produce result sets.\n\nDO only executes expressions. It cannot be used in all cases where\nSELECT can be used. For example, DO id FROM t1 is invalid because it\nreferences a table.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/do.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/do.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (74,38,'CHAR_LENGTH','Syntax:\nCHAR_LENGTH(str)\n\nReturns the length of the string str, measured in characters. A\nmulti-byte character counts as a single character. This means that for\na string containing five 2-byte characters, LENGTH() returns 10,\nwhereas CHAR_LENGTH() returns 5.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (75,23,'DATE','DATE\n\nA date. The supported range is \'1000-01-01\' to \'9999-12-31\'. MySQL\ndisplays DATE values in \'YYYY-MM-DD\' format, but permits assignment of\nvalues to DATE columns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (76,38,'EXTRACTVALUE','Syntax:\nExtractValue(xml_frag, xpath_expr)\n\nExtractValue() takes two string arguments, a fragment of XML markup\nxml_frag and an XPath expression xpath_expr (also known as a locator);\nit returns the text (CDATA) of the first text node which is a child of\nthe elements or elements matched by the XPath expression. In MySQL\n5.6.6 and earlier, the XPath expression could contain at most 127\ncharacters. This limitation was lifted in MySQL 5.6.7. (Bug #13007062,\nBug#62429)\n\nUsing this function is the equivalent of performing a match using the\nxpath_expr after appending /text(). In other words,\nExtractValue(\'<a><b>Sakila</b></a>\', \'/a/b\') and\nExtractValue(\'<a><b>Sakila</b></a>\', \'/a/b/text()\') produce the same\nresult.\n\nIf multiple matches are found, the content of the first child text node\nof each matching element is returned (in the order matched) as a\nsingle, space-delimited string.\n\nIf no matching text node is found for the expression (including the\nimplicit /text())---for whatever reason, as long as xpath_expr is\nvalid, and xml_frag consists of elements which are properly nested and\nclosed---an empty string is returned. No distinction is made between a\nmatch on an empty element and no match at all. This is by design.\n\nIf you need to determine whether no matching element was found in\nxml_frag or such an element was found but contained no child text\nnodes, you should test the result of an expression that uses the XPath\ncount() function. For example, both of these statements return an empty\nstring, as shown here:\n\nmysql> SELECT ExtractValue(\'<a><b/></a>\', \'/a/b\');\n+-------------------------------------+\n| ExtractValue(\'<a><b/></a>\', \'/a/b\') |\n+-------------------------------------+\n|                                     |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT ExtractValue(\'<a><c/></a>\', \'/a/b\');\n+-------------------------------------+\n| ExtractValue(\'<a><c/></a>\', \'/a/b\') |\n+-------------------------------------+\n|                                     |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nHowever, you can determine whether there was actually a matching\nelement using the following:\n\nmysql> SELECT ExtractValue(\'<a><b/></a>\', \'count(/a/b)\');\n+-------------------------------------+\n| ExtractValue(\'<a><b/></a>\', \'count(/a/b)\') |\n+-------------------------------------+\n| 1                                   |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT ExtractValue(\'<a><c/></a>\', \'count(/a/b)\');\n+-------------------------------------+\n| ExtractValue(\'<a><c/></a>\', \'count(/a/b)\') |\n+-------------------------------------+\n| 0                                   |\n+-------------------------------------+\n1 row in set (0.01 sec)\n\n*Important*: ExtractValue() returns only CDATA, and does not return any\ntags that might be contained within a matching tag, nor any of their\ncontent (see the result returned as val1 in the following example).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/xml-functions.html\n\n','mysql> SELECT\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/a\') AS val1,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/a/b\') AS val2,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'//b\') AS val3,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/b\') AS val4,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b><b>eee</b></a>\', \'//b\') AS val5;\n\n+------+------+------+------+---------+\n| val1 | val2 | val3 | val4 | val5    |\n+------+------+------+------+---------+\n| ccc  | ddd  | ddd  |      | ddd eee |\n+------+------+------+------+---------+\n','http://dev.mysql.com/doc/refman/5.6/en/xml-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (77,12,'OLD_PASSWORD','Syntax:\nOLD_PASSWORD(str)\n\nOLD_PASSWORD() was added when the implementation of PASSWORD() was\nchanged in MySQL 4.1 to improve security. OLD_PASSWORD() returns the\nvalue of the pre-4.1 implementation of PASSWORD() as a string, and is\nintended to permit you to reset passwords for any pre-4.1 clients that\nneed to connect to your version 5.6 MySQL server without locking them\nout. See http://dev.mysql.com/doc/refman/5.6/en/password-hashing.html.\n\nThe return value is a nonbinary string in the connection character set.\n\n*Note*: Passwords that use the pre-4.1 hashing method are less secure\nthan passwords that use the native password hashing method and should\nbe avoided. Pre-4.1 passwords are deprecated and support for them will\nbe removed in a future MySQL release.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (78,38,'FORMAT','Syntax:\nFORMAT(X,D[,locale])\n\nFormats the number X to a format like \'#,###,###.##\', rounded to D\ndecimal places, and returns the result as a string. If D is 0, the\nresult has no decimal point or fractional part.\n\nThe optional third parameter enables a locale to be specified to be\nused for the result number\'s decimal point, thousands separator, and\ngrouping between separators. Permissible locale values are the same as\nthe legal values for the lc_time_names system variable (see\nhttp://dev.mysql.com/doc/refman/5.6/en/locale-support.html). If no\nlocale is specified, the default is \'en_US\'.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT FORMAT(12332.123456, 4);\n        -> \'12,332.1235\'\nmysql> SELECT FORMAT(12332.1,4);\n        -> \'12,332.1000\'\nmysql> SELECT FORMAT(12332.2,0);\n        -> \'12,332\'\nmysql> SELECT FORMAT(12332.2,2,\'de_DE\');\n        -> \'12.332,20\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (79,15,'||','Syntax:\nOR, ||\n\nLogical OR. When both operands are non-NULL, the result is 1 if any\noperand is nonzero, and 0 otherwise. With a NULL operand, the result is\n1 if the other operand is nonzero, and NULL otherwise. If both operands\nare NULL, the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/logical-operators.html\n\n','mysql> SELECT 1 || 1;\n        -> 1\nmysql> SELECT 1 || 0;\n        -> 1\nmysql> SELECT 0 || 0;\n        -> 0\nmysql> SELECT 0 || NULL;\n        -> NULL\nmysql> SELECT 1 || NULL;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/logical-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (80,38,'BIT_LENGTH','Syntax:\nBIT_LENGTH(str)\n\nReturns the length of the string str in bits.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT BIT_LENGTH(\'text\');\n        -> 32\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (81,2,'EXTERIORRING','ExteriorRing(poly)\n\nReturns the exterior ring of the Polygon value poly as a LineString.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(ExteriorRing(GeomFromText(@poly)));\n+-------------------------------------------+\n| AsText(ExteriorRing(GeomFromText(@poly))) |\n+-------------------------------------------+\n| LINESTRING(0 0,0 3,3 3,3 0,0 0)           |\n+-------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (82,33,'GEOMFROMWKB','GeomFromWKB(wkb[,srid]), GeometryFromWKB(wkb[,srid])\n\nConstructs a geometry value of any type using its WKB representation\nand SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (83,19,'BETWEEN AND','Syntax:\nexpr BETWEEN min AND max\n\nIf expr is greater than or equal to min and expr is less than or equal\nto max, BETWEEN returns 1, otherwise it returns 0. This is equivalent\nto the expression (min <= expr AND expr <= max) if all the arguments\nare of the same type. Otherwise type conversion takes place according\nto the rules described in\nhttp://dev.mysql.com/doc/refman/5.6/en/type-conversion.html, but\napplied to all the three arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 2 BETWEEN 1 AND 3, 2 BETWEEN 3 and 1;\n        -> 1, 0\nmysql> SELECT 1 BETWEEN 2 AND 3;\n        -> 0\nmysql> SELECT \'b\' BETWEEN \'a\' AND \'c\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'3\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'x-3\';\n        -> 0\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (84,25,'MULTIPOLYGON','MultiPolygon(poly1,poly2,...)\n\nConstructs a MultiPolygon value from a set of Polygon or WKB Polygon\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (85,38,'LEFT','Syntax:\nLEFT(str,len)\n\nReturns the leftmost len characters from the string str, or NULL if any\nargument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT LEFT(\'foobarbar\', 5);\n        -> \'fooba\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (86,27,'FLUSH QUERY CACHE','You can defragment the query cache to better utilize its memory with\nthe FLUSH QUERY CACHE statement. The statement does not remove any\nqueries from the cache.\n\nThe RESET QUERY CACHE statement removes all query results from the\nquery cache. The FLUSH TABLES statement also does this.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/query-cache-status-and-maintenance.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/query-cache-status-and-maintenance.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (87,23,'SET DATA TYPE','SET(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA set. A string object that can have zero or more values, each of which\nmust be chosen from the list of values \'value1\', \'value2\', ... SET\nvalues are represented internally as integers.\n\nA SET column can have a maximum of 64 distinct members. A table can\nhave no more than 255 unique element list definitions among its ENUM\nand SET columns considered as a group. For more information on this\nlimit, see http://dev.mysql.com/doc/refman/5.6/en/limits-frm-file.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (88,4,'RAND','Syntax:\nRAND(), RAND(N)\n\nReturns a random floating-point value v in the range 0 <= v < 1.0. If a\nconstant integer argument N is specified, it is used as the seed value,\nwhich produces a repeatable sequence of column values. In the following\nexample, note that the sequences of values produced by RAND(3) is the\nsame both places where it occurs.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> CREATE TABLE t (i INT);\nQuery OK, 0 rows affected (0.42 sec)\n\nmysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT i, RAND() FROM t;\n+------+------------------+\n| i    | RAND()           |\n+------+------------------+\n|    1 | 0.61914388706828 |\n|    2 | 0.93845168309142 |\n|    3 | 0.83482678498591 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND(3) FROM t;\n+------+------------------+\n| i    | RAND(3)          |\n+------+------------------+\n|    1 | 0.90576975597606 |\n|    2 | 0.37307905813035 |\n|    3 | 0.14808605345719 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND() FROM t;\n+------+------------------+\n| i    | RAND()           |\n+------+------------------+\n|    1 | 0.35877890638893 |\n|    2 | 0.28941420772058 |\n|    3 | 0.37073435016976 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND(3) FROM t;\n+------+------------------+\n| i    | RAND(3)          |\n+------+------------------+\n|    1 | 0.90576975597606 |\n|    2 | 0.37307905813035 |\n|    3 | 0.14808605345719 |\n+------+------------------+\n3 rows in set (0.01 sec)\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (89,38,'RPAD','Syntax:\nRPAD(str,len,padstr)\n\nReturns the string str, right-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT RPAD(\'hi\',5,\'?\');\n        -> \'hi???\'\nmysql> SELECT RPAD(\'hi\',1,\'?\');\n        -> \'h\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (90,23,'DEC','DEC[(M[,D])] [UNSIGNED] [ZEROFILL], NUMERIC[(M[,D])] [UNSIGNED]\n[ZEROFILL], FIXED[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nThese types are synonyms for DECIMAL. The FIXED synonym is available\nfor compatibility with other database systems.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (91,38,'ELT','Syntax:\nELT(N,str1,str2,str3,...)\n\nELT() returns the Nth element of the list of strings: str1 if N = 1,\nstr2 if N = 2, and so on. Returns NULL if N is less than 1 or greater\nthan the number of arguments. ELT() is the complement of FIELD().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT ELT(1, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'ej\'\nmysql> SELECT ELT(4, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'foo\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (92,40,'ALTER VIEW','Syntax:\nALTER\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThis statement changes the definition of a view, which must exist. The\nsyntax is similar to that for CREATE VIEW and the effect is the same as\nfor CREATE OR REPLACE VIEW. See [HELP CREATE VIEW]. This statement\nrequires the CREATE VIEW and DROP privileges for the view, and some\nprivilege for each column referred to in the SELECT statement. ALTER\nVIEW is permitted only to the definer or users with the SUPER\nprivilege.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/alter-view.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/alter-view.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (93,27,'SHOW DATABASES','Syntax:\nSHOW {DATABASES | SCHEMAS}\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW DATABASES lists the databases on the MySQL server host. SHOW\nSCHEMAS is a synonym for SHOW DATABASES. The LIKE clause, if present,\nindicates which database names to match. The WHERE clause can be given\nto select rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html.\n\nYou see only those databases for which you have some kind of privilege,\nunless you have the global SHOW DATABASES privilege. You can also get\nthis list using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-databases.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-databases.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (94,32,'SEC_TO_TIME','Syntax:\nSEC_TO_TIME(seconds)\n\nReturns the seconds argument, converted to hours, minutes, and seconds,\nas a TIME value. The range of the result is constrained to that of the\nTIME data type. A warning occurs if the argument corresponds to a value\noutside that range.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT SEC_TO_TIME(2378);\n        -> \'00:39:38\'\nmysql> SELECT SEC_TO_TIME(2378) + 0;\n        -> 3938\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (95,38,'LOCATE','Syntax:\nLOCATE(substr,str), LOCATE(substr,str,pos)\n\nThe first syntax returns the position of the first occurrence of\nsubstring substr in string str. The second syntax returns the position\nof the first occurrence of substring substr in string str, starting at\nposition pos. Returns 0 if substr is not in str.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT LOCATE(\'bar\', \'foobarbar\');\n        -> 4\nmysql> SELECT LOCATE(\'xbar\', \'foobar\');\n        -> 0\nmysql> SELECT LOCATE(\'bar\', \'foobarbar\', 5);\n        -> 7\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (96,27,'SHOW EVENTS','Syntax:\nSHOW EVENTS [{FROM | IN} schema_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement displays information about Event Manager events. It\nrequires the EVENT privilege for the database from which the events are\nto be shown.\n\nIn its simplest form, SHOW EVENTS lists all of the events in the\ncurrent schema:\n\nmysql> SELECT CURRENT_USER(), SCHEMA();\n+----------------+----------+\n| CURRENT_USER() | SCHEMA() |\n+----------------+----------+\n| jon@ghidora    | myschema |\n+----------------+----------+\n1 row in set (0.00 sec)\n\nmysql> SHOW EVENTS\\G\n*************************** 1. row ***************************\n                  Db: myschema\n                Name: e_daily\n             Definer: jon@ghidora\n           Time zone: SYSTEM\n                Type: RECURRING\n          Execute at: NULL\n      Interval value: 10\n      Interval field: SECOND\n              Starts: 2006-02-09 10:41:23\n                Ends: NULL\n              Status: ENABLED\n          Originator: 0\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\nTo see events for a specific schema, use the FROM clause. For example,\nto see events for the test schema, use the following statement:\n\nSHOW EVENTS FROM test;\n\nThe LIKE clause, if present, indicates which event names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-events.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-events.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (97,23,'LONGTEXT','LONGTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\ncharacters. The effective maximum length is less if the value contains\nmulti-byte characters. The effective maximum length of LONGTEXT columns\nalso depends on the configured maximum packet size in the client/server\nprotocol and available memory. Each LONGTEXT value is stored using a\n4-byte length prefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (98,27,'KILL','Syntax:\nKILL [CONNECTION | QUERY] thread_id\n\nEach connection to mysqld runs in a separate thread. You can see which\nthreads are running with the SHOW PROCESSLIST statement and kill a\nthread with the KILL thread_id statement.\n\nKILL permits an optional CONNECTION or QUERY modifier:\n\no KILL CONNECTION is the same as KILL with no modifier: It terminates\n  the connection associated with the given thread_id.\n\no KILL QUERY terminates the statement that the connection is currently\n  executing, but leaves the connection itself intact.\n\nIf you have the PROCESS privilege, you can see all threads. If you have\nthe SUPER privilege, you can kill all threads and statements.\nOtherwise, you can see and kill only your own threads and statements.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\n*Note*: You cannot use KILL with the Embedded MySQL Server library\nbecause the embedded server merely runs inside the threads of the host\napplication. It does not create any connection threads of its own.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/kill.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/kill.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (99,31,'DISJOINT','Disjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially disjoint from (does\nnot intersect) g2.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (100,38,'LPAD','Syntax:\nLPAD(str,len,padstr)\n\nReturns the string str, left-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT LPAD(\'hi\',4,\'??\');\n        -> \'??hi\'\nmysql> SELECT LPAD(\'hi\',1,\'??\');\n        -> \'h\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (101,31,'OVERLAPS','Overlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially overlaps g2. The term\nspatially overlaps is used if two geometries intersect and their\nintersection results in a geometry of the same dimension but not equal\nto either of the given geometries.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (102,8,'SET GLOBAL SQL_SLAVE_SKIP_COUNTER','Syntax:\nSET GLOBAL sql_slave_skip_counter = N\n\nThis statement skips the next N events from the master. This is useful\nfor recovering from replication stops caused by a statement.\n\nThis statement is valid only when the slave threads are not running.\nOtherwise, it produces an error.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/set-global-sql-slave-skip-counter.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/set-global-sql-slave-skip-counter.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (103,6,'MBREQUAL','MBREqual(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are the same.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (104,34,'PROCEDURE ANALYSE','Syntax:\nANALYSE([max_elements[,max_memory]])\n\nANALYSE() examines the result from a query and returns an analysis of\nthe results that suggests optimal data types for each column that may\nhelp reduce table sizes. To obtain this analysis, append PROCEDURE\nANALYSE to the end of a SELECT statement:\n\nSELECT ... FROM ... WHERE ... PROCEDURE ANALYSE([max_elements,[max_memory]])\n\nFor example:\n\nSELECT col1, col2 FROM table1 PROCEDURE ANALYSE(10, 2000);\n\nThe results show some statistics for the values returned by the query,\nand propose an optimal data type for the columns. This can be helpful\nfor checking your existing tables, or after importing new data. You may\nneed to try different settings for the arguments so that PROCEDURE\nANALYSE() does not suggest the ENUM data type when it is not\nappropriate.\n\nThe arguments are optional and are used as follows:\n\no max_elements (default 256) is the maximum number of distinct values\n  that ANALYSE() notices per column. This is used by ANALYSE() to check\n  whether the optimal data type should be of type ENUM; if there are\n  more than max_elements distinct values, then ENUM is not a suggested\n  type.\n\no max_memory (default 8192) is the maximum amount of memory that\n  ANALYSE() should allocate per column while trying to find all\n  distinct values.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/procedure-analyse.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/procedure-analyse.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (105,9,'HELP_VERSION','This help information was generated from the MySQL 5.6 Reference Manual\non: 2014-03-14 (revision: 38087)\n\nThis information applies to MySQL 5.6 through 5.6.18.\n','','');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (106,38,'CHARACTER_LENGTH','Syntax:\nCHARACTER_LENGTH(str)\n\nCHARACTER_LENGTH() is a synonym for CHAR_LENGTH().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (107,27,'SHOW PRIVILEGES','Syntax:\nSHOW PRIVILEGES\n\nSHOW PRIVILEGES shows the list of system privileges that the MySQL\nserver supports. The exact list of privileges depends on the version of\nyour server.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-privileges.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-privileges.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (108,40,'CREATE TABLESPACE','Syntax:\nCREATE TABLESPACE tablespace_name\n    ADD DATAFILE \'file_name\'\n    USE LOGFILE GROUP logfile_group\n    [EXTENT_SIZE [=] extent_size]\n    [INITIAL_SIZE [=] initial_size]\n    [AUTOEXTEND_SIZE [=] autoextend_size]\n    [MAX_SIZE [=] max_size]\n    [NODEGROUP [=] nodegroup_id]\n    [WAIT]\n    [COMMENT [=] comment_text]\n    ENGINE [=] engine_name\n\nThis statement is used to create a tablespace, which can contain one or\nmore data files, providing storage space for tables. One data file is\ncreated and added to the tablespace using this statement. Additional\ndata files may be added to the tablespace by using the ALTER TABLESPACE\nstatement (see [HELP ALTER TABLESPACE]). For rules covering the naming\nof tablespaces, see\nhttp://dev.mysql.com/doc/refman/5.6/en/identifiers.html.\n\n*Note*: All MySQL Cluster Disk Data objects share the same namespace.\nThis means that each Disk Data object must be uniquely named (and not\nmerely each Disk Data object of a given type). For example, you cannot\nhave a tablespace and a log file group with the same name, or a\ntablespace and a data file with the same name.\n\nA log file group of one or more UNDO log files must be assigned to the\ntablespace to be created with the USE LOGFILE GROUP clause.\nlogfile_group must be an existing log file group created with CREATE\nLOGFILE GROUP (see\nhttp://dev.mysql.com/doc/refman/5.6/en/create-logfile-group.html).\nMultiple tablespaces may use the same log file group for UNDO logging.\n\nThe EXTENT_SIZE sets the size, in bytes, of the extents used by any\nfiles belonging to the tablespace. The default value is 1M. The minimum\nsize is 32K, and theoretical maximum is 2G, although the practical\nmaximum size depends on a number of factors. In most cases, changing\nthe extent size does not have any measurable effect on performance, and\nthe default value is recommended for all but the most unusual\nsituations.\n\nAn extent is a unit of disk space allocation. One extent is filled with\nas much data as that extent can contain before another extent is used.\nIn theory, up to 65,535 (64K) extents may used per data file; however,\nthe recommended maximum is 32,768 (32K). The recommended maximum size\nfor a single data file is 32G---that is, 32K extents x 1 MB per extent.\nIn addition, once an extent is allocated to a given partition, it\ncannot be used to store data from a different partition; an extent\ncannot store data from more than one partition. This means, for example\nthat a tablespace having a single datafile whose INITIAL_SIZE is 256 MB\nand whose EXTENT_SIZE is 128M has just two extents, and so can be used\nto store data from at most two different disk data table partitions.\n\nYou can see how many extents remain free in a given data file by\nquerying the INFORMATION_SCHEMA.FILES table, and so derive an estimate\nfor how much space remains free in the file. For further discussion and\nexamples, see http://dev.mysql.com/doc/refman/5.6/en/files-table.html.\n\nThe INITIAL_SIZE parameter sets the data file\'s total size in bytes.\nOnce the file has been created, its size cannot be changed; however,\nyou can add more data files to the tablespace using ALTER TABLESPACE\n... ADD DATAFILE. See [HELP ALTER TABLESPACE].\n\nINITIAL_SIZE is optional; its default value is 128M.\n\nOn 32-bit systems, the maximum supported value for INITIAL_SIZE is 4G.\n(Bug #29186)\n\nWhen setting EXTENT_SIZE or INITIAL_SIZE (either or both), you may\noptionally follow the number with a one-letter abbreviation for an\norder of magnitude, similar to those used in my.cnf. Generally, this is\none of the letters M (for megabytes) or G (for gigabytes).\n\nINITIAL_SIZE, EXTENT_SIZE, and UNDO_BUFFER_SIZE are subject to rounding\nas follows:\n\no EXTENT_SIZE and UNDO_BUFFER_SIZE are each rounded up to the nearest\n  whole multiple of 32K.\n\no INITIAL_SIZE is rounded down to the nearest whole multiple of 32K.\n\n  For data files, INITIAL_SIZE is subject to further rounding; the\n  result just obtained is rounded up to the nearest whole multiple of\n  EXTENT_SIZE (after any rounding).\n\nThe rounding just described is done explicitly, and a warning is issued\nby the MySQL Server when any such rounding is performed. The rounded\nvalues are also used by the NDB kernel for calculating\nINFORMATION_SCHEMA.FILES column values and other purposes. However, to\navoid an unexpected result, we suggest that you always use whole\nmultiples of 32K in specifying these options.\n\nAUTOEXTEND_SIZE, MAX_SIZE, NODEGROUP, WAIT, and COMMENT are parsed but\nignored, and so currently have no effect. These options are intended\nfor future expansion.\n\nThe ENGINE parameter determines the storage engine which uses this\ntablespace, with engine_name being the name of the storage engine.\nCurrently, engine_name must be one of the values NDB or NDBCLUSTER.\n\nWhen CREATE TABLESPACE is used with ENGINE = NDB, a tablespace and\nassociated data file are created on each Cluster data node. You can\nverify that the data files were created and obtain information about\nthem by querying the INFORMATION_SCHEMA.FILES table. For example:\n\nmysql> SELECT LOGFILE_GROUP_NAME, FILE_NAME, EXTRA\n    -> FROM INFORMATION_SCHEMA.FILES\n    -> WHERE TABLESPACE_NAME = \'newts\' AND FILE_TYPE = \'DATAFILE\';\n+--------------------+-------------+----------------+\n| LOGFILE_GROUP_NAME | FILE_NAME   | EXTRA          |\n+--------------------+-------------+----------------+\n| lg_3               | newdata.dat | CLUSTER_NODE=3 |\n| lg_3               | newdata.dat | CLUSTER_NODE=4 |\n+--------------------+-------------+----------------+\n2 rows in set (0.01 sec)\n\n(See http://dev.mysql.com/doc/refman/5.6/en/files-table.html.)\n\nCREATE TABLESPACE is useful only with Disk Data storage for MySQL\nCluster. See\nhttp://dev.mysql.com/doc/refman/5.6/en/mysql-cluster-disk-data.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-tablespace.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/create-tablespace.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (109,38,'INSERT FUNCTION','Syntax:\nINSERT(str,pos,len,newstr)\n\nReturns the string str, with the substring beginning at position pos\nand len characters long replaced by the string newstr. Returns the\noriginal string if pos is not within the length of the string. Replaces\nthe rest of the string from position pos if len is not within the\nlength of the rest of the string. Returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT INSERT(\'Quadratic\', 3, 4, \'What\');\n        -> \'QuWhattic\'\nmysql> SELECT INSERT(\'Quadratic\', -1, 4, \'What\');\n        -> \'Quadratic\'\nmysql> SELECT INSERT(\'Quadratic\', 3, 100, \'What\');\n        -> \'QuWhat\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (110,15,'XOR','Syntax:\nXOR\n\nLogical XOR. Returns NULL if either operand is NULL. For non-NULL\noperands, evaluates to 1 if an odd number of operands is nonzero,\notherwise 0 is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/logical-operators.html\n\n','mysql> SELECT 1 XOR 1;\n        -> 0\nmysql> SELECT 1 XOR 0;\n        -> 1\nmysql> SELECT 1 XOR NULL;\n        -> NULL\nmysql> SELECT 1 XOR 1 XOR 1;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/logical-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (111,10,'GRANT','Syntax:\nGRANT\n    priv_type [(column_list)]\n      [, priv_type [(column_list)]] ...\n    ON [object_type] priv_level\n    TO user_specification [, user_specification] ...\n    [REQUIRE {NONE | ssl_option [[AND] ssl_option] ...}]\n    [WITH with_option ...]\n\nGRANT PROXY ON user_specification\n    TO user_specification [, user_specification] ...\n    [WITH GRANT OPTION]\n\nobject_type:\n    TABLE\n  | FUNCTION\n  | PROCEDURE\n\npriv_level:\n    *\n  | *.*\n  | db_name.*\n  | db_name.tbl_name\n  | tbl_name\n  | db_name.routine_name\n\nuser_specification:\n    user\n    [\n      | IDENTIFIED WITH auth_plugin [AS \'auth_string\']\n        IDENTIFIED BY [PASSWORD] \'password\'\n    ]\n\nssl_option:\n    SSL\n  | X509\n  | CIPHER \'cipher\'\n  | ISSUER \'issuer\'\n  | SUBJECT \'subject\'\n\nwith_option:\n    GRANT OPTION\n  | MAX_QUERIES_PER_HOUR count\n  | MAX_UPDATES_PER_HOUR count\n  | MAX_CONNECTIONS_PER_HOUR count\n  | MAX_USER_CONNECTIONS count\n\nThe GRANT statement grants privileges to MySQL user accounts. GRANT\nalso serves to specify other account characteristics such as use of\nsecure connections and limits on access to server resources. To use\nGRANT, you must have the GRANT OPTION privilege, and you must have the\nprivileges that you are granting.\n\nNormally, a database administrator first uses CREATE USER to create an\naccount, then GRANT to define its privileges and characteristics. For\nexample:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\nGRANT ALL ON db1.* TO \'jeffrey\'@\'localhost\';\nGRANT SELECT ON db2.invoice TO \'jeffrey\'@\'localhost\';\nGRANT USAGE ON *.* TO \'jeffrey\'@\'localhost\' WITH MAX_QUERIES_PER_HOUR 90;\n\nHowever, if an account named in a GRANT statement does not already\nexist, GRANT may create it under the conditions described later in the\ndiscussion of the NO_AUTO_CREATE_USER SQL mode.\n\nThe REVOKE statement is related to GRANT and enables administrators to\nremove account privileges. See [HELP REVOKE].\n\nWhen successfully executed from the mysql program, GRANT responds with\nQuery OK, 0 rows affected. To determine what privileges result from the\noperation, use SHOW GRANTS. See [HELP SHOW GRANTS].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/grant.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/grant.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (112,6,'MBRINTERSECTS','MBRIntersects(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 intersect.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (113,19,'IS NOT','Syntax:\nIS NOT boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;\n        -> 1, 1, 0\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (114,4,'SQRT','Syntax:\nSQRT(X)\n\nReturns the square root of a nonnegative number X.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT SQRT(4);\n        -> 2\nmysql> SELECT SQRT(20);\n        -> 4.4721359549996\nmysql> SELECT SQRT(-16);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (115,40,'CREATE INDEX','Syntax:\nCREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name\n    [index_type]\n    ON tbl_name (index_col_name,...)\n    [index_option]\n    [algorithm_option | lock_option] ...\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\nalgorithm_option:\n    ALGORITHM [=] {DEFAULT|INPLACE|COPY}\n\nlock_option:\n    LOCK [=] {DEFAULT|NONE|SHARED|EXCLUSIVE}\n\nCREATE INDEX is mapped to an ALTER TABLE statement to create indexes.\nSee [HELP ALTER TABLE]. CREATE INDEX cannot be used to create a PRIMARY\nKEY; use ALTER TABLE instead. For more information about indexes, see\nhttp://dev.mysql.com/doc/refman/5.6/en/mysql-indexes.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-index.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/create-index.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (116,40,'ALTER DATABASE','Syntax:\nALTER {DATABASE | SCHEMA} [db_name]\n    alter_specification ...\nALTER {DATABASE | SCHEMA} db_name\n    UPGRADE DATA DIRECTORY NAME\n\nalter_specification:\n    [DEFAULT] CHARACTER SET [=] charset_name\n  | [DEFAULT] COLLATE [=] collation_name\n\nALTER DATABASE enables you to change the overall characteristics of a\ndatabase. These characteristics are stored in the db.opt file in the\ndatabase directory. To use ALTER DATABASE, you need the ALTER privilege\non the database. ALTER SCHEMA is a synonym for ALTER DATABASE.\n\nThe database name can be omitted from the first syntax, in which case\nthe statement applies to the default database.\n\nNational Language Characteristics\n\nThe CHARACTER SET clause changes the default database character set.\nThe COLLATE clause changes the default database collation.\nhttp://dev.mysql.com/doc/refman/5.6/en/charset.html, discusses\ncharacter set and collation names.\n\nYou can see what character sets and collations are available using,\nrespectively, the SHOW CHARACTER SET and SHOW COLLATION statements. See\n[HELP SHOW CHARACTER SET], and [HELP SHOW COLLATION], for more\ninformation.\n\nIf you change the default character set or collation for a database,\nstored routines that use the database defaults must be dropped and\nrecreated so that they use the new defaults. (In a stored routine,\nvariables with character data types use the database defaults if the\ncharacter set or collation are not specified explicitly. See [HELP\nCREATE PROCEDURE].)\n\nUpgrading from Versions Older than MySQL 5.1\n\nThe syntax that includes the UPGRADE DATA DIRECTORY NAME clause updates\nthe name of the directory associated with the database to use the\nencoding implemented in MySQL 5.1 for mapping database names to\ndatabase directory names (see\nhttp://dev.mysql.com/doc/refman/5.6/en/identifier-mapping.html). This\nclause is for use under these conditions:\n\no It is intended when upgrading MySQL to 5.1 or later from older\n  versions.\n\no It is intended to update a database directory name to the current\n  encoding format if the name contains special characters that need\n  encoding.\n\no The statement is used by mysqlcheck (as invoked by mysql_upgrade).\n\nFor example, if a database in MySQL 5.0 has the name a-b-c, the name\ncontains instances of the - (dash) character. In MySQL 5.0, the\ndatabase directory is also named a-b-c, which is not necessarily safe\nfor all file systems. In MySQL 5.1 and later, the same database name is\nencoded as a@002db@002dc to produce a file system-neutral directory\nname.\n\nWhen a MySQL installation is upgraded to MySQL 5.1 or later from an\nolder version,the server displays a name such as a-b-c (which is in the\nold format) as #mysql50#a-b-c, and you must refer to the name using the\n#mysql50# prefix. Use UPGRADE DATA DIRECTORY NAME in this case to\nexplicitly tell the server to re-encode the database directory name to\nthe current encoding format:\n\nALTER DATABASE `#mysql50#a-b-c` UPGRADE DATA DIRECTORY NAME;\n\nAfter executing this statement, you can refer to the database as a-b-c\nwithout the special #mysql50# prefix.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/alter-database.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/alter-database.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (117,26,'GEOMETRYN','GeometryN(gc,N)\n\nReturns the N-th geometry in the GeometryCollection value gc.\nGeometries are numbered beginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT AsText(GeometryN(GeomFromText(@gc),1));\n+----------------------------------------+\n| AsText(GeometryN(GeomFromText(@gc),1)) |\n+----------------------------------------+\n| POINT(1 1)                             |\n+----------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (118,20,'<<','Syntax:\n<<\n\nShifts a longlong (BIGINT) number to the left.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html\n\n','mysql> SELECT 1 << 2;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (119,27,'SHOW TABLE STATUS','Syntax:\nSHOW TABLE STATUS [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLE STATUS works likes SHOW TABLES, but provides a lot of\ninformation about each non-TEMPORARY table. You can also get this list\nusing the mysqlshow --status db_name command. The LIKE clause, if\npresent, indicates which table names to match. The WHERE clause can be\ngiven to select rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-table-status.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-table-status.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (120,38,'ASCII','Syntax:\nASCII(str)\n\nReturns the numeric value of the leftmost character of the string str.\nReturns 0 if str is the empty string. Returns NULL if str is NULL.\nASCII() works for 8-bit characters.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT ASCII(\'2\');\n        -> 50\nmysql> SELECT ASCII(2);\n        -> 50\nmysql> SELECT ASCII(\'dx\');\n        -> 100\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (121,4,'DIV','Syntax:\nDIV\n\nInteger division. Similar to FLOOR(), but is safe with BIGINT values.\n\nIn MySQL 5.6, if either operand has a noninteger type, the operands are\nconverted to DECIMAL and divided using DECIMAL arithmetic before\nconverting the result to BIGINT. If the result exceeds BIGINT range, an\nerror occurs.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html\n\n','mysql> SELECT 5 DIV 2;\n        -> 2\n','http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (122,27,'SHOW SLAVE STATUS','Syntax:\nSHOW SLAVE STATUS\n\nThis statement provides status information on essential parameters of\nthe slave threads. It requires either the SUPER or REPLICATION CLIENT\nprivilege.\n\nIf you issue this statement using the mysql client, you can use a \\G\nstatement terminator rather than a semicolon to obtain a more readable\nvertical layout:\n\nmysql> SHOW SLAVE STATUS\\G\n*************************** 1. row ***************************\n               Slave_IO_State: Waiting for master to send event\n                  Master_Host: localhost\n                  Master_User: root\n                  Master_Port: 13000\n                Connect_Retry: 60\n              Master_Log_File: master-bin.000002\n          Read_Master_Log_Pos: 1307\n               Relay_Log_File: slave-relay-bin.000003\n                Relay_Log_Pos: 1508\n        Relay_Master_Log_File: master-bin.000002\n             Slave_IO_Running: Yes\n            Slave_SQL_Running: Yes\n              Replicate_Do_DB:\n          Replicate_Ignore_DB:\n           Replicate_Do_Table:\n       Replicate_Ignore_Table:\n      Replicate_Wild_Do_Table:\n  Replicate_Wild_Ignore_Table:\n                   Last_Errno: 0\n                   Last_Error:\n                 Skip_Counter: 0\n          Exec_Master_Log_Pos: 1307\n              Relay_Log_Space: 1858\n              Until_Condition: None\n               Until_Log_File:\n                Until_Log_Pos: 0\n           Master_SSL_Allowed: No\n           Master_SSL_CA_File:\n           Master_SSL_CA_Path:\n              Master_SSL_Cert:\n            Master_SSL_Cipher:\n               Master_SSL_Key:\n        Seconds_Behind_Master: 0\nMaster_SSL_Verify_Server_Cert: No\n                Last_IO_Errno: 0\n                Last_IO_Error:\n               Last_SQL_Errno: 0\n               Last_SQL_Error:\n  Replicate_Ignore_Server_Ids:\n             Master_Server_Id: 1\n                  Master_UUID: 3e11fa47-71ca-11e1-9e33-c80aa9429562\n             Master_Info_File: /var/mysqld.2/data/master.info\n                    SQL_Delay: 0\n          SQL_Remaining_Delay: NULL\n      Slave_SQL_Running_State: Slave has read all relay log; waiting for the slave I/O thread to update it\n           Master_Retry_Count: 10\n                  Master_Bind:\n      Last_IO_Error_Timestamp:\n     Last_SQL_Error_Timestamp:\n               Master_SSL_Crl:\n           Master_SSL_Crlpath:\n           Retrieved_Gtid_Set: 3e11fa47-71ca-11e1-9e33-c80aa9429562:1-5\n            Executed_Gtid_Set: 3e11fa47-71ca-11e1-9e33-c80aa9429562:1-5\n                Auto_Position: 1\n1 row in set (0.00 sec)\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-slave-status.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-slave-status.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (123,35,'GEOMETRY','MySQL provides a standard way of creating spatial columns for geometry\ntypes, for example, with CREATE TABLE or ALTER TABLE. Currently,\nspatial columns are supported for MyISAM, InnoDB, NDB, and ARCHIVE\ntables. See also the annotations about spatial indexes under [HELP\nSPATIAL].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-columns.html\n\n','CREATE TABLE geom (g GEOMETRY);\n','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-columns.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (124,20,'&','Syntax:\n&\n\nBitwise AND:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html\n\n','mysql> SELECT 29 & 15;\n        -> 13\n','http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (125,15,'ASSIGN-EQUAL','Syntax:\n=\n\nThis operator is used to perform value assignments in two cases,\ndescribed in the next two paragraphs.\n\nWithin a SET statement, = is treated as an assignment operator that\ncauses the user variable on the left hand side of the operator to take\non the value to its right. (In other words, when used in a SET\nstatement, = is treated identically to :=.) The value on the right hand\nside may be a literal value, another variable storing a value, or any\nlegal expression that yields a scalar value, including the result of a\nquery (provided that this value is a scalar value). You can perform\nmultiple assignments in the same SET statement.\n\nIn the SET clause of an UPDATE statement, = also acts as an assignment\noperator; in this case, however, it causes the column named on the left\nhand side of the operator to assume the value given to the right,\nprovided any WHERE conditions that are part of the UPDATE are met. You\ncan make multiple assignments in the same SET clause of an UPDATE\nstatement.\n\nIn any other context, = is treated as a comparison operator.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/assignment-operators.html\n\n','mysql> SELECT @var1, @var2;\n        -> NULL, NULL\nmysql> SELECT @var1 := 1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2 := @var1;\n        -> 1, 1\nmysql> SELECT @var1, @var2;\n        -> 1, 1\n','http://dev.mysql.com/doc/refman/5.6/en/assignment-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (126,38,'CONVERT','Syntax:\nCONVERT(expr,type), CONVERT(expr USING transcoding_name)\n\nThe CONVERT() and CAST() functions take an expression of any type and\nproduce a result value of a specified type.\n\nThe type for the result can be one of the following values:\n\no BINARY[(N)]\n\no CHAR[(N)]\n\no DATE\n\no DATETIME\n\no DECIMAL[(M[,D])]\n\no SIGNED [INTEGER]\n\no TIME\n\no UNSIGNED [INTEGER]\n\nBINARY produces a string with the BINARY data type. See\nhttp://dev.mysql.com/doc/refman/5.6/en/binary-varbinary.html for a\ndescription of how this affects comparisons. If the optional length N\nis given, BINARY(N) causes the cast to use no more than N bytes of the\nargument. Values shorter than N bytes are padded with 0x00 bytes to a\nlength of N.\n\nCHAR(N) causes the cast to use no more than N characters of the\nargument.\n\nCAST() and CONVERT(... USING ...) are standard SQL syntax. The\nnon-USING form of CONVERT() is ODBC syntax.\n\nCONVERT() with USING is used to convert data between different\ncharacter sets. In MySQL, transcoding names are the same as the\ncorresponding character set names. For example, this statement converts\nthe string \'abc\' in the default character set to the corresponding\nstring in the utf8 character set:\n\nSELECT CONVERT(\'abc\' USING utf8);\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/cast-functions.html\n\n','SELECT enum_col FROM tbl_name ORDER BY CAST(enum_col AS CHAR);\n','http://dev.mysql.com/doc/refman/5.6/en/cast-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (127,24,'REPEAT LOOP','Syntax:\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\nThe statement list within a REPEAT statement is repeated until the\nsearch_condition expression is true. Thus, a REPEAT always enters the\nloop at least once. statement_list consists of one or more statements,\neach terminated by a semicolon (;) statement delimiter.\n\nA REPEAT statement can be labeled. For the rules regarding label use,\nsee [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/repeat.html\n\n','mysql> delimiter //\n\nmysql> CREATE PROCEDURE dorepeat(p1 INT)\n    -> BEGIN\n    ->   SET @x = 0;\n    ->   REPEAT\n    ->     SET @x = @x + 1;\n    ->   UNTIL @x > p1 END REPEAT;\n    -> END\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL dorepeat(1000)//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n+------+\n| @x   |\n+------+\n| 1001 |\n+------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.6/en/repeat.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (128,23,'SMALLINT','SMALLINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA small integer. The signed range is -32768 to 32767. The unsigned\nrange is 0 to 65535.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (129,23,'DOUBLE PRECISION','DOUBLE PRECISION[(M,D)] [UNSIGNED] [ZEROFILL], REAL[(M,D)] [UNSIGNED]\n[ZEROFILL]\n\nThese types are synonyms for DOUBLE. Exception: If the REAL_AS_FLOAT\nSQL mode is enabled, REAL is a synonym for FLOAT rather than DOUBLE.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (130,38,'ORD','Syntax:\nORD(str)\n\nIf the leftmost character of the string str is a multi-byte character,\nreturns the code for that character, calculated from the numeric values\nof its constituent bytes using this formula:\n\n  (1st byte code)\n+ (2nd byte code * 256)\n+ (3rd byte code * 2562) ...\n\nIf the leftmost character is not a multi-byte character, ORD() returns\nthe same value as the ASCII() function.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT ORD(\'2\');\n        -> 50\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (131,37,'ENVELOPE','Envelope(g)\n\nReturns the Minimum Bounding Rectangle (MBR) for the geometry value g.\nThe result is returned as a Polygon value.\n\nThe polygon is defined by the corner points of the bounding box:\n\nPOLYGON((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SELECT AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\')));\n+-------------------------------------------------------+\n| AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\'))) |\n+-------------------------------------------------------+\n| POLYGON((1 1,2 1,2 2,1 2,1 1))                        |\n+-------------------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (132,14,'INET_ATON','Syntax:\nINET_ATON(expr)\n\nGiven the dotted-quad representation of an IPv4 network address as a\nstring, returns an integer that represents the numeric value of the\naddress in network byte order (big endian). INET_ATON() returns NULL if\nit does not understand its argument.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> SELECT INET_ATON(\'10.0.5.9\');\n        -> 167773449\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (133,37,'ISSIMPLE','IsSimple(g)\n\nReturns 1 if the geometry value g has no anomalous geometric points,\nsuch as self-intersection or self-tangency. IsSimple() returns 0 if the\nargument is not simple, and NULL if it is NULL.\n\nThe description of each instantiable geometric class given earlier in\nthe chapter includes the specific conditions that cause an instance of\nthat class to be classified as not simple. (See [HELP Geometry\nhierarchy].)\n\nPrior to MySQL 5.6.1, this function always returns 0.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (134,4,'- BINARY','Syntax:\n-\n\nSubtraction:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html\n\n','mysql> SELECT 3-5;\n        -> -2\n','http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (135,3,'WKT DEFINITION','The Well-Known Text (WKT) representation of Geometry is designed to\nexchange geometry data in ASCII form. For a Backus-Naur grammar that\nspecifies the formal production rules for writing WKT values, see the\nOpenGIS specification document referenced in\nhttp://dev.mysql.com/doc/refman/5.6/en/spatial-extensions.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/gis-wkt-format.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/gis-wkt-format.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (136,32,'CURRENT_TIME','Syntax:\nCURRENT_TIME, CURRENT_TIME([fsp])\n\nCURRENT_TIME and CURRENT_TIME() are synonyms for CURTIME().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (137,10,'REVOKE','Syntax:\nREVOKE\n    priv_type [(column_list)]\n      [, priv_type [(column_list)]] ...\n    ON [object_type] priv_level\n    FROM user [, user] ...\n\nREVOKE ALL PRIVILEGES, GRANT OPTION\n    FROM user [, user] ...\n\nREVOKE PROXY ON user\n    FROM user [, user] ...\n\nThe REVOKE statement enables system administrators to revoke privileges\nfrom MySQL accounts. Each account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.6/en/account-names.html. For example:\n\nREVOKE INSERT ON *.* FROM \'jeffrey\'@\'localhost\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nFor details on the levels at which privileges exist, the permissible\npriv_type and priv_level values, and the syntax for specifying users\nand passwords, see [HELP GRANT]\n\nTo use the first REVOKE syntax, you must have the GRANT OPTION\nprivilege, and you must have the privileges that you are revoking.\n\nTo revoke all privileges, use the second syntax, which drops all\nglobal, database, table, column, and routine privileges for the named\nuser or users:\n\nREVOKE ALL PRIVILEGES, GRANT OPTION FROM user [, user] ...\n\nTo use this REVOKE syntax, you must have the global CREATE USER\nprivilege or the UPDATE privilege for the mysql database.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/revoke.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/revoke.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (138,32,'LAST_DAY','Syntax:\nLAST_DAY(date)\n\nTakes a date or datetime value and returns the corresponding value for\nthe last day of the month. Returns NULL if the argument is invalid.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT LAST_DAY(\'2003-02-05\');\n        -> \'2003-02-28\'\nmysql> SELECT LAST_DAY(\'2004-02-05\');\n        -> \'2004-02-29\'\nmysql> SELECT LAST_DAY(\'2004-01-01 01:01:01\');\n        -> \'2004-01-31\'\nmysql> SELECT LAST_DAY(\'2003-03-32\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (139,23,'MEDIUMINT','MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA medium-sized integer. The signed range is -8388608 to 8388607. The\nunsigned range is 0 to 16777215.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (140,12,'RANDOM_BYTES','Syntax:\nRANDOM_BYTES(len)\n\nThis function returns a binary string of len random bytes generated\nusing the random number generator of the SSL library (OpenSSL or\nyaSSL). Permitted values of len range from 1 to 1024. For values\noutside that range, RANDOM_BYTES() generates a warning and returns\nNULL.\n\nRANDOM_BYTES() can be used to provide the initialization vector for the\nAES_DECRYPT() and AES_ENCRYPT() functions. For use in that context, len\nmust be at least 16. Larger values are permitted, but bytes in excess\nof 16 are ignored.\n\nRANDOM_BYTES() generates a random value, which makes its result\nnondeterministic. Consequently, statements that use this function are\nunsafe for statement-based replication and cannot be stored in the\nquery cache.\n\nThis function is available as of MySQL 5.6.17.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (141,38,'RTRIM','Syntax:\nRTRIM(str)\n\nReturns the string str with trailing space characters removed.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT RTRIM(\'barbar   \');\n        -> \'barbar\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (142,29,'EXPLAIN','Syntax:\n{EXPLAIN | DESCRIBE | DESC}\n    tbl_name [col_name | wild]\n\n{EXPLAIN | DESCRIBE | DESC}\n    [explain_type]\n    explainable_stmt\n\nexplain_type: {\n    EXTENDED\n  | PARTITIONS\n  | FORMAT = format_name\n}\n\nformat_name: {\n    TRADITIONAL\n  | JSON\n}\n\nexplainable_stmt: {\n    SELECT statement\n  | DELETE statement\n  | INSERT statement\n  | REPLACE statement\n  | UPDATE statement\n}\n\nThe DESCRIBE and EXPLAIN statements are synonyms. In practice, the\nDESCRIBE keyword is more often used to obtain information about table\nstructure, whereas EXPLAIN is used to obtain a query execution plan\n(that is, an explanation of how MySQL would execute a query). The\nfollowing discussion uses the DESCRIBE and EXPLAIN keywords in\naccordance with those uses, but the MySQL parser treats them as\ncompletely synonymous.\n\nObtaining Table Structure Information\n\nDESCRIBE provides information about the columns in a table:\n\nmysql> DESCRIBE City;\n+------------+----------+------+-----+---------+----------------+\n| Field      | Type     | Null | Key | Default | Extra          |\n+------------+----------+------+-----+---------+----------------+\n| Id         | int(11)  | NO   | PRI | NULL    | auto_increment |\n| Name       | char(35) | NO   |     |         |                |\n| Country    | char(3)  | NO   | UNI |         |                |\n| District   | char(20) | YES  | MUL |         |                |\n| Population | int(11)  | NO   |     | 0       |                |\n+------------+----------+------+-----+---------+----------------+\n\nDESCRIBE is a shortcut for SHOW COLUMNS. These statements also display\ninformation for views. The description for SHOW COLUMNS provides more\ninformation about the output columns. See [HELP SHOW COLUMNS].\n\nBy default, DESCRIBE displays information about all columns in the\ntable. col_name, if given, is the name of a column in the table. In\nthis case, the statement displays information only for the named\ncolumn. wild, if given, is a pattern string. It can contain the SQL "%"\nand "_" wildcard characters. In this case, the statement displays\noutput only for the columns with names matching the string. There is no\nneed to enclose the string within quotation marks unless it contains\nspaces or other special characters.\n\nThe DESCRIBE statement is provided for compatibility with Oracle.\n\nThe SHOW CREATE TABLE, SHOW TABLE STATUS, and SHOW INDEX statements\nalso provide information about tables. See [HELP SHOW].\n\nObtaining Execution Plan Information\n\nThe EXPLAIN statement provides information about how MySQL executes\nstatements:\n\no As of MySQL 5.6.3, permitted explainable statements for EXPLAIN are\n  SELECT, DELETE, INSERT, REPLACE, and UPDATE. Before MySQL 5.6.3,\n  SELECT is the only explainable statement.\n\no When EXPLAIN is used with an explainable statement, MySQL displays\n  information from the optimizer about the statement execution plan.\n  That is, MySQL explains how it would process the statement, including\n  information about how tables are joined and in which order. For\n  information about using EXPLAIN to obtain execution plan information,\n  see http://dev.mysql.com/doc/refman/5.6/en/explain-output.html.\n\no EXPLAIN EXTENDED can be used to obtain additional execution plan\n  information. See\n  http://dev.mysql.com/doc/refman/5.6/en/explain-extended.html.\n\no EXPLAIN PARTITIONS is useful for examining queries involving\n  partitioned tables. See\n  http://dev.mysql.com/doc/refman/5.6/en/partitioning-info.html.\n\no As of MySQL 5.6.5, the FORMAT option can be used to select the output\n  format. TRADITIONAL presents the output in tabular format. This is\n  the default if no FORMAT option is present. JSON format displays the\n  information in JSON format. With FORMAT = JSON, the output includes\n  extended and partition information.\n\nWith the help of EXPLAIN, you can see where you should add indexes to\ntables so that the statement executes faster by using indexes to find\nrows. You can also use EXPLAIN to check whether the optimizer joins the\ntables in an optimal order. To give a hint to the optimizer to use a\njoin order corresponding to the order in which the tables are named in\na SELECT statement, begin the statement with SELECT STRAIGHT_JOIN\nrather than just SELECT. (See\nhttp://dev.mysql.com/doc/refman/5.6/en/select.html.)\n\nIf you have a problem with indexes not being used when you believe that\nthey should be, run ANALYZE TABLE to update table statistics, such as\ncardinality of keys, that can affect the choices the optimizer makes.\nSee [HELP ANALYZE TABLE].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/explain.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/explain.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (143,4,'DEGREES','Syntax:\nDEGREES(X)\n\nReturns the argument X, converted from radians to degrees.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT DEGREES(PI());\n        -> 180\nmysql> SELECT DEGREES(PI() / 2);\n        -> 90\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (144,4,'- UNARY','Syntax:\n-\n\nUnary minus. This operator changes the sign of the operand.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html\n\n','mysql> SELECT - 2;\n        -> -2\n','http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (145,23,'VARCHAR','[NATIONAL] VARCHAR(M) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA variable-length string. M represents the maximum column length in\ncharacters. The range of M is 0 to 65,535. The effective maximum length\nof a VARCHAR is subject to the maximum row size (65,535 bytes, which is\nshared among all columns) and the character set used. For example, utf8\ncharacters can require up to three bytes per character, so a VARCHAR\ncolumn that uses the utf8 character set can be declared to be a maximum\nof 21,844 characters. See\nhttp://dev.mysql.com/doc/refman/5.6/en/column-count-limit.html.\n\nMySQL stores VARCHAR values as a 1-byte or 2-byte length prefix plus\ndata. The length prefix indicates the number of bytes in the value. A\nVARCHAR column uses one length byte if values require no more than 255\nbytes, two length bytes if values may require more than 255 bytes.\n\n*Note*: MySQL 5.6 follows the standard SQL specification, and does not\nremove trailing spaces from VARCHAR values.\n\nVARCHAR is shorthand for CHARACTER VARYING. NATIONAL VARCHAR is the\nstandard SQL way to define that a VARCHAR column should use some\npredefined character set. MySQL 4.1 and up uses utf8 as this predefined\ncharacter set.\nhttp://dev.mysql.com/doc/refman/5.6/en/charset-national.html. NVARCHAR\nis shorthand for NATIONAL VARCHAR.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (146,38,'UNHEX','Syntax:\n\nUNHEX(str)\n\nFor a string argument str, UNHEX(str) interprets each pair of\ncharacters in the argument as a hexadecimal number and converts it to\nthe byte represented by the number. The return value is a binary\nstring.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT UNHEX(\'4D7953514C\');\n        -> \'MySQL\'\nmysql> SELECT 0x4D7953514C;\n        -> \'MySQL\'\nmysql> SELECT UNHEX(HEX(\'string\'));\n        -> \'string\'\nmysql> SELECT HEX(UNHEX(\'1267\'));\n        -> \'1267\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (147,40,'DROP TRIGGER','Syntax:\nDROP TRIGGER [IF EXISTS] [schema_name.]trigger_name\n\nThis statement drops a trigger. The schema (database) name is optional.\nIf the schema is omitted, the trigger is dropped from the default\nschema. DROP TRIGGER requires the TRIGGER privilege for the table\nassociated with the trigger.\n\nUse IF EXISTS to prevent an error from occurring for a trigger that\ndoes not exist. A NOTE is generated for a nonexistent trigger when\nusing IF EXISTS. See [HELP SHOW WARNINGS].\n\nTriggers for a table are also dropped if you drop the table.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-trigger.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (148,8,'RESET MASTER','Syntax:\nRESET MASTER\n\nDeletes all binary log files listed in the index file, resets the\nbinary log index file to be empty, and creates a new binary log file.\n\nIn MySQL 5.6.5 and later, RESET MASTER also clears the values of the\ngtid_purged system variable (known as gtid_lost in MySQL 5.6.8 and\nearlier) as well as the global value of the gtid_executed (gtid_done,\nprior to MySQL 5.6.9) system variable (but not its session value); that\nis, executing this statement sets each of these values to an empty\nstring (\'\').\n\nThis statement is intended to be used only when the master is started\nfor the first time.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/reset-master.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/reset-master.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (149,4,'PI','Syntax:\nPI()\n\nReturns the value of π (pi). The default number of decimal places\ndisplayed is seven, but MySQL uses the full double-precision value\ninternally.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT PI();\n        -> 3.141593\nmysql> SELECT PI()+0.000000000000000000;\n        -> 3.141592653589793116\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (150,4,'/','Syntax:\n/\n\nDivision:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html\n\n','mysql> SELECT 3/5;\n        -> 0.60\n','http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (151,8,'PURGE BINARY LOGS','Syntax:\nPURGE { BINARY | MASTER } LOGS\n    { TO \'log_name\' | BEFORE datetime_expr }\n\nThe binary log is a set of files that contain information about data\nmodifications made by the MySQL server. The log consists of a set of\nbinary log files, plus an index file (see\nhttp://dev.mysql.com/doc/refman/5.6/en/binary-log.html).\n\nThe PURGE BINARY LOGS statement deletes all the binary log files listed\nin the log index file prior to the specified log file name or date.\nBINARY and MASTER are synonyms. Deleted log files also are removed from\nthe list recorded in the index file, so that the given log file becomes\nthe first in the list.\n\nThis statement has no effect if the server was not started with the\n--log-bin option to enable binary logging.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/purge-binary-logs.html\n\n','PURGE BINARY LOGS TO \'mysql-bin.010\';\nPURGE BINARY LOGS BEFORE \'2008-04-02 22:46:26\';\n','http://dev.mysql.com/doc/refman/5.6/en/purge-binary-logs.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (152,16,'STDDEV_SAMP','Syntax:\nSTDDEV_SAMP(expr)\n\nReturns the sample standard deviation of expr (the square root of\nVAR_SAMP().\n\nSTDDEV_SAMP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (153,31,'ST_TOUCHES','ST_Touches(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially touches g2. Two\ngeometries spatially touch if the interiors of the geometries do not\nintersect, but the boundary of one of the geometries intersects either\nthe boundary or the interior of the other.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (154,17,'SCHEMA','Syntax:\nSCHEMA()\n\nThis function is a synonym for DATABASE().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (155,33,'MLINEFROMWKB','MLineFromWKB(wkb[,srid]), MultiLineStringFromWKB(wkb[,srid])\n\nConstructs a MULTILINESTRING value using its WKB representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (156,27,'SHOW CREATE TABLE','Syntax:\nSHOW CREATE TABLE tbl_name\n\nShows the CREATE TABLE statement that creates the named table. To use\nthis statement, you must have some privilege for the table. This\nstatement also works with views.\nSHOW CREATE TABLE quotes table and column names according to the value\nof the sql_quote_show_create option. See\nhttp://dev.mysql.com/doc/refman/5.6/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-create-table.html\n\n','mysql> SHOW CREATE TABLE t\\G\n*************************** 1. row ***************************\n       Table: t\nCreate Table: CREATE TABLE t (\n  id INT(11) default NULL auto_increment,\n  s char(60) default NULL,\n  PRIMARY KEY (id)\n) ENGINE=MyISAM\n','http://dev.mysql.com/doc/refman/5.6/en/show-create-table.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (157,28,'DUAL','You are permitted to specify DUAL as a dummy table name in situations\nwhere no tables are referenced:\n\nmysql> SELECT 1 + 1 FROM DUAL;\n        -> 2\n\nDUAL is purely for the convenience of people who require that all\nSELECT statements should have FROM and possibly other clauses. MySQL\nmay ignore the clauses. MySQL does not require FROM DUAL if no tables\nare referenced.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/select.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/select.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (158,38,'INSTR','Syntax:\nINSTR(str,substr)\n\nReturns the position of the first occurrence of substring substr in\nstring str. This is the same as the two-argument form of LOCATE(),\nexcept that the order of the arguments is reversed.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT INSTR(\'foobarbar\', \'bar\');\n        -> 4\nmysql> SELECT INSTR(\'xbar\', \'foobar\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (159,19,'>=','Syntax:\n>=\n\nGreater than or equal:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 2 >= 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (160,4,'EXP','Syntax:\nEXP(X)\n\nReturns the value of e (the base of natural logarithms) raised to the\npower of X. The inverse of this function is LOG() (using a single\nargument only) or LN().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT EXP(2);\n        -> 7.3890560989307\nmysql> SELECT EXP(-2);\n        -> 0.13533528323661\nmysql> SELECT EXP(0);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (161,13,'POINTN','PointN(ls,N)\n\nReturns the N-th Point in the Linestring value ls. Points are numbered\nbeginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(PointN(GeomFromText(@ls),2));\n+-------------------------------------+\n| AsText(PointN(GeomFromText(@ls),2)) |\n+-------------------------------------+\n| POINT(2 2)                          |\n+-------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (162,38,'OCT','Syntax:\nOCT(N)\n\nReturns a string representation of the octal value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,8). Returns\nNULL if N is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT OCT(12);\n        -> \'14\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (163,32,'SYSDATE','Syntax:\nSYSDATE()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS format, depending on whether the function is used in\na string or numeric context.\n\nSYSDATE() returns the time at which it executes. This differs from the\nbehavior for NOW(), which returns a constant time that indicates the\ntime at which the statement began to execute. (Within a stored function\nor trigger, NOW() returns the time at which the function or triggering\nstatement began to execute.)\n\nmysql> SELECT NOW(), SLEEP(2), NOW();\n+---------------------+----------+---------------------+\n| NOW()               | SLEEP(2) | NOW()               |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:36 |        0 | 2006-04-12 13:47:36 |\n+---------------------+----------+---------------------+\n\nmysql> SELECT SYSDATE(), SLEEP(2), SYSDATE();\n+---------------------+----------+---------------------+\n| SYSDATE()           | SLEEP(2) | SYSDATE()           |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:44 |        0 | 2006-04-12 13:47:46 |\n+---------------------+----------+---------------------+\n\nIn addition, the SET TIMESTAMP statement affects the value returned by\nNOW() but not by SYSDATE(). This means that timestamp settings in the\nbinary log have no effect on invocations of SYSDATE().\n\nBecause SYSDATE() can return different values even within the same\nstatement, and is not affected by SET TIMESTAMP, it is nondeterministic\nand therefore unsafe for replication if statement-based binary logging\nis used. If that is a problem, you can use row-based logging.\n\nAlternatively, you can use the --sysdate-is-now option to cause\nSYSDATE() to be an alias for NOW(). This works if the option is used on\nboth the master and the slave.\n\nThe nondeterministic nature of SYSDATE() also means that indexes cannot\nbe used for evaluating expressions that refer to it.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (164,5,'UNINSTALL PLUGIN','Syntax:\nUNINSTALL PLUGIN plugin_name\n\nThis statement removes an installed server plugin. It requires the\nDELETE privilege for the mysql.plugin table.\n\nplugin_name must be the name of some plugin that is listed in the\nmysql.plugin table. The server executes the plugin\'s deinitialization\nfunction and removes the row for the plugin from the mysql.plugin\ntable, so that subsequent server restarts will not load and initialize\nthe plugin. UNINSTALL PLUGIN does not remove the plugin\'s shared\nlibrary file.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/uninstall-plugin.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/uninstall-plugin.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (165,33,'ASBINARY','AsBinary(g), AsWKB(g)\n\nConverts a value in internal geometry format to its WKB representation\nand returns the binary result.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-to-convert-geometries-between-formats.html\n\n','SELECT AsBinary(g) FROM geom;\n','http://dev.mysql.com/doc/refman/5.6/en/functions-to-convert-geometries-between-formats.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (166,27,'SHOW TABLES','Syntax:\nSHOW [FULL] TABLES [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLES lists the non-TEMPORARY tables in a given database. You can\nalso get this list using the mysqlshow db_name command. The LIKE\nclause, if present, indicates which table names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.6/en/extended-show.html.\n\nMatching performed by the LIKE clause is dependent on the setting of\nthe lower_case_table_names system variable.\n\nThis statement also lists any views in the database. The FULL modifier\nis supported such that SHOW FULL TABLES displays a second output\ncolumn. Values for the second column are BASE TABLE for a table and\nVIEW for a view.\n\nIf you have no privileges for a base table or view, it does not show up\nin the output from SHOW TABLES or mysqlshow db_name.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-tables.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (167,32,'MAKEDATE','Syntax:\nMAKEDATE(year,dayofyear)\n\nReturns a date, given year and day-of-year values. dayofyear must be\ngreater than 0 or the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT MAKEDATE(2011,31), MAKEDATE(2011,32);\n        -> \'2011-01-31\', \'2011-02-01\'\nmysql> SELECT MAKEDATE(2011,365), MAKEDATE(2014,365);\n        -> \'2011-12-31\', \'2014-12-31\'\nmysql> SELECT MAKEDATE(2011,0);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (168,38,'BINARY OPERATOR','Syntax:\nBINARY\n\nThe BINARY operator casts the string following it to a binary string.\nThis is an easy way to force a column comparison to be done byte by\nbyte rather than character by character. This causes the comparison to\nbe case sensitive even if the column is not defined as BINARY or BLOB.\nBINARY also causes trailing spaces to be significant.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/cast-functions.html\n\n','mysql> SELECT \'a\' = \'A\';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'A\';\n        -> 0\nmysql> SELECT \'a\' = \'a \';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'a \';\n        -> 0\n','http://dev.mysql.com/doc/refman/5.6/en/cast-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (169,6,'MBROVERLAPS','MBROverlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 overlap. The term spatially overlaps is\nused if two geometries intersect and their intersection results in a\ngeometry of the same dimension but not equal to either of the given\ngeometries.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (170,28,'INSERT SELECT','Syntax:\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name \n    [PARTITION (partition_name,...)]\n    [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nWith INSERT ... SELECT, you can quickly insert many rows into a table\nfrom one or many tables. For example:\n\nINSERT INTO tbl_temp2 (fld_id)\n  SELECT tbl_temp1.fld_order_id\n  FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/insert-select.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/insert-select.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (171,40,'CREATE PROCEDURE','Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    PROCEDURE sp_name ([proc_parameter[,...]])\n    [characteristic ...] routine_body\n\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    FUNCTION sp_name ([func_parameter[,...]])\n    RETURNS type\n    [characteristic ...] routine_body\n\nproc_parameter:\n    [ IN | OUT | INOUT ] param_name type\n\nfunc_parameter:\n    param_name type\n\ntype:\n    Any valid MySQL data type\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | [NOT] DETERMINISTIC\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nroutine_body:\n    Valid SQL routine statement\n\nThese statements create stored routines. By default, a routine is\nassociated with the default database. To associate the routine\nexplicitly with a given database, specify the name as db_name.sp_name\nwhen you create it.\n\nThe CREATE FUNCTION statement is also used in MySQL to support UDFs\n(user-defined functions). See\nhttp://dev.mysql.com/doc/refman/5.6/en/adding-functions.html. A UDF can\nbe regarded as an external stored function. Stored functions share\ntheir namespace with UDFs. See\nhttp://dev.mysql.com/doc/refman/5.6/en/function-resolution.html, for\nthe rules describing how the server interprets references to different\nkinds of functions.\n\nTo invoke a stored procedure, use the CALL statement (see [HELP CALL]).\nTo invoke a stored function, refer to it in an expression. The function\nreturns a value during expression evaluation.\n\nCREATE PROCEDURE and CREATE FUNCTION require the CREATE ROUTINE\nprivilege. They might also require the SUPER privilege, depending on\nthe DEFINER value, as described later in this section. If binary\nlogging is enabled, CREATE FUNCTION might require the SUPER privilege,\nas described in\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-programs-logging.html.\n\nBy default, MySQL automatically grants the ALTER ROUTINE and EXECUTE\nprivileges to the routine creator. This behavior can be changed by\ndisabling the automatic_sp_privileges system variable. See\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-routines-privileges.html.\n\nThe DEFINER and SQL SECURITY clauses specify the security context to be\nused when checking access privileges at routine execution time, as\ndescribed later in this section.\n\nIf the routine name is the same as the name of a built-in SQL function,\na syntax error occurs unless you use a space between the name and the\nfollowing parenthesis when defining the routine or invoking it later.\nFor this reason, avoid using the names of existing SQL functions for\nyour own stored routines.\n\nThe IGNORE_SPACE SQL mode applies to built-in functions, not to stored\nroutines. It is always permissible to have spaces after a stored\nroutine name, regardless of whether IGNORE_SPACE is enabled.\n\nThe parameter list enclosed within parentheses must always be present.\nIf there are no parameters, an empty parameter list of () should be\nused. Parameter names are not case sensitive.\n\nEach parameter is an IN parameter by default. To specify otherwise for\na parameter, use the keyword OUT or INOUT before the parameter name.\n\n*Note*: Specifying a parameter as IN, OUT, or INOUT is valid only for a\nPROCEDURE. For a FUNCTION, parameters are always regarded as IN\nparameters.\n\nAn IN parameter passes a value into a procedure. The procedure might\nmodify the value, but the modification is not visible to the caller\nwhen the procedure returns. An OUT parameter passes a value from the\nprocedure back to the caller. Its initial value is NULL within the\nprocedure, and its value is visible to the caller when the procedure\nreturns. An INOUT parameter is initialized by the caller, can be\nmodified by the procedure, and any change made by the procedure is\nvisible to the caller when the procedure returns.\n\nFor each OUT or INOUT parameter, pass a user-defined variable in the\nCALL statement that invokes the procedure so that you can obtain its\nvalue when the procedure returns. If you are calling the procedure from\nwithin another stored procedure or function, you can also pass a\nroutine parameter or local routine variable as an IN or INOUT\nparameter.\n\nRoutine parameters cannot be referenced in statements prepared within\nthe routine; see\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-program-restrictions.html\n.\n\nThe following example shows a simple stored procedure that uses an OUT\nparameter:\n\nmysql> delimiter //\n\nmysql> CREATE PROCEDURE simpleproc (OUT param1 INT)\n    -> BEGIN\n    ->   SELECT COUNT(*) INTO param1 FROM t;\n    -> END//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter ;\n\nmysql> CALL simpleproc(@a);\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @a;\n+------+\n| @a   |\n+------+\n| 3    |\n+------+\n1 row in set (0.00 sec)\n\nThe example uses the mysql client delimiter command to change the\nstatement delimiter from ; to // while the procedure is being defined.\nThis enables the ; delimiter used in the procedure body to be passed\nthrough to the server rather than being interpreted by mysql itself.\nSee\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-programs-defining.html.\n\nThe RETURNS clause may be specified only for a FUNCTION, for which it\nis mandatory. It indicates the return type of the function, and the\nfunction body must contain a RETURN value statement. If the RETURN\nstatement returns a value of a different type, the value is coerced to\nthe proper type. For example, if a function specifies an ENUM or SET\nvalue in the RETURNS clause, but the RETURN statement returns an\ninteger, the value returned from the function is the string for the\ncorresponding ENUM member of set of SET members.\n\nThe following example function takes a parameter, performs an operation\nusing an SQL function, and returns the result. In this case, it is\nunnecessary to use delimiter because the function definition contains\nno internal ; statement delimiters:\n\nmysql> CREATE FUNCTION hello (s CHAR(20))\nmysql> RETURNS CHAR(50) DETERMINISTIC\n    -> RETURN CONCAT(\'Hello, \',s,\'!\');\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT hello(\'world\');\n+----------------+\n| hello(\'world\') |\n+----------------+\n| Hello, world!  |\n+----------------+\n1 row in set (0.00 sec)\n\nParameter types and function return types can be declared to use any\nvalid data type. The COLLATE attribute can be used if preceded by the\nCHARACTER SET attribute.\n\nThe routine_body consists of a valid SQL routine statement. This can be\na simple statement such as SELECT or INSERT, or a compound statement\nwritten using BEGIN and END. Compound statements can contain\ndeclarations, loops, and other control structure statements. The syntax\nfor these statements is described in\nhttp://dev.mysql.com/doc/refman/5.6/en/sql-syntax-compound-statements.h\ntml.\n\nMySQL permits routines to contain DDL statements, such as CREATE and\nDROP. MySQL also permits stored procedures (but not stored functions)\nto contain SQL transaction statements such as COMMIT. Stored functions\nmay not contain statements that perform explicit or implicit commit or\nrollback. Support for these statements is not required by the SQL\nstandard, which states that each DBMS vendor may decide whether to\npermit them.\n\nStatements that return a result set can be used within a stored\nprocedure but not within a stored function. This prohibition includes\nSELECT statements that do not have an INTO var_list clause and other\nstatements such as SHOW, EXPLAIN, and CHECK TABLE. For statements that\ncan be determined at function definition time to return a result set, a\nNot allowed to return a result set from a function error occurs\n(ER_SP_NO_RETSET). For statements that can be determined only at\nruntime to return a result set, a PROCEDURE %s can\'t return a result\nset in the given context error occurs (ER_SP_BADSELECT).\n\nUSE statements within stored routines are not permitted. When a routine\nis invoked, an implicit USE db_name is performed (and undone when the\nroutine terminates). The causes the routine to have the given default\ndatabase while it executes. References to objects in databases other\nthan the routine default database should be qualified with the\nappropriate database name.\n\nFor additional information about statements that are not permitted in\nstored routines, see\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-program-restrictions.html\n.\n\nFor information about invoking stored procedures from within programs\nwritten in a language that has a MySQL interface, see [HELP CALL].\n\nMySQL stores the sql_mode system variable setting in effect when a\nroutine is created or altered, and always executes the routine with\nthis setting in force, regardless of the current server SQL mode when\nthe routine begins executing.\n\nThe switch from the SQL mode of the invoker to that of the routine\noccurs after evaluation of arguments and assignment of the resulting\nvalues to routine parameters. If you define a routine in strict SQL\nmode but invoke it in nonstrict mode, assignment of arguments to\nroutine parameters does not take place in strict mode. If you require\nthat expressions passed to a routine be assigned in strict SQL mode,\nyou should invoke the routine with strict mode in effect.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/create-procedure.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (172,17,'SQL_THREAD_WAIT_AFTER_GTIDS','Syntax:\nSQL_THREAD_WAIT_AFTER_GTIDS(gtid_set[, timeout])\n\nSQL_THREAD_WAIT_AFTER_GTIDS() was added in MySQL 5.6.5, and replaced by\nWAIT_UNTIL_SQL_THREAD_AFTER_GTIDS() in MySQL 5.6.9. (Bug #14775984)\n\nFor more information, see\nhttp://dev.mysql.com/doc/refman/5.6/en/replication-gtids.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/gtid-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/gtid-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (173,24,'GET DIAGNOSTICS','Syntax:\nGET [CURRENT] DIAGNOSTICS\n{\n    statement_information_item\n    [, statement_information_item] ... \n  | CONDITION condition_number\n    condition_information_item\n    [, condition_information_item] ...\n}\n\nstatement_information_item:\n    target = statement_information_item_name\n\ncondition_information_item:\n    target = condition_information_item_name\n\nstatement_information_item_name:\n    NUMBER\n  | ROW_COUNT\n\ncondition_information_item_name:\n    CLASS_ORIGIN\n  | SUBCLASS_ORIGIN\n  | RETURNED_SQLSTATE\n  | MESSAGE_TEXT\n  | MYSQL_ERRNO\n  | CONSTRAINT_CATALOG\n  | CONSTRAINT_SCHEMA\n  | CONSTRAINT_NAME\n  | CATALOG_NAME\n  | SCHEMA_NAME\n  | TABLE_NAME\n  | COLUMN_NAME\n  | CURSOR_NAME\n\ncondition_number, target:\n    (see following discussion)\n\nSQL statements produce diagnostic information that populates the\ndiagnostics area. The GET DIAGNOSTICS statement enables applications to\ninspect this information. It is available as of MySQL 5.6.4. (You can\nalso use SHOW WARNINGS or SHOW ERRORS to see conditions or errors.)\n\nNo special privileges are required to execute GET DIAGNOSTICS.\n\nThe keyword CURRENT means to retrieve information from the current\ndiagnostics area. In MySQL, it has no effect because that is the\ndefault behavior.\n\nGET DIAGNOSTICS is typically used in a handler within a stored program,\nbut it is a MySQL extension that it is permitted outside handler\ncontext to check the execution of any SQL statement. For example, if\nyou invoke the mysql client program, you can enter these statements at\nthe prompt:\n\nmysql> DROP TABLE test.no_such_table;\nERROR 1051 (42S02): Unknown table \'test.no_such_table\'\nmysql> GET DIAGNOSTICS CONDITION 1\n    ->   @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;\nmysql> SELECT @p1, @p2;\n+-------+------------------------------------+\n| @p1   | @p2                                |\n+-------+------------------------------------+\n| 42S02 | Unknown table \'test.no_such_table\' |\n+-------+------------------------------------+\n\nFor a description of the diagnostics area, see\nhttp://dev.mysql.com/doc/refman/5.6/en/diagnostics-area.html. Briefly,\nit contains two kinds of information:\n\no Statement information, such as the number of conditions that occurred\n  or the affected-rows count.\n\no Condition information, such as the error code and message. If a\n  statement raises multiple conditions, this part of the diagnostics\n  area has a condition area for each one. If a statement raises no\n  conditions, this part of the diagnostics area is empty.\n\nFor a statement that produces three conditions, the diagnostics area\ncontains statement and condition information like this:\n\nStatement information:\n  row count\n  ... other statement information items ...\nCondition area list:\n  Condition area 1:\n    error code for condition 1\n    error message for condition 1\n    ... other condition information items ...\n  Condition area 2:\n    error code for condition 2:\n    error message for condition 2\n    ... other condition information items ...\n  Condition area 3:\n    error code for condition 3\n    error message for condition 3\n    ... other condition information items ...\n\nGET DIAGNOSTICS can obtain either statement or condition information,\nbut not both in the same statement:\n\no To obtain statement information, retrieve the desired statement items\n  into target variables. This instance of GET DIAGNOSTICS assigns the\n  number of available conditions and the rows-affected count to the\n  user variables @p1 and @p2:\n\nGET DIAGNOSTICS @p1 = NUMBER, @p2 = ROW_COUNT;\n\no To obtain condition information, specify the condition number and\n  retrieve the desired condition items into target variables. This\n  instance of GET DIAGNOSTICS assigns the SQLSTATE value and error\n  message to the user variables @p3 and @p4:\n\nGET DIAGNOSTICS CONDITION 1\n  @p3 = RETURNED_SQLSTATE, @p4 = MESSAGE_TEXT;\n\nThe retrieval list specifies one or more target = item_name\nassignments, separated by commas. Each assignment names a target\nvariable and either a statement_information_item_name or\ncondition_information_item_name designator, depending on whether the\nstatement retrieves statement or condition information.\n\nValid target designators for storing item information can be stored\nprocedure or function parameters, stored program local variables\ndeclared with DECLARE, or user-defined variables.\n\nValid condition_number designators can be stored procedure or function\nparameters, stored program local variables declared with DECLARE,\nuser-defined variables, system variables, or literals. A character\nliteral may include a _charset introducer. A warning occurs if the\ncondition number is not in the range from 1 to the number of condition\nareas that have information. In this case, the warning is added to the\ndiagnostics area without clearing it.\n\nCurrently, when a condition occurs, MySQL does not populate all\ncondition items recognized by GET DIAGNOSTICS. For example:\n\nmysql> GET DIAGNOSTICS CONDITION 1\n    ->   @p5 = SCHEMA_NAME, @p6 = TABLE_NAME;\nmysql> SELECT @p5, @p6;\n+------+------+\n| @p5  | @p6  |\n+------+------+\n|      |      |\n+------+------+\n\nIn standard SQL, if there are multiple conditions, the first condition\nrelates to the SQLSTATE value returned for the previous SQL statement.\nIn MySQL, this is not guaranteed. To get the main error, you cannot do\nthis:\n\nGET DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO;\n\nInstead, retrieve the condition count first, then use it to specify\nwhich condition number to inspect:\n\nGET DIAGNOSTICS @cno = NUMBER;\nGET DIAGNOSTICS CONDITION @cno @errno = MYSQL_ERRNO;\n\nFor information about permissible statement and condition information\nitems, and which ones are populated when a condition occurs, see\nhttp://dev.mysql.com/doc/refman/5.6/en/diagnostics-area.html#diagnostic\ns-area-information-items.\n\nHere is an example that uses GET DIAGNOSTICS and an exception handler\nin stored procedure context to assess the outcome of an insert\noperation. If the insert was successful, the procedure uses GET\nDIAGNOSTICS to get the rows-affected count. This shows that you can use\nGET DIAGNOSTICS multiple times to retrieve information about a\nstatement as long as the diagnostics area has not been cleared.\n\nCREATE PROCEDURE do_insert(value INT)\nBEGIN\n  -- Declare variables to hold diagnostics area information\n  DECLARE code CHAR(5) DEFAULT \'00000\';\n  DECLARE msg TEXT;\n  DECLARE rows INT;\n  DECLARE result TEXT;\n  -- Declare exception handler for failed insert\n  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION\n    BEGIN\n      GET DIAGNOSTICS CONDITION 1\n        code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;\n    END;\n\n  -- Perform the insert\n  INSERT INTO t1 (int_col) VALUES(value);\n  -- Check whether the insert was successful\n  IF code = \'00000\' THEN\n    GET DIAGNOSTICS rows = ROW_COUNT;\n    SET result = CONCAT(\'insert succeeded, row count = \',rows);\n  ELSE\n    SET result = CONCAT(\'insert failed, error = \',code,\', message = \',msg);\n  END IF;\n  -- Say what happened\n  SELECT result;\nEND;\n\nSuppose that t1.int_col is an integer column that is declared as NOT\nNULL. The procedure produces these results when invoked to insert\nnon-NULL and NULL values:\n\nmysql> CALL do_insert(1);\n+---------------------------------+\n| result                          |\n+---------------------------------+\n| insert succeeded, row count = 1 |\n+---------------------------------+\n\nmysql> CALL do_insert(NULL);\n+-------------------------------------------------------------------------+\n| result                                                                  |\n+-------------------------------------------------------------------------+\n| insert failed, error = 23000, message = Column \'int_col\' cannot be null |\n+-------------------------------------------------------------------------+\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/get-diagnostics.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/get-diagnostics.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (174,38,'NOT REGEXP','Syntax:\nexpr NOT REGEXP pat, expr NOT RLIKE pat\n\nThis is the same as NOT (expr REGEXP pat).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/regexp.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/regexp.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (175,24,'LEAVE','Syntax:\nLEAVE label\n\nThis statement is used to exit the flow control construct that has the\ngiven label. If the label is for the outermost stored program block,\nLEAVE exits the program.\n\nLEAVE can be used within BEGIN ... END or loop constructs (LOOP,\nREPEAT, WHILE).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/leave.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/leave.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (176,19,'NOT IN','Syntax:\nexpr NOT IN (value,...)\n\nThis is the same as NOT (expr IN (value,...)).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (177,15,'&&','Syntax:\nAND, &&\n\nLogical AND. Evaluates to 1 if all operands are nonzero and not NULL,\nto 0 if one or more operands are 0, otherwise NULL is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/logical-operators.html\n\n','mysql> SELECT 1 && 1;\n        -> 1\nmysql> SELECT 1 && 0;\n        -> 0\nmysql> SELECT 1 && NULL;\n        -> NULL\nmysql> SELECT 0 && NULL;\n        -> 0\nmysql> SELECT NULL && 0;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.6/en/logical-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (178,11,'X','X(p)\n\nReturns the X-coordinate value for the Point object p as a\ndouble-precision number.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SELECT X(POINT(56.7, 53.34));\n+-----------------------+\n| X(POINT(56.7, 53.34)) |\n+-----------------------+\n|                  56.7 |\n+-----------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (179,17,'FOUND_ROWS','Syntax:\nFOUND_ROWS()\n\nA SELECT statement may include a LIMIT clause to restrict the number of\nrows the server returns to the client. In some cases, it is desirable\nto know how many rows the statement would have returned without the\nLIMIT, but without running the statement again. To obtain this row\ncount, include a SQL_CALC_FOUND_ROWS option in the SELECT statement,\nand then invoke FOUND_ROWS() afterward:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','mysql> SELECT SQL_CALC_FOUND_ROWS * FROM tbl_name\n    -> WHERE id > 100 LIMIT 10;\nmysql> SELECT FOUND_ROWS();\n','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (180,31,'CROSSES','Crosses(g1,g2)\n\nReturns 1 if g1 spatially crosses g2. Returns NULL if g1 is a Polygon\nor a MultiPolygon, or if g2 is a Point or a MultiPoint. Otherwise,\nreturns 0.\n\nThe term spatially crosses denotes a spatial relation between two given\ngeometries that has the following properties:\n\no The two geometries intersect\n\no Their intersection results in a geometry that has a dimension that is\n  one less than the maximum dimension of the two given geometries\n\no Their intersection is not equal to either of the two given geometries\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (181,16,'BIT_XOR','Syntax:\nBIT_XOR(expr)\n\nReturns the bitwise XOR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (182,27,'FLUSH','Syntax:\nFLUSH [NO_WRITE_TO_BINLOG | LOCAL]\n    flush_option [, flush_option] ...\n\nThe FLUSH statement has several variant forms that clear or reload\nvarious internal caches, flush tables, or acquire locks. To execute\nFLUSH, you must have the RELOAD privilege. Specific flush options might\nrequire additional privileges, as described later.\n\nBy default, the server writes FLUSH statements to the binary log so\nthat they replicate to replication slaves. To suppress logging, specify\nthe optional NO_WRITE_TO_BINLOG keyword or its alias LOCAL.\n\n*Note*: FLUSH LOGS, FLUSH TABLES WITH READ LOCK (with or without a\ntable list), and FLUSH TABLES tbl_name ... FOR EXPORT are not written\nto the binary log in any case because they would cause problems if\nreplicated to a slave.\n\nSending a SIGHUP signal to the server causes several flush operations\nto occur that are similar to various forms of the FLUSH statement. See\nhttp://dev.mysql.com/doc/refman/5.6/en/server-signal-response.html.\n\nThe FLUSH statement causes an implicit commit. See\nhttp://dev.mysql.com/doc/refman/5.6/en/implicit-commit.html.\n\nThe RESET statement is similar to FLUSH. See [HELP RESET], for\ninformation about using the RESET statement with replication.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/flush.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/flush.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (183,24,'BEGIN END','Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\nBEGIN ... END syntax is used for writing compound statements, which can\nappear within stored programs (stored procedures and functions,\ntriggers, and events). A compound statement can contain multiple\nstatements, enclosed by the BEGIN and END keywords. statement_list\nrepresents a list of one or more statements, each terminated by a\nsemicolon (;) statement delimiter. The statement_list itself is\noptional, so the empty compound statement (BEGIN END) is legal.\n\nBEGIN ... END blocks can be nested.\n\nUse of multiple statements requires that a client is able to send\nstatement strings containing the ; statement delimiter. In the mysql\ncommand-line client, this is handled with the delimiter command.\nChanging the ; end-of-statement delimiter (for example, to //) permit ;\nto be used in a program body. For an example, see\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-programs-defining.html.\n\nA BEGIN ... END block can be labeled. See [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/begin-end.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/begin-end.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (184,27,'SHOW PROCEDURE STATUS','Syntax:\nSHOW PROCEDURE STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is a MySQL extension. It returns characteristics of a\nstored procedure, such as the database, name, type, creator, creation\nand modification dates, and character set information. A similar\nstatement, SHOW FUNCTION STATUS, displays information about stored\nfunctions (see [HELP SHOW FUNCTION STATUS]).\n\nThe LIKE clause, if present, indicates which procedure or function\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-procedure-status.html\n\n','mysql> SHOW PROCEDURE STATUS LIKE \'sp1\'\\G\n*************************** 1. row ***************************\n                  Db: test\n                Name: sp1\n                Type: PROCEDURE\n             Definer: testuser@localhost\n            Modified: 2004-08-03 15:29:37\n             Created: 2004-08-03 15:29:37\n       Security_type: DEFINER\n             Comment:\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.6/en/show-procedure-status.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (185,16,'STDDEV_POP','Syntax:\nSTDDEV_POP(expr)\n\nReturns the population standard deviation of expr (the square root of\nVAR_POP()). You can also use STD() or STDDEV(), which are equivalent\nbut not standard SQL.\n\nSTDDEV_POP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (186,27,'SHOW CHARACTER SET','Syntax:\nSHOW CHARACTER SET\n    [LIKE \'pattern\' | WHERE expr]\n\nThe SHOW CHARACTER SET statement shows all available character sets.\nThe LIKE clause, if present, indicates which character set names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html. For example:\n\nmysql> SHOW CHARACTER SET LIKE \'latin%\';\n+---------+-----------------------------+-------------------+--------+\n| Charset | Description                 | Default collation | Maxlen |\n+---------+-----------------------------+-------------------+--------+\n| latin1  | cp1252 West European        | latin1_swedish_ci |      1 |\n| latin2  | ISO 8859-2 Central European | latin2_general_ci |      1 |\n| latin5  | ISO 8859-9 Turkish          | latin5_turkish_ci |      1 |\n| latin7  | ISO 8859-13 Baltic          | latin7_general_ci |      1 |\n+---------+-----------------------------+-------------------+--------+\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-character-set.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-character-set.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (187,31,'INTERSECTS','Intersects(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially intersects g2.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (188,24,'LOOP','Syntax:\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\nLOOP implements a simple loop construct, enabling repeated execution of\nthe statement list, which consists of one or more statements, each\nterminated by a semicolon (;) statement delimiter. The statements\nwithin the loop are repeated until the loop is terminated. Usually,\nthis is accomplished with a LEAVE statement. Within a stored function,\nRETURN can also be used, which exits the function entirely.\n\nNeglecting to include a loop-termination statement results in an\ninfinite loop.\n\nA LOOP statement can be labeled. For the rules regarding label use, see\n[HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/loop.html\n\n','CREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN\n      ITERATE label1;\n    END IF;\n    LEAVE label1;\n  END LOOP label1;\n  SET @x = p1;\nEND;\n','http://dev.mysql.com/doc/refman/5.6/en/loop.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (189,19,'GREATEST','Syntax:\nGREATEST(value1,value2,...)\n\nWith two or more arguments, returns the largest (maximum-valued)\nargument. The arguments are compared using the same rules as for\nLEAST().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT GREATEST(2,0);\n        -> 2\nmysql> SELECT GREATEST(34.0,3.0,5.0,767.0);\n        -> 767.0\nmysql> SELECT GREATEST(\'B\',\'A\',\'C\');\n        -> \'C\'\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (190,31,'ST_CONTAINS','ST_Contains(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 completely contains g2. This\ntests the opposite relationship as ST_Within().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (191,16,'BIT_AND','Syntax:\nBIT_AND(expr)\n\nReturns the bitwise AND of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (192,32,'SECOND','Syntax:\nSECOND(time)\n\nReturns the second for time, in the range 0 to 59.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT SECOND(\'10:05:03\');\n        -> 3\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (193,6,'MBRCONTAINS','MBRContains(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\ncontains the Minimum Bounding Rectangle of g2. This tests the opposite\nrelationship as MBRWithin().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Point(1 1)\');\nmysql> SELECT MBRContains(@g1,@g2), MBRContains(@g2,@g1);\n----------------------+----------------------+\n| MBRContains(@g1,@g2) | MBRContains(@g2,@g1) |\n+----------------------+----------------------+\n|                    1 |                    0 |\n+----------------------+----------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (194,4,'COT','Syntax:\nCOT(X)\n\nReturns the cotangent of X.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT COT(12);\n        -> -1.5726734063977\nmysql> SELECT COT(0);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (195,27,'SHOW CREATE EVENT','Syntax:\nSHOW CREATE EVENT event_name\n\nThis statement displays the CREATE EVENT statement needed to re-create\na given event. It requires the EVENT privilege for the database from\nwhich the event is to be shown. For example (using the same event\ne_daily defined and then altered in [HELP SHOW EVENTS]):\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-create-event.html\n\n','mysql> SHOW CREATE EVENT test.e_daily\\G\n*************************** 1. row ***************************\n               Event: e_daily\n            sql_mode:\n           time_zone: SYSTEM\n        Create Event: CREATE EVENT `e_daily`\n                        ON SCHEDULE EVERY 1 DAY\n                        STARTS CURRENT_TIMESTAMP + INTERVAL 6 HOUR\n                        ON COMPLETION NOT PRESERVE\n                        ENABLE\n                        COMMENT \'Saves total number of sessions then\n                                clears the table each day\'\n                        DO BEGIN\n                          INSERT INTO site_activity.totals (time, total)\n                            SELECT CURRENT_TIMESTAMP, COUNT(*)\n                            FROM site_activity.sessions;\n                          DELETE FROM site_activity.sessions;\n                        END\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.6/en/show-create-event.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (196,38,'LOAD_FILE','Syntax:\nLOAD_FILE(file_name)\n\nReads the file and returns the file contents as a string. To use this\nfunction, the file must be located on the server host, you must specify\nthe full path name to the file, and you must have the FILE privilege.\nThe file must be readable by all and its size less than\nmax_allowed_packet bytes. If the secure_file_priv system variable is\nset to a nonempty directory name, the file to be loaded must be located\nin that directory.\n\nIf the file does not exist or cannot be read because one of the\npreceding conditions is not satisfied, the function returns NULL.\n\nThe character_set_filesystem system variable controls interpretation of\nfile names that are given as literal strings.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> UPDATE t\n            SET blob_col=LOAD_FILE(\'/tmp/picture\')\n            WHERE id=1;\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (197,3,'POINTFROMTEXT','PointFromText(wkt[,srid])\n\nConstructs a POINT value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (198,32,'DATE_FORMAT','Syntax:\nDATE_FORMAT(date,format)\n\nFormats the date value according to the format string.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT DATE_FORMAT(\'2009-10-04 22:23:00\', \'%W %M %Y\');\n        -> \'Sunday October 2009\'\nmysql> SELECT DATE_FORMAT(\'2007-10-04 22:23:00\', \'%H:%i:%s\');\n        -> \'22:23:00\'\nmysql> SELECT DATE_FORMAT(\'1900-10-04 22:23:00\',\n    ->                 \'%D %y %a %d %m %b %j\');\n        -> \'4th 00 Thu 04 10 Oct 277\'\nmysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\',\n    ->                 \'%H %k %I %r %T %S %w\');\n        -> \'22 22 10 10:23:00 PM 22:23:00 00 6\'\nmysql> SELECT DATE_FORMAT(\'1999-01-01\', \'%X %V\');\n        -> \'1998 52\'\nmysql> SELECT DATE_FORMAT(\'2006-06-00\', \'%d\');\n        -> \'00\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (199,32,'YEAR','Syntax:\nYEAR(date)\n\nReturns the year for date, in the range 1000 to 9999, or 0 for the\n"zero" date.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT YEAR(\'1987-01-01\');\n        -> 1987\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (200,19,'IS NULL','Syntax:\nIS NULL\n\nTests whether a value is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;\n        -> 0, 0, 1\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (201,40,'ALTER SERVER','Syntax:\nALTER SERVER  server_name\n    OPTIONS (option [, option] ...)\n\nAlters the server information for server_name, adjusting any of the\noptions permitted in the CREATE SERVER statement. The corresponding\nfields in the mysql.servers table are updated accordingly. This\nstatement requires the SUPER privilege.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/alter-server.html\n\n','ALTER SERVER s OPTIONS (USER \'sally\');\n','http://dev.mysql.com/doc/refman/5.6/en/alter-server.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (202,24,'RESIGNAL','Syntax:\nRESIGNAL [condition_value]\n    [SET signal_information_item\n    [, signal_information_item] ...]\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n\nsignal_information_item:\n    condition_information_item_name = simple_value_specification\n\ncondition_information_item_name:\n    CLASS_ORIGIN\n  | SUBCLASS_ORIGIN\n  | MESSAGE_TEXT\n  | MYSQL_ERRNO\n  | CONSTRAINT_CATALOG\n  | CONSTRAINT_SCHEMA\n  | CONSTRAINT_NAME\n  | CATALOG_NAME\n  | SCHEMA_NAME\n  | TABLE_NAME\n  | COLUMN_NAME\n  | CURSOR_NAME\n\ncondition_name, simple_value_specification:\n    (see following discussion)\n\nRESIGNAL passes on the error condition information that is available\nduring execution of a condition handler within a compound statement\ninside a stored procedure or function, trigger, or event. RESIGNAL may\nchange some or all information before passing it on. RESIGNAL is\nrelated to SIGNAL, but instead of originating a condition as SIGNAL\ndoes, RESIGNAL relays existing condition information, possibly after\nmodifying it.\n\nRESIGNAL makes it possible to both handle an error and return the error\ninformation. Otherwise, by executing an SQL statement within the\nhandler, information that caused the handler\'s activation is destroyed.\nRESIGNAL also can make some procedures shorter if a given handler can\nhandle part of a situation, then pass the condition "up the line" to\nanother handler.\n\nNo special privileges are required to execute the RESIGNAL statement.\n\nAll forms of RESIGNAL require that the current context be a condition\nhandler. Otherwise, RESIGNAL is illegal and a RESIGNAL when handler not\nactive error occurs.\n\nTo retrieve information from the diagnostics area, use the GET\nDIAGNOSTICS statement (see [HELP GET DIAGNOSTICS]). For information\nabout the diagnostics area, see\nhttp://dev.mysql.com/doc/refman/5.6/en/diagnostics-area.html.\n\nFor condition_value and signal_information_item, the definitions and\nrules are the same for RESIGNAL as for SIGNAL. For example, the\ncondition_value can be an SQLSTATE value, and the value can indicate\nerrors, warnings, or "not found." For additional information, see [HELP\nSIGNAL].\n\nThe RESIGNAL statement takes condition_value and SET clauses, both of\nwhich are optional. This leads to several possible uses:\n\no RESIGNAL alone:\n\nRESIGNAL;\n\no RESIGNAL with new signal information:\n\nRESIGNAL SET signal_information_item [, signal_information_item] ...;\n\no RESIGNAL with a condition value and possibly new signal information:\n\nRESIGNAL condition_value\n    [SET signal_information_item [, signal_information_item] ...];\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/resignal.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/resignal.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (203,32,'TIME FUNCTION','Syntax:\nTIME(expr)\n\nExtracts the time part of the time or datetime expression expr and\nreturns it as a string.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT TIME(\'2003-12-31 01:02:03\');\n        -> \'01:02:03\'\nmysql> SELECT TIME(\'2003-12-31 01:02:03.000123\');\n        -> \'01:02:03.000123\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (204,32,'DATE_ADD','Syntax:\nDATE_ADD(date,INTERVAL expr unit), DATE_SUB(date,INTERVAL expr unit)\n\nThese functions perform date arithmetic. The date argument specifies\nthe starting date or datetime value. expr is an expression specifying\nthe interval value to be added or subtracted from the starting date.\nexpr is a string; it may start with a "-" for negative intervals. unit\nis a keyword indicating the units in which the expression should be\ninterpreted.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT \'2008-12-31 23:59:59\' + INTERVAL 1 SECOND;\n        -> \'2009-01-01 00:00:00\'\nmysql> SELECT INTERVAL 1 DAY + \'2008-12-31\';\n        -> \'2009-01-01\'\nmysql> SELECT \'2005-01-01\' - INTERVAL 1 SECOND;\n        -> \'2004-12-31 23:59:59\'\nmysql> SELECT DATE_ADD(\'2000-12-31 23:59:59\',\n    ->                 INTERVAL 1 SECOND);\n        -> \'2001-01-01 00:00:00\'\nmysql> SELECT DATE_ADD(\'2010-12-31 23:59:59\',\n    ->                 INTERVAL 1 DAY);\n        -> \'2011-01-01 23:59:59\'\nmysql> SELECT DATE_ADD(\'2100-12-31 23:59:59\',\n    ->                 INTERVAL \'1:1\' MINUTE_SECOND);\n        -> \'2101-01-01 00:01:00\'\nmysql> SELECT DATE_SUB(\'2005-01-01 00:00:00\',\n    ->                 INTERVAL \'1 1:1:1\' DAY_SECOND);\n        -> \'2004-12-30 22:58:59\'\nmysql> SELECT DATE_ADD(\'1900-01-01 00:00:00\',\n    ->                 INTERVAL \'-1 10\' DAY_HOUR);\n        -> \'1899-12-30 14:00:00\'\nmysql> SELECT DATE_SUB(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1997-12-02\'\nmysql> SELECT DATE_ADD(\'1992-12-31 23:59:59.000002\',\n    ->            INTERVAL \'1.999999\' SECOND_MICROSECOND);\n        -> \'1993-01-01 00:00:01.000001\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (205,38,'LIKE','Syntax:\nexpr LIKE pat [ESCAPE \'escape_char\']\n\nPattern matching using SQL simple regular expression comparison.\nReturns 1 (TRUE) or 0 (FALSE). If either expr or pat is NULL, the\nresult is NULL.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-comparison-functions.html\n\n','mysql> SELECT \'David!\' LIKE \'David_\';\n        -> 1\nmysql> SELECT \'David!\' LIKE \'%D%v%\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/string-comparison-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (206,25,'MULTIPOINT','MultiPoint(pt1,pt2,...)\n\nConstructs a MultiPoint value using Point or WKB Point arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (207,20,'>>','Syntax:\n>>\n\nShifts a longlong (BIGINT) number to the right.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html\n\n','mysql> SELECT 4 >> 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (208,24,'FETCH','Syntax:\nFETCH [[NEXT] FROM] cursor_name INTO var_name [, var_name] ...\n\nThis statement fetches the next row for the SELECT statement associated\nwith the specified cursor (which must be open), and advances the cursor\npointer. If a row exists, the fetched columns are stored in the named\nvariables. The number of columns retrieved by the SELECT statement must\nmatch the number of output variables specified in the FETCH statement.\n\nIf no more rows are available, a No Data condition occurs with SQLSTATE\nvalue \'02000\'. To detect this condition, you can set up a handler for\nit (or for a NOT FOUND condition). For an example, see\nhttp://dev.mysql.com/doc/refman/5.6/en/cursors.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/fetch.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/fetch.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (209,30,'TRUE FALSE','The constants TRUE and FALSE evaluate to 1 and 0, respectively. The\nconstant names can be written in any lettercase.\n\nmysql> SELECT TRUE, true, FALSE, false;\n        -> 1, 1, 0, 0\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/boolean-literals.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/boolean-literals.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (210,6,'MBRWITHIN','MBRWithin(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\nis within the Minimum Bounding Rectangle of g2. This tests the opposite\nrelationship as MBRContains().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Polygon((0 0,0 5,5 5,5 0,0 0))\');\nmysql> SELECT MBRWithin(@g1,@g2), MBRWithin(@g2,@g1);\n+--------------------+--------------------+\n| MBRWithin(@g1,@g2) | MBRWithin(@g2,@g1) |\n+--------------------+--------------------+\n|                  1 |                  0 |\n+--------------------+--------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (211,17,'SESSION_USER','Syntax:\nSESSION_USER()\n\nSESSION_USER() is a synonym for USER().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (212,27,'SHOW CREATE FUNCTION','Syntax:\nSHOW CREATE FUNCTION func_name\n\nThis statement is similar to SHOW CREATE PROCEDURE but for stored\nfunctions. See [HELP SHOW CREATE PROCEDURE].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-create-function.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-create-function.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (213,32,'STR_TO_DATE','Syntax:\nSTR_TO_DATE(str,format)\n\nThis is the inverse of the DATE_FORMAT() function. It takes a string\nstr and a format string format. STR_TO_DATE() returns a DATETIME value\nif the format string contains both date and time parts, or a DATE or\nTIME value if the string contains only date or time parts. If the date,\ntime, or datetime value extracted from str is illegal, STR_TO_DATE()\nreturns NULL and produces a warning.\n\nThe server scans str attempting to match format to it. The format\nstring can contain literal characters and format specifiers beginning\nwith %. Literal characters in format must match literally in str.\nFormat specifiers in format must match a date or time part in str. For\nthe specifiers that can be used in format, see the DATE_FORMAT()\nfunction description.\n\nmysql> SELECT STR_TO_DATE(\'01,5,2013\',\'%d,%m,%Y\');\n        -> \'2013-05-01\'\nmysql> SELECT STR_TO_DATE(\'May 1, 2013\',\'%M %d,%Y\');\n        -> \'2013-05-01\'\n\nScanning starts at the beginning of str and fails if format is found\nnot to match. Extra characters at the end of str are ignored.\n\nmysql> SELECT STR_TO_DATE(\'a09:30:17\',\'a%h:%i:%s\');\n        -> \'09:30:17\'\nmysql> SELECT STR_TO_DATE(\'a09:30:17\',\'%h:%i:%s\');\n        -> NULL\nmysql> SELECT STR_TO_DATE(\'09:30:17a\',\'%h:%i:%s\');\n        -> \'09:30:17\'\n\nUnspecified date or time parts have a value of 0, so incompletely\nspecified values in str produce a result with some or all parts set to\n0:\n\nmysql> SELECT STR_TO_DATE(\'abc\',\'abc\');\n        -> \'0000-00-00\'\nmysql> SELECT STR_TO_DATE(\'9\',\'%m\');\n        -> \'0000-09-00\'\nmysql> SELECT STR_TO_DATE(\'9\',\'%s\');\n        -> \'00:00:09\'\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (214,11,'Y','Y(p)\n\nReturns the Y-coordinate value for the Point object p as a\ndouble-precision number.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SELECT Y(POINT(56.7, 53.34));\n+-----------------------+\n| Y(POINT(56.7, 53.34)) |\n+-----------------------+\n|                 53.34 |\n+-----------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (215,21,'CHECKSUM TABLE','Syntax:\nCHECKSUM TABLE tbl_name [, tbl_name] ... [ QUICK | EXTENDED ]\n\nCHECKSUM TABLE reports a checksum for the contents of a table. You can\nuse this statement to verify that the contents are the same before and\nafter a backup, rollback, or other operation that is intended to put\nthe data back to a known state. This statement requires the SELECT\nprivilege for the table.\n\nPerformance Considerations\n\nBy default, the entire table is read row by row and the checksum is\ncalculated. For large tables, this could take a long time, thus you\nwould only perform this operation occasionally. This row-by-row\ncalculation is what you get with the EXTENDED clause, with InnoDB and\nall other storage engines other than MyISAM, and with MyISAM tables not\ncreated with the CHECKSUM=1 clause.\n\nFor MyISAM tables created with the CHECKSUM=1 clause, CHECKSUM TABLE or\nCHECKSUM TABLE ... QUICK returns the "live" table checksum that can be\nreturned very fast. If the table does not meet all these conditions,\nthe QUICK method returns NULL. See [HELP CREATE TABLE] for the syntax\nof the CHECKSUM clause.\n\nFor a nonexistent table, CHECKSUM TABLE returns NULL and generates a\nwarning.\n\nPrior to MySQL 5.6.4, CHECKSUM TABLE returned 0 for partitioned tables\nunless the EXTENDED option was used. (Bug #11933226, Bug #60681)\n\nThe checksum value depends on the table row format. If the row format\nchanges, the checksum also changes. For example, the storage format for\nVARCHAR changed between MySQL 4.1 and 5.0, so if a 4.1 table is\nupgraded to MySQL 5.0, the checksum value may change.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/checksum-table.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/checksum-table.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (216,2,'NUMINTERIORRINGS','NumInteriorRings(poly)\n\nReturns the number of interior rings in the Polygon value poly.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT NumInteriorRings(GeomFromText(@poly));\n+---------------------------------------+\n| NumInteriorRings(GeomFromText(@poly)) |\n+---------------------------------------+\n|                                     1 |\n+---------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (217,2,'INTERIORRINGN','InteriorRingN(poly,N)\n\nReturns the N-th interior ring for the Polygon value poly as a\nLineString. Rings are numbered beginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(InteriorRingN(GeomFromText(@poly),1));\n+----------------------------------------------+\n| AsText(InteriorRingN(GeomFromText(@poly),1)) |\n+----------------------------------------------+\n| LINESTRING(1 1,1 2,2 2,2 1,1 1)              |\n+----------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (218,32,'UTC_TIME','Syntax:\nUTC_TIME, UTC_TIME([fsp])\n\nReturns the current UTC time as a value in \'HH:MM:SS\' or HHMMSS format,\ndepending on whether the function is used in a string or numeric\ncontext.\n\nAs of MySQL 5.6.4, if the fsp argument is given to specify a fractional\nseconds precision from 0 to 6, the return value includes a fractional\nseconds part of that many digits. Before 5.6.4, any argument is\nignored.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_TIME(), UTC_TIME() + 0;\n        -> \'18:07:53\', 180753.000000\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (219,14,'IS_IPV4_COMPAT','Syntax:\nIS_IPV4_COMPAT(expr)\n\nThis function takes an IPv6 address represented in numeric form as a\nbinary string, as returned by INET6_ATON(). It returns 1 if the\nargument is a valid IPv4-compatible IPv6 address, 0 otherwise.\nIPv4-compatible addresses have the form ::ipv4_address.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> SELECT IS_IPV4_COMPAT(INET6_ATON(\'::10.0.5.9\'));\n        -> 1\nmysql> SELECT IS_IPV4_COMPAT(INET6_ATON(\'::ffff:10.0.5.9\'));\n        -> 0\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (220,40,'DROP FUNCTION','The DROP FUNCTION statement is used to drop stored functions and\nuser-defined functions (UDFs):\n\no For information about dropping stored functions, see [HELP DROP\n  PROCEDURE].\n\no For information about dropping user-defined functions, see [HELP DROP\n  FUNCTION UDF].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-function.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-function.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (221,16,'STDDEV','Syntax:\nSTDDEV(expr)\n\nReturns the population standard deviation of expr. This function is\nprovided for compatibility with Oracle. The standard SQL function\nSTDDEV_POP() can be used instead.\n\nThis function returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (222,32,'PERIOD_ADD','Syntax:\nPERIOD_ADD(P,N)\n\nAdds N months to period P (in the format YYMM or YYYYMM). Returns a\nvalue in the format YYYYMM. Note that the period argument P is not a\ndate value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT PERIOD_ADD(200801,2);\n        -> 200803\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (223,38,'RIGHT','Syntax:\nRIGHT(str,len)\n\nReturns the rightmost len characters from the string str, or NULL if\nany argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT RIGHT(\'foobarbar\', 4);\n        -> \'rbar\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (224,40,'DROP TABLESPACE','Syntax:\nDROP TABLESPACE tablespace_name\n    ENGINE [=] engine_name\n\nThis statement drops a tablespace that was previously created using\nCREATE TABLESPACE (see [HELP CREATE TABLESPACE]).\n\n*Important*: The tablespace to be dropped must not contain any data\nfiles; in other words, before you can drop a tablespace, you must first\ndrop each of its data files using ALTER TABLESPACE ... DROP DATAFILE\n(see [HELP ALTER TABLESPACE]).\n\nThe ENGINE clause (required) specifies the storage engine used by the\ntablespace. Currently, the only accepted values for engine_name are NDB\nand NDBCLUSTER.\n\nDROP TABLESPACE is useful only with Disk Data storage for MySQL\nCluster. See\nhttp://dev.mysql.com/doc/refman/5.6/en/mysql-cluster-disk-data.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-tablespace.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-tablespace.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (225,21,'CHECK TABLE','Syntax:\nCHECK TABLE tbl_name [, tbl_name] ... [option] ...\n\noption = {FOR UPGRADE | QUICK | FAST | MEDIUM | EXTENDED | CHANGED}\n\nCHECK TABLE checks a table or tables for errors. CHECK TABLE works for\nInnoDB, MyISAM, ARCHIVE, and CSV tables. For MyISAM tables, the key\nstatistics are updated as well.\n\nTo check a table, you must have some privilege for it.\n\nCHECK TABLE can also check views for problems, such as tables that are\nreferenced in the view definition that no longer exist.\n\nCHECK TABLE is supported for partitioned tables, and you can use ALTER\nTABLE ... CHECK PARTITION to check one or more partitions; for more\ninformation, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.6/en/partitioning-maintenance.html.\n\nIn MySQL 5.6.11 only, gtid_next must be set to AUTOMATIC before issuing\nthis statement. (Bug #16062608, Bug #16715809, Bug #69045)\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/check-table.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/check-table.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (226,38,'BIN','Syntax:\nBIN(N)\n\nReturns a string representation of the binary value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,2). Returns\nNULL if N is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT BIN(12);\n        -> \'1100\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (227,25,'MULTILINESTRING','MultiLineString(ls1,ls2,...)\n\nConstructs a MultiLineString value using LineString or WKB LineString\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (228,27,'SHOW RELAYLOG EVENTS','Syntax:\nSHOW RELAYLOG EVENTS\n   [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\n\nShows the events in the relay log of a replication slave. If you do not\nspecify \'log_name\', the first relay log is displayed. This statement\nhas no effect on the master.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-relaylog-events.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-relaylog-events.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (229,3,'MPOINTFROMTEXT','MPointFromText(wkt[,srid]), MultiPointFromText(wkt[,srid])\n\nConstructs a MULTIPOINT value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (230,38,'SUBSTR','Syntax:\nSUBSTR(str,pos), SUBSTR(str FROM pos), SUBSTR(str,pos,len), SUBSTR(str\nFROM pos FOR len)\n\nSUBSTR() is a synonym for SUBSTRING().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (231,23,'CHAR','[NATIONAL] CHAR[(M)] [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA fixed-length string that is always right-padded with spaces to the\nspecified length when stored. M represents the column length in\ncharacters. The range of M is 0 to 255. If M is omitted, the length is\n1.\n\n*Note*: Trailing spaces are removed when CHAR values are retrieved\nunless the PAD_CHAR_TO_FULL_LENGTH SQL mode is enabled.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (232,16,'COUNT DISTINCT','Syntax:\nCOUNT(DISTINCT expr,[expr...])\n\nReturns a count of the number of rows with different non-NULL expr\nvalues.\n\nCOUNT(DISTINCT) returns 0 if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','mysql> SELECT COUNT(DISTINCT results) FROM student;\n','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (233,27,'SHOW CREATE VIEW','Syntax:\nSHOW CREATE VIEW view_name\n\nThis statement shows the CREATE VIEW statement that creates the named\nview.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-create-view.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-create-view.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (234,19,'INTERVAL','Syntax:\nINTERVAL(N,N1,N2,N3,...)\n\nReturns 0 if N < N1, 1 if N < N2 and so on or -1 if N is NULL. All\narguments are treated as integers. It is required that N1 < N2 < N3 <\n... < Nn for this function to work correctly. This is because a binary\nsearch is used (very fast).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT INTERVAL(23, 1, 15, 17, 30, 44, 200);\n        -> 3\nmysql> SELECT INTERVAL(10, 1, 10, 100, 1000);\n        -> 2\nmysql> SELECT INTERVAL(22, 23, 30, 44, 200);\n        -> 0\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (235,32,'FROM_DAYS','Syntax:\nFROM_DAYS(N)\n\nGiven a day number N, returns a DATE value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT FROM_DAYS(730669);\n        -> \'2007-07-03\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (236,40,'ALTER PROCEDURE','Syntax:\nALTER PROCEDURE proc_name [characteristic ...]\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nThis statement can be used to change the characteristics of a stored\nprocedure. More than one change may be specified in an ALTER PROCEDURE\nstatement. However, you cannot change the parameters or body of a\nstored procedure using this statement; to make such changes, you must\ndrop and re-create the procedure using DROP PROCEDURE and CREATE\nPROCEDURE.\n\nYou must have the ALTER ROUTINE privilege for the procedure. By\ndefault, that privilege is granted automatically to the procedure\ncreator. This behavior can be changed by disabling the\nautomatic_sp_privileges system variable. See\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-routines-privileges.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/alter-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/alter-procedure.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (237,20,'BIT_COUNT','Syntax:\nBIT_COUNT(N)\n\nReturns the number of bits that are set in the argument N.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html\n\n','mysql> SELECT BIT_COUNT(29), BIT_COUNT(b\'101010\');\n        -> 4, 3\n','http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (238,31,'ST_WITHIN','ST_Within(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially within g2. This\ntests the opposite relationship as ST_Contains().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (239,4,'ACOS','Syntax:\nACOS(X)\n\nReturns the arc cosine of X, that is, the value whose cosine is X.\nReturns NULL if X is not in the range -1 to 1.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT ACOS(1);\n        -> 0\nmysql> SELECT ACOS(1.0001);\n        -> NULL\nmysql> SELECT ACOS(0);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (240,8,'ISOLATION','Syntax:\nSET [GLOBAL | SESSION] TRANSACTION\n    transaction_characteristic [, transaction_characteristic] ...\n\ntransaction_characteristic:\n    ISOLATION LEVEL level\n  | READ WRITE\n  | READ ONLY\n\nlevel:\n     REPEATABLE READ\n   | READ COMMITTED\n   | READ UNCOMMITTED\n   | SERIALIZABLE\n\nThis statement specifies transaction characteristics. It takes a list\nof one or more characteristic values separated by commas. These\ncharacteristics set the transaction isolation level or access mode. The\nisolation level is used for operations on InnoDB tables. The access\nmode may be specified as of MySQL 5.6.5 and indicates whether\ntransactions operate in read/write or read-only mode.\n\nIn addition, SET TRANSACTION can include an optional GLOBAL or SESSION\nkeyword to indicate the scope of the statement.\n\nScope of Transaction Characteristics\n\nYou can set transaction characteristics globally, for the current\nsession, or for the next transaction:\n\no With the GLOBAL keyword, the statement applies globally for all\n  subsequent sessions. Existing sessions are unaffected.\n\no With the SESSION keyword, the statement applies to all subsequent\n  transactions performed within the current session.\n\no Without any SESSION or GLOBAL keyword, the statement applies to the\n  next (not started) transaction performed within the current session.\n\nA global change to transaction characteristics requires the SUPER\nprivilege. Any session is free to change its session characteristics\n(even in the middle of a transaction), or the characteristics for its\nnext transaction.\n\nSET TRANSACTION without GLOBAL or SESSION is not permitted while there\nis an active transaction:\n\nmysql> START TRANSACTION;\nQuery OK, 0 rows affected (0.02 sec)\n\nmysql> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;\nERROR 1568 (25001): Transaction characteristics can\'t be changed\nwhile a transaction is in progress\n\nTo set the global default isolation level at server startup, use the\n--transaction-isolation=level option to mysqld on the command line or\nin an option file. Values of level for this option use dashes rather\nthan spaces, so the permissible values are READ-UNCOMMITTED,\nREAD-COMMITTED, REPEATABLE-READ, or SERIALIZABLE. For example, to set\nthe default isolation level to REPEATABLE READ, use these lines in the\n[mysqld] section of an option file:\n\n[mysqld]\ntransaction-isolation = REPEATABLE-READ\n\nIt is possible to check or set the global and session transaction\nisolation levels at runtime by using the tx_isolation system variable:\n\nSELECT @@GLOBAL.tx_isolation, @@tx_isolation;\nSET GLOBAL tx_isolation=\'REPEATABLE-READ\';\nSET SESSION tx_isolation=\'SERIALIZABLE\';\n\nSimilarly, to set the transaction access mode at server startup or at\nruntime, use the --transaction-read-only option or tx_read_only system\nvariable. By default, these are OFF (the mode is read/write) but can be\nset to ON for a default mode of read only.\n\nSetting the global or session value of tx_isolation or tx_read_only is\nequivalent to setting the isolation level or access mode with SET\nGLOBAL TRANSACTION or SET SESSION TRANSACTION.\n\nDetails and Usage of Isolation Levels\n\nInnoDB supports each of the transaction isolation levels described here\nusing different locking strategies. You can enforce a high degree of\nconsistency with the default REPEATABLE READ level, for operations on\ncrucial data where ACID compliance is important. Or you can relax the\nconsistency rules with READ COMMITTED or even READ UNCOMMITTED, in\nsituations such as bulk reporting where precise consistency and\nrepeatable results are less important than minimizing the amount of\noverhead for locking. SERIALIZABLE enforces even stricter rules than\nREPEATABLE READ, and is used mainly in specialized situations, such as\nwith XA transactions and for troubleshooting issues with concurrency\nand deadlocks.\n\nFor full information about how these isolation levels work with InnoDB\ntransactions, see\nhttp://dev.mysql.com/doc/refman/5.6/en/innodb-transaction-model.html.\nIn particular, for additional information about InnoDB record-level\nlocks and how it uses them to execute various types of statements, see\nhttp://dev.mysql.com/doc/refman/5.6/en/innodb-record-level-locks.html\nand http://dev.mysql.com/doc/refman/5.6/en/innodb-locks-set.html.\n\nThe following list describes how MySQL supports the different\ntransaction levels. The list goes from the most commonly used level to\nthe least used.\n\no REPEATABLE READ\n\n  This is the default isolation level for InnoDB. For consistent reads,\n  there is an important difference from the READ COMMITTED isolation\n  level: All consistent reads within the same transaction read the\n  snapshot established by the first read. This convention means that if\n  you issue several plain (nonlocking) SELECT statements within the\n  same transaction, these SELECT statements are consistent also with\n  respect to each other. See\n  http://dev.mysql.com/doc/refman/5.6/en/innodb-consistent-read.html.\n\n  For locking reads (SELECT with FOR UPDATE or LOCK IN SHARE MODE),\n  UPDATE, and DELETE statements, locking depends on whether the\n  statement uses a unique index with a unique search condition, or a\n  range-type search condition. For a unique index with a unique search\n  condition, InnoDB locks only the index record found, not the gap\n  before it. For other search conditions, InnoDB locks the index range\n  scanned, using gap locks or next-key locks to block insertions by\n  other sessions into the gaps covered by the range.\n\no READ COMMITTED\n\n  A somewhat Oracle-like isolation level with respect to consistent\n  (nonlocking) reads: Each consistent read, even within the same\n  transaction, sets and reads its own fresh snapshot. See\n  http://dev.mysql.com/doc/refman/5.6/en/innodb-consistent-read.html.\n\n  For locking reads (SELECT with FOR UPDATE or LOCK IN SHARE MODE),\n  UPDATE statements, and DELETE statements, InnoDB locks only index\n  records, not the gaps before them, and thus permits the free\n  insertion of new records next to locked records.\n\n  *Note*: In MySQL 5.6, when READ COMMITTED isolation level is used, or\n  the deprecated innodb_locks_unsafe_for_binlog system variable is\n  enabled, there is no InnoDB gap locking except for foreign-key\n  constraint checking and duplicate-key checking. Also, record locks\n  for nonmatching rows are released after MySQL has evaluated the WHERE\n  condition. If you use READ COMMITTED or enable\n  innodb_locks_unsafe_for_binlog, you must use row-based binary\n  logging.\n\no READ UNCOMMITTED\n\n  SELECT statements are performed in a nonlocking fashion, but a\n  possible earlier version of a row might be used. Thus, using this\n  isolation level, such reads are not consistent. This is also called a\n  dirty read. Otherwise, this isolation level works like READ\n  COMMITTED.\n\no SERIALIZABLE\n\n  This level is like REPEATABLE READ, but InnoDB implicitly converts\n  all plain SELECT statements to SELECT ... LOCK IN SHARE MODE if\n  autocommit is disabled. If autocommit is enabled, the SELECT is its\n  own transaction. It therefore is known to be read only and can be\n  serialized if performed as a consistent (nonlocking) read and need\n  not block for other transactions. (To force a plain SELECT to block\n  if other transactions have modified the selected rows, disable\n  autocommit.)\n\nTransaction Access Mode\n\nAs of MySQL 5.6.5, the transaction access mode may be specified with\nSET TRANSACTION. By default, a transaction takes place in read/write\nmode, with both reads and writes permitted to tables used in the\ntransaction. This mode may be specified explicitly using an access mode\nof READ WRITE.\n\nIf the transaction access mode is set to READ ONLY, changes to tables\nare prohibited. This may enable storage engines to make performance\nimprovements that are possible when writes are not permitted.\n\nIt is not permitted to specify both READ WRITE and READ ONLY in the\nsame statement.\n\nIn read-only mode, it remains possible to change tables created with\nthe TEMPORARY keyword using DML statements. Changes made with DDL\nstatements are not permitted, just as with permanent tables.\n\nThe READ WRITE and READ ONLY access modes also may be specified for an\nindividual transaction using the START TRANSACTION statement.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/set-transaction.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/set-transaction.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (241,4,'SIN','Syntax:\nSIN(X)\n\nReturns the sine of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT SIN(PI());\n        -> 1.2246063538224e-16\nmysql> SELECT ROUND(SIN(PI()));\n        -> 0\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (242,26,'BUFFER','Buffer(g,d)\n\nReturns a geometry that represents all points whose distance from the\ngeometry value g is less than or equal to a distance of d.\n\nBuffer() supports negative distances for polygons, multipolygons, and\ngeometry collections containing polygons or multipolygons. For point,\nmultipoint, linestring, multilinestring, and geometry collections not\ncontaining any polygons or multipolygons, Buffer() with a negative\ndistance returns NULL.\n\nPrior to MySQL 5.6.1, this function is unimplemented.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-that-create-new-geometries-from-existing-ones.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-that-create-new-geometries-from-existing-ones.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (243,19,'IS','Syntax:\nIS boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;\n        -> 1, 1, 1\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (244,32,'GET_FORMAT','Syntax:\nGET_FORMAT({DATE|TIME|DATETIME}, {\'EUR\'|\'USA\'|\'JIS\'|\'ISO\'|\'INTERNAL\'})\n\nReturns a format string. This function is useful in combination with\nthe DATE_FORMAT() and the STR_TO_DATE() functions.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT DATE_FORMAT(\'2003-10-03\',GET_FORMAT(DATE,\'EUR\'));\n        -> \'03.10.2003\'\nmysql> SELECT STR_TO_DATE(\'10.31.2003\',GET_FORMAT(DATE,\'USA\'));\n        -> \'2003-10-31\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (245,23,'TINYBLOB','TINYBLOB\n\nA BLOB column with a maximum length of 255 (28 - 1) bytes. Each\nTINYBLOB value is stored using a 1-byte length prefix that indicates\nthe number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (246,17,'USER','Syntax:\nUSER()\n\nReturns the current MySQL user name and host name as a string in the\nutf8 character set.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\n','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (247,21,'REPAIR TABLE','Syntax:\nREPAIR [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n    [QUICK] [EXTENDED] [USE_FRM]\n\nREPAIR TABLE repairs a possibly corrupted table, for certain storage\nengines only. By default, it has the same effect as myisamchk --recover\ntbl_name.\n\n*Note*: REPAIR TABLE only applies to MyISAM, ARCHIVE, and CSV tables.\nSee http://dev.mysql.com/doc/refman/5.6/en/myisam-storage-engine.html,\nand http://dev.mysql.com/doc/refman/5.6/en/archive-storage-engine.html,\nand http://dev.mysql.com/doc/refman/5.6/en/csv-storage-engine.html\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nREPAIR TABLE is supported for partitioned tables. However, the USE_FRM\noption cannot be used with this statement on a partitioned table.\n\nIn MySQL 5.6.11 only, gtid_next must be set to AUTOMATIC before issuing\nthis statement. (Bug #16062608, Bug #16715809, Bug #69045)\n\nYou can use ALTER TABLE ... REPAIR PARTITION to repair one or more\npartitions; for more information, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.6/en/partitioning-maintenance.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/repair-table.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/repair-table.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (248,18,'MERGE','The MERGE storage engine, also known as the MRG_MyISAM engine, is a\ncollection of identical MyISAM tables that can be used as one.\n"Identical" means that all tables have identical column and index\ninformation. You cannot merge MyISAM tables in which the columns are\nlisted in a different order, do not have exactly the same columns, or\nhave the indexes in different order. However, any or all of the MyISAM\ntables can be compressed with myisampack. See\nhttp://dev.mysql.com/doc/refman/5.6/en/myisampack.html. Differences in\ntable options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS do not\nmatter.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/merge-storage-engine.html\n\n','mysql> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> INSERT INTO t1 (message) VALUES (\'Testing\'),(\'table\'),(\'t1\');\nmysql> INSERT INTO t2 (message) VALUES (\'Testing\'),(\'table\'),(\'t2\');\nmysql> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;\n','http://dev.mysql.com/doc/refman/5.6/en/merge-storage-engine.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (249,40,'CREATE TABLE','Syntax:\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    (create_definition,...)\n    [table_options]\n    [partition_options]\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    [(create_definition,...)]\n    [table_options]\n    [partition_options]\n    select_statement\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    { LIKE old_tbl_name | (LIKE old_tbl_name) }\n\ncreate_definition:\n    col_name column_definition\n  | [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name,...)\n      [index_option] ...\n  | {INDEX|KEY} [index_name] [index_type] (index_col_name,...)\n      [index_option] ...\n  | [CONSTRAINT [symbol]] UNIQUE [INDEX|KEY]\n      [index_name] [index_type] (index_col_name,...)\n      [index_option] ...\n  | {FULLTEXT|SPATIAL} [INDEX|KEY] [index_name] (index_col_name,...)\n      [index_option] ...\n  | [CONSTRAINT [symbol]] FOREIGN KEY\n      [index_name] (index_col_name,...) reference_definition\n  | CHECK (expr)\n\ncolumn_definition:\n    data_type [NOT NULL | NULL] [DEFAULT default_value]\n      [AUTO_INCREMENT] [UNIQUE [KEY] | [PRIMARY] KEY]\n      [COMMENT \'string\']\n      [COLUMN_FORMAT {FIXED|DYNAMIC|DEFAULT}]\n      [STORAGE {DISK|MEMORY|DEFAULT}]\n      [reference_definition]\n\ndata_type:\n    BIT[(length)]\n  | TINYINT[(length)] [UNSIGNED] [ZEROFILL]\n  | SMALLINT[(length)] [UNSIGNED] [ZEROFILL]\n  | MEDIUMINT[(length)] [UNSIGNED] [ZEROFILL]\n  | INT[(length)] [UNSIGNED] [ZEROFILL]\n  | INTEGER[(length)] [UNSIGNED] [ZEROFILL]\n  | BIGINT[(length)] [UNSIGNED] [ZEROFILL]\n  | REAL[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DOUBLE[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | FLOAT[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DECIMAL[(length[,decimals])] [UNSIGNED] [ZEROFILL]\n  | NUMERIC[(length[,decimals])] [UNSIGNED] [ZEROFILL]\n  | DATE\n  | TIME\n  | TIMESTAMP\n  | DATETIME\n  | YEAR\n  | CHAR[(length)]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | VARCHAR(length)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | BINARY[(length)]\n  | VARBINARY(length)\n  | TINYBLOB\n  | BLOB\n  | MEDIUMBLOB\n  | LONGBLOB\n  | TINYTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | TEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | MEDIUMTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | LONGTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | ENUM(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | SET(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | spatial_type\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\nreference_definition:\n    REFERENCES tbl_name (index_col_name,...)\n      [MATCH FULL | MATCH PARTIAL | MATCH SIMPLE]\n      [ON DELETE reference_option]\n      [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION\n\ntable_options:\n    table_option [[,] table_option] ...\n\ntable_option:\n    ENGINE [=] engine_name\n  | AUTO_INCREMENT [=] value\n  | AVG_ROW_LENGTH [=] value\n  | [DEFAULT] CHARACTER SET [=] charset_name\n  | CHECKSUM [=] {0 | 1}\n  | [DEFAULT] COLLATE [=] collation_name\n  | COMMENT [=] \'string\'\n  | CONNECTION [=] \'connect_string\'\n  | DATA DIRECTORY [=] \'absolute path to directory\'\n  | DELAY_KEY_WRITE [=] {0 | 1}\n  | INDEX DIRECTORY [=] \'absolute path to directory\'\n  | INSERT_METHOD [=] { NO | FIRST | LAST }\n  | KEY_BLOCK_SIZE [=] value\n  | MAX_ROWS [=] value\n  | MIN_ROWS [=] value\n  | PACK_KEYS [=] {0 | 1 | DEFAULT}\n  | PASSWORD [=] \'string\'\n  | ROW_FORMAT [=] {DEFAULT|DYNAMIC|FIXED|COMPRESSED|REDUNDANT|COMPACT}\n  | STATS_AUTO_RECALC [=] {DEFAULT|0|1}\n  | STATS_PERSISTENT [=] {DEFAULT|0|1}\n  | STATS_SAMPLE_PAGES [=] value\n  | TABLESPACE tablespace_name [STORAGE {DISK|MEMORY|DEFAULT}]\n  | UNION [=] (tbl_name[,tbl_name]...)\n\npartition_options:\n    PARTITION BY\n        { [LINEAR] HASH(expr)\n        | [LINEAR] KEY [ALGORITHM={1|2}] (column_list)\n        | RANGE{(expr) | COLUMNS(column_list)}\n        | LIST{(expr) | COLUMNS(column_list)} }\n    [PARTITIONS num]\n    [SUBPARTITION BY\n        { [LINEAR] HASH(expr)\n        | [LINEAR] KEY [ALGORITHM={1|2}] (column_list) }\n      [SUBPARTITIONS num]\n    ]\n    [(partition_definition [, partition_definition] ...)]\n\npartition_definition:\n    PARTITION partition_name\n        [VALUES \n            {LESS THAN {(expr | value_list) | MAXVALUE} \n            | \n            IN (value_list)}]\n        [[STORAGE] ENGINE [=] engine_name]\n        [COMMENT [=] \'comment_text\' ]\n        [DATA DIRECTORY [=] \'data_dir\']\n        [INDEX DIRECTORY [=] \'index_dir\']\n        [MAX_ROWS [=] max_number_of_rows]\n        [MIN_ROWS [=] min_number_of_rows]\n        [TABLESPACE [=] tablespace_name]\n        [NODEGROUP [=] node_group_id]\n        [(subpartition_definition [, subpartition_definition] ...)]\n\nsubpartition_definition:\n    SUBPARTITION logical_name\n        [[STORAGE] ENGINE [=] engine_name]\n        [COMMENT [=] \'comment_text\' ]\n        [DATA DIRECTORY [=] \'data_dir\']\n        [INDEX DIRECTORY [=] \'index_dir\']\n        [MAX_ROWS [=] max_number_of_rows]\n        [MIN_ROWS [=] min_number_of_rows]\n        [TABLESPACE [=] tablespace_name]\n        [NODEGROUP [=] node_group_id]\n\nselect_statement:\n    [IGNORE | REPLACE] [AS] SELECT ...   (Some valid select statement)\n\nCREATE TABLE creates a table with the given name. You must have the\nCREATE privilege for the table.\n\nRules for permissible table names are given in\nhttp://dev.mysql.com/doc/refman/5.6/en/identifiers.html. By default,\nthe table is created in the default database, using the InnoDB storage\nengine. An error occurs if the table exists, if there is no default\ndatabase, or if the database does not exist.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-table.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/create-table.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (250,32,'MICROSECOND','Syntax:\nMICROSECOND(expr)\n\nReturns the microseconds from the time or datetime expression expr as a\nnumber in the range from 0 to 999999.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT MICROSECOND(\'12:00:00.123456\');\n        -> 123456\nmysql> SELECT MICROSECOND(\'2009-12-31 23:59:59.000010\');\n        -> 10\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (251,40,'CREATE SERVER','Syntax:\nCREATE SERVER server_name\n    FOREIGN DATA WRAPPER wrapper_name\n    OPTIONS (option [, option] ...)\n\noption:\n  { HOST character-literal\n  | DATABASE character-literal\n  | USER character-literal\n  | PASSWORD character-literal\n  | SOCKET character-literal\n  | OWNER character-literal\n  | PORT numeric-literal }\n\nThis statement creates the definition of a server for use with the\nFEDERATED storage engine. The CREATE SERVER statement creates a new row\nin the servers table in the mysql database. This statement requires the\nSUPER privilege.\n\nThe server_name should be a unique reference to the server. Server\ndefinitions are global within the scope of the server, it is not\npossible to qualify the server definition to a specific database.\nserver_name has a maximum length of 64 characters (names longer than 64\ncharacters are silently truncated), and is case insensitive. You may\nspecify the name as a quoted string.\n\nThe wrapper_name should be mysql, and may be quoted with single\nquotation marks. Other values for wrapper_name are not currently\nsupported.\n\nFor each option you must specify either a character literal or numeric\nliteral. Character literals are UTF-8, support a maximum length of 64\ncharacters and default to a blank (empty) string. String literals are\nsilently truncated to 64 characters. Numeric literals must be a number\nbetween 0 and 9999, default value is 0.\n\n*Note*: The OWNER option is currently not applied, and has no effect on\nthe ownership or operation of the server connection that is created.\n\nThe CREATE SERVER statement creates an entry in the mysql.servers table\nthat can later be used with the CREATE TABLE statement when creating a\nFEDERATED table. The options that you specify will be used to populate\nthe columns in the mysql.servers table. The table columns are\nServer_name, Host, Db, Username, Password, Port and Socket.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-server.html\n\n','CREATE SERVER s\nFOREIGN DATA WRAPPER mysql\nOPTIONS (USER \'Remote\', HOST \'192.168.1.106\', DATABASE \'test\');\n','http://dev.mysql.com/doc/refman/5.6/en/create-server.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (252,32,'MAKETIME','Syntax:\nMAKETIME(hour,minute,second)\n\nReturns a time value calculated from the hour, minute, and second\narguments.\n\nAs of MySQL 5.6.4, the second argument can have a fractional part.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT MAKETIME(12,15,30);\n        -> \'12:15:30\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (253,32,'CURDATE','Syntax:\nCURDATE()\n\nReturns the current date as a value in \'YYYY-MM-DD\' or YYYYMMDD format,\ndepending on whether the function is used in a string or numeric\ncontext.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT CURDATE();\n        -> \'2008-06-13\'\nmysql> SELECT CURDATE() + 0;\n        -> 20080613\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (254,10,'SET PASSWORD','Syntax:\nSET PASSWORD [FOR user] =\n    {\n        PASSWORD(\'cleartext password\')\n      | OLD_PASSWORD(\'cleartext password\')\n      | \'encrypted password\'\n    }\n\nThe SET PASSWORD statement assigns a password to a MySQL user account:\n\no With no FOR user clause, this statement sets the password for the\n  current user:\n\nSET PASSWORD = PASSWORD(\'cleartext password\');\n\n  Any client who connects to the server using a nonanonymous account\n  can change the password for that account. To see which account the\n  server authenticated you for, invoke the CURRENT_USER() function:\n\nSELECT CURRENT_USER();\n\no With a FOR user clause, this statement sets the password for the\n  named account, which must exist:\n\nSET PASSWORD FOR \'jeffrey\'@\'localhost\' = PASSWORD(\'cleartext password\');\n\n  In this case, you must have the UPDATE privilege for the mysql\n  database.\n\nWhen the read_only system variable is enabled, SET PASSWORD requires\nthe SUPER privilege, in addition to any other required privileges.\n\nIf a FOR user clause is given, the account name uses the format\ndescribed in http://dev.mysql.com/doc/refman/5.6/en/account-names.html.\nThe user value should be given as \'user_name\'@\'host_name\', where\n\'user_name\' and \'host_name\' are exactly as listed in the User and Host\ncolumns of the account\'s mysql.user table row. (If you specify only a\nuser name, a host name of \'%\' is used.) For example, to set the\npassword for an account with User and Host column values of \'bob\' and\n\'%.example.org\', write the statement like this:\n\nSET PASSWORD FOR \'bob\'@\'%.example.org\' = PASSWORD(\'cleartext password\');\n\nThe password can be specified in these ways:\n\no Using the PASSWORD() function\n\n  The function argument is the cleartext (unencrypted) password.\n  PASSWORD() hashes the password and returns the encrypted password\n  string.\n\n  The old_passwords system variable value determines the hashing method\n  used by PASSWORD(). If SET PASSWORD rejects the password as not being\n  in the correct format, it may be necessary to change old_passwords to\n  change the hashing method. For example, if the account uses the\n  mysql_native_password plugin, the old_passwords value must be 0:\n\nSET old_passwords = 0;\nSET PASSWORD FOR \'jeffrey\'@\'localhost\' = PASSWORD(\'mypass\');\n\n  If the old_passwords value differs from that required by the\n  authentication plugin, hashed password values returned by PASSWORD()\n  are not acceptable for that plugin and attempts to set the password\n  produce an error. For example:\n\nmysql> SET old_passwords = 1;\nmysql> SET PASSWORD FOR \'jeffrey\'@\'localhost\' = PASSWORD(\'mypass\');\nERROR 1372 (HY000): Password hash should be a 41-digit hexadecimal number\n\no Using the OLD_PASSWORD() function:\n\n  The function argument is the cleartext (unencrypted) password.\n  OLD_PASSWORD() hashes the password using pre-4.1 hashing and returns\n  the encrypted password string. This hashing method is appropriate\n  only for accounts that use the mysql_old_password authentication\n  plugin.\n\no Using an already encrypted password string\n\n  The password is specified as a string literal. It must represent the\n  already encrypted password value, in the hash format required by the\n  authentication method used for the account.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/set-password.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/set-password.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (255,17,'DATABASE','Syntax:\nDATABASE()\n\nReturns the default (current) database name as a string in the utf8\ncharacter set. If there is no default database, DATABASE() returns\nNULL. Within a stored routine, the default database is the database\nthat the routine is associated with, which is not necessarily the same\nas the database that is the default in the calling context.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','mysql> SELECT DATABASE();\n        -> \'test\'\n','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (256,7,'IF FUNCTION','Syntax:\nIF(expr1,expr2,expr3)\n\nIf expr1 is TRUE (expr1 <> 0 and expr1 <> NULL) then IF() returns\nexpr2; otherwise it returns expr3. IF() returns a numeric or string\nvalue, depending on the context in which it is used.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/control-flow-functions.html\n\n','mysql> SELECT IF(1>2,2,3);\n        -> 3\nmysql> SELECT IF(1<2,\'yes\',\'no\');\n        -> \'yes\'\nmysql> SELECT IF(STRCMP(\'test\',\'test1\'),\'no\',\'yes\');\n        -> \'no\'\n','http://dev.mysql.com/doc/refman/5.6/en/control-flow-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (257,33,'POINTFROMWKB','PointFromWKB(wkb[,srid])\n\nConstructs a POINT value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (258,4,'POWER','Syntax:\nPOWER(X,Y)\n\nThis is a synonym for POW().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (259,4,'ATAN','Syntax:\nATAN(X)\n\nReturns the arc tangent of X, that is, the value whose tangent is X.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT ATAN(2);\n        -> 1.1071487177941\nmysql> SELECT ATAN(-2);\n        -> -1.1071487177941\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (260,27,'SHOW PROFILE','Syntax:\nSHOW PROFILE [type [, type] ... ]\n    [FOR QUERY n]\n    [LIMIT row_count [OFFSET offset]]\n\ntype:\n    ALL\n  | BLOCK IO\n  | CONTEXT SWITCHES\n  | CPU\n  | IPC\n  | MEMORY\n  | PAGE FAULTS\n  | SOURCE\n  | SWAPS\n\nThe SHOW PROFILE and SHOW PROFILES statements display profiling\ninformation that indicates resource usage for statements executed\nduring the course of the current session.\n\n*Note*: These statements are deprecated as of MySQL 5.6.7 and will be\nremoved in a future MySQL release. Use the Performance Schema instead;\nsee http://dev.mysql.com/doc/refman/5.6/en/performance-schema.html.\n\nProfiling is controlled by the profiling session variable, which has a\ndefault value of 0 (OFF). Profiling is enabled by setting profiling to\n1 or ON:\n\nmysql> SET profiling = 1;\n\nSHOW PROFILES displays a list of the most recent statements sent to the\nserver. The size of the list is controlled by the\nprofiling_history_size session variable, which has a default value of\n15. The maximum value is 100. Setting the value to 0 has the practical\neffect of disabling profiling.\n\nAll statements are profiled except SHOW PROFILE and SHOW PROFILES, so\nyou will find neither of those statements in the profile list.\nMalformed statements are profiled. For example, SHOW PROFILING is an\nillegal statement, and a syntax error occurs if you try to execute it,\nbut it will show up in the profiling list.\n\nSHOW PROFILE displays detailed information about a single statement.\nWithout the FOR QUERY n clause, the output pertains to the most\nrecently executed statement. If FOR QUERY n is included, SHOW PROFILE\ndisplays information for statement n. The values of n correspond to the\nQuery_ID values displayed by SHOW PROFILES.\n\nThe LIMIT row_count clause may be given to limit the output to\nrow_count rows. If LIMIT is given, OFFSET offset may be added to begin\nthe output offset rows into the full set of rows.\n\nBy default, SHOW PROFILE displays Status and Duration columns. The\nStatus values are like the State values displayed by SHOW PROCESSLIST,\nalthough there might be some minor differences in interpretion for the\ntwo statements for some status values (see\nhttp://dev.mysql.com/doc/refman/5.6/en/thread-information.html).\n\nOptional type values may be specified to display specific additional\ntypes of information:\n\no ALL displays all information\n\no BLOCK IO displays counts for block input and output operations\n\no CONTEXT SWITCHES displays counts for voluntary and involuntary\n  context switches\n\no CPU displays user and system CPU usage times\n\no IPC displays counts for messages sent and received\n\no MEMORY is not currently implemented\n\no PAGE FAULTS displays counts for major and minor page faults\n\no SOURCE displays the names of functions from the source code, together\n  with the name and line number of the file in which the function\n  occurs\n\no SWAPS displays swap counts\n\nProfiling is enabled per session. When a session ends, its profiling\ninformation is lost.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-profile.html\n\n','mysql> SELECT @@profiling;\n+-------------+\n| @@profiling |\n+-------------+\n|           0 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> SET profiling = 1;\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> DROP TABLE IF EXISTS t1;\nQuery OK, 0 rows affected, 1 warning (0.00 sec)\n\nmysql> CREATE TABLE T1 (id INT);\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SHOW PROFILES;\n+----------+----------+--------------------------+\n| Query_ID | Duration | Query                    |\n+----------+----------+--------------------------+\n|        0 | 0.000088 | SET PROFILING = 1        |\n|        1 | 0.000136 | DROP TABLE IF EXISTS t1  |\n|        2 | 0.011947 | CREATE TABLE t1 (id INT) |\n+----------+----------+--------------------------+\n3 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE;\n+----------------------+----------+\n| Status               | Duration |\n+----------------------+----------+\n| checking permissions | 0.000040 |\n| creating table       | 0.000056 |\n| After create         | 0.011363 |\n| query end            | 0.000375 |\n| freeing items        | 0.000089 |\n| logging slow query   | 0.000019 |\n| cleaning up          | 0.000005 |\n+----------------------+----------+\n7 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE FOR QUERY 1;\n+--------------------+----------+\n| Status             | Duration |\n+--------------------+----------+\n| query end          | 0.000107 |\n| freeing items      | 0.000008 |\n| logging slow query | 0.000015 |\n| cleaning up        | 0.000006 |\n+--------------------+----------+\n4 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE CPU FOR QUERY 2;\n+----------------------+----------+----------+------------+\n| Status               | Duration | CPU_user | CPU_system |\n+----------------------+----------+----------+------------+\n| checking permissions | 0.000040 | 0.000038 |   0.000002 |\n| creating table       | 0.000056 | 0.000028 |   0.000028 |\n| After create         | 0.011363 | 0.000217 |   0.001571 |\n| query end            | 0.000375 | 0.000013 |   0.000028 |\n| freeing items        | 0.000089 | 0.000010 |   0.000014 |\n| logging slow query   | 0.000019 | 0.000009 |   0.000010 |\n| cleaning up          | 0.000005 | 0.000003 |   0.000002 |\n+----------------------+----------+----------+------------+\n7 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.6/en/show-profile.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (261,4,'LN','Syntax:\nLN(X)\n\nReturns the natural logarithm of X; that is, the base-e logarithm of X.\nIf X is less than or equal to 0, then NULL is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT LN(2);\n        -> 0.69314718055995\nmysql> SELECT LN(-2);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (262,24,'RETURN','Syntax:\nRETURN expr\n\nThe RETURN statement terminates execution of a stored function and\nreturns the value expr to the function caller. There must be at least\none RETURN statement in a stored function. There may be more than one\nif the function has multiple exit points.\n\nThis statement is not used in stored procedures, triggers, or events.\nThe LEAVE statement can be used to exit a stored program of those\ntypes.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/return.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/return.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (263,8,'SET SQL_LOG_BIN','Syntax:\nSET sql_log_bin = {0|1}\n\nThe sql_log_bin variable controls whether logging to the binary log is\ndone. The default value is 1 (do logging). To change logging for the\ncurrent session, change the session value of this variable. The session\nuser must have the SUPER privilege to set this variable.\n\nIn MySQL 5.6, it is not possible to set @@session.sql_log_bin within a\ntransaction or subquery. (Bug #53437)\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/set-sql-log-bin.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/set-sql-log-bin.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (264,12,'AES_DECRYPT','Syntax:\nAES_DECRYPT(crypt_str,key_str[,init_vector])\n\nThis function decrypts data using the official AES (Advanced Encryption\nStandard) algorithm. For more information, see the description of\nAES_ENCRYPT().\n\nThe optional initialization vector argument, init_vector, is available\nas of MySQL 5.6.17. As of that version, statements that use\nAES_DECRYPT() are unsafe for statement-based replication and cannot be\nstored in the query cache.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (265,17,'COERCIBILITY','Syntax:\nCOERCIBILITY(str)\n\nReturns the collation coercibility value of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','mysql> SELECT COERCIBILITY(\'abc\' COLLATE latin1_swedish_ci);\n        -> 0\nmysql> SELECT COERCIBILITY(USER());\n        -> 3\nmysql> SELECT COERCIBILITY(\'abc\');\n        -> 4\n','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (266,23,'INT','INT[(M)] [UNSIGNED] [ZEROFILL]\n\nA normal-size integer. The signed range is -2147483648 to 2147483647.\nThe unsigned range is 0 to 4294967295.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (267,13,'GLENGTH','GLength(ls)\n\nReturns as a double-precision number the length of the LineString value\nls in its associated spatial reference.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT GLength(GeomFromText(@ls));\n+----------------------------+\n| GLength(GeomFromText(@ls)) |\n+----------------------------+\n|            2.8284271247462 |\n+----------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (268,38,'MAKE_SET','Syntax:\nMAKE_SET(bits,str1,str2,...)\n\nReturns a set value (a string containing substrings separated by ","\ncharacters) consisting of the strings that have the corresponding bit\nin bits set. str1 corresponds to bit 0, str2 to bit 1, and so on. NULL\nvalues in str1, str2, ... are not appended to the result.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT MAKE_SET(1,\'a\',\'b\',\'c\');\n        -> \'a\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',\'world\');\n        -> \'hello,world\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',NULL,\'world\');\n        -> \'hello\'\nmysql> SELECT MAKE_SET(0,\'a\',\'b\',\'c\');\n        -> \'\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (269,38,'FIND_IN_SET','Syntax:\nFIND_IN_SET(str,strlist)\n\nReturns a value in the range of 1 to N if the string str is in the\nstring list strlist consisting of N substrings. A string list is a\nstring composed of substrings separated by "," characters. If the first\nargument is a constant string and the second is a column of type SET,\nthe FIND_IN_SET() function is optimized to use bit arithmetic. Returns\n0 if str is not in strlist or if strlist is the empty string. Returns\nNULL if either argument is NULL. This function does not work properly\nif the first argument contains a comma (",") character.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT FIND_IN_SET(\'b\',\'a,b,c,d\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (270,16,'MIN','Syntax:\nMIN([DISTINCT] expr)\n\nReturns the minimum value of expr. MIN() may take a string argument; in\nsuch cases, it returns the minimum string value. See\nhttp://dev.mysql.com/doc/refman/5.6/en/mysql-indexes.html. The DISTINCT\nkeyword can be used to find the minimum of the distinct values of expr,\nhowever, this produces the same result as omitting DISTINCT.\n\nMIN() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (271,28,'REPLACE','Syntax:\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    [PARTITION (partition_name,...)] \n    [(col_name,...)]\n    {VALUES | VALUE} ({expr | DEFAULT},...),(...),...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    [PARTITION (partition_name,...)] \n    SET col_name={expr | DEFAULT}, ...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    [PARTITION (partition_name,...)]  \n    [(col_name,...)]\n    SELECT ...\n\nREPLACE works exactly like INSERT, except that if an old row in the\ntable has the same value as a new row for a PRIMARY KEY or a UNIQUE\nindex, the old row is deleted before the new row is inserted. See [HELP\nINSERT].\n\nREPLACE is a MySQL extension to the SQL standard. It either inserts, or\ndeletes and inserts. For another MySQL extension to standard SQL---that\neither inserts or updates---see\nhttp://dev.mysql.com/doc/refman/5.6/en/insert-on-duplicate.html.\n\nNote that unless the table has a PRIMARY KEY or UNIQUE index, using a\nREPLACE statement makes no sense. It becomes equivalent to INSERT,\nbecause there is no index to be used to determine whether a new row\nduplicates another.\n\nValues for all columns are taken from the values specified in the\nREPLACE statement. Any missing columns are set to their default values,\njust as happens for INSERT. You cannot refer to values from the current\nrow and use them in the new row. If you use an assignment such as SET\ncol_name = col_name + 1, the reference to the column name on the right\nhand side is treated as DEFAULT(col_name), so the assignment is\nequivalent to SET col_name = DEFAULT(col_name) + 1.\n\nTo use REPLACE, you must have both the INSERT and DELETE privileges for\nthe table.\n\nBeginning with MySQL 5.6.2, REPLACE supports explicit partition\nselection using the PARTITION option with a comma-separated list of\nnames of partitions, subpartitions, or both. As with INSERT, if it is\nnot possible to insert the new row into any of these partitions or\nsubpartitions, the REPLACE statement fails with the error Found a row\nnot matching the given partition set. See\nhttp://dev.mysql.com/doc/refman/5.6/en/partitioning-selection.html, for\nmore information.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/replace.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/replace.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (272,32,'CURRENT_TIMESTAMP','Syntax:\nCURRENT_TIMESTAMP, CURRENT_TIMESTAMP([fsp])\n\nCURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (273,17,'GTID_SUBSET','Syntax:\nGTID_SUBSET(subset,set)\n\nGiven two sets of global transaction IDs subset and set, returns true\n(1) if all GTIDs in subset are also in set. Returns false (0)\notherwise.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/gtid-functions.html\n\n','mysql> SELECT GTID_SUBSET(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:23\', \n    ->     \'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\')\\G\n*************************** 1. row ***************************\nGTID_SUBSET(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:23\', \n    \'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\'): 1\n1 row in set (0.00 sec)\n\nmysql> SELECT GTID_SUBSET(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:23-25\', \n    ->     \'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\')\\G\n*************************** 1. row ***************************\nGTID_SUBSET(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:23-25\', \n    \'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\'): 1\n1 row in set (0.00 sec)\n\nmysql> SELECT GTID_SUBSET(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:20-25\', \n    ->     \'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\')\\G\n*************************** 1. row ***************************\nGTID_SUBSET(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:20-25\', \n    \'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\'): 0\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.6/en/gtid-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (274,16,'VAR_SAMP','Syntax:\nVAR_SAMP(expr)\n\nReturns the sample variance of expr. That is, the denominator is the\nnumber of rows minus one.\n\nVAR_SAMP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (275,23,'DATETIME','DATETIME[(fsp)]\n\nA date and time combination. The supported range is \'1000-01-01\n00:00:00.000000\' to \'9999-12-31 23:59:59.999999\'. MySQL displays\nDATETIME values in \'YYYY-MM-DD HH:MM:SS[.fraction]\' format, but permits\nassignment of values to DATETIME columns using either strings or\nnumbers.\n\nAs of MySQL 5.6.4, an optional fsp value in the range from 0 to 6 may\nbe given to specify fractional seconds precision. A value of 0\nsignifies that there is no fractional part. If omitted, the default\nprecision is 0.\n\nAs of MySQL 5.6.5, automatic initialization and updating to the current\ndate and time for DATETIME columns can be specified using DEFAULT and\nON UPDATE column definition clauses, as described in\nhttp://dev.mysql.com/doc/refman/5.6/en/timestamp-initialization.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (276,23,'INTEGER','INTEGER[(M)] [UNSIGNED] [ZEROFILL]\n\nThis type is a synonym for INT.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (277,27,'SHOW COLUMNS','Syntax:\nSHOW [FULL] COLUMNS {FROM | IN} tbl_name [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW COLUMNS displays information about the columns in a given table.\nIt also works for views. The LIKE clause, if present, indicates which\ncolumn names to match. The WHERE clause can be given to select rows\nusing more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html.\n\nSHOW COLUMNS displays information only for those columns for which you\nhave some privilege.\n\nmysql> SHOW COLUMNS FROM City;\n+------------+----------+------+-----+---------+----------------+\n| Field      | Type     | Null | Key | Default | Extra          |\n+------------+----------+------+-----+---------+----------------+\n| Id         | int(11)  | NO   | PRI | NULL    | auto_increment |\n| Name       | char(35) | NO   |     |         |                |\n| Country    | char(3)  | NO   | UNI |         |                |\n| District   | char(20) | YES  | MUL |         |                |\n| Population | int(11)  | NO   |     | 0       |                |\n+------------+----------+------+-----+---------+----------------+\n5 rows in set (0.00 sec)\n\nIf the data types differ from what you expect them to be based on a\nCREATE TABLE statement, note that MySQL sometimes changes data types\nwhen you create or alter a table. The conditions under which this\noccurs are described in\nhttp://dev.mysql.com/doc/refman/5.6/en/silent-column-changes.html.\n\nThe FULL keyword causes the output to include the column collation and\ncomments, as well as the privileges you have for each column.\n\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. In other words, these two statements are equivalent:\n\nmysql> SHOW COLUMNS FROM mytable FROM mydb;\nmysql> SHOW COLUMNS FROM mydb.mytable;\n\nSHOW COLUMNS displays the following values for each table column:\n\nField indicates the column name.\n\nType indicates the column data type.\n\nCollation indicates the collation for nonbinary string columns, or NULL\nfor other columns. This value is displayed only if you use the FULL\nkeyword.\n\nThe Null field contains YES if NULL values can be stored in the column,\nNO if not.\n\nThe Key field indicates whether the column is indexed:\n\no If Key is empty, the column either is not indexed or is indexed only\n  as a secondary column in a multiple-column, nonunique index.\n\no If Key is PRI, the column is a PRIMARY KEY or is one of the columns\n  in a multiple-column PRIMARY KEY.\n\no If Key is UNI, the column is the first column of a UNIQUE index. (A\n  UNIQUE index permits multiple NULL values, but you can tell whether\n  the column permits NULL by checking the Null field.)\n\no If Key is MUL, the column is the first column of a nonunique index in\n  which multiple occurrences of a given value are permitted within the\n  column.\n\nIf more than one of the Key values applies to a given column of a\ntable, Key displays the one with the highest priority, in the order\nPRI, UNI, MUL.\n\nA UNIQUE index may be displayed as PRI if it cannot contain NULL values\nand there is no PRIMARY KEY in the table. A UNIQUE index may display as\nMUL if several columns form a composite UNIQUE index; although the\ncombination of the columns is unique, each column can still hold\nmultiple occurrences of a given value.\n\nThe Default field indicates the default value that is assigned to the\ncolumn. This is NULL if the column has an explicit default of NULL, or\nif the column definition has no DEFAULT clause.\n\nThe Extra field contains any additional information that is available\nabout a given column. The value is nonempty in these cases:\nauto_increment for columns that have the AUTO_INCREMENT attribute; on\nupdate CURRENT_TIMESTAMP for TIMESTAMP or DATETIME columns that have\nthe ON UPDATE CURRENT_TIMESTAMP attribute.\n\nPrivileges indicates the privileges you have for the column. This value\nis displayed only if you use the FULL keyword.\n\nComment indicates any comment the column has. This value is displayed\nonly if you use the FULL keyword.\n\nSHOW FIELDS is a synonym for SHOW COLUMNS. You can also list a table\'s\ncolumns with the mysqlshow db_name tbl_name command.\n\nThe DESCRIBE statement provides information similar to SHOW COLUMNS.\nSee http://dev.mysql.com/doc/refman/5.6/en/describe.html.\n\nThe SHOW CREATE TABLE, SHOW TABLE STATUS, and SHOW INDEX statements\nalso provide information about tables. See [HELP SHOW].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-columns.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-columns.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (278,23,'TINYINT','TINYINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA very small integer. The signed range is -128 to 127. The unsigned\nrange is 0 to 255.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (279,14,'MASTER_POS_WAIT','Syntax:\nMASTER_POS_WAIT(log_name,log_pos[,timeout])\n\nThis function is useful for control of master/slave synchronization. It\nblocks until the slave has read and applied all updates up to the\nspecified position in the master log. The return value is the number of\nlog events the slave had to wait for to advance to the specified\nposition. The function returns NULL if the slave SQL thread is not\nstarted, the slave\'s master information is not initialized, the\narguments are incorrect, or an error occurs. It returns -1 if the\ntimeout has been exceeded. If the slave SQL thread stops while\nMASTER_POS_WAIT() is waiting, the function returns NULL. If the slave\nis past the specified position, the function returns immediately.\n\nIf a timeout value is specified, MASTER_POS_WAIT() stops waiting when\ntimeout seconds have elapsed. timeout must be greater than 0; a zero or\nnegative timeout means no timeout.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (280,20,'^','Syntax:\n^\n\nBitwise XOR:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html\n\n','mysql> SELECT 1 ^ 1;\n        -> 0\nmysql> SELECT 1 ^ 0;\n        -> 1\nmysql> SELECT 11 ^ 3;\n        -> 8\n','http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (281,40,'DROP VIEW','Syntax:\nDROP VIEW [IF EXISTS]\n    view_name [, view_name] ...\n    [RESTRICT | CASCADE]\n\nDROP VIEW removes one or more views. You must have the DROP privilege\nfor each view. If any of the views named in the argument list do not\nexist, MySQL returns an error indicating by name which nonexisting\nviews it was unable to drop, but it also drops all of the views in the\nlist that do exist.\n\nThe IF EXISTS clause prevents an error from occurring for views that\ndon\'t exist. When this clause is given, a NOTE is generated for each\nnonexistent view. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE, if given, are parsed and ignored.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-view.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-view.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (282,32,'WEEK','Syntax:\nWEEK(date[,mode])\n\nThis function returns the week number for date. The two-argument form\nof WEEK() enables you to specify whether the week starts on Sunday or\nMonday and whether the return value should be in the range from 0 to 53\nor from 1 to 53. If the mode argument is omitted, the value of the\ndefault_week_format system variable is used. See\nhttp://dev.mysql.com/doc/refman/5.6/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT WEEK(\'2008-02-20\');\n        -> 7\nmysql> SELECT WEEK(\'2008-02-20\',0);\n        -> 7\nmysql> SELECT WEEK(\'2008-02-20\',1);\n        -> 8\nmysql> SELECT WEEK(\'2008-12-31\',1);\n        -> 53\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (283,22,'DROP FUNCTION UDF','Syntax:\nDROP FUNCTION function_name\n\nThis statement drops the user-defined function (UDF) named\nfunction_name.\n\nTo drop a function, you must have the DELETE privilege for the mysql\ndatabase. This is because DROP FUNCTION removes a row from the\nmysql.func system table that records the function\'s name, type, and\nshared library name.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-function-udf.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-function-udf.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (284,38,'UPDATEXML','Syntax:\nUpdateXML(xml_target, xpath_expr, new_xml)\n\nThis function replaces a single portion of a given fragment of XML\nmarkup xml_target with a new XML fragment new_xml, and then returns the\nchanged XML. The portion of xml_target that is replaced matches an\nXPath expression xpath_expr supplied by the user. In MySQL 5.6.6 and\nearlier, the XPath expression could contain at most 127 characters.\nThis limitation is lifted in MySQL 5.6.7. (Bug #13007062, Bug #62429)\n\nIf no expression matching xpath_expr is found, or if multiple matches\nare found, the function returns the original xml_target XML fragment.\nAll three arguments should be strings.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/xml-functions.html\n\n','mysql> SELECT\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/a\', \'<e>fff</e>\') AS val1,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/b\', \'<e>fff</e>\') AS val2,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'//b\', \'<e>fff</e>\') AS val3,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/a/d\', \'<e>fff</e>\') AS val4,\n    ->   UpdateXML(\'<a><d></d><b>ccc</b><d></d></a>\', \'/a/d\', \'<e>fff</e>\') AS val5\n    -> \\G\n\n*************************** 1. row ***************************\nval1: <e>fff</e>\nval2: <a><b>ccc</b><d></d></a>\nval3: <a><e>fff</e><d></d></a>\nval4: <a><b>ccc</b><e>fff</e></a>\nval5: <a><d></d><b>ccc</b><d></d></a>\n','http://dev.mysql.com/doc/refman/5.6/en/xml-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (285,8,'RESET SLAVE','Syntax:\nRESET SLAVE [ALL]\n\nRESET SLAVE makes the slave forget its replication position in the\nmaster\'s binary log. This statement is meant to be used for a clean\nstart: It clears the master info and relay log info repositories,\ndeletes all the relay log files, and starts a new relay log file. It\nalso resets to 0 the replication delay specified with the MASTER_DELAY\noption to CHANGE MASTER TO. To use RESET SLAVE, the slave replication\nthreads must be stopped (use STOP SLAVE if necessary).\n\n*Note*: All relay log files are deleted, even if they have not been\ncompletely executed by the slave SQL thread. (This is a condition\nlikely to exist on a replication slave if you have issued a STOP SLAVE\nstatement or if the slave is highly loaded.)\n\nIn MySQL 5.6 (unlike the case in MySQL 5.1 and earlier), RESET SLAVE\ndoes not change any replication connection parameters such as master\nhost, master port, master user, or master password, which are retained\nin memory. This means that START SLAVE can be issued without requiring\na CHANGE MASTER TO statement following RESET SLAVE.\n\nConnection parameters are reset if the slave mysqld is shut down\nfollowing RESET SLAVE. In MySQL 5.6.3 and later, you can instead use\nRESET SLAVE ALL to reset these connection parameters (Bug #11809016).\n\nIn MySQL 5.6.7 and later, RESET SLAVE causes an implicit commit of an\nongoing transaction. See\nhttp://dev.mysql.com/doc/refman/5.6/en/implicit-commit.html.\n\nIf the slave SQL thread was in the middle of replicating temporary\ntables when it was stopped, and RESET SLAVE is issued, these replicated\ntemporary tables are deleted on the slave.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/reset-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/reset-slave.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (286,32,'DAY','Syntax:\nDAY(date)\n\nDAY() is a synonym for DAYOFMONTH().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (287,14,'UUID','Syntax:\nUUID()\n\nReturns a Universal Unique Identifier (UUID) generated according to\n"DCE 1.1: Remote Procedure Call" (Appendix A) CAE (Common Applications\nEnvironment) Specifications published by The Open Group in October 1997\n(Document Number C706,\nhttp://www.opengroup.org/public/pubs/catalog/c706.htm).\n\nA UUID is designed as a number that is globally unique in space and\ntime. Two calls to UUID() are expected to generate two different\nvalues, even if these calls are performed on two separate computers\nthat are not connected to each other.\n\nA UUID is a 128-bit number represented by a utf8 string of five\nhexadecimal numbers in aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee format:\n\no The first three numbers are generated from a timestamp.\n\no The fourth number preserves temporal uniqueness in case the timestamp\n  value loses monotonicity (for example, due to daylight saving time).\n\no The fifth number is an IEEE 802 node number that provides spatial\n  uniqueness. A random number is substituted if the latter is not\n  available (for example, because the host computer has no Ethernet\n  card, or we do not know how to find the hardware address of an\n  interface on your operating system). In this case, spatial uniqueness\n  cannot be guaranteed. Nevertheless, a collision should have very low\n  probability.\n\n  Currently, the MAC address of an interface is taken into account only\n  on FreeBSD and Linux. On other operating systems, MySQL uses a\n  randomly generated 48-bit number.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> SELECT UUID();\n        -> \'6ccd780c-baba-1026-9564-0040f4311e29\'\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (288,14,'SLEEP','Syntax:\nSLEEP(duration)\n\nSleeps (pauses) for the number of seconds given by the duration\nargument, then returns 0. If SLEEP() is interrupted, it returns 1. The\nduration may have a fractional part.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (289,25,'LINESTRING','LineString(pt1,pt2,...)\n\nConstructs a LineString value from a number of Point or WKB Point\narguments. If the number of arguments is less than two, the return\nvalue is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (290,7,'NULLIF','Syntax:\nNULLIF(expr1,expr2)\n\nReturns NULL if expr1 = expr2 is true, otherwise returns expr1. This is\nthe same as CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/control-flow-functions.html\n\n','mysql> SELECT NULLIF(1,1);\n        -> NULL\nmysql> SELECT NULLIF(1,2);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/control-flow-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (291,4,'ROUND','Syntax:\nROUND(X), ROUND(X,D)\n\nRounds the argument X to D decimal places. The rounding algorithm\ndepends on the data type of X. D defaults to 0 if not specified. D can\nbe negative to cause D digits left of the decimal point of the value X\nto become zero.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT ROUND(-1.23);\n        -> -1\nmysql> SELECT ROUND(-1.58);\n        -> -2\nmysql> SELECT ROUND(1.58);\n        -> 2\nmysql> SELECT ROUND(1.298, 1);\n        -> 1.3\nmysql> SELECT ROUND(1.298, 0);\n        -> 1\nmysql> SELECT ROUND(23.298, -1);\n        -> 20\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (292,32,'TIMEDIFF','Syntax:\nTIMEDIFF(expr1,expr2)\n\nTIMEDIFF() returns expr1 - expr2 expressed as a time value. expr1 and\nexpr2 are time or date-and-time expressions, but both must be of the\nsame type.\n\nThe result returned by TIMEDIFF() is limited to the range allowed for\nTIME values. Alternatively, you can use either of the functions\nTIMESTAMPDIFF() and UNIX_TIMESTAMP(), both of which return integers.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT TIMEDIFF(\'2000:01:01 00:00:00\',\n    ->                 \'2000:01:01 00:00:00.000001\');\n        -> \'-00:00:00.000001\'\nmysql> SELECT TIMEDIFF(\'2008-12-31 23:59:59.000001\',\n    ->                 \'2008-12-30 01:01:01.000002\');\n        -> \'46:58:57.999999\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (293,8,'STOP SLAVE','Syntax:\nSTOP SLAVE [thread_types]\n\nthread_types:\n    [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nStops the slave threads. STOP SLAVE requires the SUPER privilege.\nRecommended best practice is to execute STOP SLAVE on the slave before\nstopping the slave server (see\nhttp://dev.mysql.com/doc/refman/5.6/en/server-shutdown.html, for more\ninformation).\n\nWhen using the row-based logging format: You should execute STOP SLAVE\nor STOP SLAVE SQL_THREAD on the slave prior to shutting down the slave\nserver if you are replicating any tables that use a nontransactional\nstorage engine (see the Note later in this section).\n\nLike START SLAVE, this statement may be used with the IO_THREAD and\nSQL_THREAD options to name the thread or threads to be stopped.\n\nIn MySQL 5.6.7 and later, STOP SLAVE causes an implicit commit of an\nongoing transaction. See\nhttp://dev.mysql.com/doc/refman/5.6/en/implicit-commit.html.\n\nBeginning with MySQL 5.6.11, gtid_next must be set to AUTOMATIC before\nissuing this statement (Bug #16062608).\n\nIn MySQL 5.6.13 and later, you can control how long STOP SLAVE waits\nbefore timing out by setting the rpl_stop_slave_timeout system\nvariable. This can be used to avoid deadlocks between STOP SLAVE and\nother slave SQL statements using different client connections to the\nslave. (Bug #16856735)\n\n*Note*: In MySQL 5.6, STOP SLAVE waits until the current replication\nevent group affecting one or more nontransactional tables has finished\nexecuting (if there is any such replication group), or until the user\nissues a KILL QUERY or KILL CONNECTION statement. (Bug #319, Bug\n#38205)\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/stop-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/stop-slave.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (294,3,'LINEFROMTEXT','LineFromText(wkt[,srid]), LineStringFromText(wkt[,srid])\n\nConstructs a LINESTRING value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (295,32,'ADDTIME','Syntax:\nADDTIME(expr1,expr2)\n\nADDTIME() adds expr2 to expr1 and returns the result. expr1 is a time\nor datetime expression, and expr2 is a time expression.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT ADDTIME(\'2007-12-31 23:59:59.999999\', \'1 1:1:1.000002\');\n        -> \'2008-01-02 01:01:01.000001\'\nmysql> SELECT ADDTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'03:00:01.999997\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (296,38,'UPPER','Syntax:\nUPPER(str)\n\nReturns the string str with all characters changed to uppercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nmysql> SELECT UPPER(\'Hej\');\n        -> \'HEJ\'\n\nSee the description of LOWER() for information that also applies to\nUPPER(). This included information about how to perform lettercase\nconversion of binary strings (BINARY, VARBINARY, BLOB) for which these\nfunctions are ineffective, and information about case folding for\nUnicode character sets.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (297,23,'MEDIUMBLOB','MEDIUMBLOB\n\nA BLOB column with a maximum length of 16,777,215 (224 - 1) bytes. Each\nMEDIUMBLOB value is stored using a 3-byte length prefix that indicates\nthe number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (298,32,'FROM_UNIXTIME','Syntax:\nFROM_UNIXTIME(unix_timestamp), FROM_UNIXTIME(unix_timestamp,format)\n\nReturns a representation of the unix_timestamp argument as a value in\n\'YYYY-MM-DD HH:MM:SS\' or YYYYMMDDHHMMSS format, depending on whether\nthe function is used in a string or numeric context. The value is\nexpressed in the current time zone. unix_timestamp is an internal\ntimestamp value such as is produced by the UNIX_TIMESTAMP() function.\n\nIf format is given, the result is formatted according to the format\nstring, which is used the same way as listed in the entry for the\nDATE_FORMAT() function.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT FROM_UNIXTIME(1196440219);\n        -> \'2007-11-30 10:30:19\'\nmysql> SELECT FROM_UNIXTIME(1196440219) + 0;\n        -> 20071130103019.000000\nmysql> SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),\n    ->                      \'%Y %D %M %h:%i:%s %x\');\n        -> \'2007 30th November 10:30:59 2007\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (299,12,'SHA2','Syntax:\nSHA2(str, hash_length)\n\nCalculates the SHA-2 family of hash functions (SHA-224, SHA-256,\nSHA-384, and SHA-512). The first argument is the cleartext string to be\nhashed. The second argument indicates the desired bit length of the\nresult, which must have a value of 224, 256, 384, 512, or 0 (which is\nequivalent to 256). If either argument is NULL or the hash length is\nnot one of the permitted values, the return value is NULL. Otherwise,\nthe function result is a hash value containing the desired number of\nbits. See the notes at the beginning of this section about storing hash\nvalues efficiently.\n\nThe return value is a nonbinary string in the connection character set.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','mysql> SELECT SHA2(\'abc\', 224);\n        -> \'23097d223405d8228642a477bda255b32aadbce4bda0b3f7e36c9da7\'\n','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (300,7,'IFNULL','Syntax:\nIFNULL(expr1,expr2)\n\nIf expr1 is not NULL, IFNULL() returns expr1; otherwise it returns\nexpr2. IFNULL() returns a numeric or string value, depending on the\ncontext in which it is used.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/control-flow-functions.html\n\n','mysql> SELECT IFNULL(1,0);\n        -> 1\nmysql> SELECT IFNULL(NULL,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,\'yes\');\n        -> \'yes\'\n','http://dev.mysql.com/doc/refman/5.6/en/control-flow-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (301,27,'SHOW FUNCTION CODE','Syntax:\nSHOW FUNCTION CODE func_name\n\nThis statement is similar to SHOW PROCEDURE CODE but for stored\nfunctions. See [HELP SHOW PROCEDURE CODE].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-function-code.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-function-code.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (302,19,'LEAST','Syntax:\nLEAST(value1,value2,...)\n\nWith two or more arguments, returns the smallest (minimum-valued)\nargument. The arguments are compared using the following rules:\n\no If any argument is NULL, the result is NULL. No comparison is needed.\n\no If the return value is used in an INTEGER context or all arguments\n  are integer-valued, they are compared as integers.\n\no If the return value is used in a REAL context or all arguments are\n  real-valued, they are compared as reals.\n\no If the arguments comprise a mix of numbers and strings, they are\n  compared as numbers.\n\no If any argument is a nonbinary (character) string, the arguments are\n  compared as nonbinary strings.\n\no In all other cases, the arguments are compared as binary strings.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT LEAST(2,0);\n        -> 0\nmysql> SELECT LEAST(34.0,3.0,5.0,767.0);\n        -> 3.0\nmysql> SELECT LEAST(\'B\',\'A\',\'C\');\n        -> \'A\'\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (303,27,'SHOW ERRORS','Syntax:\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW COUNT(*) ERRORS\n\nSHOW ERRORS is a diagnostic statement that is similar to SHOW WARNINGS,\nexcept that it displays information only for errors, rather than for\nerrors, warnings, and notes.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttp://dev.mysql.com/doc/refman/5.6/en/select.html.\n\nThe SHOW COUNT(*) ERRORS statement displays the number of errors. You\ncan also retrieve this number from the error_count variable:\n\nSHOW COUNT(*) ERRORS;\nSELECT @@error_count;\n\nSHOW ERRORS and error_count apply only to errors, not warnings or\nnotes. In other respects, they are similar to SHOW WARNINGS and\nwarning_count. In particular, SHOW ERRORS cannot display information\nfor more than max_error_count messages, and error_count can exceed the\nvalue of max_error_count if the number of errors exceeds\nmax_error_count.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-errors.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-errors.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (304,19,'=','=\n\nEqual:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 1 = 0;\n        -> 0\nmysql> SELECT \'0\' = 0;\n        -> 1\nmysql> SELECT \'0.0\' = 0;\n        -> 1\nmysql> SELECT \'0.01\' = 0;\n        -> 0\nmysql> SELECT \'.01\' = 0.01;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (305,14,'IS_IPV4_MAPPED','Syntax:\nIS_IPV4_MAPPED(expr)\n\nThis function takes an IPv6 address represented in numeric form as a\nbinary string, as returned by INET6_ATON(). It returns 1 if the\nargument is a valid IPv4-mapped IPv6 address, 0 otherwise. IPv4-mapped\naddresses have the form ::ffff:ipv4_address.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> SELECT IS_IPV4_MAPPED(INET6_ATON(\'::10.0.5.9\'));\n        -> 0\nmysql> SELECT IS_IPV4_MAPPED(INET6_ATON(\'::ffff:10.0.5.9\'));\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (306,37,'BOUNDARY','Boundary(g)\n\nReturns a geometry that is the closure of the combinatorial boundary of\nthe geometry value g.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (307,10,'CREATE USER','Syntax:\nCREATE USER user_specification [, user_specification] ...\n\nuser_specification:\n    user\n    [\n      | IDENTIFIED WITH auth_plugin [AS \'auth_string\']\n        IDENTIFIED BY [PASSWORD] \'password\'\n    ]\n\nThe CREATE USER statement creates new MySQL accounts. An error occurs\nfor accounts that already exist. To use this statement, you must have\nthe global CREATE USER privilege or the INSERT privilege for the mysql\ndatabase. For each account, CREATE USER creates a new row in the\nmysql.user table with no privileges and assigns the account an\nauthentication plugin. Depending on the syntax used, CREATE USER may\nalso assign the account a password.\n\nEach user_specification clause consists of an account name and\ninformation about how authentication occurs for clients that use the\naccount. This part of CREATE USER syntax is shared with GRANT, so the\ndescription here applies to GRANT as well.\n\nEach account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.6/en/account-names.html. For example:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nThe server assigns an authentication plugin and password to each\naccount as follows, depending on whether the user specification clause\nincludes IDENTIFIED WITH to specify a plugin or IDENTIFIED BY to\nspecify a password:\n\no With IDENTIFIED WITH, the server assigns the specified plugin and the\n  account has no password.\n\no With IDENTIFIED BY, the server assigns the plugin implicitly and\n  assigns the specified password.\n\no With neither IDENTIFIED WITH nor IDENTIFIED BY, the server assigns\n  the plugin implicitly and the account has no password.\n\nIf the account has no password, the Password column in the account\'s\nmysql.user table row remains empty, which is insecure. To set the\npassword, use SET PASSWORD. See [HELP SET PASSWORD].\n\nFor implicit authentication plugin assignment, the server uses these\nrules:\n\no As of MySQL 5.6.6, the server assigns the default plugin to the\n  account. This plugin becomes the value of the plugin column in the\n  account\'s mysql.user table row. The default plugin is\n  mysql_native_password unless the --default-authentication-plugin\n  option is set otherwise at server startup.\n\no Before MySQL 5.6.6, the server assigns no plugin to the account. The\n  plugin column in the account\'s mysql.user table row remains empty.\n\nFor client connections that use a given account, the server invokes the\nauthentication plugin assigned to the account and the client must\nprovide credentials as required by the authentication method that the\nplugin implements. If the server cannot find the plugin, either at\naccount-creation time or connect time, an error occurs.\n\nIf an account\'s mysql.user table row has a nonempty plugin column:\n\no The server authenticates client connection attempts using the named\n  plugin.\n\no Changes to the account password using SET PASSWORD with PASSWORD()\n  must be made with the old_passwords system variable set to the value\n  required by the authentication plugin, so that PASSWORD() uses the\n  appropriate password hashing method. If the plugin is\n  mysql_old_password, the password can also be changed using SET\n  PASSWORD with OLD_PASSWORD(), which uses pre-4.1 password hashing\n  regardless of the value of old_passwords.\n\nIf an account\'s mysql.user table row has an empty plugin column:\n\no The server authenticates client connection attempts using the\n  mysql_native_password or mysql_old_password authentication plugin,\n  depending on the hash format of the password stored in the Password\n  column.\n\no Changes to the account password using SET PASSWORD can be made with\n  PASSWORD(), with old_passwords set to 0 or 1 for 4.1 or pre-4.1\n  password hashing, respectively, or with OLD_PASSWORD(), which uses\n  pre-4.1 password hashing regardless of the value of old_passwords.\n\nCREATE USER examples:\n\no To specify an authentication plugin for an account, use IDENTIFIED\n  WITH auth_plugin. The plugin name can be a quoted string literal or\n  an unquoted name. \'auth_string\' is an optional quoted string literal\n  to pass to the plugin. The plugin interprets the meaning of the\n  string, so its format is plugin specific. Consult the documentation\n  for a given plugin for information about the authentication string\n  values it accepts, if any.\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED WITH mysql_native_password;\n\n  The server assigns the given authentication plugin to the account but\n  no password. Clients must provide no password when they connect.\n  However, an account with no password is insecure. To ensure that an\n  account uses a specific authentication plugin and has a password with\n  the corresponding hash format, specify the plugin explicitly with\n  IDENTIFIED WITH, then use SET PASSWORD to set the password:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED WITH mysql_native_password;\nSET old_passwords = 0;\nSET PASSWORD FOR \'jeffrey\'@\'localhost\' = PASSWORD(\'mypass\');\n\n  Changes to the account password using SET PASSWORD with PASSWORD()\n  must be made with the old_passwords system variable set to the value\n  required by the account\'s authentication plugin, so that PASSWORD()\n  uses the appropriate password hashing method. Therefore, to use the\n  sha256_password or mysql_old_password plugin instead, name that\n  plugin in the CREATE USER statement and set old_passwords to 2 or 1,\n  respectively, before using SET PASSWORD. (Use of mysql_old_password\n  is not recommended. It is deprecated and support for it will be\n  removed in a future MySQL release.)\n\no To specify a password for an account at account-creation time, use\n  IDENTIFIED BY with the literal plaintext password value:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\n\n  The server assigns an authentication plugin to the account\n  implicitly, as described previously, and assigns the given password.\n  Clients must provide the given password when they connect.\n\n  If the implicitly assigned plugin is mysql_native_password, the\n  old_passwords system variable must be set to 0. Otherwise, CREATE\n  USER does not hash the password in the format required by the plugin\n  and an error occurs:\n\nmysql> SET old_passwords = 1;\nmysql> CREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\nERROR 1827 (HY000): The password hash doesn\'t have the expected\nformat. Check if the correct password algorithm is being used with\nthe PASSWORD() function.\n\nmysql> SET old_passwords = 0;\nmysql> CREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\nQuery OK, 0 rows affected (0.00 sec)\n\no To avoid specifying the plaintext password if you know its hash value\n  (the value that PASSWORD() would return for the password), specify\n  the hash value preceded by the keyword PASSWORD:\n\nCREATE USER \'jeffrey\'@\'localhost\'\nIDENTIFIED BY PASSWORD \'*90E462C37378CED12064BB3388827D2BA3A9B689\';\n\n  The server assigns an authentication plugin to the account\n  implicitly, as described previously, and assigns the given password.\n  The password hash must be in the format required by the assigned\n  plugin. Clients must provide the password when they connect.\n\no To enable the user to connect with no password, include no IDENTIFIED\n  BY clause:\n\nCREATE USER \'jeffrey\'@\'localhost\';\n\n  The server assigns an authentication plugin to the account\n  implicitly, as described previously, but no password. Clients must\n  provide no password when they connect. However, an account with no\n  password is insecure. To avoid this, use SET PASSWORD to set the\n  account password.\n\nAs mentioned previously, implicit plugin assignment depends on the\ndefault authentication plugin. Permitted values of\n--default-authentication-plugin are mysql_native_plugin and\nsha256_password, but not mysql_old_password. This means it is not\npossible to set the default plugin so as to be able to create an\naccount that uses mysql_old_password with CREATE USER ... IDENTIFIED BY\nsyntax. To create an account that uses mysql_old_password, use CREATE\nUSER ... IDENTIFIED WITH to name the plugin explicitly, then set the\npassword: CREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED WITH\nmysql_old_password; SET old_passwords = 1; SET PASSWORD FOR\n\'jeffrey\'@\'localhost\' = PASSWORD(\'mypass\');\n\nHowever, the preceding procedure is not recommended because\nmysql_old_password is deprecated.\n\nFor additional information about setting passwords and authentication\nplugins, see\nhttp://dev.mysql.com/doc/refman/5.6/en/assigning-passwords.html, and\nhttp://dev.mysql.com/doc/refman/5.6/en/pluggable-authentication.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-user.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/create-user.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (308,25,'POINT','Point(x,y)\n\nConstructs a Point using its coordinates.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (309,38,'LCASE','Syntax:\nLCASE(str)\n\nLCASE() is a synonym for LOWER().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (310,19,'IS NOT NULL','Syntax:\nIS NOT NULL\n\nTests whether a value is not NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;\n        -> 1, 1, 0\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (311,38,'MATCH AGAINST','Syntax:\nMATCH (col1,col2,...) AGAINST (expr [search_modifier])\n\nMySQL has support for full-text indexing and searching:\n\no A full-text index in MySQL is an index of type FULLTEXT.\n\no Full-text indexes can be used only with InnoDB or MyISAM tables, and\n  can be created only for CHAR, VARCHAR, or TEXT columns.\n\no A FULLTEXT index definition can be given in the CREATE TABLE\n  statement when a table is created, or added later using ALTER TABLE\n  or CREATE INDEX.\n\no For large data sets, it is much faster to load your data into a table\n  that has no FULLTEXT index and then create the index after that, than\n  to load data into a table that has an existing FULLTEXT index.\n\nFull-text searching is performed using MATCH() ... AGAINST syntax.\nMATCH() takes a comma-separated list that names the columns to be\nsearched. AGAINST takes a string to search for, and an optional\nmodifier that indicates what type of search to perform. The search\nstring must be a string value that is constant during query evaluation.\nThis rules out, for example, a table column because that can differ for\neach row.\n\nThere are three types of full-text searches:\n\no A natural language search interprets the search string as a phrase in\n  natural human language (a phrase in free text). There are no special\n  operators. The stopword list applies, controlled by\n  innodb_ft_enable_stopword, innodb_ft_server_stopword_table, and\n  innodb_ft_user_stopword_table for InnoDB search indexes, and\n  ft_stopword_file for MyISAM ones.\n\no Full-text searches are natural language searches if the IN NATURAL\n  LANGUAGE MODE modifier is given or if no modifier is given. For more\n  information, see\n  http://dev.mysql.com/doc/refman/5.6/en/fulltext-natural-language.html\n  .\n\no A boolean search interprets the search string using the rules of a\n  special query language. The string contains the words to search for.\n  It can also contain operators that specify requirements such that a\n  word must be present or absent in matching rows, or that it should be\n  weighted higher or lower than usual. Certain common words (stopwords)\n  are omitted from the search index and do not match if present in the\n  search string. The IN BOOLEAN MODE modifier specifies a boolean\n  search. For more information, see\n  http://dev.mysql.com/doc/refman/5.6/en/fulltext-boolean.html.\n\no A query expansion search is a modification of a natural language\n  search. The search string is used to perform a natural language\n  search. Then words from the most relevant rows returned by the search\n  are added to the search string and the search is done again. The\n  query returns the rows from the second search. The IN NATURAL\n  LANGUAGE MODE WITH QUERY EXPANSION or WITH QUERY EXPANSION modifier\n  specifies a query expansion search. For more information, see\n  http://dev.mysql.com/doc/refman/5.6/en/fulltext-query-expansion.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/fulltext-search.html\n\n','mysql> SELECT id, body, MATCH (title,body) AGAINST\n    (\'Security implications of running MySQL as root\'\n    IN NATURAL LANGUAGE MODE) AS score\n    FROM articles WHERE MATCH (title,body) AGAINST\n    (\'Security implications of running MySQL as root\'\n    IN NATURAL LANGUAGE MODE);\n+----+-------------------------------------+-----------------+\n| id | body                                | score           |\n+----+-------------------------------------+-----------------+\n|  4 | 1. Never run mysqld as root. 2. ... | 1.5219271183014 |\n|  6 | When configured properly, MySQL ... | 1.3114095926285 |\n+----+-------------------------------------+-----------------+\n2 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.6/en/fulltext-search.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (312,40,'CREATE EVENT','Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    EVENT\n    [IF NOT EXISTS]\n    event_name\n    ON SCHEDULE schedule\n    [ON COMPLETION [NOT] PRESERVE]\n    [ENABLE | DISABLE | DISABLE ON SLAVE]\n    [COMMENT \'comment\']\n    DO event_body;\n\nschedule:\n    AT timestamp [+ INTERVAL interval] ...\n  | EVERY interval\n    [STARTS timestamp [+ INTERVAL interval] ...]\n    [ENDS timestamp [+ INTERVAL interval] ...]\n\ninterval:\n    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |\n              WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |\n              DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}\n\nThis statement creates and schedules a new event. The event will not\nrun unless the Event Scheduler is enabled. For information about\nchecking Event Scheduler status and enabling it if necessary, see\nhttp://dev.mysql.com/doc/refman/5.6/en/events-configuration.html.\n\nCREATE EVENT requires the EVENT privilege for the schema in which the\nevent is to be created. It might also require the SUPER privilege,\ndepending on the DEFINER value, as described later in this section.\n\nThe minimum requirements for a valid CREATE EVENT statement are as\nfollows:\n\no The keywords CREATE EVENT plus an event name, which uniquely\n  identifies the event in a database schema.\n\no An ON SCHEDULE clause, which determines when and how often the event\n  executes.\n\no A DO clause, which contains the SQL statement to be executed by an\n  event.\n\nThis is an example of a minimal CREATE EVENT statement:\n\nCREATE EVENT myevent\n    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR\n    DO\n      UPDATE myschema.mytable SET mycol = mycol + 1;\n\nThe previous statement creates an event named myevent. This event\nexecutes once---one hour following its creation---by running an SQL\nstatement that increments the value of the myschema.mytable table\'s\nmycol column by 1.\n\nThe event_name must be a valid MySQL identifier with a maximum length\nof 64 characters. Event names are not case sensitive, so you cannot\nhave two events named myevent and MyEvent in the same schema. In\ngeneral, the rules governing event names are the same as those for\nnames of stored routines. See\nhttp://dev.mysql.com/doc/refman/5.6/en/identifiers.html.\n\nAn event is associated with a schema. If no schema is indicated as part\nof event_name, the default (current) schema is assumed. To create an\nevent in a specific schema, qualify the event name with a schema using\nschema_name.event_name syntax.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-event.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/create-event.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (313,6,'MBR DEFINITION','Its MBR (Minimum Bounding Rectangle), or Envelope. This is the bounding\ngeometry, formed by the minimum and maximum (X,Y) coordinates:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/gis-class-geometry.html\n\n','((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n','http://dev.mysql.com/doc/refman/5.6/en/gis-class-geometry.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (314,25,'GEOMETRYCOLLECTION','GeometryCollection(g1,g2,...)\n\nConstructs a GeometryCollection.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (315,4,'*','Syntax:\n*\n\nMultiplication:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html\n\n','mysql> SELECT 3*5;\n        -> 15\nmysql> SELECT 18014398509481984*18014398509481984.0;\n        -> 324518553658426726783156020576256.0\nmysql> SELECT 18014398509481984*18014398509481984;\n        -> out-of-range error\n','http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (316,12,'DES_DECRYPT','Syntax:\nDES_DECRYPT(crypt_str[,key_str])\n\nDecrypts a string encrypted with DES_ENCRYPT(). If an error occurs,\nthis function returns NULL.\n\nThis function works only if MySQL has been configured with SSL support.\nSee http://dev.mysql.com/doc/refman/5.6/en/ssl-connections.html.\n\nIf no key_str argument is given, DES_DECRYPT() examines the first byte\nof the encrypted string to determine the DES key number that was used\nto encrypt the original string, and then reads the key from the DES key\nfile to decrypt the message. For this to work, the user must have the\nSUPER privilege. The key file can be specified with the --des-key-file\nserver option.\n\nIf you pass this function a key_str argument, that string is used as\nthe key for decrypting the message.\n\nIf the crypt_str argument does not appear to be an encrypted string,\nMySQL returns the given crypt_str.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (317,13,'ENDPOINT','EndPoint(ls)\n\nReturns the Point that is the endpoint of the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(EndPoint(GeomFromText(@ls)));\n+-------------------------------------+\n| AsText(EndPoint(GeomFromText(@ls))) |\n+-------------------------------------+\n| POINT(3 3)                          |\n+-------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (318,16,'COUNT','Syntax:\nCOUNT(expr)\n\nReturns a count of the number of non-NULL values of expr in the rows\nretrieved by a SELECT statement. The result is a BIGINT value.\n\nCOUNT() returns 0 if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','mysql> SELECT student.student_name,COUNT(*)\n    ->        FROM student,course\n    ->        WHERE student.student_id=course.student_id\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (319,28,'INSERT','Syntax:\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    [PARTITION (partition_name,...)] \n    [(col_name,...)]\n    {VALUES | VALUE} ({expr | DEFAULT},...),(...),...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    [PARTITION (partition_name,...)]\n    SET col_name={expr | DEFAULT}, ...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    [PARTITION (partition_name,...)] \n    [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nINSERT inserts new rows into an existing table. The INSERT ... VALUES\nand INSERT ... SET forms of the statement insert rows based on\nexplicitly specified values. The INSERT ... SELECT form inserts rows\nselected from another table or tables. INSERT ... SELECT is discussed\nfurther in [HELP INSERT SELECT].\n\nIn MySQL 5.6.2 and later, when inserting into a partitioned table, you\ncan control which partitions and subpartitions accept new rows. The\nPARTITION option takes a comma-separated list of the names of one or\nmore partitions or subpartitions (or both) of the table. If any of the\nrows to be inserted by a given INSERT statement do not match one of the\npartitions listed, the INSERT statement fails with the error Found a\nrow not matching the given partition set. See\nhttp://dev.mysql.com/doc/refman/5.6/en/partitioning-selection.html, for\nmore information and examples.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/insert.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/insert.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (320,3,'MLINEFROMTEXT','MLineFromText(wkt[,srid]), MultiLineStringFromText(wkt[,srid])\n\nConstructs a MULTILINESTRING value using its WKT representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (321,33,'GEOMCOLLFROMWKB','GeomCollFromWKB(wkb[,srid]), GeometryCollectionFromWKB(wkb[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKB representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (322,23,'TINYTEXT','TINYTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 255 (28 - 1) characters. The\neffective maximum length is less if the value contains multi-byte\ncharacters. Each TINYTEXT value is stored using a 1-byte length prefix\nthat indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (323,14,'DEFAULT','Syntax:\nDEFAULT(col_name)\n\nReturns the default value for a table column. An error results if the\ncolumn has no default value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> UPDATE t SET i = DEFAULT(i)+1 WHERE id < 100;\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (324,12,'DECODE','Syntax:\nDECODE(crypt_str,pass_str)\n\nDecrypts the encrypted string crypt_str using pass_str as the password.\ncrypt_str should be a string returned from ENCODE().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (325,21,'OPTIMIZE TABLE','Syntax:\nOPTIMIZE [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n\nReorganizes the physical storage of table data and associated index\ndata, to reduce storage space and improve I/O efficiency when accessing\nthe table. The exact changes made to each table depend on the storage\nengine used by that table.\n\nUse OPTIMIZE TABLE in these cases, depending on the type of table:\n\no After doing substantial insert, update, or delete operations on an\n  InnoDB table that has its own .ibd file because it was created with\n  the innodb_file_per_table option enabled. The table and indexes are\n  reorganized, and disk space can be reclaimed for use by the operating\n  system.\n\no After doing substantial insert, update, or delete operations on\n  columns that are part of a FULLTEXT index in an InnoDB table. Set the\n  configuration option innodb_optimize_fulltext_only=1 first. To keep\n  the index maintenance period to a reasonable time, set the\n  innodb_ft_num_word_optimize option to specify how many words to\n  update in the search index, and run a sequence of OPTIMIZE TABLE\n  statements until the search index is fully updated.\n\no After deleting a large part of a MyISAM or ARCHIVE table, or making\n  many changes to a MyISAM or ARCHIVE table with variable-length rows\n  (tables that have VARCHAR, VARBINARY, BLOB, or TEXT columns). Deleted\n  rows are maintained in a linked list and subsequent INSERT operations\n  reuse old row positions. You can use OPTIMIZE TABLE to reclaim the\n  unused space and to defragment the data file. After extensive changes\n  to a table, this statement may also improve performance of statements\n  that use the table, sometimes significantly.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nOPTIMIZE TABLE is also supported for partitioned tables. For\ninformation about using this statement with partitioned tables and\ntable partitions, see\nhttp://dev.mysql.com/doc/refman/5.6/en/partitioning-maintenance.html.\n\nIn MySQL 5.6.11 only, gtid_next must be set to AUTOMATIC before issuing\nthis statement. (Bug #16062608, Bug #16715809, Bug #69045)\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/optimize-table.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/optimize-table.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (326,19,'<=>','Syntax:\n<=>\n\nNULL-safe equal. This operator performs an equality comparison like the\n= operator, but returns 1 rather than NULL if both operands are NULL,\nand 0 rather than NULL if one operand is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;\n        -> 1, 1, 0\nmysql> SELECT 1 = 1, NULL = NULL, 1 = NULL;\n        -> 1, NULL, NULL\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (327,27,'RESET','Syntax:\nRESET reset_option [, reset_option] ...\n\nThe RESET statement is used to clear the state of various server\noperations. You must have the RELOAD privilege to execute RESET.\n\nRESET acts as a stronger version of the FLUSH statement. See [HELP\nFLUSH].\n\nThe RESET statement causes an implicit commit. See\nhttp://dev.mysql.com/doc/refman/5.6/en/implicit-commit.html.\n\nIn MySQL 5.6.11 only, gtid_next must be set to AUTOMATIC before issuing\nthis statement. (Bug #16062608, Bug #16715809, Bug #69045)\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/reset.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/reset.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (328,14,'GET_LOCK','Syntax:\nGET_LOCK(str,timeout)\n\nTries to obtain a lock with a name given by the string str, using a\ntimeout of timeout seconds. Returns 1 if the lock was obtained\nsuccessfully, 0 if the attempt timed out (for example, because another\nclient has previously locked the name), or NULL if an error occurred\n(such as running out of memory or the thread was killed with mysqladmin\nkill). If you have a lock obtained with GET_LOCK(), it is released when\nyou execute RELEASE_LOCK(), execute a new GET_LOCK(), or your\nconnection terminates (either normally or abnormally). Locks obtained\nwith GET_LOCK() do not interact with transactions. That is, committing\na transaction does not release any such locks obtained during the\ntransaction.\n\nThis function can be used to implement application locks or to simulate\nrecord locks. Names are locked on a server-wide basis. If a name has\nbeen locked by one client, GET_LOCK() blocks any request by another\nclient for a lock with the same name. This enables clients that agree\non a given lock name to use the name to perform cooperative advisory\nlocking. But be aware that it also enables a client that is not among\nthe set of cooperating clients to lock a name, either inadvertently or\ndeliberately, and thus prevent any of the cooperating clients from\nlocking that name. One way to reduce the likelihood of this is to use\nlock names that are database-specific or application-specific. For\nexample, use lock names of the form db_name.str or app_name.str.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> SELECT GET_LOCK(\'lock1\',10);\n        -> 1\nmysql> SELECT IS_FREE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT GET_LOCK(\'lock2\',10);\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock1\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (329,23,'BIGINT','BIGINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA large integer. The signed range is -9223372036854775808 to\n9223372036854775807. The unsigned range is 0 to 18446744073709551615.\n\nSERIAL is an alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (330,32,'CURTIME','Syntax:\nCURTIME([fsp])\n\nReturns the current time as a value in \'HH:MM:SS\' or HHMMSS format,\ndepending on whether the function is used in a string or numeric\ncontext. The value is expressed in the current time zone.\n\nAs of MySQL 5.6.4, if the fsp argument is given to specify a fractional\nseconds precision from 0 to 6, the return value includes a fractional\nseconds part of that many digits. Before 5.6.4, any argument is\nignored.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT CURTIME();\n        -> \'23:50:26\'\nmysql> SELECT CURTIME() + 0;\n        -> 235026.000000\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (331,27,'SET','Syntax:\nSET variable_assignment [, variable_assignment] ...\n\nvariable_assignment:\n      user_var_name = expr\n    | [GLOBAL | SESSION] system_var_name = expr\n    | [@@global. | @@session. | @@]system_var_name = expr\n\nThe SET statement assigns values to different types of variables that\naffect the operation of the server or your client.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/set-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/set-statement.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (332,38,'TO_BASE64()','Syntax:\nTO_BASE64(str)\n\nConverts the string argument to base-64 encoded form and returns the\nresult as a character string with the connection character set and\ncollation. If the argument is not a string, it is converted to a string\nbefore conversion takes place. The result is NULL if the argument is\nNULL. Base-64 encoded strings can be decoded using the the\nFROM_BASE64() function.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT TO_BASE64(\'abc\'), FROM_BASE64(TO_BASE64(\'abc\'));\n        -> \'JWJj\', \'abc\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (333,4,'CONV','Syntax:\nCONV(N,from_base,to_base)\n\nConverts numbers between different number bases. Returns a string\nrepresentation of the number N, converted from base from_base to base\nto_base. Returns NULL if any argument is NULL. The argument N is\ninterpreted as an integer, but may be specified as an integer or a\nstring. The minimum base is 2 and the maximum base is 36. If to_base is\na negative number, N is regarded as a signed number. Otherwise, N is\ntreated as unsigned. CONV() works with 64-bit precision.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT CONV(\'a\',16,2);\n        -> \'1010\'\nmysql> SELECT CONV(\'6E\',18,8);\n        -> \'172\'\nmysql> SELECT CONV(-17,10,-18);\n        -> \'-H\'\nmysql> SELECT CONV(10+\'10\'+\'10\'+0xa,10,10);\n        -> \'40\'\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (334,28,'LOAD XML','Syntax:\nLOAD XML [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'file_name\'\n    [REPLACE | IGNORE]\n    INTO TABLE [db_name.]tbl_name\n    [PARTITION (partition_name,...)]\n    [CHARACTER SET charset_name]\n    [ROWS IDENTIFIED BY \'<tagname>\']\n    [IGNORE number {LINES | ROWS}]\n    [(column_or_user_var,...)]\n    [SET col_name = expr,...]\n\nThe LOAD XML statement reads data from an XML file into a table. The\nfile_name must be given as a literal string. The tagname in the\noptional ROWS IDENTIFIED BY clause must also be given as a literal\nstring, and must be surrounded by angle brackets (< and >).\n\nLOAD XML acts as the complement of running the mysql client in XML\noutput mode (that is, starting the client with the --xml option). To\nwrite data from a table to an XML file, use a command such as the\nfollowing one from the system shell:\n\nshell> mysql --xml -e \'SELECT * FROM mytable\' > file.xml\n\nTo read the file back into a table, use LOAD XML INFILE. By default,\nthe <row> element is considered to be the equivalent of a database\ntable row; this can be changed using the ROWS IDENTIFIED BY clause.\n\nThis statement supports three different XML formats:\n\no Column names as attributes and column values as attribute values:\n\n<row column1="value1" column2="value2" .../>\n\no Column names as tags and column values as the content of these tags:\n\n<row>\n  <column1>value1</column1>\n  <column2>value2</column2>\n</row>\n\no Column names are the name attributes of <field> tags, and values are\n  the contents of these tags:\n\n<row>\n  <field name=\'column1\'>value1</field>\n  <field name=\'column2\'>value2</field>\n</row>\n\n  This is the format used by other MySQL tools, such as mysqldump.\n\nAll three formats can be used in the same XML file; the import routine\nautomatically detects the format for each row and interprets it\ncorrectly. Tags are matched based on the tag or attribute name and the\ncolumn name.\n\nThe following clauses work essentially the same way for LOAD XML as\nthey do for LOAD DATA:\n\no LOW_PRIORITY or CONCURRENT\n\no LOCAL\n\no REPLACE or IGNORE\n\no PARTITION\n\no CHARACTER SET\n\no (column_or_user_var,...)\n\no SET\n\nSee [HELP LOAD DATA], for more information about these clauses.\n\nThe IGNORE number LINES or IGNORE number ROWS clause causes the first\nnumber rows in the XML file to be skipped. It is analogous to the LOAD\nDATA statement\'s IGNORE ... LINES clause.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/load-xml.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/load-xml.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (335,15,'ASSIGN-VALUE','Syntax:\n:=\n\nAssignment operator. Causes the user variable on the left hand side of\nthe operator to take on the value to its right. The value on the right\nhand side may be a literal value, another variable storing a value, or\nany legal expression that yields a scalar value, including the result\nof a query (provided that this value is a scalar value). You can\nperform multiple assignments in the same SET statement. You can perform\nmultiple assignments in the same statement-\n\nUnlike =, the := operator is never interpreted as a comparison\noperator. This means you can use := in any valid SQL statement (not\njust in SET statements) to assign a value to a variable.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/assignment-operators.html\n\n','mysql> SELECT @var1, @var2;\n        -> NULL, NULL\nmysql> SELECT @var1 := 1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2 := @var1;\n        -> 1, 1\nmysql> SELECT @var1, @var2;\n        -> 1, 1\n\nmysql> SELECT @var1:=COUNT(*) FROM t1;\n        -> 4\nmysql> SELECT @var1;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.6/en/assignment-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (336,27,'SHOW OPEN TABLES','Syntax:\nSHOW OPEN TABLES [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open\nin the table cache. See\nhttp://dev.mysql.com/doc/refman/5.6/en/table-cache.html. The FROM\nclause, if present, restricts the tables shown to those present in the\ndb_name database. The LIKE clause, if present, indicates which table\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-open-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-open-tables.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (337,32,'EXTRACT','Syntax:\nEXTRACT(unit FROM date)\n\nThe EXTRACT() function uses the same kinds of unit specifiers as\nDATE_ADD() or DATE_SUB(), but extracts parts from the date rather than\nperforming date arithmetic.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT EXTRACT(YEAR FROM \'2009-07-02\');\n       -> 2009\nmysql> SELECT EXTRACT(YEAR_MONTH FROM \'2009-07-02 01:02:03\');\n       -> 200907\nmysql> SELECT EXTRACT(DAY_MINUTE FROM \'2009-07-02 01:02:03\');\n       -> 20102\nmysql> SELECT EXTRACT(MICROSECOND\n    ->                FROM \'2003-01-02 10:30:00.000123\');\n        -> 123\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (338,12,'ENCRYPT','Syntax:\nENCRYPT(str[,salt])\n\nEncrypts str using the Unix crypt() system call and returns a binary\nstring. The salt argument must be a string with at least two characters\nor the result will be NULL. If no salt argument is given, a random\nvalue is used.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','mysql> SELECT ENCRYPT(\'hello\');\n        -> \'VxuFAJXVARROc\'\n','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (339,27,'SHOW STATUS','Syntax:\nSHOW [GLOBAL | SESSION] STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW STATUS provides server status information. This information also\ncan be obtained using the mysqladmin extended-status command. The LIKE\nclause, if present, indicates which variable names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.6/en/extended-show.html.\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern:\n\nmysql> SHOW STATUS LIKE \'Key%\';\n+--------------------+----------+\n| Variable_name      | Value    |\n+--------------------+----------+\n| Key_blocks_used    | 14955    |\n| Key_read_requests  | 96854827 |\n| Key_reads          | 162040   |\n| Key_write_requests | 7589728  |\n| Key_writes         | 3813196  |\n+--------------------+----------+\n\nWith the GLOBAL modifier, SHOW STATUS displays the status values for\nall connections to MySQL. With SESSION, it displays the status values\nfor the current connection. If no modifier is present, the default is\nSESSION. LOCAL is a synonym for SESSION.\n\nSome status variables have only a global value. For these, you get the\nsame value for both GLOBAL and SESSION. The scope for each status\nvariable is listed at\nhttp://dev.mysql.com/doc/refman/5.6/en/server-status-variables.html.\n\nEach invocation of the SHOW STATUS statement uses an internal temporary\ntable and increments the global Created_tmp_tables value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-status.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-status.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (340,14,'INET6_ATON','Syntax:\nINET6_ATON(expr)\n\nGiven an IPv6 or IPv4 network address as a string, returns a binary\nstring that represents the numeric value of the address in network byte\norder (big endian). Because numeric-format IPv6 addresses require more\nbytes than the largest integer type, the representation returned by\nthis function has the VARBINARY data type: VARBINARY(16) for IPv6\naddresses and VARBINARY(4) for IPv4 addresses. If the argument is not a\nvalid address, INET6_ATON() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> SELECT HEX(INET6_ATON(\'fdfe::5a55:caff:fefa:9089\'));\n        -> \'FDFE0000000000005A55CAFFFEFA9089\'\nmysql> SELECT HEX(INET6_ATON(\'10.0.5.9\'));\n        -> \'0A000509\'\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (341,27,'SHOW SLAVE HOSTS','Syntax:\nSHOW SLAVE HOSTS\n\nDisplays a list of replication slaves currently registered with the\nmaster.\n\nSHOW SLAVE HOSTS should be executed on a server that acts as a\nreplication master. The statement displays information about servers\nthat are or have been connected as replication slaves, with each row of\nthe result corresponding to one slave server, as shown here:\n\nmysql> SHOW SLAVE HOSTS;\n+-----------+-----------+-------+-----------+--------------------------------------+\n| Server_id | Host      | Port  | Master_id | Slave_UUID                           |\n+-----------+-----------+-------+-----------+--------------------------------------+\n|  192168010 | iconnect2 | 3306 | 192168011 | 14cb6624-7f93-11e0-b2c0-c80aa9429562 |\n| 1921680101 | athena    | 3306 | 192168011 | 07af4990-f41f-11df-a566-7ac56fdaf645 |\n+------------+-----------+------+-----------+--------------------------------------+\n\no Server_id: The unique server ID of the slave server, as configured in\n  the slave server\'s option file, or on the command line with\n  --server-id=value.\n\no Host: The host name of the slave server, as configured in the slave\n  server\'s option file, or on the command line with\n  --report-host=host_name. Note that this can differ from the machine\n  name as configured in the operating system.\n\no Port: The port on the master to which the slave server is listening.\n\n  In MySQL 5.6.5 and later, a zero in this column means that the slave\n  port (--report-port) was not set. Prior to MySQL 5.6.5, 3306 was used\n  as the default in such cases (Bug #13333431).\n\no Master_id: The unique server ID of the master server that the slave\n  server is replicating from. This is the server ID of the server on\n  which SHOW SLAVE HOSTS is executed, so this same value is listed for\n  each row in the result.\n\no Slave_UUID: The globally unique ID of this slave, as generated on the\n  slave and found in the slave\'s auto.cnf file.\n\n  This column was added in MySQL 5.6.0.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-slave-hosts.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-slave-hosts.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (342,8,'START TRANSACTION','Syntax:\nSTART TRANSACTION\n    [transaction_characteristic [, transaction_characteristic] ...]\n\ntransaction_characteristic:\n    WITH CONSISTENT SNAPSHOT\n  | READ WRITE\n  | READ ONLY\n\nBEGIN [WORK]\nCOMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nSET autocommit = {0 | 1}\n\nThese statements provide control over use of transactions:\n\no START TRANSACTION or BEGIN start a new transaction.\n\no COMMIT commits the current transaction, making its changes permanent.\n\no ROLLBACK rolls back the current transaction, canceling its changes.\n\no SET autocommit disables or enables the default autocommit mode for\n  the current session.\n\nBy default, MySQL runs with autocommit mode enabled. This means that as\nsoon as you execute a statement that updates (modifies) a table, MySQL\nstores the update on disk to make it permanent. The change cannot be\nrolled back.\n\nTo disable autocommit mode implicitly for a single series of\nstatements, use the START TRANSACTION statement:\n\nSTART TRANSACTION;\nSELECT @A:=SUM(salary) FROM table1 WHERE type=1;\nUPDATE table2 SET summary=@A WHERE type=1;\nCOMMIT;\n\nWith START TRANSACTION, autocommit remains disabled until you end the\ntransaction with COMMIT or ROLLBACK. The autocommit mode then reverts\nto its previous state.\n\nSTART TRANSACTION permits several modifiers that control transaction\ncharacteristics. To specify multiple modifiers, separate them by\ncommas.\n\no The WITH CONSISTENT SNAPSHOT modifier starts a consistent read for\n  storage engines that are capable of it. This applies only to InnoDB.\n  The effect is the same as issuing a START TRANSACTION followed by a\n  SELECT from any InnoDB table. See\n  http://dev.mysql.com/doc/refman/5.6/en/innodb-consistent-read.html.\n  The WITH CONSISTENT SNAPSHOT modifier does not change the current\n  transaction isolation level, so it provides a consistent snapshot\n  only if the current isolation level is one that permits a consistent\n  read. The only isolation level that permits a consistent read is\n  REPEATABLE READ. For all other isolation levels, the WITH CONSISTENT\n  SNAPSHOT clause is ignored.\n\no The READ WRITE and READ ONLY modifiers set the transaction access\n  mode. They permit or prohibit changes to tables used in the\n  transaction. The READ ONLY restriction prevents the transaction from\n  modifying or locking both transactional and nontransactional tables\n  that are visible to other transactions; the transaction can still\n  modify or lock temporary tables. These modifiers are available as of\n  MySQL 5.6.5.\n\n  MySQL enables extra optimizations for queries on InnoDB tables when\n  the transaction is known to be read-only. Specifying READ ONLY\n  ensures these optimizations are applied in cases where the read-only\n  status cannot be determined automatically. See\n  http://dev.mysql.com/doc/refman/5.6/en/innodb-performance.html#innodb\n  -performance-ro-txn for more information.\n\n  If no access mode is specified, the default mode applies. Unless the\n  default has been changed, it is read/write. It is not permitted to\n  specify both READ WRITE and READ ONLY in the same statement.\n\n  In read-only mode, it remains possible to change tables created with\n  the TEMPORARY keyword using DML statements. Changes made with DDL\n  statements are not permitted, just as with permanent tables.\n\n  For additional information about transaction access mode, including\n  ways to change the default mode, see [HELP ISOLATION].\n\n  If the read_only system variable is enabled, explicitly starting a\n  transaction with START TRANSACTION READ WRITE requires the SUPER\n  privilege.\n\n*Important*: Many APIs used for writing MySQL client applications (such\nas JDBC) provide their own methods for starting transactions that can\n(and sometimes should) be used instead of sending a START TRANSACTION\nstatement from the client. See\nhttp://dev.mysql.com/doc/refman/5.6/en/connectors-apis.html, or the\ndocumentation for your API, for more information.\n\nTo disable autocommit mode explicitly, use the following statement:\n\nSET autocommit=0;\n\nAfter disabling autocommit mode by setting the autocommit variable to\nzero, changes to transaction-safe tables (such as those for InnoDB or\nNDB) are not made permanent immediately. You must use COMMIT to store\nyour changes to disk or ROLLBACK to ignore the changes.\n\nautocommit is a session variable and must be set for each session. To\ndisable autocommit mode for each new connection, see the description of\nthe autocommit system variable at\nhttp://dev.mysql.com/doc/refman/5.6/en/server-system-variables.html.\n\nBEGIN and BEGIN WORK are supported as aliases of START TRANSACTION for\ninitiating a transaction. START TRANSACTION is standard SQL syntax, is\nthe recommended way to start an ad-hoc transaction, and permits\nmodifiers that BEGIN does not.\n\nThe BEGIN statement differs from the use of the BEGIN keyword that\nstarts a BEGIN ... END compound statement. The latter does not begin a\ntransaction. See [HELP BEGIN END].\n\n*Note*: Within all stored programs (stored procedures and functions,\ntriggers, and events), the parser treats BEGIN [WORK] as the beginning\nof a BEGIN ... END block. Begin a transaction in this context with\nSTART TRANSACTION instead.\n\nThe optional WORK keyword is supported for COMMIT and ROLLBACK, as are\nthe CHAIN and RELEASE clauses. CHAIN and RELEASE can be used for\nadditional control over transaction completion. The value of the\ncompletion_type system variable determines the default completion\nbehavior. See\nhttp://dev.mysql.com/doc/refman/5.6/en/server-system-variables.html.\n\nThe AND CHAIN clause causes a new transaction to begin as soon as the\ncurrent one ends, and the new transaction has the same isolation level\nas the just-terminated transaction. The RELEASE clause causes the\nserver to disconnect the current client session after terminating the\ncurrent transaction. Including the NO keyword suppresses CHAIN or\nRELEASE completion, which can be useful if the completion_type system\nvariable is set to cause chaining or release completion by default.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/commit.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/commit.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (343,32,'TIME_FORMAT','Syntax:\nTIME_FORMAT(time,format)\n\nThis is used like the DATE_FORMAT() function, but the format string may\ncontain format specifiers only for hours, minutes, seconds, and\nmicroseconds. Other specifiers produce a NULL value or 0.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT TIME_FORMAT(\'100:00:00\', \'%H %k %h %I %l\');\n        -> \'100 100 04 04 4\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (344,40,'CREATE DATABASE','Syntax:\nCREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n    [create_specification] ...\n\ncreate_specification:\n    [DEFAULT] CHARACTER SET [=] charset_name\n  | [DEFAULT] COLLATE [=] collation_name\n\nCREATE DATABASE creates a database with the given name. To use this\nstatement, you need the CREATE privilege for the database. CREATE\nSCHEMA is a synonym for CREATE DATABASE.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-database.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/create-database.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (345,16,'VAR_POP','Syntax:\nVAR_POP(expr)\n\nReturns the population standard variance of expr. It considers rows as\nthe whole population, not as a sample, so it has the number of rows as\nthe denominator. You can also use VARIANCE(), which is equivalent but\nis not standard SQL.\n\nVAR_POP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (346,38,'CONCAT_WS','Syntax:\nCONCAT_WS(separator,str1,str2,...)\n\nCONCAT_WS() stands for Concatenate With Separator and is a special form\nof CONCAT(). The first argument is the separator for the rest of the\narguments. The separator is added between the strings to be\nconcatenated. The separator can be a string, as can the rest of the\narguments. If the separator is NULL, the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT CONCAT_WS(\',\',\'First name\',\'Second name\',\'Last Name\');\n        -> \'First name,Second name,Last Name\'\nmysql> SELECT CONCAT_WS(\',\',\'First name\',NULL,\'Last Name\');\n        -> \'First name,Last Name\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (347,23,'TEXT','TEXT[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 65,535 (216 - 1) characters. The\neffective maximum length is less if the value contains multi-byte\ncharacters. Each TEXT value is stored using a 2-byte length prefix that\nindicates the number of bytes in the value.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest TEXT type large enough to hold\nvalues M characters long.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (348,20,'~','Syntax:\n~\n\nInvert all bits.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html\n\n','mysql> SELECT 5 & ~1;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (349,4,'ASIN','Syntax:\nASIN(X)\n\nReturns the arc sine of X, that is, the value whose sine is X. Returns\nNULL if X is not in the range -1 to 1.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT ASIN(0.2);\n        -> 0.20135792079033\nmysql> SELECT ASIN(\'foo\');\n\n+-------------+\n| ASIN(\'foo\') |\n+-------------+\n|           0 |\n+-------------+\n1 row in set, 1 warning (0.00 sec)\n\nmysql> SHOW WARNINGS;\n+---------+------+-----------------------------------------+\n| Level   | Code | Message                                 |\n+---------+------+-----------------------------------------+\n| Warning | 1292 | Truncated incorrect DOUBLE value: \'foo\' |\n+---------+------+-----------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (350,17,'ROW_COUNT','Syntax:\nROW_COUNT()\n\nIn MySQL 5.6, ROW_COUNT() returns a value as follows:\n\no DDL statements: 0. This applies to statements such as CREATE TABLE or\n  DROP TABLE.\n\no DML statements other than SELECT: The number of affected rows. This\n  applies to statements such as UPDATE, INSERT, or DELETE (as before),\n  but now also to statements such as ALTER TABLE and LOAD DATA INFILE.\n\no SELECT: -1 if the statement returns a result set, or the number of\n  rows "affected" if it does not. For example, for SELECT * FROM t1,\n  ROW_COUNT() returns -1. For SELECT * FROM t1 INTO OUTFILE\n  \'file_name\', ROW_COUNT() returns the number of rows written to the\n  file.\n\no SIGNAL statements: 0.\n\nFor UPDATE statements, the affected-rows value by default is the number\nof rows actually changed. If you specify the CLIENT_FOUND_ROWS flag to\nmysql_real_connect() when connecting to mysqld, the affected-rows value\nis the number of rows "found"; that is, matched by the WHERE clause.\n\nFor REPLACE statements, the affected-rows value is 2 if the new row\nreplaced an old row, because in this case, one row was inserted after\nthe duplicate was deleted.\n\nFor INSERT ... ON DUPLICATE KEY UPDATE statements, the affected-rows\nvalue per row is 1 if the row is inserted as a new row, 2 if an\nexisting row is updated, and 0 if an existing row is set to its current\nvalues. If you specify the CLIENT_FOUND_ROWS flag, the affected-rows\nvalue is 1 (not 0) if an existing row is set to its current values.\n\nThe ROW_COUNT() value is similar to the value from the\nmysql_affected_rows() C API function and the row count that the mysql\nclient displays following statement execution.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','mysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           3 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> DELETE FROM t WHERE i IN(1,2);\nQuery OK, 2 rows affected (0.00 sec)\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           2 |\n+-------------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (351,4,'SIGN','Syntax:\nSIGN(X)\n\nReturns the sign of the argument as -1, 0, or 1, depending on whether X\nis negative, zero, or positive.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT SIGN(-32);\n        -> -1\nmysql> SELECT SIGN(0);\n        -> 0\nmysql> SELECT SIGN(234);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (352,23,'FLOAT','FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA small (single-precision) floating-point number. Permissible values\nare -3.402823466E+38 to -1.175494351E-38, 0, and 1.175494351E-38 to\n3.402823466E+38. These are the theoretical limits, based on the IEEE\nstandard. The actual range might be slightly smaller depending on your\nhardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits permitted by the hardware. A single-precision floating-point\nnumber is accurate to approximately 7 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nUsing FLOAT might give you some unexpected problems because all\ncalculations in MySQL are done with double precision. See\nhttp://dev.mysql.com/doc/refman/5.6/en/no-matching-rows.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (353,17,'CHARSET','Syntax:\nCHARSET(str)\n\nReturns the character set of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','mysql> SELECT CHARSET(\'abc\');\n        -> \'latin1\'\nmysql> SELECT CHARSET(CONVERT(\'abc\' USING utf8));\n        -> \'utf8\'\nmysql> SELECT CHARSET(USER());\n        -> \'utf8\'\n','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (354,32,'SUBDATE','Syntax:\nSUBDATE(date,INTERVAL expr unit), SUBDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, SUBDATE()\nis a synonym for DATE_SUB(). For information on the INTERVAL unit\nargument, see the discussion for DATE_ADD().\n\nmysql> SELECT DATE_SUB(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2007-12-02\'\nmysql> SELECT SUBDATE(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2007-12-02\'\n\nThe second form enables the use of an integer value for days. In such\ncases, it is interpreted as the number of days to be subtracted from\nthe date or datetime expression expr.\n\nmysql> SELECT SUBDATE(\'2008-01-02 12:00:00\', 31);\n        -> \'2007-12-02 12:00:00\'\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (355,32,'DAYOFYEAR','Syntax:\nDAYOFYEAR(date)\n\nReturns the day of the year for date, in the range 1 to 366.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFYEAR(\'2007-02-03\');\n        -> 34\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (356,4,'%','Syntax:\nN % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M. For more\ninformation, see the description for the MOD() function in\nhttp://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (357,3,'ASTEXT','AsText(g), AsWKT(g)\n\nConverts a value in internal geometry format to its WKT representation\nand returns the string result.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-to-convert-geometries-between-formats.html\n\n','mysql> SET @g = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(GeomFromText(@g));\n+--------------------------+\n| AsText(GeomFromText(@g)) |\n+--------------------------+\n| LINESTRING(1 1,2 2,3 3)  |\n+--------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/functions-to-convert-geometries-between-formats.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (358,24,'DECLARE CONDITION','Syntax:\nDECLARE condition_name CONDITION FOR condition_value\n\ncondition_value:\n    mysql_error_code\n  | SQLSTATE [VALUE] sqlstate_value\n\nThe DECLARE ... CONDITION statement declares a named error condition,\nassociating a name with a condition that needs specific handling. The\nname can be referred to in a subsequent DECLARE ... HANDLER statement\n(see [HELP DECLARE HANDLER]).\n\nCondition declarations must appear before cursor or handler\ndeclarations.\n\nThe condition_value for DECLARE ... CONDITION can be a MySQL error code\n(a number) or an SQLSTATE value (a 5-character string literal). You\nshould not use MySQL error code 0 or SQLSTATE values that begin with\n\'00\', because those indicate success rather than an error condition.\nFor a list of MySQL error codes and SQLSTATE values, see\nhttp://dev.mysql.com/doc/refman/5.6/en/error-messages-server.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/declare-condition.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/declare-condition.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (359,32,'MONTHNAME','Syntax:\nMONTHNAME(date)\n\nReturns the full name of the month for date. The language used for the\nname is controlled by the value of the lc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.6/en/locale-support.html).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT MONTHNAME(\'2008-02-03\');\n        -> \'February\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (360,26,'NUMGEOMETRIES','NumGeometries(gc)\n\nReturns the number of geometries in the GeometryCollection value gc.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT NumGeometries(GeomFromText(@gc));\n+----------------------------------+\n| NumGeometries(GeomFromText(@gc)) |\n+----------------------------------+\n|                                2 |\n+----------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (361,32,'TIMESTAMP FUNCTION','Syntax:\nTIMESTAMP(expr), TIMESTAMP(expr1,expr2)\n\nWith a single argument, this function returns the date or datetime\nexpression expr as a datetime value. With two arguments, it adds the\ntime expression expr2 to the date or datetime expression expr1 and\nreturns the result as a datetime value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMP(\'2003-12-31\');\n        -> \'2003-12-31 00:00:00\'\nmysql> SELECT TIMESTAMP(\'2003-12-31 12:00:00\',\'12:00:00\');\n        -> \'2004-01-01 00:00:00\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (362,40,'DROP DATABASE','Syntax:\nDROP {DATABASE | SCHEMA} [IF EXISTS] db_name\n\nDROP DATABASE drops all tables in the database and deletes the\ndatabase. Be very careful with this statement! To use DROP DATABASE,\nyou need the DROP privilege on the database. DROP SCHEMA is a synonym\nfor DROP DATABASE.\n\n*Important*: When a database is dropped, user privileges on the\ndatabase are not automatically dropped. See [HELP GRANT].\n\nIF EXISTS is used to prevent an error from occurring if the database\ndoes not exist.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-database.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-database.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (363,8,'CHANGE MASTER TO','Syntax:\nCHANGE MASTER TO option [, option] ...\n\noption:\n    MASTER_BIND = \'interface_name\'\n  | MASTER_HOST = \'host_name\'\n  | MASTER_USER = \'user_name\'\n  | MASTER_PASSWORD = \'password\'\n  | MASTER_PORT = port_num\n  | MASTER_CONNECT_RETRY = interval\n  | MASTER_RETRY_COUNT = count\n  | MASTER_DELAY = interval\n  | MASTER_HEARTBEAT_PERIOD = interval\n  | MASTER_LOG_FILE = \'master_log_name\'\n  | MASTER_LOG_POS = master_log_pos\n  | MASTER_AUTO_POSITION = {0|1}\n  | RELAY_LOG_FILE = \'relay_log_name\'\n  | RELAY_LOG_POS = relay_log_pos\n  | MASTER_SSL = {0|1}\n  | MASTER_SSL_CA = \'ca_file_name\'\n  | MASTER_SSL_CAPATH = \'ca_directory_name\'\n  | MASTER_SSL_CERT = \'cert_file_name\'\n  | MASTER_SSL_CRL = \'crl_file_name\'\n  | MASTER_SSL_CRLPATH = \'crl_directory_name\'\n  | MASTER_SSL_KEY = \'key_file_name\'\n  | MASTER_SSL_CIPHER = \'cipher_list\'\n  | MASTER_SSL_VERIFY_SERVER_CERT = {0|1}\n  | IGNORE_SERVER_IDS = (server_id_list)\n\nserver_id_list:\n    [server_id [, server_id] ... ]\n\nCHANGE MASTER TO changes the parameters that the slave server uses for\nconnecting to the master server, for reading the master binary log, and\nreading the slave relay log. It also updates the contents of the master\ninfo and relay log info repositories (see\nhttp://dev.mysql.com/doc/refman/5.6/en/slave-logs.html). To use CHANGE\nMASTER TO, the slave replication threads must be stopped (use STOP\nSLAVE if necessary). In MySQL 5.6.11 and later, gtid_next must also be\nset to AUTOMATIC (Bug #16062608).\n\nOptions not specified retain their value, except as indicated in the\nfollowing discussion. Thus, in most cases, there is no need to specify\noptions that do not change. For example, if the password to connect to\nyour MySQL master has changed, you just need to issue these statements\nto tell the slave about the new password:\n\nSTOP SLAVE; -- if replication was running\nCHANGE MASTER TO MASTER_PASSWORD=\'new3cret\';\nSTART SLAVE; -- if you want to restart replication\n\nMASTER_HOST, MASTER_USER, MASTER_PASSWORD, and MASTER_PORT provide\ninformation to the slave about how to connect to its master:\n\no MASTER_HOST and MASTER_PORT are the host name (or IP address) of the\n  master host and its TCP/IP port.\n\n  *Note*: Replication cannot use Unix socket files. You must be able to\n  connect to the master MySQL server using TCP/IP.\n\n  If you specify the MASTER_HOST or MASTER_PORT option, the slave\n  assumes that the master server is different from before (even if the\n  option value is the same as its current value.) In this case, the old\n  values for the master binary log file name and position are\n  considered no longer applicable, so if you do not specify\n  MASTER_LOG_FILE and MASTER_LOG_POS in the statement,\n  MASTER_LOG_FILE=\'\' and MASTER_LOG_POS=4 are silently appended to it.\n\n  Setting MASTER_HOST=\'\' (that is, setting its value explicitly to an\n  empty string) is not the same as not setting MASTER_HOST at all.\n  Beginning with MySQL 5.5, trying to set MASTER_HOST to an empty\n  string fails with an error. Previously, setting MASTER_HOST to an\n  empty string caused START SLAVE subsequently to fail. (Bug #28796)\n\n  In MySQL 5.6.5 and later, values used for MASTER_HOST and other\n  CHANGE MASTER TO options are checked for linefeed (\\n or 0x0A)\n  characters; the presence of such characters in these values causes\n  the statement to fail with ER_MASTER_INFO. (Bug #11758581, Bug\n  #50801)\n\no MASTER_USER and MASTER_PASSWORD are the user name and password of the\n  account to use for connecting to the master.\n\n  In MySQL 5.6.4 and later, MASTER_USER cannot be made empty; setting\n  MASTER_USER = \'\' or leaving it unset when setting a value for for\n  MASTER_PASSWORD causes an error (Bug #13427949).\n\n  Currently, a password used for a replication slave account is\n  effectively limited to 32 characters in length; if the password is\n  longer, any excess characters are truncated. This is not due to any\n  limit imposed by the MySQL Server generally, but rather is an issue\n  specific to MySQL Replication. (For more information, see Bug\n  #43439.)\n\n  The text of a running CHANGE MASTER TO statement, including values\n  for MASTER_USER and MASTER_PASSWORD, can be seen in the output of a\n  concurrent SHOW PROCESSLIST statement. (The complete text of a START\n  SLAVE statement is also visible to SHOW PROCESSLIST.)\n\nThe MASTER_SSL_xxx options provide information about using SSL for the\nconnection. They correspond to the --ssl-xxx options described in\nhttp://dev.mysql.com/doc/refman/5.6/en/ssl-options.html, and\nhttp://dev.mysql.com/doc/refman/5.6/en/replication-solutions-ssl.html.\nThese options can be changed even on slaves that are compiled without\nSSL support. They are saved to the master info repository, but are\nignored if the slave does not have SSL support enabled. MASTER_SSL_CRL\nand MASTER_SSL_CRLPATH were added in MySQL 5.6.3.\n\nMASTER_CONNECT_RETRY specifies how many seconds to wait between connect\nretries. The default is 60.\n\nMASTER_RETRY_COUNT, added in MySQL 5.6.1, limits the number of\nreconnection attempts and updates the value of the Master_Retry_Count\ncolumn in the output of SHOW SLAVE STATUS (also added in MySQL 5.6.1).\nThe default value is 24 * 3600 = 86400. MASTER_RETRY_COUNT is intended\nto replace the older --master-retry-count server option, and is now the\npreferred method for setting this limit. You are encouraged not to rely\non --master-retry-count in new applications and, when upgrading to\nMySQL 5.6.1 or later from earlier versions of MySQL, to update any\nexisting applications that rely on it, so that they use CHANGE MASTER\nTO ... MASTER_RETRY_COUNT instead.\n\nMASTER_DELAY specifies how many seconds behind the master the slave\nmust lag. An event received from the master is not executed until at\nleast interval seconds later than its execution on the master. The\ndefault is 0. An error occurs if interval is not a nonnegative integer\nin the range from 0 to 231-1. For more information, see\nhttp://dev.mysql.com/doc/refman/5.6/en/replication-delayed.html. This\noption was added in MySQL 5.6.0.\n\nMASTER_BIND is for use on replication slaves having multiple network\ninterfaces, and determines which of the slave\'s network interfaces is\nchosen for connecting to the master.\n\nThe address configured with this option, if any, can be seen in the\nMaster_Bind column of the output from SHOW SLAVE STATUS. If you are\nusing slave status log tables (server started with\n--master-info-repository=TABLE), the value can also be seen as the\nMaster_bind column of the mysql.slave_master_info table.\n\nThe ability to bind a replication slave to a specific network interface\nwas added in MySQL 5.6.2. This is also supported by MySQL Cluster NDB\n7.3.1 and later.\n\nMASTER_HEARTBEAT_PERIOD sets the interval in seconds between\nreplication heartbeats. Whenever the master\'s binary log is updated\nwith an event, the waiting period for the next heartbeat is reset.\ninterval is a decimal value having the range 0 to 4294967 seconds and a\nresolution in milliseconds; the smallest nonzero value is 0.001.\nHeartbeats are sent by the master only if there are no unsent events in\nthe binary log file for a period longer than interval.\n\nIf you are logging master connection information to tables,\nMASTER_HEARTBEAT_PERIOD can be seen as the value of the Heartbeat\ncolumn of the mysql.slave_master_info table.\n\nSetting interval to 0 disables heartbeats altogether. The default value\nfor interval is equal to the value of slave_net_timeout divided by 2.\n\nSetting @@global.slave_net_timeout to a value less than that of the\ncurrent heartbeat interval results in a warning being issued. The\neffect of issuing RESET SLAVE on the heartbeat interval is to reset it\nto the default value.\n\nMASTER_LOG_FILE and MASTER_LOG_POS are the coordinates at which the\nslave I/O thread should begin reading from the master the next time the\nthread starts. RELAY_LOG_FILE and RELAY_LOG_POS are the coordinates at\nwhich the slave SQL thread should begin reading from the relay log the\nnext time the thread starts. If you specify either of MASTER_LOG_FILE\nor MASTER_LOG_POS, you cannot specify RELAY_LOG_FILE or RELAY_LOG_POS.\nIn MySQL 5.6.5 and later, if you specify either of MASTER_LOG_FILE or\nMASTER_LOG_POS, you also cannot specify MASTER_AUTO_POSITION = 1\n(described later in this section). If neither of MASTER_LOG_FILE or\nMASTER_LOG_POS is specified, the slave uses the last coordinates of the\nslave SQL thread before CHANGE MASTER TO was issued. This ensures that\nthere is no discontinuity in replication, even if the slave SQL thread\nwas late compared to the slave I/O thread, when you merely want to\nchange, say, the password to use.\n\nMASTER_AUTO_POSITION was added in MySQL 5.6.5. If MASTER_AUTO_POSITION\n= 1 is used with CHANGE MASTER TO, the slave attempts to connect to the\nmaster using the GTID-based replication protocol.\n\nWhen using GTIDs, the slave tells the master which transactions it has\nalready received, executed, or both. To compute this set, it reads the\nglobal value of gtid_executed and the value of the Retrieved_gtid_set\ncolumn from SHOW SLAVE STATUS. Since the GTID of the last transmitted\ntransaction is included in Retrieved_gtid_set even if the transaction\nwas only partially transmitted, the last received GTID is subtracted\nfrom this set. Thus, the slave computes the following set:\n\nUNION(@@global.gtid_executed, Retrieved_gtid_set - last_received_GTID)\n\nThis set is sent to the master as part of the initial handshake, and\nthe master sends back all transactions that it has executed which are\nnot part of the set. If any of these transactions have been already\npurged from the master\'s binary log, the master sends the error\nER_MASTER_HAS_PURGED_REQUIRED_GTIDS to the slave, and replication does\nnot start.\n\nWhen GTID-based replication is employed, the coordinates represented by\nMASTER_LOG_FILE and MASTER_LOG_POS are not used, and global transaction\nidentifiers are used instead. Thus the use of either or both of these\noptions together with MASTER_AUTO_POSITION causes an error.\n\nBeginning with MySQL 5.6.10, you can see whether replication is running\nwith autopositioning enabled by checking the output of SHOW SLAVE\nSTATUS. (Bug #15992220)\n\ngtid_mode must also be enabled before issuing CHANGE MASTER TO ...\nMASTER_AUTO_POSITION = 1. Otherwise, the statement fails with an error.\n\nTo revert to the older file-based replication protocol after using\nGTIDs, you can issue a new CHANGE MASTER TO statement that specifies\nMASTER_AUTO_POSITION = 0, as well as at least one of MASTER_LOG_FILE or\nMASTER_LOG_POSITION.\n\nCHANGE MASTER TO deletes all relay log files and starts a new one,\nunless you specify RELAY_LOG_FILE or RELAY_LOG_POS. In that case, relay\nlog files are kept; the relay_log_purge global variable is set silently\nto 0.\n\nPrior to MySQL 5.6.2, RELAY_LOG_FILE required an absolute path.\nBeginning with MySQL 5.6.2, the path can be relative, in which case it\nis assumed to be relative to the slave\'s data directory. (Bug #12190)\n\nIGNORE_SERVER_IDS takes a comma-separated list of 0 or more server IDs.\nEvents originating from the corresponding servers are ignored, with the\nexception of log rotation and deletion events, which are still recorded\nin the relay log.\n\nIn circular replication, the originating server normally acts as the\nterminator of its own events, so that they are not applied more than\nonce. Thus, this option is useful in circular replication when one of\nthe servers in the circle is removed. Suppose that you have a circular\nreplication setup with 4 servers, having server IDs 1, 2, 3, and 4, and\nserver 3 fails. When bridging the gap by starting replication from\nserver 2 to server 4, you can include IGNORE_SERVER_IDS = (3) in the\nCHANGE MASTER TO statement that you issue on server 4 to tell it to use\nserver 2 as its master instead of server 3. Doing so causes it to\nignore and not to propagate any statements that originated with the\nserver that is no longer in use.\n\nIf a CHANGE MASTER TO statement is issued without any IGNORE_SERVER_IDS\noption, any existing list is preserved; RESET SLAVE also has no effect\non the server ID list. To clear the list of ignored servers, it is\nnecessary to use the option with an empty list:\n\nCHANGE MASTER TO IGNORE_SERVER_IDS = ();\n\nIf IGNORE_SERVER_IDS contains the server\'s own ID and the server was\nstarted with the --replicate-same-server-id option enabled, an error\nresults.\n\nIn MySQL 5.6, the master info repository and the output of SHOW SLAVE\nSTATUS provide the list of servers that are currently ignored. For more\ninformation, see\nhttp://dev.mysql.com/doc/refman/5.6/en/slave-logs-status.html, and\n[HELP SHOW SLAVE STATUS].\n\nIn MySQL 5.6, invoking CHANGE MASTER TO causes the previous values for\nMASTER_HOST, MASTER_PORT, MASTER_LOG_FILE, and MASTER_LOG_POS to be\nwritten to the error log, along with other information about the\nslave\'s state prior to execution.\n\nIn MySQL 5.6.7 and later, CHANGE MASTER TO causes an implicit commit of\nan ongoing transaction. See\nhttp://dev.mysql.com/doc/refman/5.6/en/implicit-commit.html.\n\nCHANGE MASTER TO is useful for setting up a slave when you have the\nsnapshot of the master and have recorded the master binary log\ncoordinates corresponding to the time of the snapshot. After loading\nthe snapshot into the slave to synchronize it with the master, you can\nrun CHANGE MASTER TO MASTER_LOG_FILE=\'log_name\', MASTER_LOG_POS=log_pos\non the slave to specify the coordinates at which the slave should begin\nreading the master binary log.\n\nThe following example changes the master server the slave uses and\nestablishes the master binary log coordinates from which the slave\nbegins reading. This is used when you want to set up the slave to\nreplicate the master:\n\nCHANGE MASTER TO\n  MASTER_HOST=\'master2.mycompany.com\',\n  MASTER_USER=\'replication\',\n  MASTER_PASSWORD=\'bigs3cret\',\n  MASTER_PORT=3306,\n  MASTER_LOG_FILE=\'master2-bin.001\',\n  MASTER_LOG_POS=4,\n  MASTER_CONNECT_RETRY=10;\n\nThe next example shows an operation that is less frequently employed.\nIt is used when the slave has relay log files that you want it to\nexecute again for some reason. To do this, the master need not be\nreachable. You need only use CHANGE MASTER TO and start the SQL thread\n(START SLAVE SQL_THREAD):\n\nCHANGE MASTER TO\n  RELAY_LOG_FILE=\'slave-relay-bin.006\',\n  RELAY_LOG_POS=4025;\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/change-master-to.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/change-master-to.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (364,27,'SHOW GRANTS','Syntax:\nSHOW GRANTS [FOR user]\n\nThis statement lists the GRANT statement or statements that must be\nissued to duplicate the privileges that are granted to a MySQL user\naccount. The account is named using the same format as for the GRANT\nstatement; for example, \'jeffrey\'@\'localhost\'. If you specify only the\nuser name part of the account name, a host name part of \'%\' is used.\nFor additional information about specifying account names, see [HELP\nGRANT].\n\nmysql> SHOW GRANTS FOR \'root\'@\'localhost\';\n+---------------------------------------------------------------------+\n| Grants for root@localhost                                           |\n+---------------------------------------------------------------------+\n| GRANT ALL PRIVILEGES ON *.* TO \'root\'@\'localhost\' WITH GRANT OPTION |\n+---------------------------------------------------------------------+\n\nTo list the privileges granted to the account that you are using to\nconnect to the server, you can use any of the following statements:\n\nSHOW GRANTS;\nSHOW GRANTS FOR CURRENT_USER;\nSHOW GRANTS FOR CURRENT_USER();\n\nIf SHOW GRANTS FOR CURRENT_USER (or any of the equivalent syntaxes) is\nused in DEFINER context, such as within a stored procedure that is\ndefined with SQL SECURITY DEFINER), the grants displayed are those of\nthe definer and not the invoker.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-grants.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-grants.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (365,4,'CRC32','Syntax:\nCRC32(expr)\n\nComputes a cyclic redundancy check value and returns a 32-bit unsigned\nvalue. The result is NULL if the argument is NULL. The argument is\nexpected to be a string and (if possible) is treated as one if it is\nnot.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT CRC32(\'MySQL\');\n        -> 3259397556\nmysql> SELECT CRC32(\'mysql\');\n        -> 2501908538\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (366,13,'STARTPOINT','StartPoint(ls)\n\nReturns the Point that is the start point of the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(StartPoint(GeomFromText(@ls)));\n+---------------------------------------+\n| AsText(StartPoint(GeomFromText(@ls))) |\n+---------------------------------------+\n| POINT(1 1)                            |\n+---------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (367,3,'MPOLYFROMTEXT','MPolyFromText(wkt[,srid]), MultiPolygonFromText(wkt[,srid])\n\nConstructs a MULTIPOLYGON value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (368,24,'DECLARE VARIABLE','Syntax:\nDECLARE var_name [, var_name] ... type [DEFAULT value]\n\nThis statement declares local variables within stored programs. To\nprovide a default value for a variable, include a DEFAULT clause. The\nvalue can be specified as an expression; it need not be a constant. If\nthe DEFAULT clause is missing, the initial value is NULL.\n\nLocal variables are treated like stored routine parameters with respect\nto data type and overflow checking. See [HELP CREATE PROCEDURE].\n\nVariable declarations must appear before cursor or handler\ndeclarations.\n\nLocal variable names are not case sensitive. Permissible characters and\nquoting rules are the same as for other identifiers, as described in\nhttp://dev.mysql.com/doc/refman/5.6/en/identifiers.html.\n\nThe scope of a local variable is the BEGIN ... END block within which\nit is declared. The variable can be referred to in blocks nested within\nthe declaring block, except those blocks that declare a variable with\nthe same name.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/declare-local-variable.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/declare-local-variable.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (369,19,'NOT BETWEEN','Syntax:\nexpr NOT BETWEEN min AND max\n\nThis is the same as NOT (expr BETWEEN min AND max).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (370,32,'YEARWEEK','Syntax:\nYEARWEEK(date), YEARWEEK(date,mode)\n\nReturns year and week for a date. The mode argument works exactly like\nthe mode argument to WEEK(). The year in the result may be different\nfrom the year in the date argument for the first and the last week of\nthe year.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT YEARWEEK(\'1987-01-01\');\n        -> 198653\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (371,16,'BIT_OR','Syntax:\nBIT_OR(expr)\n\nReturns the bitwise OR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (372,4,'LOG10','Syntax:\nLOG10(X)\n\nReturns the base-10 logarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT LOG10(2);\n        -> 0.30102999566398\nmysql> SELECT LOG10(100);\n        -> 2\nmysql> SELECT LOG10(-100);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (373,23,'DECIMAL','DECIMAL[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nA packed "exact" fixed-point number. M is the total number of digits\n(the precision) and D is the number of digits after the decimal point\n(the scale). The decimal point and (for negative numbers) the "-" sign\nare not counted in M. If D is 0, values have no decimal point or\nfractional part. The maximum number of digits (M) for DECIMAL is 65.\nThe maximum number of supported decimals (D) is 30. If D is omitted,\nthe default is 0. If M is omitted, the default is 10.\n\nUNSIGNED, if specified, disallows negative values.\n\nAll basic calculations (+, -, *, /) with DECIMAL columns are done with\na precision of 65 digits.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (374,40,'CREATE FUNCTION','The CREATE FUNCTION statement is used to create stored functions and\nuser-defined functions (UDFs):\n\no For information about creating stored functions, see [HELP CREATE\n  PROCEDURE].\n\no For information about creating user-defined functions, see [HELP\n  CREATE FUNCTION UDF].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-function.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/create-function.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (375,19,'<','Syntax:\n<\n\nLess than:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 2 < 2;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (376,12,'MD5','Syntax:\nMD5(str)\n\nCalculates an MD5 128-bit checksum for the string. The value is\nreturned as a string of 32 hex digits, or NULL if the argument was\nNULL. The return value can, for example, be used as a hash key. See the\nnotes at the beginning of this section about storing hash values\nefficiently.\n\nThe return value is a nonbinary string in the connection character set.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','mysql> SELECT MD5(\'testing\');\n        -> \'ae2b1fca515949e5d54fb22b8ed95575\'\n','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (377,32,'DAYOFMONTH','Syntax:\nDAYOFMONTH(date)\n\nReturns the day of the month for date, in the range 1 to 31, or 0 for\ndates such as \'0000-00-00\' or \'2008-00-00\' that have a zero day part.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFMONTH(\'2007-02-03\');\n        -> 3\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (378,32,'UNIX_TIMESTAMP','Syntax:\nUNIX_TIMESTAMP(), UNIX_TIMESTAMP(date)\n\nIf called with no argument, returns a Unix timestamp (seconds since\n\'1970-01-01 00:00:00\' UTC) as an unsigned integer. If UNIX_TIMESTAMP()\nis called with a date argument, it returns the value of the argument as\nseconds since \'1970-01-01 00:00:00\' UTC. date may be a DATE string, a\nDATETIME string, a TIMESTAMP, or a number in the format YYMMDD or\nYYYYMMDD. The server interprets date as a value in the current time\nzone and converts it to an internal value in UTC. Clients can set their\ntime zone as described in\nhttp://dev.mysql.com/doc/refman/5.6/en/time-zone-support.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT UNIX_TIMESTAMP();\n        -> 1196440210\nmysql> SELECT UNIX_TIMESTAMP(\'2007-11-30 10:30:19\');\n        -> 1196440219\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (379,10,'RENAME USER','Syntax:\nRENAME USER old_user TO new_user\n    [, old_user TO new_user] ...\n\nThe RENAME USER statement renames existing MySQL accounts. An error\noccurs for old accounts that do not exist or new accounts that already\nexist. To use this statement, you must have the global CREATE USER\nprivilege or the UPDATE privilege for the mysql database.\n\nEach account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.6/en/account-names.html. For example:\n\nRENAME USER \'jeffrey\'@\'localhost\' TO \'jeff\'@\'127.0.0.1\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nRENAME USER causes the privileges held by the old user to be those held\nby the new user. However, RENAME USER does not automatically drop or\ninvalidate databases or objects within them that the old user created.\nThis includes stored programs or views for which the DEFINER attribute\nnames the old user. Attempts to access such objects may produce an\nerror if they execute in definer security context. (For information\nabout security context, see\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-programs-security.html.)\n\nThe privilege changes take effect as indicated in\nhttp://dev.mysql.com/doc/refman/5.6/en/privilege-changes.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/rename-user.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/rename-user.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (380,13,'NUMPOINTS','NumPoints(ls)\n\nReturns the number of Point objects in the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT NumPoints(GeomFromText(@ls));\n+------------------------------+\n| NumPoints(GeomFromText(@ls)) |\n+------------------------------+\n|                            3 |\n+------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (381,40,'ALTER LOGFILE GROUP','Syntax:\nALTER LOGFILE GROUP logfile_group\n    ADD UNDOFILE \'file_name\'\n    [INITIAL_SIZE [=] size]\n    [WAIT]\n    ENGINE [=] engine_name\n\nThis statement adds an UNDO file named \'file_name\' to an existing log\nfile group logfile_group. An ALTER LOGFILE GROUP statement has one and\nonly one ADD UNDOFILE clause. No DROP UNDOFILE clause is currently\nsupported.\n\n*Note*: All MySQL Cluster Disk Data objects share the same namespace.\nThis means that each Disk Data object must be uniquely named (and not\nmerely each Disk Data object of a given type). For example, you cannot\nhave a tablespace and an undo log file with the same name, or an undo\nlog file and a data file with the same name.\n\nThe optional INITIAL_SIZE parameter sets the UNDO file\'s initial size\nin bytes; if not specified, the initial size default to 128M (128\nmegabytes). You may optionally follow size with a one-letter\nabbreviation for an order of magnitude, similar to those used in\nmy.cnf. Generally, this is one of the letters M (for megabytes) or G\n(for gigabytes).\n\nOn 32-bit systems, the maximum supported value for INITIAL_SIZE is 4G.\n(Bug #29186)\n\nThe minimum permitted value for INITIAL_SIZE is 1M. (Bug #29574)\n\n*Note*: WAIT is parsed but otherwise ignored. This keyword currently\nhas no effect, and is intended for future expansion.\n\nThe ENGINE parameter (required) determines the storage engine which is\nused by this log file group, with engine_name being the name of the\nstorage engine. Currently, the only accepted values for engine_name are\n"NDBCLUSTER" and "NDB". The two values are equivalent.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/alter-logfile-group.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/alter-logfile-group.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (382,32,'LOCALTIMESTAMP','Syntax:\nLOCALTIMESTAMP, LOCALTIMESTAMP([fsp])\n\nLOCALTIMESTAMP and LOCALTIMESTAMP() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (383,32,'ADDDATE','Syntax:\nADDDATE(date,INTERVAL expr unit), ADDDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, ADDDATE()\nis a synonym for DATE_ADD(). The related function SUBDATE() is a\nsynonym for DATE_SUB(). For information on the INTERVAL unit argument,\nsee the discussion for DATE_ADD().\n\nmysql> SELECT DATE_ADD(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2008-02-02\'\nmysql> SELECT ADDDATE(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2008-02-02\'\n\nWhen invoked with the days form of the second argument, MySQL treats it\nas an integer number of days to be added to expr.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT ADDDATE(\'2008-01-02\', 31);\n        -> \'2008-02-02\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (384,40,'ALTER FUNCTION','Syntax:\nALTER FUNCTION func_name [characteristic ...]\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nThis statement can be used to change the characteristics of a stored\nfunction. More than one change may be specified in an ALTER FUNCTION\nstatement. However, you cannot change the parameters or body of a\nstored function using this statement; to make such changes, you must\ndrop and re-create the function using DROP FUNCTION and CREATE\nFUNCTION.\n\nYou must have the ALTER ROUTINE privilege for the function. (That\nprivilege is granted automatically to the function creator.) If binary\nlogging is enabled, the ALTER FUNCTION statement might also require the\nSUPER privilege, as described in\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-programs-logging.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/alter-function.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/alter-function.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (385,14,'IS_FREE_LOCK','Syntax:\nIS_FREE_LOCK(str)\n\nChecks whether the lock named str is free to use (that is, not locked).\nReturns 1 if the lock is free (no one is using the lock), 0 if the lock\nis in use, and NULL if an error occurs (such as an incorrect argument).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (386,8,'DEALLOCATE PREPARE','Syntax:\n{DEALLOCATE | DROP} PREPARE stmt_name\n\nTo deallocate a prepared statement produced with PREPARE, use a\nDEALLOCATE PREPARE statement that refers to the prepared statement\nname. Attempting to execute a prepared statement after deallocating it\nresults in an error. If too many prepared statements are created and\nnot deallocated by either the DEALLOCATE PREPARE statement or the end\nof the session, you might encounter the upper limit enforced by the\nmax_prepared_stmt_count system variable.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/deallocate-prepare.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/deallocate-prepare.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (387,31,'TOUCHES','Touches(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially touches g2. Two\ngeometries spatially touch if the interiors of the geometries do not\nintersect, but the boundary of one of the geometries intersects either\nthe boundary or the interior of the other.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (388,23,'AUTO_INCREMENT','The AUTO_INCREMENT attribute can be used to generate a unique identity\nfor new rows:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/example-auto-increment.html\n\n','CREATE TABLE animals (\n     id MEDIUMINT NOT NULL AUTO_INCREMENT,\n     name CHAR(30) NOT NULL,\n     PRIMARY KEY (id)\n);\n\nINSERT INTO animals (name) VALUES\n    (\'dog\'),(\'cat\'),(\'penguin\'),\n    (\'lax\'),(\'whale\'),(\'ostrich\');\n\nSELECT * FROM animals;\n','http://dev.mysql.com/doc/refman/5.6/en/example-auto-increment.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (389,12,'UNCOMPRESS','Syntax:\nUNCOMPRESS(string_to_uncompress)\n\nUncompresses a string compressed by the COMPRESS() function. If the\nargument is not a compressed value, the result is NULL. This function\nrequires MySQL to have been compiled with a compression library such as\nzlib. Otherwise, the return value is always NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','mysql> SELECT UNCOMPRESS(COMPRESS(\'any string\'));\n        -> \'any string\'\nmysql> SELECT UNCOMPRESS(\'any string\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (390,3,'GEOMCOLLFROMTEXT','GeomCollFromText(wkt[,srid]), GeometryCollectionFromText(wkt[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKT representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (391,17,'LAST_INSERT_ID','Syntax:\nLAST_INSERT_ID(), LAST_INSERT_ID(expr)\n\nWith no argument, LAST_INSERT_ID() returns a 64-bit value representing\nthe first automatically generated value successfully inserted for an\nAUTO_INCREMENT column as a result of the most recently executed INSERT\nstatement. The value has a type of BIGINT UNSIGNED as of MySQL 5.6.9,\nBIGINT (signed) before that. The value of LAST_INSERT_ID() remains\nunchanged if no rows are successfully inserted.\n\nWith an argument, LAST_INSERT_ID() returns an unsigned integer as of\nMySQL 5.6.9, a signed integer before that.\n\nFor example, after inserting a row that generates an AUTO_INCREMENT\nvalue, you can get the value like this:\n\nmysql> SELECT LAST_INSERT_ID();\n        -> 195\n\nThe currently executing statement does not affect the value of\nLAST_INSERT_ID(). Suppose that you generate an AUTO_INCREMENT value\nwith one statement, and then refer to LAST_INSERT_ID() in a\nmultiple-row INSERT statement that inserts rows into a table with its\nown AUTO_INCREMENT column. The value of LAST_INSERT_ID() will remain\nstable in the second statement; its value for the second and later rows\nis not affected by the earlier row insertions. (However, if you mix\nreferences to LAST_INSERT_ID() and LAST_INSERT_ID(expr), the effect is\nundefined.)\n\nIf the previous statement returned an error, the value of\nLAST_INSERT_ID() is undefined. For transactional tables, if the\nstatement is rolled back due to an error, the value of LAST_INSERT_ID()\nis left undefined. For manual ROLLBACK, the value of LAST_INSERT_ID()\nis not restored to that before the transaction; it remains as it was at\nthe point of the ROLLBACK.\n\nPrior to MySQL 5.6.15, this function was not replicated correctly if\nreplication filtering rules were in use. (Bug #17234370, Bug #69861)\n\nWithin the body of a stored routine (procedure or function) or a\ntrigger, the value of LAST_INSERT_ID() changes the same way as for\nstatements executed outside the body of these kinds of objects. The\neffect of a stored routine or trigger upon the value of\nLAST_INSERT_ID() that is seen by following statements depends on the\nkind of routine:\n\no If a stored procedure executes statements that change the value of\n  LAST_INSERT_ID(), the changed value is seen by statements that follow\n  the procedure call.\n\no For stored functions and triggers that change the value, the value is\n  restored when the function or trigger ends, so following statements\n  will not see a changed value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (392,4,'FLOOR','Syntax:\nFLOOR(X)\n\nReturns the largest integer value not greater than X.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT FLOOR(1.23);\n        -> 1\nmysql> SELECT FLOOR(-1.23);\n        -> -2\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (393,4,'COS','Syntax:\nCOS(X)\n\nReturns the cosine of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT COS(PI());\n        -> -1\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (394,16,'STD','Syntax:\nSTD(expr)\n\nReturns the population standard deviation of expr. This is an extension\nto standard SQL. The standard SQL function STDDEV_POP() can be used\ninstead.\n\nThis function returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (395,32,'DATE FUNCTION','Syntax:\nDATE(expr)\n\nExtracts the date part of the date or datetime expression expr.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT DATE(\'2003-12-31 01:02:03\');\n        -> \'2003-12-31\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (396,4,'TAN','Syntax:\nTAN(X)\n\nReturns the tangent of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT TAN(PI());\n        -> -1.2246063538224e-16\nmysql> SELECT TAN(PI()+1);\n        -> 1.5574077246549\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (397,32,'WEEKOFYEAR','Syntax:\nWEEKOFYEAR(date)\n\nReturns the calendar week of the date as a number in the range from 1\nto 53. WEEKOFYEAR() is a compatibility function that is equivalent to\nWEEK(date,3).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT WEEKOFYEAR(\'2008-02-20\');\n        -> 8\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (398,12,'UNCOMPRESSED_LENGTH','Syntax:\nUNCOMPRESSED_LENGTH(compressed_string)\n\nReturns the length that the compressed string had before being\ncompressed.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','mysql> SELECT UNCOMPRESSED_LENGTH(COMPRESS(REPEAT(\'a\',30)));\n        -> 30\n','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (399,32,'SUBTIME','Syntax:\nSUBTIME(expr1,expr2)\n\nSUBTIME() returns expr1 - expr2 expressed as a value in the same format\nas expr1. expr1 is a time or datetime expression, and expr2 is a time\nexpression.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT SUBTIME(\'2007-12-31 23:59:59.999999\',\'1 1:1:1.000002\');\n        -> \'2007-12-30 22:58:58.999997\'\nmysql> SELECT SUBTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'-00:59:59.999999\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (400,4,'LOG2','Syntax:\nLOG2(X)\n\nReturns the base-2 logarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT LOG2(65536);\n        -> 16\nmysql> SELECT LOG2(-100);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (401,4,'POW','Syntax:\nPOW(X,Y)\n\nReturns the value of X raised to the power of Y.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT POW(2,2);\n        -> 4\nmysql> SELECT POW(2,-2);\n        -> 0.25\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (402,40,'DROP TABLE','Syntax:\nDROP [TEMPORARY] TABLE [IF EXISTS]\n    tbl_name [, tbl_name] ...\n    [RESTRICT | CASCADE]\n\nDROP TABLE removes one or more tables. You must have the DROP privilege\nfor each table. All table data and the table definition are removed, so\nbe careful with this statement! If any of the tables named in the\nargument list do not exist, MySQL returns an error indicating by name\nwhich nonexisting tables it was unable to drop, but it also drops all\nof the tables in the list that do exist.\n\n*Important*: When a table is dropped, user privileges on the table are\nnot automatically dropped. See [HELP GRANT].\n\nNote that for a partitioned table, DROP TABLE permanently removes the\ntable definition, all of its partitions, and all of the data which was\nstored in those partitions. It also removes the partitioning definition\n(.par) file associated with the dropped table.\n\nUse IF EXISTS to prevent an error from occurring for tables that do not\nexist. A NOTE is generated for each nonexistent table when using IF\nEXISTS. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE are permitted to make porting easier. In MySQL\n5.6, they do nothing.\n\n*Note*: DROP TABLE automatically commits the current active\ntransaction, unless you use the TEMPORARY keyword.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-table.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-table.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (403,32,'NOW','Syntax:\nNOW([fsp])\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS format, depending on whether the function is used in\na string or numeric context. The value is expressed in the current time\nzone.\n\nAs of MySQL 5.6.4, if the fsp argument is given to specify a fractional\nseconds precision from 0 to 6, the return value includes a fractional\nseconds part of that many digits. Before 5.6.4, any argument is\nignored.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT NOW();\n        -> \'2007-12-15 23:50:26\'\nmysql> SELECT NOW() + 0;\n        -> 20071215235026.000000\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (404,27,'SHOW ENGINES','Syntax:\nSHOW [STORAGE] ENGINES\n\nSHOW ENGINES displays status information about the server\'s storage\nengines. This is particularly useful for checking whether a storage\nengine is supported, or to see what the default engine is. This\ninformation can also be obtained from the INFORMATION_SCHEMA ENGINES\ntable. See http://dev.mysql.com/doc/refman/5.6/en/engines-table.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-engines.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-engines.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (405,14,'IS_IPV6','Syntax:\nIS_IPV6(expr)\n\nReturns 1 if the argument is a valid IPv6 address specified as a\nstring, 0 otherwise. This function does not consider IPv4 addresses to\nbe valid IPv6 addresses.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> SELECT IS_IPV6(\'10.0.5.9\'), IS_IPV6(\'::1\');\n        -> 0, 1\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (406,23,'LONGBLOB','LONGBLOB\n\nA BLOB column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\nbytes. The effective maximum length of LONGBLOB columns depends on the\nconfigured maximum packet size in the client/server protocol and\navailable memory. Each LONGBLOB value is stored using a 4-byte length\nprefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (407,31,'ST_OVERLAPS','ST_Overlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially overlaps g2. The term\nspatially overlaps is used if two geometries intersect and their\nintersection results in a geometry of the same dimension but not equal\nto either of the given geometries.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (408,23,'YEAR DATA TYPE','YEAR[(2|4)]\n\nA year in two-digit or four-digit format. The default is four-digit\nformat. YEAR(2) or YEAR(4) differ in display format, but have the same\nrange of values. In four-digit format, values display as 1901 to 2155,\nand 0000. In two-digit format, values display as 70 to 69, representing\nyears from 1970 to 2069. MySQL displays YEAR values in YYYY or\nYYformat, but permits assignment of values to YEAR columns using either\nstrings or numbers.\n\n*Note*: The YEAR(2) data type has certain issues that you should\nconsider before choosing to use it. As of MySQL 5.6.6, YEAR(2) is\ndeprecated. YEAR(2) columns in existing tables are treated as before,\nbut YEAR(2) in new or altered tables are converted to YEAR(4). For more\ninformation, see\nhttp://dev.mysql.com/doc/refman/5.6/en/migrating-to-year4.html.\n\nFor additional information about YEAR display format and interpretation\nof input values, see http://dev.mysql.com/doc/refman/5.6/en/year.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (409,16,'SUM','Syntax:\nSUM([DISTINCT] expr)\n\nReturns the sum of expr. If the return set has no rows, SUM() returns\nNULL. The DISTINCT keyword can be used to sum only the distinct values\nof expr.\n\nSUM() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (410,38,'REPEAT FUNCTION','Syntax:\nREPEAT(str,count)\n\nReturns a string consisting of the string str repeated count times. If\ncount is less than 1, returns an empty string. Returns NULL if str or\ncount are NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT REPEAT(\'MySQL\', 3);\n        -> \'MySQLMySQLMySQL\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (411,38,'SOUNDEX','Syntax:\nSOUNDEX(str)\n\nReturns a soundex string from str. Two strings that sound almost the\nsame should have identical soundex strings. A standard soundex string\nis four characters long, but the SOUNDEX() function returns an\narbitrarily long string. You can use SUBSTRING() on the result to get a\nstandard soundex string. All nonalphabetic characters in str are\nignored. All international alphabetic characters outside the A-Z range\nare treated as vowels.\n\n*Important*: When using SOUNDEX(), you should be aware of the following\nlimitations:\n\no This function, as currently implemented, is intended to work well\n  with strings that are in the English language only. Strings in other\n  languages may not produce reliable results.\n\no This function is not guaranteed to provide consistent results with\n  strings that use multi-byte character sets, including utf-8.\n\n  We hope to remove these limitations in a future release. See Bug\n  #22638 for more information.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT SOUNDEX(\'Hello\');\n        -> \'H400\'\nmysql> SELECT SOUNDEX(\'Quadratically\');\n        -> \'Q36324\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (412,6,'MBRTOUCHES','MBRTouches(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 touch. Two geometries spatially touch if\nthe interiors of the geometries do not intersect, but the boundary of\none of the geometries intersects either the boundary or the interior of\nthe other.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (413,40,'DROP EVENT','Syntax:\nDROP EVENT [IF EXISTS] event_name\n\nThis statement drops the event named event_name. The event immediately\nceases being active, and is deleted completely from the server.\n\nIf the event does not exist, the error ERROR 1517 (HY000): Unknown\nevent \'event_name\' results. You can override this and cause the\nstatement to generate a warning for nonexistent events instead using IF\nEXISTS.\n\nThis statement requires the EVENT privilege for the schema to which the\nevent to be dropped belongs.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-event.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-event.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (414,23,'VARBINARY','VARBINARY(M)\n\nThe VARBINARY type is similar to the VARCHAR type, but stores binary\nbyte strings rather than nonbinary character strings. M represents the\nmaximum column length in bytes.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (415,27,'LOAD INDEX','Syntax:\nLOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [PARTITION (partition_list | ALL)]\n    [[INDEX|KEY] (index_name[, index_name] ...)]\n    [IGNORE LEAVES]\n\npartition_list:\n    partition_name[, partition_name][, ...]\n\nThe LOAD INDEX INTO CACHE statement preloads a table index into the key\ncache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise.\n\nLOAD INDEX INTO CACHE is used only for MyISAM tables. In MySQL 5.6, it\nis also supported for partitioned MyISAM tables; in addition, indexes\non partitioned tables can be preloaded for one, several, or all\npartitions.\n\nThe IGNORE LEAVES modifier causes only blocks for the nonleaf nodes of\nthe index to be preloaded.\n\nIGNORE LEAVES is also supported for partitioned MyISAM tables.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/load-index.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/load-index.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (416,28,'UNION','Syntax:\nSELECT ...\nUNION [ALL | DISTINCT] SELECT ...\n[UNION [ALL | DISTINCT] SELECT ...]\n\nUNION is used to combine the result from multiple SELECT statements\ninto a single result set.\n\nThe column names from the first SELECT statement are used as the column\nnames for the results returned. Selected columns listed in\ncorresponding positions of each SELECT statement should have the same\ndata type. (For example, the first column selected by the first\nstatement should have the same type as the first column selected by the\nother statements.)\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/union.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/union.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (417,32,'TO_DAYS','Syntax:\nTO_DAYS(date)\n\nGiven a date date, returns a day number (the number of days since year\n0).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT TO_DAYS(950501);\n        -> 728779\nmysql> SELECT TO_DAYS(\'2007-10-07\');\n        -> 733321\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (418,27,'SHOW CREATE DATABASE','Syntax:\nSHOW CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n\nShows the CREATE DATABASE statement that creates the named database. If\nthe SHOW statement includes an IF NOT EXISTS clause, the output too\nincludes such a clause. SHOW CREATE SCHEMA is a synonym for SHOW CREATE\nDATABASE.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-create-database.html\n\n','mysql> SHOW CREATE DATABASE test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n\nmysql> SHOW CREATE SCHEMA test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n','http://dev.mysql.com/doc/refman/5.6/en/show-create-database.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (419,27,'SHOW INDEX','Syntax:\nSHOW {INDEX | INDEXES | KEYS}\n    {FROM | IN} tbl_name\n    [{FROM | IN} db_name]\n    [WHERE expr]\n\nSHOW INDEX returns table index information. The format resembles that\nof the SQLStatistics call in ODBC. This statement requires some\nprivilege for any column in the table.\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. These two statements are equivalent:\n\nSHOW INDEX FROM mytable FROM mydb;\nSHOW INDEX FROM mydb.mytable;\n\nThe WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html.\n\nYou can also list a table\'s indexes with the mysqlshow -k db_name\ntbl_name command.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-index.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-index.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (420,15,'!','Syntax:\nNOT, !\n\nLogical NOT. Evaluates to 1 if the operand is 0, to 0 if the operand is\nnonzero, and NOT NULL returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/logical-operators.html\n\n','mysql> SELECT NOT 10;\n        -> 0\nmysql> SELECT NOT 0;\n        -> 1\nmysql> SELECT NOT NULL;\n        -> NULL\nmysql> SELECT ! (1+1);\n        -> 0\nmysql> SELECT ! 1+1;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/logical-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (421,23,'DOUBLE','DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA normal-size (double-precision) floating-point number. Permissible\nvalues are -1.7976931348623157E+308 to -2.2250738585072014E-308, 0, and\n2.2250738585072014E-308 to 1.7976931348623157E+308. These are the\ntheoretical limits, based on the IEEE standard. The actual range might\nbe slightly smaller depending on your hardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits permitted by the hardware. A double-precision floating-point\nnumber is accurate to approximately 15 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (422,24,'DECLARE HANDLER','Syntax:\nDECLARE handler_action HANDLER\n    FOR condition_value [, condition_value] ...\n    statement\n\nhandler_action:\n    CONTINUE\n  | EXIT\n  | UNDO\n\ncondition_value:\n    mysql_error_code\n  | SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n  | SQLWARNING\n  | NOT FOUND\n  | SQLEXCEPTION\n\nThe DECLARE ... HANDLER statement specifies a handler that deals with\none or more conditions. If one of these conditions occurs, the\nspecified statement executes. statement can be a simple statement such\nas SET var_name = value, or a compound statement written using BEGIN\nand END (see [HELP BEGIN END]).\n\nHandler declarations must appear after variable or condition\ndeclarations.\n\nThe handler_action value indicates what action the handler takes after\nexecution of the handler statement:\n\no CONTINUE: Execution of the current program continues.\n\no EXIT: Execution terminates for the BEGIN ... END compound statement\n  in which the handler is declared. This is true even if the condition\n  occurs in an inner block.\n\no UNDO: Not supported.\n\nThe condition_value for DECLARE ... HANDLER indicates the specific\ncondition or class of conditions that activates the handler:\n\no A MySQL error code (a number) or an SQLSTATE value (a 5-character\n  string literal). You should not use MySQL error code 0 or SQLSTATE\n  values that begin with \'00\', because those indicate success rather\n  than an error condition. For a list of MySQL error codes and SQLSTATE\n  values, see\n  http://dev.mysql.com/doc/refman/5.6/en/error-messages-server.html.\n\no A condition name previously specified with DECLARE ... CONDITION. A\n  condition name can be associated with a MySQL error code or SQLSTATE\n  value. See [HELP DECLARE CONDITION].\n\no SQLWARNING is shorthand for the class of SQLSTATE values that begin\n  with \'01\'.\n\no NOT FOUND is shorthand for the class of SQLSTATE values that begin\n  with \'02\'. This is relevant within the context of cursors and is used\n  to control what happens when a cursor reaches the end of a data set.\n  If no more rows are available, a No Data condition occurs with\n  SQLSTATE value \'02000\'. To detect this condition, you can set up a\n  handler for it (or for a NOT FOUND condition). For an example, see\n  http://dev.mysql.com/doc/refman/5.6/en/cursors.html. This condition\n  also occurs for SELECT ... INTO var_list statements that retrieve no\n  rows.\n\no SQLEXCEPTION is shorthand for the class of SQLSTATE values that do\n  not begin with \'00\', \'01\', or \'02\'.\n\nFor information about how the server chooses handlers when a condition\noccurs, see http://dev.mysql.com/doc/refman/5.6/en/handler-scope.html.\n\nIf a condition occurs for which no handler has been declared, the\naction taken depends on the condition class:\n\no For SQLEXCEPTION conditions, the stored program terminates at the\n  statement that raised the condition, as if there were an EXIT\n  handler. If the program was called by another stored program, the\n  calling program handles the condition using the handler selection\n  rules applied to its own handlers.\n\no For SQLWARNING conditions, the program continues executing, as if\n  there were a CONTINUE handler.\n\no For NOT FOUND conditions, if the condition was raised normally, the\n  action is CONTINUE. If it was raised by SIGNAL or RESIGNAL, the\n  action is EXIT.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/declare-handler.html\n\n','mysql> CREATE TABLE test.t (s1 INT, PRIMARY KEY (s1));\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter //\n\nmysql> CREATE PROCEDURE handlerdemo ()\n    -> BEGIN\n    ->   DECLARE CONTINUE HANDLER FOR SQLSTATE \'23000\' SET @x2 = 1;\n    ->   SET @x = 1;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 2;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 3;\n    -> END;\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL handlerdemo()//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n    +------+\n    | @x   |\n    +------+\n    | 3    |\n    +------+\n    1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.6/en/declare-handler.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (423,23,'TIME','TIME[(fsp)]\n\nA time. The range is \'-838:59:59.000000\' to \'838:59:59.000000\'. MySQL\ndisplays TIME values in \'HH:MM:SS[.fraction]\' format, but permits\nassignment of values to TIME columns using either strings or numbers.\n\nAs of MySQL 5.6.4, an optional fsp value in the range from 0 to 6 may\nbe given to specify fractional seconds precision. A value of 0\nsignifies that there is no fractional part. If omitted, the default\nprecision is 0.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (424,17,'SYSTEM_USER','Syntax:\nSYSTEM_USER()\n\nSYSTEM_USER() is a synonym for USER().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (425,32,'CURRENT_DATE','Syntax:\nCURRENT_DATE, CURRENT_DATE()\n\nCURRENT_DATE and CURRENT_DATE() are synonyms for CURDATE().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (426,40,'TRUNCATE TABLE','Syntax:\nTRUNCATE [TABLE] tbl_name\n\nTRUNCATE TABLE empties a table completely. It requires the DROP\nprivilege.\n\nLogically, TRUNCATE TABLE is similar to a DELETE statement that deletes\nall rows, or a sequence of DROP TABLE and CREATE TABLE statements. To\nachieve high performance, it bypasses the DML method of deleting data.\nThus, it cannot be rolled back, it does not cause ON DELETE triggers to\nfire, and it cannot be performed for InnoDB tables with parent-child\nforeign key relationships.\n\nAlthough TRUNCATE TABLE is similar to DELETE, it is classified as a DDL\nstatement rather than a DML statement. It differs from DELETE in the\nfollowing ways in MySQL 5.6:\n\no Truncate operations drop and re-create the table, which is much\n  faster than deleting rows one by one, particularly for large tables.\n\no Truncate operations cause an implicit commit, and so cannot be rolled\n  back.\n\no Truncation operations cannot be performed if the session holds an\n  active table lock.\n\no TRUNCATE TABLE fails for an InnoDB table if there are any FOREIGN KEY\n  constraints from other tables that reference the table. Foreign key\n  constraints between columns of the same table are permitted.\n\no Truncation operations do not return a meaningful value for the number\n  of deleted rows. The usual result is "0 rows affected," which should\n  be interpreted as "no information."\n\no As long as the table format file tbl_name.frm is valid, the table can\n  be re-created as an empty table with TRUNCATE TABLE, even if the data\n  or index files have become corrupted.\n\no Any AUTO_INCREMENT value is reset to its start value. This is true\n  even for MyISAM and InnoDB, which normally do not reuse sequence\n  values.\n\no When used with partitioned tables, TRUNCATE TABLE preserves the\n  partitioning; that is, the data and index files are dropped and\n  re-created, while the partition definitions (.par) file is\n  unaffected.\n\no The TRUNCATE TABLE statement does not invoke ON DELETE triggers.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/truncate-table.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/truncate-table.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (427,2,'AREA','Area(poly)\n\nReturns as a double-precision number the area of the Polygon value\npoly, as measured in its spatial reference system.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SET @poly = \'Polygon((0 0,0 3,3 0,0 0),(1 1,1 2,2 1,1 1))\';\nmysql> SELECT Area(GeomFromText(@poly));\n+---------------------------+\n| Area(GeomFromText(@poly)) |\n+---------------------------+\n|                         4 |\n+---------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (428,8,'START SLAVE','Syntax:\nSTART SLAVE [thread_types] [until_option] [connection_options]\n\nthread_types:\n    [thread_type [, thread_type] ... ]\n\nthread_type: \n    IO_THREAD | SQL_THREAD\n\nuntil_option:\n    UNTIL {   {SQL_BEFORE_GTIDS | SQL_AFTER_GTIDS} = gtid_set\n          |   MASTER_LOG_FILE = \'log_name\', MASTER_LOG_POS = log_pos\n          |   RELAY_LOG_FILE = \'log_name\', RELAY_LOG_POS = log_pos\n          |   SQL_AFTER_MTS_GAPS  }\n\nconnection_options: \n    [USER=\'user_name\'] [PASSWORD=\'user_pass\'] [DEFAULT_AUTH=\'plugin_name\'] [PLUGIN_DIR=\'plugin_dir\']\n\n\ngtid_set:\n    uuid_set [, uuid_set] ...\n    | \'\'\n\nuuid_set:\n    uuid:interval[:interval]...\n\nuuid:\n    hhhhhhhh-hhhh-hhhh-hhhh-hhhhhhhhhhhh\n\nh:\n    [0-9,A-F]\n\ninterval:\n    n[-n]\n\n    (n >= 1) \n\nSTART SLAVE with no thread_type options starts both of the slave\nthreads. The I/O thread reads events from the master server and stores\nthem in the relay log. The SQL thread reads events from the relay log\nand executes them. START SLAVE requires the SUPER privilege.\n\nIf START SLAVE succeeds in starting the slave threads, it returns\nwithout any error. However, even in that case, it might be that the\nslave threads start and then later stop (for example, because they do\nnot manage to connect to the master or read its binary log, or some\nother problem). START SLAVE does not warn you about this. You must\ncheck the slave\'s error log for error messages generated by the slave\nthreads, or check that they are running satisfactorily with SHOW SLAVE\nSTATUS.\n\nIn MySQL 5.6.7 and later, START SLAVE causes an implicit commit of an\nongoing transaction. See\nhttp://dev.mysql.com/doc/refman/5.6/en/implicit-commit.html.\n\nBeginning with MySQL 5.6.11, gtid_next must be set to AUTOMATIC before\nissuing this statement (Bug #16062608).\n\nMySQL 5.6.4 and later supports pluggable user-password authentication\nwith START SLAVE with the USER, PASSWORD, DEFAULT_AUTH and PLUGIN_DIR\noptions, as described in the following list:\n\no USER: User name. Cannot be set to an empty or null string, or left\n  unset if PASSWORD is used.\n\no PASSWORD: Password.\n\no DEFAULT_AUTH: Name of plugin; default is MySQL native authentication.\n\no PLUGIN_DIR: Location of plugin.\n\nStarting with MySQL 5.6.4, you cannot use the SQL_THREAD option when\nspecifying USER, PASSWORD, or both. (Bug #13083642).\n\nSee\nhttp://dev.mysql.com/doc/refman/5.6/en/pluggable-authentication.html,\nfor more information.\n\nIf an insecure connection is used with any these options, the server\nissues the warning Sending passwords in plain text without SSL/TLS is\nextremely insecure.\n\nStarting with MySQL 5.6.6, START SLAVE ... UNTIL supports two\nadditional options for use with global transaction identifiers (GTIDs)\n(see http://dev.mysql.com/doc/refman/5.6/en/replication-gtids.html).\nEach of these takes a set of one or more global transaction identifiers\ngtid_set as an argument (see\nhttp://dev.mysql.com/doc/refman/5.6/en/replication-gtids-concepts.html#\nreplication-gtids-concepts-gtid-sets, for more information).\n\nWhen no thread_type is specified, START SLAVE UNTIL SQL_BEFORE_GTIDS\ncauses both the slave SQL thread to process and the slave I/O thread to\nfetch transactions until both of them have reached the first\ntransaction whose GTID is listed in the gtid_set. START SLAVE UNTIL\nSQL_AFTER_GTIDS causes the slave threads to process all transactions\nuntil the last transaction in the gtid_set has been processed by both\nthreads. In other words, START SLAVE UNTIL SQL_BEFORE_GTIDS causes the\nslave SQL to process and I/O threads to fetch all transactions\noccurring before the first GTID in the gtid_set is reached, and START\nSLAVE UNTIL SQL_AFTER_GTIDS causes the slave threads to handle all\ntransactions, including those whose GTIDs are found in gtid_set, until\neach has encountered a transaction whose GTID is not part of the set.\nSQL_BEFORE_GTIDS and SQL_AFTER_GTIDS each support the SQL_THREAD and\nIO_THREAD options.\n\nFor example, START SLAVE SQL_THREAD UNTIL SQL_BEFORE_GTIDS =\n3E11FA47-71CA-11E1-9E33-C80AA9429562:11-56 causes the slave SQL thread\nto process all transactions originating from the master whose\nserver_uuid is 3E11FA47-71CA-11E1-9E33-C80AA9429562 until it encounters\nthe transaction having sequence number 11; it then stops without\nprocessing this transaction. In other words, all transactions up to and\nincluding the transaction with sequence number 10 are processed.\nExecuting START SLAVE IO_THREAD UNTIL SQL_AFTER_GTIDS =\n3E11FA47-71CA-11E1-9E33-C80AA9429562:11-56, on the other hand, would\ncause the slave I/O thread to obtain all transactions just mentioned\nfrom the master, including all of the transactions having the sequence\nnumbers 11 through 56, and then to stop without processing any\nadditional transactions; that is, the transaction having sequence\nnumber 56 would be the last transaction fetched by the slave I/O\nthread.\n\nWith neither the SQL_THREAD option nor the IO_THREAD option, the\nprevious statement would cause the slave SQL thread to execute all\ntransactions originating from this master, including all transactions\nwith sequence numbers 11 through 56, and then to stop without\nprocessing any additional transactions. The same command would also\ncause the slave I/O thread to start. When the SQL thread reaches the\ncondition, it is stopped. In other words, START SLAVE UNTIL\nSQL_BEFORE_GTIDS has the same effect as START SLAVE SQL_THREAD,\nIO_THREAD UNTIL SQL_BEFORE_GTIDS; the slave SQL thread and slave I/O\nthread are each started, and the SQL thread continues executing\ntransactions until the stop condition for that thread is met.\n(Similarly, START SLAVE UNTIL SQL_AFTER_GTIDS is effectively the same\nas START SLAVE SQL_THREAD, IO_THREAD UNTIL SQL_AFTER_GTIDS.)\n\nPrior to MySQL 5.6.14, SQL_AFTER_GTIDS did not stop the slave once the\nindicated transaction waa completed, but waited until another GTID\nevent was received (Bug #14767986).\n\n*Note*: The SQL_BEFORE_GTIDS and SQL_AFTER_GTIDS keywords are present\nin the MySQL 5.6.5 server; however, neither of them functioned\ncorrectly as options with START SLAVE [SQL_THREAD | IO_THREAD] UNTIL in\nthat version, and are therefore supported beginning only with MySQL\n5.6.6. (Bug#13810456)\n\nSTART SLAVE UNTIL SQL_AFTER_MTS_GAPS is available in MySQL 5.6.6 or\nlater. This statement causes a multi-threaded slave\'s SQL threads to\nrun until no more gaps are found in the relay log, and then to stop.\nThis statement can take an SQL_THREAD option, but the effects of the\nstatement remain unchanged. It has no effect on the slave I/O thread\n(and cannot be used with the IO_THREAD option). START SLAVE UNTIL\nSQL_AFTER_MTS_GAPS should be used before switching the slave from\nmulti-threaded mode to single-threaded mode (that is, when resetting\nslave_parallel_workers back to 0 from a positive, nonzero value) after\nslave has failed with errors in multi-threaded mode.\n\nTo change a failed multi-threaded slave to single-threaded mode, you\ncan issue the following series of statements, in the order shown:\n\nSTART SLAVE UNTIL SQL_AFTER_MTS_GAPS;\n\nSET @@GLOBAL.slave_parallel_workers = 0;\n\nSTART SLAVE SQL_THREAD;\n\nIf you were running the failed multi-threaded slave with\nrelay_log_recovery enabled, then you must issue START SLAVE UNTIL\nSQL_AFTER_MTS_GAPS prior to executing CHANGE MASTER TO. Otherwise the\nlatter statement fails.\n\n*Note*: It is possible to view the entire text of a running START SLAVE\n... statement, including any USER or PASSWORD values used, in the\noutput of SHOW PROCESSLIST. This is also true for the text of a running\nCHANGE MASTER TO statement, including any values it employs for\nMASTER_USER or MASTER_PASSWORD.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/start-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/start-slave.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (429,27,'SHOW WARNINGS','Syntax:\nSHOW WARNINGS [LIMIT [offset,] row_count]\nSHOW COUNT(*) WARNINGS\n\nSHOW WARNINGS is a diagnostic statement that displays information about\nthe conditions (errors, warnings, and notes) resulting from executing a\nstatement in the current session. Warnings are generated for DML\nstatements such as INSERT, UPDATE, and LOAD DATA INFILE as well as DDL\nstatements such as CREATE TABLE and ALTER TABLE.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttp://dev.mysql.com/doc/refman/5.6/en/select.html.\n\nSHOW WARNINGS is also used following EXPLAIN EXTENDED, to display the\nextra information generated by EXPLAIN when the EXTENDED keyword is\nused. See http://dev.mysql.com/doc/refman/5.6/en/explain-extended.html.\n\nSHOW WARNINGS displays information about the conditions resulting from\nthe most recent statement in the current session that generated\nmessages. It shows nothing if the most recent statement used a table\nand generated no messages. (That is, statements that use a table but\ngenerate no messages clear the message list.) Statements that do not\nuse tables and do not generate messages have no effect on the message\nlist.\n\nThe SHOW COUNT(*) WARNINGS diagnostic statement displays the total\nnumber of errors, warnings, and notes. You can also retrieve this\nnumber from the warning_count system variable:\n\nSHOW COUNT(*) WARNINGS;\nSELECT @@warning_count;\n\nA related diagnostic statement, SHOW ERRORS, shows only error\nconditions (it excludes warnings and notes), and SHOW COUNT(*) ERRORS\nstatement displays the total number of errors. See [HELP SHOW ERRORS].\nGET DIAGNOSTICS can be used to examine information for individual\nconditions. See [HELP GET DIAGNOSTICS].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-warnings.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-warnings.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (430,10,'DROP USER','Syntax:\nDROP USER user [, user] ...\n\nThe DROP USER statement removes one or more MySQL accounts and their\nprivileges. It removes privilege rows for the account from all grant\ntables. An error occurs for accounts that do not exist. To use this\nstatement, you must have the global CREATE USER privilege or the DELETE\nprivilege for the mysql database.\n\nEach account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.6/en/account-names.html. For example:\n\nDROP USER \'jeffrey\'@\'localhost\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-user.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-user.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (431,38,'SUBSTRING','Syntax:\nSUBSTRING(str,pos), SUBSTRING(str FROM pos), SUBSTRING(str,pos,len),\nSUBSTRING(str FROM pos FOR len)\n\nThe forms without a len argument return a substring from string str\nstarting at position pos. The forms with a len argument return a\nsubstring len characters long from string str, starting at position\npos. The forms that use FROM are standard SQL syntax. It is also\npossible to use a negative value for pos. In this case, the beginning\nof the substring is pos characters from the end of the string, rather\nthan the beginning. A negative value may be used for pos in any of the\nforms of this function.\n\nFor all forms of SUBSTRING(), the position of the first character in\nthe string from which the substring is to be extracted is reckoned as\n1.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT SUBSTRING(\'Quadratically\',5);\n        -> \'ratically\'\nmysql> SELECT SUBSTRING(\'foobarbar\' FROM 4);\n        -> \'barbar\'\nmysql> SELECT SUBSTRING(\'Quadratically\',5,6);\n        -> \'ratica\'\nmysql> SELECT SUBSTRING(\'Sakila\', -3);\n        -> \'ila\'\nmysql> SELECT SUBSTRING(\'Sakila\', -5, 3);\n        -> \'aki\'\nmysql> SELECT SUBSTRING(\'Sakila\' FROM -4 FOR 2);\n        -> \'ki\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (432,37,'ISEMPTY','IsEmpty(g)\n\nThis function is a placeholder that returns 0 for any valid geometry\nvalue, 1 for any invalid geometry value or NULL.\n\nMySQL does not support GIS EMPTY values such as POINT EMPTY.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (433,27,'SHOW FUNCTION STATUS','Syntax:\nSHOW FUNCTION STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is similar to SHOW PROCEDURE STATUS but for stored\nfunctions. See [HELP SHOW PROCEDURE STATUS].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-function-status.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-function-status.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (434,38,'LTRIM','Syntax:\nLTRIM(str)\n\nReturns the string str with leading space characters removed.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT LTRIM(\'  barbar\');\n        -> \'barbar\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (435,31,'ST_CROSSES','ST_Crosses(g1,g2)\n\nReturns 1 if g1 spatially crosses g2. Returns NULL if g1 is a Polygon\nor a MultiPolygon, or if g2 is a Point or a MultiPoint. Otherwise,\nreturns 0.\n\nThe term spatially crosses denotes a spatial relation between two given\ngeometries that has the following properties:\n\no The two geometries intersect\n\no Their intersection results in a geometry that has a dimension that is\n  one less than the maximum dimension of the two given geometries\n\no Their intersection is not equal to either of the two given geometries\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (436,14,'VALUES','Syntax:\nVALUES(col_name)\n\nIn an INSERT ... ON DUPLICATE KEY UPDATE statement, you can use the\nVALUES(col_name) function in the UPDATE clause to refer to column\nvalues from the INSERT portion of the statement. In other words,\nVALUES(col_name) in the UPDATE clause refers to the value of col_name\nthat would be inserted, had no duplicate-key conflict occurred. This\nfunction is especially useful in multiple-row inserts. The VALUES()\nfunction is meaningful only in the ON DUPLICATE KEY UPDATE clause of\nINSERT statements and returns NULL otherwise. See\nhttp://dev.mysql.com/doc/refman/5.6/en/insert-on-duplicate.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> INSERT INTO table (a,b,c) VALUES (1,2,3),(4,5,6)\n    -> ON DUPLICATE KEY UPDATE c=VALUES(a)+VALUES(b);\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (437,6,'MBRDISJOINT','MBRDisjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are disjoint (do not intersect).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (438,28,'CALL','Syntax:\nCALL sp_name([parameter[,...]])\nCALL sp_name[()]\n\nThe CALL statement invokes a stored procedure that was defined\npreviously with CREATE PROCEDURE.\n\nStored procedures that take no arguments can be invoked without\nparentheses. That is, CALL p() and CALL p are equivalent.\n\nCALL can pass back values to its caller using parameters that are\ndeclared as OUT or INOUT parameters. When the procedure returns, a\nclient program can also obtain the number of rows affected for the\nfinal statement executed within the routine: At the SQL level, call the\nROW_COUNT() function; from the C API, call the mysql_affected_rows()\nfunction.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/call.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/call.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (439,12,'ENCODE','Syntax:\nENCODE(str,pass_str)\n\nEncrypt str using pass_str as the password. The result is a binary\nstring of the same length as str. To decrypt the result, use DECODE().\n\nThe ENCODE() function should no longer be used. If you still need to\nuse ENCODE(), a salt value must be used with it to reduce risk. For\nexample:\n\nENCODE(\'plaintext\', CONCAT(\'my_random_salt\',\'my_secret_password\'))\n\nA new random salt value must be used whenever a password is updated.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (440,38,'SUBSTRING_INDEX','Syntax:\nSUBSTRING_INDEX(str,delim,count)\n\nReturns the substring from string str before count occurrences of the\ndelimiter delim. If count is positive, everything to the left of the\nfinal delimiter (counting from the left) is returned. If count is\nnegative, everything to the right of the final delimiter (counting from\nthe right) is returned. SUBSTRING_INDEX() performs a case-sensitive\nmatch when searching for delim.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', 2);\n        -> \'www.mysql\'\nmysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', -2);\n        -> \'mysql.com\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (441,32,'TIMESTAMPADD','Syntax:\nTIMESTAMPADD(unit,interval,datetime_expr)\n\nAdds the integer expression interval to the date or datetime expression\ndatetime_expr. The unit for interval is given by the unit argument,\nwhich should be one of the following values: MICROSECOND\n(microseconds), SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, or\nYEAR.\n\nThe unit value may be specified using one of keywords as shown, or with\na prefix of SQL_TSI_. For example, DAY and SQL_TSI_DAY both are legal.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMPADD(MINUTE,1,\'2003-01-02\');\n        -> \'2003-01-02 00:01:00\'\nmysql> SELECT TIMESTAMPADD(WEEK,1,\'2003-01-02\');\n        -> \'2003-01-09\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (442,4,'TRUNCATE','Syntax:\nTRUNCATE(X,D)\n\nReturns the number X, truncated to D decimal places. If D is 0, the\nresult has no decimal point or fractional part. D can be negative to\ncause D digits left of the decimal point of the value X to become zero.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT TRUNCATE(1.223,1);\n        -> 1.2\nmysql> SELECT TRUNCATE(1.999,1);\n        -> 1.9\nmysql> SELECT TRUNCATE(1.999,0);\n        -> 1\nmysql> SELECT TRUNCATE(-1.999,1);\n        -> -1.9\nmysql> SELECT TRUNCATE(122,-2);\n       -> 100\nmysql> SELECT TRUNCATE(10.28*100,0);\n       -> 1028\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (443,27,'SHOW','SHOW has many forms that provide information about databases, tables,\ncolumns, or status information about the server. This section describes\nthose following:\n\nSHOW AUTHORS\nSHOW {BINARY | MASTER} LOGS\nSHOW BINLOG EVENTS [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\nSHOW CHARACTER SET [like_or_where]\nSHOW COLLATION [like_or_where]\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [like_or_where]\nSHOW CONTRIBUTORS\nSHOW CREATE DATABASE db_name\nSHOW CREATE EVENT event_name\nSHOW CREATE FUNCTION func_name\nSHOW CREATE PROCEDURE proc_name\nSHOW CREATE TABLE tbl_name\nSHOW CREATE TRIGGER trigger_name\nSHOW CREATE VIEW view_name\nSHOW DATABASES [like_or_where]\nSHOW ENGINE engine_name {STATUS | MUTEX}\nSHOW [STORAGE] ENGINES\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW EVENTS\nSHOW FUNCTION CODE func_name\nSHOW FUNCTION STATUS [like_or_where]\nSHOW GRANTS FOR user\nSHOW INDEX FROM tbl_name [FROM db_name]\nSHOW MASTER STATUS\nSHOW OPEN TABLES [FROM db_name] [like_or_where]\nSHOW PLUGINS\nSHOW PROCEDURE CODE proc_name\nSHOW PROCEDURE STATUS [like_or_where]\nSHOW PRIVILEGES\nSHOW [FULL] PROCESSLIST\nSHOW PROFILE [types] [FOR QUERY n] [OFFSET n] [LIMIT n]\nSHOW PROFILES\nSHOW SLAVE HOSTS\nSHOW SLAVE STATUS\nSHOW [GLOBAL | SESSION] STATUS [like_or_where]\nSHOW TABLE STATUS [FROM db_name] [like_or_where]\nSHOW [FULL] TABLES [FROM db_name] [like_or_where]\nSHOW TRIGGERS [FROM db_name] [like_or_where]\nSHOW [GLOBAL | SESSION] VARIABLES [like_or_where]\nSHOW WARNINGS [LIMIT [offset,] row_count]\n\nlike_or_where:\n    LIKE \'pattern\'\n  | WHERE expr\n\nIf the syntax for a given SHOW statement includes a LIKE \'pattern\'\npart, \'pattern\' is a string that can contain the SQL "%" and "_"\nwildcard characters. The pattern is useful for restricting statement\noutput to matching values.\n\nSeveral SHOW statements also accept a WHERE clause that provides more\nflexibility in specifying which rows to display. See\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (444,27,'SHOW VARIABLES','Syntax:\nSHOW [GLOBAL | SESSION] VARIABLES\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW VARIABLES shows the values of MySQL system variables. This\ninformation also can be obtained using the mysqladmin variables\ncommand. The LIKE clause, if present, indicates which variable names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html. This\nstatement does not require any privilege. It requires only the ability\nto connect to the server.\n\nWith the GLOBAL modifier, SHOW VARIABLES displays the values that are\nused for new connections to MySQL. In MySQL 5.6, if a variable has no\nglobal value, no value is displayed. With SESSION, SHOW VARIABLES\ndisplays the values that are in effect for the current connection. If\nno modifier is present, the default is SESSION. LOCAL is a synonym for\nSESSION.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern. To obtain the row for a\nspecific variable, use a LIKE clause as shown:\n\nSHOW VARIABLES LIKE \'max_join_size\';\nSHOW SESSION VARIABLES LIKE \'max_join_size\';\n\nTo get a list of variables whose name match a pattern, use the "%"\nwildcard character in a LIKE clause:\n\nSHOW VARIABLES LIKE \'%size%\';\nSHOW GLOBAL VARIABLES LIKE \'%size%\';\n\nWildcard characters can be used in any position within the pattern to\nbe matched. Strictly speaking, because "_" is a wildcard that matches\nany single character, you should escape it as "\\_" to match it\nliterally. In practice, this is rarely necessary.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-variables.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-variables.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (445,27,'BINLOG','Syntax:\nBINLOG \'str\'\n\nBINLOG is an internal-use statement. It is generated by the mysqlbinlog\nprogram as the printable representation of certain events in binary log\nfiles. (See http://dev.mysql.com/doc/refman/5.6/en/mysqlbinlog.html.)\nThe \'str\' value is a base 64-encoded string the that server decodes to\ndetermine the data change indicated by the corresponding event. This\nstatement requires the SUPER privilege.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/binlog.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/binlog.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (446,31,'ST_DISJOINT','ST_Disjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially disjoint from (does\nnot intersect) g2.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (447,4,'ATAN2','Syntax:\nATAN(Y,X), ATAN2(Y,X)\n\nReturns the arc tangent of the two variables X and Y. It is similar to\ncalculating the arc tangent of Y / X, except that the signs of both\narguments are used to determine the quadrant of the result.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT ATAN(-2,2);\n        -> -0.78539816339745\nmysql> SELECT ATAN2(PI(),0);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (448,32,'HOUR','Syntax:\nHOUR(time)\n\nReturns the hour for time. The range of the return value is 0 to 23 for\ntime-of-day values. However, the range of TIME values actually is much\nlarger, so HOUR can return values greater than 23.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT HOUR(\'10:05:03\');\n        -> 10\nmysql> SELECT HOUR(\'272:59:59\');\n        -> 272\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (449,28,'SELECT','Syntax:\nSELECT\n    [ALL | DISTINCT | DISTINCTROW ]\n      [HIGH_PRIORITY]\n      [STRAIGHT_JOIN]\n      [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]\n      [SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]\n    select_expr [, select_expr ...]\n    [FROM table_references\n      [PARTITION partition_list]\n    [WHERE where_condition]\n    [GROUP BY {col_name | expr | position}\n      [ASC | DESC], ... [WITH ROLLUP]]\n    [HAVING where_condition]\n    [ORDER BY {col_name | expr | position}\n      [ASC | DESC], ...]\n    [LIMIT {[offset,] row_count | row_count OFFSET offset}]\n    [PROCEDURE procedure_name(argument_list)]\n    [INTO OUTFILE \'file_name\'\n        [CHARACTER SET charset_name]\n        export_options\n      | INTO DUMPFILE \'file_name\'\n      | INTO var_name [, var_name]]\n    [FOR UPDATE | LOCK IN SHARE MODE]]\n\nSELECT is used to retrieve rows selected from one or more tables, and\ncan include UNION statements and subqueries. See [HELP UNION], and\nhttp://dev.mysql.com/doc/refman/5.6/en/subqueries.html.\n\nThe most commonly used clauses of SELECT statements are these:\n\no Each select_expr indicates a column that you want to retrieve. There\n  must be at least one select_expr.\n\no table_references indicates the table or tables from which to retrieve\n  rows. Its syntax is described in [HELP JOIN].\n\no Starting in MySQL 5.6.2, SELECT supports explicit partition selection\n  using the PARTITION keyword with a list of partitions or\n  subpartitions (or both) following the name of the table in a\n  table_reference (see [HELP JOIN]). In this case, rows are selected\n  only from the partitions listed, and any other partitions of the\n  table are ignored. For more information and examples, see\n  http://dev.mysql.com/doc/refman/5.6/en/partitioning-selection.html.\n\n  In MySQL 5.6.6 and later, SELECT ... PARTITION from tables using\n  storage engines such as MyISAM that perform table-level locks (and\n  thus partition locks) lock only the partitions or subpartitions named\n  by the PARTITION option.\n\n  See\n  http://dev.mysql.com/doc/refman/5.6/en/partitioning-limitations-locki\n  ng.html, for more information.\n\no The WHERE clause, if given, indicates the condition or conditions\n  that rows must satisfy to be selected. where_condition is an\n  expression that evaluates to true for each row to be selected. The\n  statement selects all rows if there is no WHERE clause.\n\n  In the WHERE expression, you can use any of the functions and\n  operators that MySQL supports, except for aggregate (summary)\n  functions. See\n  http://dev.mysql.com/doc/refman/5.6/en/expressions.html, and\n  http://dev.mysql.com/doc/refman/5.6/en/functions.html.\n\nSELECT can also be used to retrieve rows computed without reference to\nany table.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/select.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/select.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (450,16,'GROUP_CONCAT','Syntax:\nGROUP_CONCAT(expr)\n\nThis function returns a string result with the concatenated non-NULL\nvalues from a group. It returns NULL if there are no non-NULL values.\nThe full syntax is as follows:\n\nGROUP_CONCAT([DISTINCT] expr [,expr ...]\n             [ORDER BY {unsigned_integer | col_name | expr}\n                 [ASC | DESC] [,col_name ...]]\n             [SEPARATOR str_val])\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','mysql> SELECT student_name,\n    ->     GROUP_CONCAT(test_score)\n    ->     FROM student\n    ->     GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (451,17,'BENCHMARK','Syntax:\nBENCHMARK(count,expr)\n\nThe BENCHMARK() function executes the expression expr repeatedly count\ntimes. It may be used to time how quickly MySQL processes the\nexpression. The result value is always 0. The intended use is from\nwithin the mysql client, which reports query execution times:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','mysql> SELECT BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\'));\n+----------------------------------------------+\n| BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\')) |\n+----------------------------------------------+\n|                                            0 |\n+----------------------------------------------+\n1 row in set (4.74 sec)\n','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (452,14,'NAME_CONST','Syntax:\nNAME_CONST(name,value)\n\nReturns the given value. When used to produce a result set column,\nNAME_CONST() causes the column to have the given name. The arguments\nshould be constants.\n\nmysql> SELECT NAME_CONST(\'myname\', 14);\n+--------+\n| myname |\n+--------+\n|     14 |\n+--------+\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (453,27,'SHOW ENGINE','Syntax:\nSHOW ENGINE engine_name {STATUS | MUTEX}\n\nSHOW ENGINE displays operational information about a storage engine. It\nrequires the PROCESS privilege. The statement has these variants:\n\nSHOW ENGINE INNODB STATUS\nSHOW ENGINE INNODB MUTEX\nSHOW ENGINE {NDB | NDBCLUSTER} STATUS\nSHOW ENGINE PERFORMANCE_SCHEMA STATUS\n\nSHOW ENGINE INNODB STATUS displays extensive information from the\nstandard InnoDB Monitor about the state of the InnoDB storage engine.\nFor information about the standard monitor and other InnoDB Monitors\nthat provide information about InnoDB processing, see\nhttp://dev.mysql.com/doc/refman/5.6/en/innodb-monitors.html.\n\nSHOW ENGINE INNODB MUTEX displays InnoDB mutex and rw-lock statistics.\nStatement output has the following columns:\n\n*Note*: Most SHOW ENGINE INNODB MUTEX output is removed in 5.6.14. SHOW\nENGINE INNODB MUTEX output is removed entirely in MySQL 5.7.2.\nComparable information can be generated by creating views on\nPerformance Schema tables.\n\no Type\n\n  Always InnoDB.\n\no Name\n\n  The source file where the mutex is implemented, and the line number\n  in the file where the mutex is created. The line number is specific\n  to your version of MySQL.\n\no Status\n\n  The mutex status. This field displays several values if WITH_DEBUG\n  was defined at MySQL compilation time. If WITH_DEBUG was not defined,\n  the statement displays only the os_waits value. In the latter case\n  (without WITH_DEBUG), the information on which the output is based is\n  insufficient to distinguish regular mutexes and mutexes that protect\n  rw-locks (which permit multiple readers or a single writer).\n  Consequently, the output may appear to contain multiple rows for the\n  same mutex.\n\n  o count indicates how many times the mutex was requested.\n\n  o spin_waits indicates how many times the spinlock had to run.\n\n  o spin_rounds indicates the number of spinlock rounds. (spin_rounds\n    divided by spin_waits provides the average round count.)\n\n  o os_waits indicates the number of operating system waits. This\n    occurs when the spinlock did not work (the mutex was not locked\n    during the spinlock and it was necessary to yield to the operating\n    system and wait).\n\n  o os_yields indicates the number of times a thread trying to lock a\n    mutex gave up its timeslice and yielded to the operating system (on\n    the presumption that permitting other threads to run will free the\n    mutex so that it can be locked).\n\n  o os_wait_times indicates the amount of time (in ms) spent in\n    operating system waits. In MySQL 5.6 timing is disabled and this\n    value is always 0.\n\nSHOW ENGINE INNODB MUTEX skips the mutexes and rw-locks of buffer pool\nblocks, as the amount of output can be overwhelming on systems with a\nlarge buffer pool. (There is one mutex and one rw-lock in each 16K\nbuffer pool block, and there are 65,536 blocks per gigabyte.) SHOW\nENGINE INNODB MUTEX also does not list any mutexes or rw-locks that\nhave never been waited on (os_waits=0). Thus, SHOW ENGINE INNODB MUTEX\nonly displays information about mutexes and rw-locks outside of the\nbuffer pool that have caused at least one OS-level wait.\n\nSHOW ENGINE INNODB MUTEX information can be used to diagnose system\nproblems. For example, large values of spin_waits and spin_rounds may\nindicate scalability problems.\n\nUse SHOW ENGINE PERFORMANCE_SCHEMA STATUS to inspect the internal\noperation of the Performance Schema code:\n\nmysql> SHOW ENGINE PERFORMANCE_SCHEMA STATUS\\G\n...\n*************************** 3. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.row_size\nStatus: 76\n*************************** 4. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.row_count\nStatus: 10000\n*************************** 5. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.memory\nStatus: 760000\n...\n*************************** 57. row ***************************\n  Type: performance_schema\n  Name: performance_schema.memory\nStatus: 26459600\n...\n\nThis statement is intended to help the DBA understand the effects that\ndifferent Performance Schema options have on memory requirements.\n\nName values consist of two parts, which name an internal buffer and a\nbuffer attribute, respectively. Interpret buffer names as follows:\n\no An internal buffer that is not exposed as a table is named within\n  parentheses. Examples: (pfs_cond_class).row_size,\n  (pfs_mutex_class).memory.\n\no An internal buffer that is exposed as a table in the\n  performance_schema database is named after the table, without\n  parentheses. Examples: events_waits_history.row_size,\n  mutex_instances.row_count.\n\no A value that applies to the Performance Schema as a whole begins with\n  performance_schema. Example: performance_schema.memory.\n\nBuffer attributes have these meanings:\n\no row_size is the size of the internal record used by the\n  implementation, such as the size of a row in a table. row_size values\n  cannot be changed.\n\no row_count is the number of internal records, such as the number of\n  rows in a table. row_count values can be changed using Performance\n  Schema configuration options.\n\no For a table, tbl_name.memory is the product of row_size and\n  row_count. For the Performance Schema as a whole,\n  performance_schema.memory is the sum of all the memory used (the sum\n  of all other memory values).\n\nIn some cases, there is a direct relationship between a Performance\nSchema configuration parameter and a SHOW ENGINE value. For example,\nevents_waits_history_long.row_count corresponds to\nperformance_schema_events_waits_history_long_size. In other cases, the\nrelationship is more complex. For example,\nevents_waits_history.row_count corresponds to\nperformance_schema_events_waits_history_size (the number of rows per\nthread) multiplied by performance_schema_max_thread_instances ( the\nnumber of threads).\n\nSHOW ENGINE NDB STATUS If the server has the NDB storage engine\nenabled, SHOW ENGINE NDB STATUS displays cluster status information\nsuch as the number of connected data nodes, the cluster connectstring,\nand cluster binlog epochs, as well as counts of various Cluster API\nobjects created by the MySQL Server when connected to the cluster.\nSample output from this statement is shown here:\n\nmysql> SHOW ENGINE NDB STATUS;\n+------------+-----------------------+--------------------------------------------------+\n| Type       | Name                  | Status                                           |\n+------------+-----------------------+--------------------------------------------------+\n| ndbcluster | connection            | cluster_node_id=7,\n  connected_host=192.168.0.103, connected_port=1186, number_of_data_nodes=4,\n  number_of_ready_data_nodes=3, connect_count=0                                         |\n| ndbcluster | NdbTransaction        | created=6, free=0, sizeof=212                    |\n| ndbcluster | NdbOperation          | created=8, free=8, sizeof=660                    |\n| ndbcluster | NdbIndexScanOperation | created=1, free=1, sizeof=744                    |\n| ndbcluster | NdbIndexOperation     | created=0, free=0, sizeof=664                    |\n| ndbcluster | NdbRecAttr            | created=1285, free=1285, sizeof=60               |\n| ndbcluster | NdbApiSignal          | created=16, free=16, sizeof=136                  |\n| ndbcluster | NdbLabel              | created=0, free=0, sizeof=196                    |\n| ndbcluster | NdbBranch             | created=0, free=0, sizeof=24                     |\n| ndbcluster | NdbSubroutine         | created=0, free=0, sizeof=68                     |\n| ndbcluster | NdbCall               | created=0, free=0, sizeof=16                     |\n| ndbcluster | NdbBlob               | created=1, free=1, sizeof=264                    |\n| ndbcluster | NdbReceiver           | created=4, free=0, sizeof=68                     |\n| ndbcluster | binlog                | latest_epoch=155467, latest_trans_epoch=148126,\n  latest_received_binlog_epoch=0, latest_handled_binlog_epoch=0,\n  latest_applied_binlog_epoch=0                                                         |\n+------------+-----------------------+--------------------------------------------------+\n\nThe rows with connection and binlog in the Name column were added to\nthe output of this statement in MySQL 5.1. The Status column in each of\nthese rows provides information about the MySQL server\'s connection to\nthe cluster and about the cluster binary log\'s status, respectively.\nThe Status information is in the form of comma-delimited set of\nname/value pairs.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-engine.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-engine.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (454,14,'RELEASE_LOCK','Syntax:\nRELEASE_LOCK(str)\n\nReleases the lock named by the string str that was obtained with\nGET_LOCK(). Returns 1 if the lock was released, 0 if the lock was not\nestablished by this thread (in which case the lock is not released),\nand NULL if the named lock did not exist. The lock does not exist if it\nwas never obtained by a call to GET_LOCK() or if it has previously been\nreleased.\n\nThe DO statement is convenient to use with RELEASE_LOCK(). See [HELP\nDO].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (455,32,'WEEKDAY','Syntax:\nWEEKDAY(date)\n\nReturns the weekday index for date (0 = Monday, 1 = Tuesday, ... 6 =\nSunday).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT WEEKDAY(\'2008-02-03 22:23:00\');\n        -> 6\nmysql> SELECT WEEKDAY(\'2007-11-06\');\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (456,32,'TIME_TO_SEC','Syntax:\nTIME_TO_SEC(time)\n\nReturns the time argument, converted to seconds.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT TIME_TO_SEC(\'22:23:00\');\n        -> 80580\nmysql> SELECT TIME_TO_SEC(\'00:39:38\');\n        -> 2378\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (457,32,'CONVERT_TZ','Syntax:\nCONVERT_TZ(dt,from_tz,to_tz)\n\nCONVERT_TZ() converts a datetime value dt from the time zone given by\nfrom_tz to the time zone given by to_tz and returns the resulting\nvalue. Time zones are specified as described in\nhttp://dev.mysql.com/doc/refman/5.6/en/time-zone-support.html. This\nfunction returns NULL if the arguments are invalid.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'GMT\',\'MET\');\n        -> \'2004-01-01 13:00:00\'\nmysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'+00:00\',\'+10:00\');\n        -> \'2004-01-01 22:00:00\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (458,38,'EXPORT_SET','Syntax:\nEXPORT_SET(bits,on,off[,separator[,number_of_bits]])\n\nReturns a string such that for every bit set in the value bits, you get\nan on string and for every bit not set in the value, you get an off\nstring. Bits in bits are examined from right to left (from low-order to\nhigh-order bits). Strings are added to the result from left to right,\nseparated by the separator string (the default being the comma\ncharacter ","). The number of bits examined is given by number_of_bits,\nwhich has a default of 64 if not specified. number_of_bits is silently\nclipped to 64 if larger than 64. It is treated as an unsigned integer,\nso a value of -1 is effectively the same as 64.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT EXPORT_SET(5,\'Y\',\'N\',\',\',4);\n        -> \'Y,N,Y,N\'\nmysql> SELECT EXPORT_SET(6,\'1\',\'0\',\',\',10);\n        -> \'0,1,1,0,0,0,0,0,0,0\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (459,38,'CAST','Syntax:\nCAST(expr AS type)\n\nThe CAST() function takes an expression of any type and produces a\nresult value of a specified type, similar to CONVERT(). See the\ndescription of CONVERT() for more information.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/cast-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/cast-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (460,38,'SOUNDS LIKE','Syntax:\nexpr1 SOUNDS LIKE expr2\n\nThis is the same as SOUNDEX(expr1) = SOUNDEX(expr2).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (461,32,'PERIOD_DIFF','Syntax:\nPERIOD_DIFF(P1,P2)\n\nReturns the number of months between periods P1 and P2. P1 and P2\nshould be in the format YYMM or YYYYMM. Note that the period arguments\nP1 and P2 are not date values.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT PERIOD_DIFF(200802,200703);\n        -> 11\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (462,16,'AVG','Syntax:\nAVG([DISTINCT] expr)\n\nReturns the average value of expr. The DISTINCT option can be used to\nreturn the average of the distinct values of expr.\n\nAVG() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html\n\n','mysql> SELECT student_name, AVG(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (463,38,'QUOTE','Syntax:\nQUOTE(str)\n\nQuotes a string to produce a result that can be used as a properly\nescaped data value in an SQL statement. The string is returned enclosed\nby single quotation marks and with each instance of backslash ("\\"),\nsingle quote ("\'"), ASCII NUL, and Control+Z preceded by a backslash.\nIf the argument is NULL, the return value is the word "NULL" without\nenclosing single quotation marks.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT QUOTE(\'Don\\\'t!\');\n        -> \'Don\\\'t!\'\nmysql> SELECT QUOTE(NULL);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (464,19,'IN','Syntax:\nexpr IN (value,...)\n\nReturns 1 if expr is equal to any of the values in the IN list, else\nreturns 0. If all values are constants, they are evaluated according to\nthe type of expr and sorted. The search for the item then is done using\na binary search. This means IN is very quick if the IN value list\nconsists entirely of constants. Otherwise, type conversion takes place\naccording to the rules described in\nhttp://dev.mysql.com/doc/refman/5.6/en/type-conversion.html, but\napplied to all the arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 2 IN (0,3,5,7);\n        -> 0\nmysql> SELECT \'wefwf\' IN (\'wee\',\'wefwf\',\'weg\');\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (465,32,'QUARTER','Syntax:\nQUARTER(date)\n\nReturns the quarter of the year for date, in the range 1 to 4.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT QUARTER(\'2008-04-01\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (466,27,'HELP COMMAND','Syntax:\nmysql> help search_string\n\nIf you provide an argument to the help command, mysql uses it as a\nsearch string to access server-side help from the contents of the MySQL\nReference Manual. The proper operation of this command requires that\nthe help tables in the mysql database be initialized with help topic\ninformation (see\nhttp://dev.mysql.com/doc/refman/5.6/en/server-side-help-support.html).\n\nIf there is no match for the search string, the search fails:\n\nmysql> help me\n\nNothing found\nPlease try to run \'help contents\' for a list of all accessible topics\n\nUse help contents to see a list of the help categories:\n\nmysql> help contents\nYou asked for help about help category: "Contents"\nFor more information, type \'help <item>\', where <item> is one of the\nfollowing categories:\n   Account Management\n   Administration\n   Data Definition\n   Data Manipulation\n   Data Types\n   Functions\n   Functions and Modifiers for Use with GROUP BY\n   Geographic Features\n   Language Structure\n   Plugins\n   Storage Engines\n   Stored Routines\n   Table Maintenance\n   Transactions\n   Triggers\n\nIf the search string matches multiple items, mysql shows a list of\nmatching topics:\n\nmysql> help logs\nMany help items for your request exist.\nTo make a more specific request, please type \'help <item>\',\nwhere <item> is one of the following topics:\n   SHOW\n   SHOW BINARY LOGS\n   SHOW ENGINE\n   SHOW LOGS\n\nUse a topic as the search string to see the help entry for that topic:\n\nmysql> help show binary logs\nName: \'SHOW BINARY LOGS\'\nDescription:\nSyntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [purge-binary-logs], that shows how\nto determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nThe search string can contain the the wildcard characters "%" and "_".\nThese have the same meaning as for pattern-matching operations\nperformed with the LIKE operator. For example, HELP rep% returns a list\nof topics that begin with rep:\n\nmysql> HELP rep%\nMany help items for your request exist.\nTo make a more specific request, please type \'help <item>\',\nwhere <item> is one of the following\ntopics:\n   REPAIR TABLE\n   REPEAT FUNCTION\n   REPEAT LOOP\n   REPLACE\n   REPLACE FUNCTION\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mysql-server-side-help.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/mysql-server-side-help.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (467,38,'POSITION','Syntax:\nPOSITION(substr IN str)\n\nPOSITION(substr IN str) is a synonym for LOCATE(substr,str).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (468,14,'IS_USED_LOCK','Syntax:\nIS_USED_LOCK(str)\n\nChecks whether the lock named str is in use (that is, locked). If so,\nit returns the connection identifier of the client that holds the lock.\nOtherwise, it returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (469,3,'POLYFROMTEXT','PolyFromText(wkt[,srid]), PolygonFromText(wkt[,srid])\n\nConstructs a POLYGON value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (470,12,'DES_ENCRYPT','Syntax:\nDES_ENCRYPT(str[,{key_num|key_str}])\n\nEncrypts the string with the given key using the Triple-DES algorithm.\n\nThis function works only if MySQL has been configured with SSL support.\nSee http://dev.mysql.com/doc/refman/5.6/en/ssl-connections.html.\n\nThe encryption key to use is chosen based on the second argument to\nDES_ENCRYPT(), if one was given. With no argument, the first key from\nthe DES key file is used. With a key_num argument, the given key number\n(0 to 9) from the DES key file is used. With a key_str argument, the\ngiven key string is used to encrypt str.\n\nThe key file can be specified with the --des-key-file server option.\n\nThe return string is a binary string where the first character is\nCHAR(128 | key_num). If an error occurs, DES_ENCRYPT() returns NULL.\n\nThe 128 is added to make it easier to recognize an encrypted key. If\nyou use a string key, key_num is 127.\n\nThe string length for the result is given by this formula:\n\nnew_len = orig_len + (8 - (orig_len % 8)) + 1\n\nEach line in the DES key file has the following format:\n\nkey_num des_key_str\n\nEach key_num value must be a number in the range from 0 to 9. Lines in\nthe file may be in any order. des_key_str is the string that is used to\nencrypt the message. There should be at least one space between the\nnumber and the key. The first key is the default key that is used if\nyou do not specify any key argument to DES_ENCRYPT().\n\nYou can tell MySQL to read new key values from the key file with the\nFLUSH DES_KEY_FILE statement. This requires the RELOAD privilege.\n\nOne benefit of having a set of default keys is that it gives\napplications a way to check for the existence of encrypted column\nvalues, without giving the end user the right to decrypt those values.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','mysql> SELECT customer_address FROM customer_table \n     > WHERE crypted_credit_card = DES_ENCRYPT(\'credit_card_number\');\n','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (471,10,'ALTER USER','Syntax:\nALTER USER user_specification [, user_specification] ...\n\nuser_specification:\n    user PASSWORD EXPIRE\n\nThe ALTER USER statement alters MySQL accounts. To use it, you must\nhave the global CREATE USER privilege or the INSERT privilege for the\nmysql database.\n\n*Warning*: ALTER USER was added in MySQL 5.6.6. However, in 5.6.6,\nALTER USER also sets the Password column to the empty string, so do not\nuse this statement until 5.6.7.\n\nFor each account, ALTER USER expires its password. For example:\n\nALTER USER \'jeffrey\'@\'localhost\' PASSWORD EXPIRE;\n\nEach account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.6/en/account-names.html. If you\nspecify only the user name part of the account name, a host name part\nof \'%\' is used.\n\nPassword expiration for an account affects the corresponding row of the\nmysql.user table: The server sets the password_expired column to \'Y\'.\n\nA client connection operates in restricted mode if the account password\nhas been expired. In restricted mode, all operations performed in the\nconnection result in an error until the user issues a SET PASSWORD\nstatement to establish a new account password:\n\nmysql> SELECT 1;\nERROR 1820 (HY000): You must SET PASSWORD before executing this statement\n\nmysql> SET PASSWORD = PASSWORD(\'new_password\');\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SELECT 1;\n+---+\n| 1 |\n+---+\n| 1 |\n+---+\n1 row in set (0.00 sec)\n\nAs of MySQL 5.6.8, this restricted mode of operation also permits SET\nstatements, which is useful if the account password uses a hashing\nformat that requires old_passwords to be set to a value different from\nits default.\n\nIt is also possible for an administrative user to reset the account\npassword, but any existing connections for the account remain under\nrestriction. Clients using the account must disconnect and reconnect\nbefore statements can be executed successfully.\n\n*Note*: It is possible to "reset" a password with SET PASSWORD by\nsetting it to its current value. As a matter of good policy, it is\npreferable to choose a different password.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/alter-user.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/alter-user.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (472,4,'CEIL','Syntax:\nCEIL(X)\n\nCEIL() is a synonym for CEILING().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (473,17,'WAIT_UNTIL_SQL_THREAD_AFTER_GTIDS','Syntax:\nWAIT_UNTIL_SQL_THREAD_AFTER_GTIDS(gtid_set[, timeout])\n\nWait until the slave SQL thread has executed all of the transactions\nwhose global transaction identifiers are contained in gtid_set (see\nhttp://dev.mysql.com/doc/refman/5.6/en/replication-gtids-concepts.html,\nfor a definition of "GTID sets"), or until timeout seconds have\nelapsed, whichever occurs first. timeout is optional; the default\ntimeout is 0 seconds, in which case the master simply waits until all\nof the transactions in the GTID set have been executed.\n\nPrior to MySQL 5.6.9, WAIT_UNTIL_SQL_THREAD_AFTER_GTIDS() was named\nSQL_THREAD_WAIT_AFTER_GTIDS(). (Bug #14775984)\n\nFor more information, see\nhttp://dev.mysql.com/doc/refman/5.6/en/replication-gtids.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/gtid-functions.html\n\n','mysql> SELECT WAIT_UNTIL_SQL_THREAD_AFTER_GTIDS(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:1-5\');\n        -> 5\n','http://dev.mysql.com/doc/refman/5.6/en/gtid-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (474,38,'LENGTH','Syntax:\nLENGTH(str)\n\nReturns the length of the string str, measured in bytes. A multi-byte\ncharacter counts as multiple bytes. This means that for a string\ncontaining five 2-byte characters, LENGTH() returns 10, whereas\nCHAR_LENGTH() returns 5.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT LENGTH(\'text\');\n        -> 4\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (475,38,'WEIGHT_STRING','Syntax:\nWEIGHT_STRING(str [AS {CHAR|BINARY}(N)] [LEVEL levels] [flags])\n\nlevels: N [ASC|DESC|REVERSE] [, N [ASC|DESC|REVERSE]] ...\n\nThis function returns the weight string for the input string. The\nreturn value is a binary string that represents the sorting and\ncomparison value of the string. It has these properties:\n\no If WEIGHT_STRING(str1) = WEIGHT_STRING(str2), then str1 = str2 (str1\n  and str2 are considered equal)\n\no If WEIGHT_STRING(str1) < WEIGHT_STRING(str2), then str1 < str2 (str1\n  sorts before str2)\n\nWEIGHT_STRING() can be used for testing and debugging of collations,\nespecially if you are adding a new collation. See\nhttp://dev.mysql.com/doc/refman/5.6/en/adding-collation.html.\n\nThe input string, str, is a string expression. If the input is a\nnonbinary (character) string such as a CHAR, VARCHAR, or TEXT value,\nthe return value contains the collation weights for the string. If the\ninput is a binary (byte) string such as a BINARY, VARBINARY, or BLOB\nvalue, the return value is the same as the input (the weight for each\nbyte in a binary string is the byte value). If the input is NULL,\nWEIGHT_STRING() returns NULL.\n\nExamples:\n\nmysql> SET @s = _latin1 \'AB\' COLLATE latin1_swedish_ci;\nmysql> SELECT @s, HEX(@s), HEX(WEIGHT_STRING(@s));\n+------+---------+------------------------+\n| @s   | HEX(@s) | HEX(WEIGHT_STRING(@s)) |\n+------+---------+------------------------+\n| AB   | 4142    | 4142                   |\n+------+---------+------------------------+\n\nmysql> SET @s = _latin1 \'ab\' COLLATE latin1_swedish_ci;\nmysql> SELECT @s, HEX(@s), HEX(WEIGHT_STRING(@s));\n+------+---------+------------------------+\n| @s   | HEX(@s) | HEX(WEIGHT_STRING(@s)) |\n+------+---------+------------------------+\n| ab   | 6162    | 4142                   |\n+------+---------+------------------------+\n\nmysql> SET @s = CAST(\'AB\' AS BINARY);\nmysql> SELECT @s, HEX(@s), HEX(WEIGHT_STRING(@s));\n+------+---------+------------------------+\n| @s   | HEX(@s) | HEX(WEIGHT_STRING(@s)) |\n+------+---------+------------------------+\n| AB   | 4142    | 4142                   |\n+------+---------+------------------------+\n\nmysql> SET @s = CAST(\'ab\' AS BINARY);\nmysql> SELECT @s, HEX(@s), HEX(WEIGHT_STRING(@s));\n+------+---------+------------------------+\n| @s   | HEX(@s) | HEX(WEIGHT_STRING(@s)) |\n+------+---------+------------------------+\n| ab   | 6162    | 6162                   |\n+------+---------+------------------------+\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (476,31,'ST_EQUALS','ST_Equals(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially equal to g2.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (477,40,'ALTER EVENT','Syntax:\nALTER\n    [DEFINER = { user | CURRENT_USER }]\n    EVENT event_name\n    [ON SCHEDULE schedule]\n    [ON COMPLETION [NOT] PRESERVE]\n    [RENAME TO new_event_name]\n    [ENABLE | DISABLE | DISABLE ON SLAVE]\n    [COMMENT \'comment\']\n    [DO event_body]\n\nThe ALTER EVENT statement changes one or more of the characteristics of\nan existing event without the need to drop and recreate it. The syntax\nfor each of the DEFINER, ON SCHEDULE, ON COMPLETION, COMMENT, ENABLE /\nDISABLE, and DO clauses is exactly the same as when used with CREATE\nEVENT. (See [HELP CREATE EVENT].)\n\nAny user can alter an event defined on a database for which that user\nhas the EVENT privilege. When a user executes a successful ALTER EVENT\nstatement, that user becomes the definer for the affected event.\n\nALTER EVENT works only with an existing event:\n\nmysql> ALTER EVENT no_such_event \n     >     ON SCHEDULE \n     >       EVERY \'2:3\' DAY_HOUR;\nERROR 1517 (HY000): Unknown event \'no_such_event\'\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/alter-event.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/alter-event.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (478,32,'DATE_SUB','Syntax:\nDATE_SUB(date,INTERVAL expr unit)\n\nSee the description for DATE_ADD().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (479,20,'|','Syntax:\n|\n\nBitwise OR:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html\n\n','mysql> SELECT 29 | 15;\n        -> 31\n','http://dev.mysql.com/doc/refman/5.6/en/bit-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (480,14,'UUID_SHORT','Syntax:\nUUID_SHORT()\n\nReturns a "short" universal identifier as a 64-bit unsigned integer\n(rather than a string-form 128-bit identifier as returned by the UUID()\nfunction).\n\nThe value of UUID_SHORT() is guaranteed to be unique if the following\nconditions hold:\n\no The server_id of the current host is unique among your set of master\n  and slave servers\n\no server_id is between 0 and 255\n\no You do not set back your system time for your server between mysqld\n  restarts\n\no You do not invoke UUID_SHORT() on average more than 16 million times\n  per second between mysqld restarts\n\nThe UUID_SHORT() return value is constructed this way:\n\n  (server_id & 255) << 56\n+ (server_startup_time_in_seconds << 24)\n+ incremented_variable++;\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> SELECT UUID_SHORT();\n        -> 92395783831158784\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (481,3,'GEOMFROMTEXT','GeomFromText(wkt[,srid]), GeometryFromText(wkt[,srid])\n\nConstructs a geometry value of any type using its WKT representation\nand SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (482,32,'DATEDIFF','Syntax:\nDATEDIFF(expr1,expr2)\n\nDATEDIFF() returns expr1 - expr2 expressed as a value in days from one\ndate to the other. expr1 and expr2 are date or date-and-time\nexpressions. Only the date parts of the values are used in the\ncalculation.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT DATEDIFF(\'2007-12-31 23:59:59\',\'2007-12-30\');\n        -> 1\nmysql> SELECT DATEDIFF(\'2010-11-30 23:59:59\',\'2010-12-31\');\n        -> -31\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (483,40,'DROP PROCEDURE','Syntax:\nDROP {PROCEDURE | FUNCTION} [IF EXISTS] sp_name\n\nThis statement is used to drop a stored procedure or function. That is,\nthe specified routine is removed from the server. You must have the\nALTER ROUTINE privilege for the routine. (If the\nautomatic_sp_privileges system variable is enabled, that privilege and\nEXECUTE are granted automatically to the routine creator when the\nroutine is created and dropped from the creator when the routine is\ndropped. See\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-routines-privileges.html.\n)\n\nThe IF EXISTS clause is a MySQL extension. It prevents an error from\noccurring if the procedure or function does not exist. A warning is\nproduced that can be viewed with SHOW WARNINGS.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/drop-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/drop-procedure.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (484,5,'INSTALL PLUGIN','Syntax:\nINSTALL PLUGIN plugin_name SONAME \'shared_library_name\'\n\nThis statement installs a server plugin. It requires the INSERT\nprivilege for the mysql.plugin table.\n\nplugin_name is the name of the plugin as defined in the plugin\ndescriptor structure contained in the library file (see\nhttp://dev.mysql.com/doc/refman/5.6/en/plugin-data-structures.html).\nPlugin names are not case sensitive. For maximal compatibility, plugin\nnames should be limited to ASCII letters, digits, and underscore\nbecause they are used in C source files, shell command lines, M4 and\nBourne shell scripts, and SQL environments.\n\nshared_library_name is the name of the shared library that contains the\nplugin code. The name includes the file name extension (for example,\nlibmyplugin.so, libmyplugin.dll, or libmyplugin.dylib).\n\nThe shared library must be located in the plugin directory (the\ndirectory named by the plugin_dir system variable). The library must be\nin the plugin directory itself, not in a subdirectory. By default,\nplugin_dir is the plugin directory under the directory named by the\npkglibdir configuration variable, but it can be changed by setting the\nvalue of plugin_dir at server startup. For example, set its value in a\nmy.cnf file:\n\n[mysqld]\nplugin_dir=/path/to/plugin/directory\n\nIf the value of plugin_dir is a relative path name, it is taken to be\nrelative to the MySQL base directory (the value of the basedir system\nvariable).\n\nINSTALL PLUGIN loads and initializes the plugin code to make the plugin\navailable for use. A plugin is initialized by executing its\ninitialization function, which handles any setup that the plugin must\nperform before it can be used. When the server shuts down, it executes\nthe deinitialization function for each plugin that is loaded so that\nthe plugin has a change to perform any final cleanup.\n\nINSTALL PLUGIN also registers the plugin by adding a line that\nindicates the plugin name and library file name to the mysql.plugin\ntable. At server startup, the server loads and initializes any plugin\nthat is listed in the mysql.plugin table. This means that a plugin is\ninstalled with INSTALL PLUGIN only once, not every time the server\nstarts. Plugin loading at startup does not occur if the server is\nstarted with the --skip-grant-tables option.\n\nA plugin library can contain multiple plugins. For each of them to be\ninstalled, use a separate INSTALL PLUGIN statement. Each statement\nnames a different plugin, but all of them specify the same library\nname.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/install-plugin.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/install-plugin.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (485,28,'LOAD DATA','Syntax:\nLOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'file_name\'\n    [REPLACE | IGNORE]\n    INTO TABLE tbl_name\n    [PARTITION (partition_name,...)]\n    [CHARACTER SET charset_name]\n    [{FIELDS | COLUMNS}\n        [TERMINATED BY \'string\']\n        [[OPTIONALLY] ENCLOSED BY \'char\']\n        [ESCAPED BY \'char\']\n    ]\n    [LINES\n        [STARTING BY \'string\']\n        [TERMINATED BY \'string\']\n    ]\n    [IGNORE number {LINES | ROWS}]\n    [(col_name_or_user_var,...)]\n    [SET col_name = expr,...]\n\nThe LOAD DATA INFILE statement reads rows from a text file into a table\nat a very high speed. LOAD DATA INFILE is the complement of SELECT ...\nINTO OUTFILE. (See\nhttp://dev.mysql.com/doc/refman/5.6/en/select-into.html.) To write data\nfrom a table to a file, use SELECT ... INTO OUTFILE. To read the file\nback into a table, use LOAD DATA INFILE. The syntax of the FIELDS and\nLINES clauses is the same for both statements. Both clauses are\noptional, but FIELDS must precede LINES if both are specified.\n\nYou can also load data files by using the mysqlimport utility; it\noperates by sending a LOAD DATA INFILE statement to the server. The\n--local option causes mysqlimport to read data files from the client\nhost. You can specify the --compress option to get better performance\nover slow networks if the client and server support the compressed\nprotocol. See http://dev.mysql.com/doc/refman/5.6/en/mysqlimport.html.\n\nFor more information about the efficiency of INSERT versus LOAD DATA\nINFILE and speeding up LOAD DATA INFILE, see\nhttp://dev.mysql.com/doc/refman/5.6/en/insert-speed.html.\n\nThe file name must be given as a literal string. On Windows, specify\nbackslashes in path names as forward slashes or doubled backslashes.\nThe character_set_filesystem system variable controls the\ninterpretation of the file name.\n\nIn MySQL 5.6.2 and later, LOAD DATA supports explicit partition\nselection using the PARTITION option with a comma-separated list of\nmore or more names of partitions, subpartitions, or both. When this\noption is used, if any rows from the file cannot be inserted into any\nof the partitions or subpartitions named in the list, the statement\nfails with the error Found a row not matching the given partition set.\nFor more information, see\nhttp://dev.mysql.com/doc/refman/5.6/en/partitioning-selection.html.\n\nFor partitioned tables using storage engines that employ table locks,\nsuch as MyISAM, LOAD DATA cannot prune any partition locks. This does\nnot apply to tables using storage engines which employ row-level\nlocking, such as InnoDB. For more information, see\nhttp://dev.mysql.com/doc/refman/5.6/en/partitioning-limitations-locking\n.html.\n\nThe character set indicated by the character_set_database system\nvariable is used to interpret the information in the file. SET NAMES\nand the setting of character_set_client do not affect interpretation of\ninput. If the contents of the input file use a character set that\ndiffers from the default, it is usually preferable to specify the\ncharacter set of the file by using the CHARACTER SET clause. A\ncharacter set of binary specifies "no conversion."\n\nLOAD DATA INFILE interprets all fields in the file as having the same\ncharacter set, regardless of the data types of the columns into which\nfield values are loaded. For proper interpretation of file contents,\nyou must ensure that it was written with the correct character set. For\nexample, if you write a data file with mysqldump -T or by issuing a\nSELECT ... INTO OUTFILE statement in mysql, be sure to use a\n--default-character-set option so that output is written in the\ncharacter set to be used when the file is loaded with LOAD DATA INFILE.\n\n*Note*: It is not possible to load data files that use the ucs2, utf16,\nutf16le, or utf32 character set.\n\nIf you use LOW_PRIORITY, execution of the LOAD DATA statement is\ndelayed until no other clients are reading from the table. This affects\nonly storage engines that use only table-level locking (such as MyISAM,\nMEMORY, and MERGE).\n\nIf you specify CONCURRENT with a MyISAM table that satisfies the\ncondition for concurrent inserts (that is, it contains no free blocks\nin the middle), other threads can retrieve data from the table while\nLOAD DATA is executing. This option affects the performance of LOAD\nDATA a bit, even if no other thread is using the table at the same\ntime.\n\nWith row-based replication, CONCURRENT is replicated regardless of\nMySQL version. With statement-based replication CONCURRENT is not\nreplicated prior to MySQL 5.5.1 (see Bug #34628). For more information,\nsee\nhttp://dev.mysql.com/doc/refman/5.6/en/replication-features-load-data.h\ntml.\n\nThe LOCAL keyword affects expected location of the file and error\nhandling, as described later. LOCAL works only if your server and your\nclient both have been configured to permit it. For example, if mysqld\nwas started with --local-infile=0, LOCAL does not work. See\nhttp://dev.mysql.com/doc/refman/5.6/en/load-data-local.html.\n\nThe LOCAL keyword affects where the file is expected to be found:\n\no If LOCAL is specified, the file is read by the client program on the\n  client host and sent to the server. The file can be given as a full\n  path name to specify its exact location. If given as a relative path\n  name, the name is interpreted relative to the directory in which the\n  client program was started.\n\n  When using LOCAL with LOAD DATA, a copy of the file is created in the\n  server\'s temporary directory. This is not the directory determined by\n  the value of tmpdir or slave_load_tmpdir, but rather the operating\n  system\'s temporary directory, and is not configurable in the MySQL\n  Server. (Typically the system temporary directory is /tmp on Linux\n  systems and C:\\WINDOWS\\TEMP on Windows.) Lack of sufficient space for\n  the copy in this directory can cause the LOAD DATA LOCAL statement to\n  fail.\n\no If LOCAL is not specified, the file must be located on the server\n  host and is read directly by the server. The server uses the\n  following rules to locate the file:\n\n  o If the file name is an absolute path name, the server uses it as\n    given.\n\n  o If the file name is a relative path name with one or more leading\n    components, the server searches for the file relative to the\n    server\'s data directory.\n\n  o If a file name with no leading components is given, the server\n    looks for the file in the database directory of the default\n    database.\n\nIn the non-LOCAL case, these rules mean that a file named as\n./myfile.txt is read from the server\'s data directory, whereas the file\nnamed as myfile.txt is read from the database directory of the default\ndatabase. For example, if db1 is the default database, the following\nLOAD DATA statement reads the file data.txt from the database directory\nfor db1, even though the statement explicitly loads the file into a\ntable in the db2 database:\n\nLOAD DATA INFILE \'data.txt\' INTO TABLE db2.my_table;\n\nFor security reasons, when reading text files located on the server,\nthe files must either reside in the database directory or be readable\nby all. Also, to use LOAD DATA INFILE on server files, you must have\nthe FILE privilege. See\nhttp://dev.mysql.com/doc/refman/5.6/en/privileges-provided.html. For\nnon-LOCAL load operations, if the secure_file_priv system variable is\nset to a nonempty directory name, the file to be loaded must be located\nin that directory.\n\nUsing LOCAL is a bit slower than letting the server access the files\ndirectly, because the contents of the file must be sent over the\nconnection by the client to the server. On the other hand, you do not\nneed the FILE privilege to load local files.\n\nLOCAL also affects error handling:\n\no With LOAD DATA INFILE, data-interpretation and duplicate-key errors\n  terminate the operation.\n\no With LOAD DATA LOCAL INFILE, data-interpretation and duplicate-key\n  errors become warnings and the operation continues because the server\n  has no way to stop transmission of the file in the middle of the\n  operation. For duplicate-key errors, this is the same as if IGNORE is\n  specified. IGNORE is explained further later in this section.\n\nThe REPLACE and IGNORE keywords control handling of input rows that\nduplicate existing rows on unique key values:\n\no If you specify REPLACE, input rows replace existing rows. In other\n  words, rows that have the same value for a primary key or unique\n  index as an existing row. See [HELP REPLACE].\n\no If you specify IGNORE, input rows that duplicate an existing row on a\n  unique key value are skipped.\n\no If you do not specify either option, the behavior depends on whether\n  the LOCAL keyword is specified. Without LOCAL, an error occurs when a\n  duplicate key value is found, and the rest of the text file is\n  ignored. With LOCAL, the default behavior is the same as if IGNORE is\n  specified; this is because the server has no way to stop transmission\n  of the file in the middle of the operation.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/load-data.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/load-data.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (486,24,'DECLARE CURSOR','Syntax:\nDECLARE cursor_name CURSOR FOR select_statement\n\nThis statement declares a cursor and associates it with a SELECT\nstatement that retrieves the rows to be traversed by the cursor. To\nfetch the rows later, use a FETCH statement. The number of columns\nretrieved by the SELECT statement must match the number of output\nvariables specified in the FETCH statement.\n\nThe SELECT statement cannot have an INTO clause.\n\nCursor declarations must appear before handler declarations and after\nvariable and condition declarations.\n\nA stored program may contain multiple cursor declarations, but each\ncursor declared in a given block must have a unique name. For an\nexample, see http://dev.mysql.com/doc/refman/5.6/en/cursors.html.\n\nFor information available through SHOW statements, it is possible in\nmany cases to obtain equivalent information by using a cursor with an\nINFORMATION_SCHEMA table.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/declare-cursor.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/declare-cursor.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (487,32,'LOCALTIME','Syntax:\nLOCALTIME, LOCALTIME([fsp])\n\nLOCALTIME and LOCALTIME() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (488,12,'SHA1','Syntax:\nSHA1(str), SHA(str)\n\nCalculates an SHA-1 160-bit checksum for the string, as described in\nRFC 3174 (Secure Hash Algorithm). The value is returned as a string of\n40 hex digits, or NULL if the argument was NULL. One of the possible\nuses for this function is as a hash key. See the notes at the beginning\nof this section about storing hash values efficiently. You can also use\nSHA1() as a cryptographic function for storing passwords. SHA() is\nsynonymous with SHA1().\n\nThe return value is a nonbinary string in the connection character set.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','mysql> SELECT SHA1(\'abc\');\n        -> \'a9993e364706816aba3e25717850c26c9cd0d89d\'\n','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (489,23,'BLOB','BLOB[(M)]\n\nA BLOB column with a maximum length of 65,535 (216 - 1) bytes. Each\nBLOB value is stored using a 2-byte length prefix that indicates the\nnumber of bytes in the value.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest BLOB type large enough to hold\nvalues M bytes long.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (490,12,'PASSWORD','Syntax:\nPASSWORD(str)\n\nReturns a hashed password string calculated from the cleartext password\nstr. The return value is a nonbinary string in the connection character\nset, or NULL if the argument is NULL. This function is the SQL\ninterface to the algorithm used by the server to encrypt MySQL\npasswords for storage in the mysql.user grant table.\n\nThe old_passwords system variable controls the password hashing method\nused by the PASSWORD() function. It also influences password hashing\nperformed by CREATE USER and GRANT statements that specify a password\nusing an IDENTIFIED BY clause.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','mysql> SET old_passwords = 0;\nmysql> SELECT PASSWORD(\'mypass\'), OLD_PASSWORD(\'mypass\');\n+-------------------------------------------+------------------------+\n| PASSWORD(\'mypass\')                        | OLD_PASSWORD(\'mypass\') |\n+-------------------------------------------+------------------------+\n| *6C8989366EAF75BB670AD8EA7A7FC1176A95CEF4 | 6f8c114b58f2ce9e       |\n+-------------------------------------------+------------------------+\n\nmysql> SET old_passwords = 1;\nmysql> SELECT PASSWORD(\'mypass\'), OLD_PASSWORD(\'mypass\');\n+--------------------+------------------------+\n| PASSWORD(\'mypass\') | OLD_PASSWORD(\'mypass\') |\n+--------------------+------------------------+\n| 6f8c114b58f2ce9e   | 6f8c114b58f2ce9e       |\n+--------------------+------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (491,32,'UTC_DATE','Syntax:\nUTC_DATE, UTC_DATE()\n\nReturns the current UTC date as a value in \'YYYY-MM-DD\' or YYYYMMDD\nformat, depending on whether the function is used in a string or\nnumeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_DATE(), UTC_DATE() + 0;\n        -> \'2003-08-14\', 20030814\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (492,37,'DIMENSION','Dimension(g)\n\nReturns the inherent dimension of the geometry value g. The result can\nbe -1, 0, 1, or 2. The meaning of these values is given in\nhttp://dev.mysql.com/doc/refman/5.6/en/gis-class-geometry.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SELECT Dimension(GeomFromText(\'LineString(1 1,2 2)\'));\n+------------------------------------------------+\n| Dimension(GeomFromText(\'LineString(1 1,2 2)\')) |\n+------------------------------------------------+\n|                                              1 |\n+------------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (493,23,'BIT','BIT[(M)]\n\nA bit-field type. M indicates the number of bits per value, from 1 to\n64. The default is 1 if M is omitted.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/numeric-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (494,31,'EQUALS','Equals(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially equal to g2.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/functions-for-testing-spatial-relations-between-geometric-objects.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (495,8,'XA','Syntax:\nXA {START|BEGIN} xid [JOIN|RESUME]\n\nXA END xid [SUSPEND [FOR MIGRATE]]\n\nXA PREPARE xid\n\nXA COMMIT xid [ONE PHASE]\n\nXA ROLLBACK xid\n\nXA RECOVER\n\nFor XA START, the JOIN and RESUME clauses are not supported.\n\nFor XA END the SUSPEND [FOR MIGRATE] clause is not supported.\n\nEach XA statement begins with the XA keyword, and most of them require\nan xid value. An xid is an XA transaction identifier. It indicates\nwhich transaction the statement applies to. xid values are supplied by\nthe client, or generated by the MySQL server. An xid value has from one\nto three parts:\n\nxid: gtrid [, bqual [, formatID ]]\n\ngtrid is a global transaction identifier, bqual is a branch qualifier,\nand formatID is a number that identifies the format used by the gtrid\nand bqual values. As indicated by the syntax, bqual and formatID are\noptional. The default bqual value is \'\' if not given. The default\nformatID value is 1 if not given.\n\ngtrid and bqual must be string literals, each up to 64 bytes (not\ncharacters) long. gtrid and bqual can be specified in several ways. You\ncan use a quoted string (\'ab\'), hex string (0x6162, X\'ab\'), or bit\nvalue (b\'nnnn\').\n\nformatID is an unsigned integer.\n\nThe gtrid and bqual values are interpreted in bytes by the MySQL\nserver\'s underlying XA support routines. However, while an SQL\nstatement containing an XA statement is being parsed, the server works\nwith some specific character set. To be safe, write gtrid and bqual as\nhex strings.\n\nxid values typically are generated by the Transaction Manager. Values\ngenerated by one TM must be different from values generated by other\nTMs. A given TM must be able to recognize its own xid values in a list\nof values returned by the XA RECOVER statement.\n\nXA START xid starts an XA transaction with the given xid value. Each XA\ntransaction must have a unique xid value, so the value must not\ncurrently be used by another XA transaction. Uniqueness is assessed\nusing the gtrid and bqual values. All following XA statements for the\nXA transaction must be specified using the same xid value as that given\nin the XA START statement. If you use any of those statements but\nspecify an xid value that does not correspond to some existing XA\ntransaction, an error occurs.\n\nOne or more XA transactions can be part of the same global transaction.\nAll XA transactions within a given global transaction must use the same\ngtrid value in the xid value. For this reason, gtrid values must be\nglobally unique so that there is no ambiguity about which global\ntransaction a given XA transaction is part of. The bqual part of the\nxid value must be different for each XA transaction within a global\ntransaction. (The requirement that bqual values be different is a\nlimitation of the current MySQL XA implementation. It is not part of\nthe XA specification.)\n\nThe XA RECOVER statement returns information for those XA transactions\non the MySQL server that are in the PREPARED state. (See\nhttp://dev.mysql.com/doc/refman/5.6/en/xa-states.html.) The output\nincludes a row for each such XA transaction on the server, regardless\nof which client started it.\n\nXA RECOVER output rows look like this (for an example xid value\nconsisting of the parts \'abc\', \'def\', and 7):\n\nmysql> XA RECOVER;\n+----------+--------------+--------------+--------+\n| formatID | gtrid_length | bqual_length | data   |\n+----------+--------------+--------------+--------+\n|        7 |            3 |            3 | abcdef |\n+----------+--------------+--------------+--------+\n\nThe output columns have the following meanings:\n\no formatID is the formatID part of the transaction xid\n\no gtrid_length is the length in bytes of the gtrid part of the xid\n\no bqual_length is the length in bytes of the bqual part of the xid\n\no data is the concatenation of the gtrid and bqual parts of the xid\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/xa-statements.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/xa-statements.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (496,38,'OCTET_LENGTH','Syntax:\nOCTET_LENGTH(str)\n\nOCTET_LENGTH() is a synonym for LENGTH().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (497,32,'UTC_TIMESTAMP','Syntax:\nUTC_TIMESTAMP, UTC_TIMESTAMP([fsp])\n\nReturns the current UTC date and time as a value in \'YYYY-MM-DD\nHH:MM:SS\' or YYYYMMDDHHMMSS format, depending on whether the function\nis used in a string or numeric context.\n\nAs of MySQL 5.6.4, if the fsp argument is given to specify a fractional\nseconds precision from 0 to 6, the return value includes a fractional\nseconds part of that many digits. Before 5.6.4, any argument is\nignored.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_TIMESTAMP(), UTC_TIMESTAMP() + 0;\n        -> \'2003-08-14 18:08:04\', 20030814180804.000000\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (498,12,'AES_ENCRYPT','Syntax:\nAES_ENCRYPT(str,key_str[,init_vector])\n\nAES_ENCRYPT() and AES_DECRYPT() implement encryption and decryption of\ndata using the official AES (Advanced Encryption Standard) algorithm,\npreviously known as "Rijndael." The AES standard permits various key\nlengths. By default these functions implement AES with a 128-bit key\nlength. As of MySQL 5.6.17, key lengths of 196 or 256 bits can be used,\nas described later. The key length is a trade off between performance\nand security.\n\nAES_ENCRYPT() encrypts the string str using the key string key_str and\nreturns a binary string containing the encrypted output. AES_DECRYPT()\ndecrypts the encrypted string crypt_str using the key string key_str\nand returns the original plaintext string. If either function argument\nis NULL, the function returns NULL.\n\nThe str and crypt_str arguments can be any length, and padding is\nautomatically added to str so it is a multiple of a block as required\nby block-based algorithms such as AES. This padding is automatically\nremoved by the AES_DECRYPT() function. The length of crypt_str can be\ncalculated using this formula:\n\n16 * (trunc(string_length / 16) + 1)\n\nFor a key length of 128 bits, the most secure way to pass a key to the\nkey_str argument is to create a truly random 128-bit value and pass it\nas a binary value. For example:\n\nINSERT INTO t\nVALUES (1,AES_ENCRYPT(\'text\',UNHEX(\'F3229A0B371ED2D9441B830D21A390C3\')));\n\nA passphrase can be used to generate an AES key by hashing the\npassphrase. For example:\n\nINSERT INTO t VALUES (1,AES_ENCRYPT(\'text\', SHA2(\'My secret passphrase\',512)));\n\nDo not pass a password or passphrase directly to crypt_str, hash it\nfirst. Previous versions of this documentation suggested the former\napproach, but it is no longer recommended as the examples shown here\nare more secure.\n\nIf AES_DECRYPT() detects invalid data or incorrect padding, it returns\nNULL. However, it is possible for AES_DECRYPT() to return a non-NULL\nvalue (possibly garbage) if the input data or the key is invalid.\n\nAs of MySQL 5.6.17, AES_ENCRYPT() and AES_DECRYPT() permit control of\nthe block encryption mode and take an optional init_vector\ninitialization vector argument:\n\no The block_encryption_mode system variable controls the mode for\n  block-based encryption algorithms. Its default value is aes-128-ecb,\n  which signifies encryption using a key length of 128 bits and ECB\n  mode. For a description of the permitted values of this variable, see\n  http://dev.mysql.com/doc/refman/5.6/en/server-system-variables.html.\n\no The optional init_vector argument provides an initialization vector\n  for block encryption modes that require it.\n\nFor modes that require the optional init_vector argument, it must be 16\nbytes or longer (bytes in excess of 16 are ignored). An error occurs if\ninit_vector is missing.\n\nFor modes that do not require init_vector, it is ignored and a warning\nis generated if it is specified.\n\nA random string of bytes to use for the initialization vector can be\nproduced by calling RANDOM_BYTES(16). For encryption modes that require\nan initialization vector, the same vector must be used for encryption\nand decryption.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html\n\n','mysql> SET block_encryption_mode = \'aes-256-cbc\';\nmysql> SET @key_str = SHA2(\'My secret passphrase\',512);\nmysql> SET @init_vector = RANDOM_BYTES(16);\nmysql> SET @crypt_str = AES_ENCRYPT(\'text\',@key_str,@init_vector);\nmysql> SELECT AES_DECRYPT(@crypt_str,@key_str,@init_vector);\n+-----------------------------------------------+\n| AES_DECRYPT(@crypt_str,@key_str,@init_vector) |\n+-----------------------------------------------+\n| text                                          |\n+-----------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (499,4,'+','Syntax:\n+\n\nAddition:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html\n\n','mysql> SELECT 3+5;\n        -> 8\n','http://dev.mysql.com/doc/refman/5.6/en/arithmetic-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (500,17,'GTID_SUBTRACT','Syntax:\nGTID_SUBTRACT(set,subset)\n\nGiven two sets of global transaction IDs subset and set, returns only\nthose GTIDs from set that are not in subset.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/gtid-functions.html\n\n','mysql> SELECT GTID_SUBTRACT(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\', \n    ->     \'3E11FA47-71CA-11E1-9E33-C80AA9429562:21\')\\G\n*************************** 1. row ***************************\nGTID_SUBTRACT(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\', \n    \'3E11FA47-71CA-11E1-9E33-C80AA9429562:21\'): 3e11fa47-71ca-11e1-9e33-c80aa9429562:22-57\n1 row in set (0.00 sec)\n\nmysql> SELECT GTID_SUBTRACT(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\', \n    ->     \'3E11FA47-71CA-11E1-9E33-C80AA9429562:20-25\')\\G\n*************************** 1. row ***************************\nGTID_SUBTRACT(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\', \n    \'3E11FA47-71CA-11E1-9E33-C80AA9429562:20-25\'): 3e11fa47-71ca-11e1-9e33-c80aa9429562:26-57\n1 row in set (0.00 sec)\n\nmysql> SELECT GTID_SUBTRACT(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\', \n    ->     \'3E11FA47-71CA-11E1-9E33-C80AA9429562:23-24\')\\G\n*************************** 1. row ***************************\nGTID_SUBTRACT(\'3E11FA47-71CA-11E1-9E33-C80AA9429562:21-57\', \n    \'3E11FA47-71CA-11E1-9E33-C80AA9429562:23-24\'): 3e11fa47-71ca-11e1-9e33-c80aa9429562:21-22:25-57\n1 row in set (0.01 sec)\n','http://dev.mysql.com/doc/refman/5.6/en/gtid-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (501,14,'INET_NTOA','Syntax:\nINET_NTOA(expr)\n\nGiven a numeric IPv4 network address in network byte order, returns the\ndotted-quad string representation of the address as a nonbinary string\nin the connection character set. INET_NTOA() returns NULL if it does\nnot understand its argument.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> SELECT INET_NTOA(167773449);\n        -> \'10.0.5.9\'\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (502,32,'DAYOFWEEK','Syntax:\nDAYOFWEEK(date)\n\nReturns the weekday index for date (1 = Sunday, 2 = Monday, ..., 7 =\nSaturday). These index values correspond to the ODBC standard.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFWEEK(\'2007-02-03\');\n        -> 7\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (503,4,'CEILING','Syntax:\nCEILING(X)\n\nReturns the smallest integer value not less than X.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT CEILING(1.23);\n        -> 2\nmysql> SELECT CEILING(-1.23);\n        -> -1\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (504,33,'LINEFROMWKB','LineFromWKB(wkb[,srid]), LineStringFromWKB(wkb[,srid])\n\nConstructs a LINESTRING value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (505,27,'SHOW PROCESSLIST','Syntax:\nSHOW [FULL] PROCESSLIST\n\nSHOW PROCESSLIST shows you which threads are running. You can also get\nthis information from the INFORMATION_SCHEMA PROCESSLIST table or the\nmysqladmin processlist command. If you have the PROCESS privilege, you\ncan see all threads. Otherwise, you can see only your own threads (that\nis, threads associated with the MySQL account that you are using). If\nyou do not use the FULL keyword, only the first 100 characters of each\nstatement are shown in the Info field.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-processlist.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-processlist.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (506,37,'GEOMETRYTYPE','GeometryType(g)\n\nReturns as a binary string the name of the geometry type of which the\ngeometry instance g is a member. The name corresponds to one of the\ninstantiable Geometry subclasses.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html\n\n','mysql> SELECT GeometryType(GeomFromText(\'POINT(1 1)\'));\n+------------------------------------------+\n| GeometryType(GeomFromText(\'POINT(1 1)\')) |\n+------------------------------------------+\n| POINT                                    |\n+------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.6/en/geometry-property-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (507,40,'CREATE VIEW','Syntax:\nCREATE\n    [OR REPLACE]\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThe CREATE VIEW statement creates a new view, or replaces an existing\none if the OR REPLACE clause is given. If the view does not exist,\nCREATE OR REPLACE VIEW is the same as CREATE VIEW. If the view does\nexist, CREATE OR REPLACE VIEW is the same as ALTER VIEW.\n\nThe select_statement is a SELECT statement that provides the definition\nof the view. (When you select from the view, you select in effect using\nthe SELECT statement.) select_statement can select from base tables or\nother views.\n\nThe view definition is "frozen" at creation time, so changes to the\nunderlying tables afterward do not affect the view definition. For\nexample, if a view is defined as SELECT * on a table, new columns added\nto the table later do not become part of the view.\n\nThe ALGORITHM clause affects how MySQL processes the view. The DEFINER\nand SQL SECURITY clauses specify the security context to be used when\nchecking access privileges at view invocation time. The WITH CHECK\nOPTION clause can be given to constrain inserts or updates to rows in\ntables referenced by the view. These clauses are described later in\nthis section.\n\nThe CREATE VIEW statement requires the CREATE VIEW privilege for the\nview, and some privilege for each column selected by the SELECT\nstatement. For columns used elsewhere in the SELECT statement you must\nhave the SELECT privilege. If the OR REPLACE clause is present, you\nmust also have the DROP privilege for the view. CREATE VIEW might also\nrequire the SUPER privilege, depending on the DEFINER value, as\ndescribed later in this section.\n\nWhen a view is referenced, privilege checking occurs as described later\nin this section.\n\nA view belongs to a database. By default, a new view is created in the\ndefault database. To create the view explicitly in a given database,\nspecify the name as db_name.view_name when you create it:\n\nmysql> CREATE VIEW test.v AS SELECT * FROM t;\n\nWithin a database, base tables and views share the same namespace, so a\nbase table and a view cannot have the same name.\n\nColumns retrieved by the SELECT statement can be simple references to\ntable columns. They can also be expressions that use functions,\nconstant values, operators, and so forth.\n\nViews must have unique column names with no duplicates, just like base\ntables. By default, the names of the columns retrieved by the SELECT\nstatement are used for the view column names. To define explicit names\nfor the view columns, the optional column_list clause can be given as a\nlist of comma-separated identifiers. The number of names in column_list\nmust be the same as the number of columns retrieved by the SELECT\nstatement.\n\nUnqualified table or view names in the SELECT statement are interpreted\nwith respect to the default database. A view can refer to tables or\nviews in other databases by qualifying the table or view name with the\nproper database name.\n\nA view can be created from many kinds of SELECT statements. It can\nrefer to base tables or other views. It can use joins, UNION, and\nsubqueries. The SELECT need not even refer to any tables. The following\nexample defines a view that selects two columns from another table, as\nwell as an expression calculated from those columns:\n\nmysql> CREATE TABLE t (qty INT, price INT);\nmysql> INSERT INTO t VALUES(3, 50);\nmysql> CREATE VIEW v AS SELECT qty, price, qty*price AS value FROM t;\nmysql> SELECT * FROM v;\n+------+-------+-------+\n| qty  | price | value |\n+------+-------+-------+\n|    3 |    50 |   150 |\n+------+-------+-------+\n\nA view definition is subject to the following restrictions:\n\no The SELECT statement cannot contain a subquery in the FROM clause.\n\no The SELECT statement cannot refer to system or user variables.\n\no Within a stored program, the definition cannot refer to program\n  parameters or local variables.\n\no The SELECT statement cannot refer to prepared statement parameters.\n\no Any table or view referred to in the definition must exist. However,\n  after a view has been created, it is possible to drop a table or view\n  that the definition refers to. In this case, use of the view results\n  in an error. To check a view definition for problems of this kind,\n  use the CHECK TABLE statement.\n\no The definition cannot refer to a TEMPORARY table, and you cannot\n  create a TEMPORARY view.\n\no Any tables named in the view definition must exist at definition\n  time.\n\no You cannot associate a trigger with a view.\n\no Aliases for column names in the SELECT statement are checked against\n  the maximum column length of 64 characters (not the maximum alias\n  length of 256 characters).\n\nORDER BY is permitted in a view definition, but it is ignored if you\nselect from a view using a statement that has its own ORDER BY.\n\nFor other options or clauses in the definition, they are added to the\noptions or clauses of the statement that references the view, but the\neffect is undefined. For example, if a view definition includes a LIMIT\nclause, and you select from the view using a statement that has its own\nLIMIT clause, it is undefined which limit applies. This same principle\napplies to options such as ALL, DISTINCT, or SQL_SMALL_RESULT that\nfollow the SELECT keyword, and to clauses such as INTO, FOR UPDATE,\nLOCK IN SHARE MODE, and PROCEDURE.\n\nIf you create a view and then change the query processing environment\nby changing system variables, that may affect the results that you get\nfrom the view:\n\nmysql> CREATE VIEW v (mycol) AS SELECT \'abc\';\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SET sql_mode = \'\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT "mycol" FROM v;\n+-------+\n| mycol |\n+-------+\n| mycol |\n+-------+\n1 row in set (0.01 sec)\n\nmysql> SET sql_mode = \'ANSI_QUOTES\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT "mycol" FROM v;\n+-------+\n| mycol |\n+-------+\n| abc   |\n+-------+\n1 row in set (0.00 sec)\n\nThe DEFINER and SQL SECURITY clauses determine which MySQL account to\nuse when checking access privileges for the view when a statement is\nexecuted that references the view. The valid SQL SECURITY\ncharacteristic values are DEFINER and INVOKER. These indicate that the\nrequired privileges must be held by the user who defined or invoked the\nview, respectively. The default SQL SECURITY value is DEFINER.\n\nIf a user value is given for the DEFINER clause, it should be a MySQL\naccount specified as \'user_name\'@\'host_name\' (the same format used in\nthe GRANT statement), CURRENT_USER, or CURRENT_USER(). The default\nDEFINER value is the user who executes the CREATE VIEW statement. This\nis the same as specifying DEFINER = CURRENT_USER explicitly.\n\nIf you specify the DEFINER clause, these rules determine the valid\nDEFINER user values:\n\no If you do not have the SUPER privilege, the only valid user value is\n  your own account, either specified literally or by using\n  CURRENT_USER. You cannot set the definer to some other account.\n\no If you have the SUPER privilege, you can specify any syntactically\n  valid account name. If the account does not actually exist, a warning\n  is generated.\n\no Although it is possible to create a view with a nonexistent DEFINER\n  account, an error occurs when the view is referenced if the SQL\n  SECURITY value is DEFINER but the definer account does not exist.\n\nFor more information about view security, see\nhttp://dev.mysql.com/doc/refman/5.6/en/stored-programs-security.html.\n\nWithin a view definition, CURRENT_USER returns the view\'s DEFINER value\nby default. For views defined with the SQL SECURITY INVOKER\ncharacteristic, CURRENT_USER returns the account for the view\'s\ninvoker. For information about user auditing within views, see\nhttp://dev.mysql.com/doc/refman/5.6/en/account-activity-auditing.html.\n\nWithin a stored routine that is defined with the SQL SECURITY DEFINER\ncharacteristic, CURRENT_USER returns the routine\'s DEFINER value. This\nalso affects a view defined within such a routine, if the view\ndefinition contains a DEFINER value of CURRENT_USER.\n\nView privileges are checked like this:\n\no At view definition time, the view creator must have the privileges\n  needed to use the top-level objects accessed by the view. For\n  example, if the view definition refers to table columns, the creator\n  must have some privilege for each column in the select list of the\n  definition, and the SELECT privilege for each column used elsewhere\n  in the definition. If the definition refers to a stored function,\n  only the privileges needed to invoke the function can be checked. The\n  privileges required at function invocation time can be checked only\n  as it executes: For different invocations, different execution paths\n  within the function might be taken.\n\no The user who references a view must have appropriate privileges to\n  access it (SELECT to select from it, INSERT to insert into it, and so\n  forth.)\n\no When a view has been referenced, privileges for objects accessed by\n  the view are checked against the privileges held by the view DEFINER\n  account or invoker, depending on whether the SQL SECURITY\n  characteristic is DEFINER or INVOKER, respectively.\n\no If reference to a view causes execution of a stored function,\n  privilege checking for statements executed within the function depend\n  on whether the function SQL SECURITY characteristic is DEFINER or\n  INVOKER. If the security characteristic is DEFINER, the function runs\n  with the privileges of the DEFINER account. If the characteristic is\n  INVOKER, the function runs with the privileges determined by the\n  view\'s SQL SECURITY characteristic.\n\nExample: A view might depend on a stored function, and that function\nmight invoke other stored routines. For example, the following view\ninvokes a stored function f():\n\nCREATE VIEW v AS SELECT * FROM t WHERE t.id = f(t.name);\n\nSuppose that f() contains a statement such as this:\n\nIF name IS NULL then\n  CALL p1();\nELSE\n  CALL p2();\nEND IF;\n\nThe privileges required for executing statements within f() need to be\nchecked when f() executes. This might mean that privileges are needed\nfor p1() or p2(), depending on the execution path within f(). Those\nprivileges must be checked at runtime, and the user who must possess\nthe privileges is determined by the SQL SECURITY values of the view v\nand the function f().\n\nThe DEFINER and SQL SECURITY clauses for views are extensions to\nstandard SQL. In standard SQL, views are handled using the rules for\nSQL SECURITY DEFINER. The standard says that the definer of the view,\nwhich is the same as the owner of the view\'s schema, gets applicable\nprivileges on the view (for example, SELECT) and may grant them. MySQL\nhas no concept of a schema "owner", so MySQL adds a clause to identify\nthe definer. The DEFINER clause is an extension where the intent is to\nhave what the standard has; that is, a permanent record of who defined\nthe view. This is why the default DEFINER value is the account of the\nview creator.\n\nThe optional ALGORITHM clause is a MySQL extension to standard SQL. It\naffects how MySQL processes the view. ALGORITHM takes three values:\nMERGE, TEMPTABLE, or UNDEFINED. The default algorithm is UNDEFINED if\nno ALGORITHM clause is present. For more information, see\nhttp://dev.mysql.com/doc/refman/5.6/en/view-algorithms.html.\n\nSome views are updatable. That is, you can use them in statements such\nas UPDATE, DELETE, or INSERT to update the contents of the underlying\ntable. For a view to be updatable, there must be a one-to-one\nrelationship between the rows in the view and the rows in the\nunderlying table. There are also certain other constructs that make a\nview nonupdatable.\n\nThe WITH CHECK OPTION clause can be given for an updatable view to\nprevent inserts or updates to rows except those for which the WHERE\nclause in the select_statement is true.\n\nIn a WITH CHECK OPTION clause for an updatable view, the LOCAL and\nCASCADED keywords determine the scope of check testing when the view is\ndefined in terms of another view. The LOCAL keyword restricts the CHECK\nOPTION only to the view being defined. CASCADED causes the checks for\nunderlying views to be evaluated as well. When neither keyword is\ngiven, the default is CASCADED.\n\nFor more information about updatable views and the WITH CHECK OPTION\nclause, see\nhttp://dev.mysql.com/doc/refman/5.6/en/view-updatability.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-view.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/create-view.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (508,38,'TRIM','Syntax:\nTRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM([remstr\nFROM] str)\n\nReturns the string str with all remstr prefixes or suffixes removed. If\nnone of the specifiers BOTH, LEADING, or TRAILING is given, BOTH is\nassumed. remstr is optional and, if not specified, spaces are removed.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT TRIM(\'  bar   \');\n        -> \'bar\'\nmysql> SELECT TRIM(LEADING \'x\' FROM \'xxxbarxxx\');\n        -> \'barxxx\'\nmysql> SELECT TRIM(BOTH \'x\' FROM \'xxxbarxxx\');\n        -> \'bar\'\nmysql> SELECT TRIM(TRAILING \'xyz\' FROM \'barxxyz\');\n        -> \'barx\'\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (509,14,'INET6_NTOA','Syntax:\nINET6_NTOA(expr)\n\nGiven an IPv6 or IPv4 network address represented in numeric form as a\nbinary string, returns the string representation of the address as a\nnonbinary string in the connection character set. If the argument is\nnot a valid address, INET6_NTOA() returns NULL.\n\nINET6_NTOA() has these properties:\n\no It does not use operating system functions to perform conversions,\n  thus the output string is platform independent.\n\no The return string has a maximum length of 39 (4 x 8 + 7). Given this\n  statement:\n\nCREATE TABLE t AS SELECT INET6_NTOA(expr) AS c1;\n\n  The resulting table would have this definition:\n\nCREATE TABLE t (c1 VARCHAR(39) CHARACTER SET utf8 DEFAULT NULL);\n\no The return string uses lowercase letters for IPv6 addresses.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html\n\n','mysql> SELECT INET6_NTOA(INET6_ATON(\'fdfe::5a55:caff:fefa:9089\'));\n        -> \'fdfe::5a55:caff:fefa:9089\'\nmysql> SELECT INET6_NTOA(INET6_ATON(\'10.0.5.9\'));\n        -> \'10.0.5.9\'\n\nmysql> SELECT INET6_NTOA(UNHEX(\'FDFE0000000000005A55CAFFFEFA9089\'));\n        -> \'fdfe::5a55:caff:fefa:9089\'\nmysql> SELECT INET6_NTOA(UNHEX(\'0A000509\'));\n        -> \'10.0.5.9\'\n','http://dev.mysql.com/doc/refman/5.6/en/miscellaneous-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (510,24,'SIGNAL','Syntax:\nSIGNAL condition_value\n    [SET signal_information_item\n    [, signal_information_item] ...]\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n\nsignal_information_item:\n    condition_information_item_name = simple_value_specification\n\ncondition_information_item_name:\n    CLASS_ORIGIN\n  | SUBCLASS_ORIGIN\n  | MESSAGE_TEXT\n  | MYSQL_ERRNO\n  | CONSTRAINT_CATALOG\n  | CONSTRAINT_SCHEMA\n  | CONSTRAINT_NAME\n  | CATALOG_NAME\n  | SCHEMA_NAME\n  | TABLE_NAME\n  | COLUMN_NAME\n  | CURSOR_NAME\n\ncondition_name, simple_value_specification:\n    (see following discussion)\n\nSIGNAL is the way to "return" an error. SIGNAL provides error\ninformation to a handler, to an outer portion of the application, or to\nthe client. Also, it provides control over the error\'s characteristics\n(error number, SQLSTATE value, message). Without SIGNAL, it is\nnecessary to resort to workarounds such as deliberately referring to a\nnonexistent table to cause a routine to return an error.\n\nNo special privileges are required to execute the SIGNAL statement.\n\nTo retrieve information from the diagnostics area, use the GET\nDIAGNOSTICS statement (see [HELP GET DIAGNOSTICS]). For information\nabout the diagnostics area, see\nhttp://dev.mysql.com/doc/refman/5.6/en/diagnostics-area.html.\n\nThe condition_value in a SIGNAL statement indicates the error value to\nbe returned. It can be an SQLSTATE value (a 5-character string literal)\nor a condition_name that refers to a named condition previously defined\nwith DECLARE ... CONDITION (see [HELP DECLARE CONDITION]).\n\nAn SQLSTATE value can indicate errors, warnings, or "not found." The\nfirst two characters of the value indicate its error class, as\ndiscussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/signal.html#signal-condition-inf\normation-items. Some signal values cause statement termination; see\nhttp://dev.mysql.com/doc/refman/5.6/en/signal.html#signal-effects.\n\nThe SQLSTATE value for a SIGNAL statement should not start with \'00\'\nbecause such values indicate success and are not valid for signaling an\nerror. This is true whether the SQLSTATE value is specified directly in\nthe SIGNAL statement or in a named condition referred to in the\nstatement. If the value is invalid, a Bad SQLSTATE error occurs.\n\nTo signal a generic SQLSTATE value, use \'45000\', which means "unhandled\nuser-defined exception."\n\nThe SIGNAL statement optionally includes a SET clause that contains\nmultiple signal items, in a comma-separated list of\ncondition_information_item_name = simple_value_specification\nassignments.\n\nEach condition_information_item_name may be specified only once in the\nSET clause. Otherwise, a Duplicate condition information item error\noccurs.\n\nValid simple_value_specification designators can be specified using\nstored procedure or function parameters, stored program local variables\ndeclared with DECLARE, user-defined variables, system variables, or\nliterals. A character literal may include a _charset introducer.\n\nFor information about permissible condition_information_item_name\nvalues, see\nhttp://dev.mysql.com/doc/refman/5.6/en/signal.html#signal-condition-inf\normation-items.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/signal.html\n\n','CREATE PROCEDURE p (pval INT)\nBEGIN\n  DECLARE specialty CONDITION FOR SQLSTATE \'45000\';\n  IF pval = 0 THEN\n    SIGNAL SQLSTATE \'01000\';\n  ELSEIF pval = 1 THEN\n    SIGNAL SQLSTATE \'45000\'\n      SET MESSAGE_TEXT = \'An error occurred\';\n  ELSEIF pval = 2 THEN\n    SIGNAL specialty\n      SET MESSAGE_TEXT = \'An error occurred\';\n  ELSE\n    SIGNAL SQLSTATE \'01000\'\n      SET MESSAGE_TEXT = \'A warning occurred\', MYSQL_ERRNO = 1000;\n    SIGNAL SQLSTATE \'45000\'\n      SET MESSAGE_TEXT = \'An error occurred\', MYSQL_ERRNO = 1001;\n  END IF;\nEND;\n','http://dev.mysql.com/doc/refman/5.6/en/signal.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (511,8,'SAVEPOINT','Syntax:\nSAVEPOINT identifier\nROLLBACK [WORK] TO [SAVEPOINT] identifier\nRELEASE SAVEPOINT identifier\n\nInnoDB supports the SQL statements SAVEPOINT, ROLLBACK TO SAVEPOINT,\nRELEASE SAVEPOINT and the optional WORK keyword for ROLLBACK.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/savepoint.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/savepoint.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (512,33,'MPOINTFROMWKB','MPointFromWKB(wkb[,srid]), MultiPointFromWKB(wkb[,srid])\n\nConstructs a MULTIPOINT value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/creating-spatial-values.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (513,40,'ALTER TABLE','Syntax:\nALTER [IGNORE] TABLE tbl_name\n    [alter_specification [, alter_specification] ...]\n    [partition_options]\n\nalter_specification:\n    table_options\n  | ADD [COLUMN] col_name column_definition\n        [FIRST | AFTER col_name ]\n  | ADD [COLUMN] (col_name column_definition,...)\n  | ADD {INDEX|KEY} [index_name]\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]] PRIMARY KEY\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]]\n        UNIQUE [INDEX|KEY] [index_name]\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD FULLTEXT [INDEX|KEY] [index_name]\n        (index_col_name,...) [index_option] ...\n  | ADD SPATIAL [INDEX|KEY] [index_name]\n        (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]]\n        FOREIGN KEY [index_name] (index_col_name,...)\n        reference_definition\n  | ALGORITHM [=] {DEFAULT|INPLACE|COPY}\n  | ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}\n  | CHANGE [COLUMN] old_col_name new_col_name column_definition\n        [FIRST|AFTER col_name]\n  | LOCK [=] {DEFAULT|NONE|SHARED|EXCLUSIVE}\n  | MODIFY [COLUMN] col_name column_definition\n        [FIRST | AFTER col_name]\n  | DROP [COLUMN] col_name\n  | DROP PRIMARY KEY\n  | DROP {INDEX|KEY} index_name\n  | DROP FOREIGN KEY fk_symbol\n  | DISABLE KEYS\n  | ENABLE KEYS\n  | RENAME [TO|AS] new_tbl_name\n  | ORDER BY col_name [, col_name] ...\n  | CONVERT TO CHARACTER SET charset_name [COLLATE collation_name]\n  | [DEFAULT] CHARACTER SET [=] charset_name [COLLATE [=] collation_name]\n  | DISCARD TABLESPACE\n  | IMPORT TABLESPACE\n  | FORCE\n  | ADD PARTITION (partition_definition)\n  | DROP PARTITION partition_names\n  | TRUNCATE PARTITION {partition_names | ALL}\n  | COALESCE PARTITION number\n  | REORGANIZE PARTITION partition_names INTO (partition_definitions)\n  | EXCHANGE PARTITION partition_name WITH TABLE tbl_name\n  | ANALYZE PARTITION {partition_names | ALL}\n  | CHECK PARTITION {partition_names | ALL}\n  | OPTIMIZE PARTITION {partition_names | ALL}\n  | REBUILD PARTITION {partition_names | ALL}\n  | REPAIR PARTITION {partition_names | ALL}\n  | REMOVE PARTITIONING\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\ntable_options:\n    table_option [[,] table_option] ...  (see CREATE TABLE options)\n\npartition_options:\n    (see CREATE TABLE options)\n\nALTER TABLE changes the structure of a table. For example, you can add\nor delete columns, create or destroy indexes, change the type of\nexisting columns, or rename columns or the table itself. You can also\nchange characteristics such as the storage engine used for the table or\nthe table comment.\n\nPartitioning-related clauses for ALTER TABLE can be used with\npartitioned tables for repartitioning, for adding, dropping, merging,\nand splitting partitions, and for performing partitioning maintenance.\nIt is possible for an ALTER TABLE statement to contain a PARTITION BY\nor REMOVE PARTITIONING clause in an addition to other alter\nspecifications, but the PARTITION BY or REMOVE PARTITIONING clause must\nbe specified last after any other specifications. The ADD PARTITION,\nDROP PARTITION, COALESCE PARTITION, REORGANIZE PARTITION, ANALYZE\nPARTITION, CHECK PARTITION, and REPAIR PARTITION options cannot be\ncombined with other alter specifications in a single ALTER TABLE, since\nthe options just listed act on individual partitions. For more\ninformation, see\nhttp://dev.mysql.com/doc/refman/5.6/en/alter-table-partition-operations\n.html.\n\nFollowing the table name, specify the alterations to be made. If none\nare given, ALTER TABLE does nothing.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/alter-table.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/alter-table.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (514,24,'LABELS','Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nLabels are permitted for BEGIN ... END blocks and for the LOOP, REPEAT,\nand WHILE statements. Label use for those statements follows these\nrules:\n\no begin_label must be followed by a colon.\n\no begin_label can be given without end_label. If end_label is present,\n  it must be the same as begin_label.\n\no end_label cannot be given without begin_label.\n\no Labels at the same nesting level must be distinct.\n\no Labels can be up to 16 characters long.\n\nTo refer to a label within the labeled construct, use an ITERATE or\nLEAVE statement. The following example uses those statements to\ncontinue iterating or terminate the loop:\n\nCREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN ITERATE label1; END IF;\n    LEAVE label1;\n  END LOOP label1;\nEND;\n\nThe scope of a block label does not include the code for handlers\ndeclared within the block. For details, see [HELP DECLARE HANDLER].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/statement-labels.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/statement-labels.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (515,23,'CHAR BYTE','The CHAR BYTE data type is an alias for the BINARY data type. This is a\ncompatibility feature.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (516,19,'>','Syntax:\n>\n\nGreater than:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT 2 > 2;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (517,21,'ANALYZE TABLE','Syntax:\nANALYZE [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n\nANALYZE TABLE analyzes and stores the key distribution for a table.\nDuring the analysis, the table is locked with a read lock for InnoDB\nand MyISAM. This statement works with InnoDB, NDB, and MyISAM tables.\nFor MyISAM tables, this statement is equivalent to using myisamchk\n--analyze.\n\nFor more information on how the analysis works within InnoDB, see\nhttp://dev.mysql.com/doc/refman/5.6/en/innodb-performance.html#innodb-p\nersistent-stats and\nhttp://dev.mysql.com/doc/refman/5.6/en/innodb-restrictions.html. In\nparticular, when you enable the innodb_stats_persistent option, you\nmust run ANALYZE TABLE after loading substantial data into an InnoDB\ntable, or creating a new index for one.\n\nMySQL uses the stored key distribution to decide the order in which\ntables should be joined when you perform a join on something other than\na constant. In addition, key distributions can be used when deciding\nwhich indexes to use for a specific table within a query.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nANALYZE TABLE is supported for partitioned tables, and you can use\nALTER TABLE ... ANALYZE PARTITION to analyze one or more partitions;\nfor more information, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.6/en/partitioning-maintenance.html.\n\nIn MySQL 5.6.11 only, gtid_next must be set to AUTOMATIC before issuing\nthis statement. (Bug #16062608, Bug #16715809, Bug #69045)\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/analyze-table.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/analyze-table.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (518,38,'FIELD','Syntax:\nFIELD(str,str1,str2,str3,...)\n\nReturns the index (position) of str in the str1, str2, str3, ... list.\nReturns 0 if str is not found.\n\nIf all arguments to FIELD() are strings, all arguments are compared as\nstrings. If all arguments are numbers, they are compared as numbers.\nOtherwise, the arguments are compared as double.\n\nIf str is NULL, the return value is 0 because NULL fails equality\ncomparison with any value. FIELD() is the complement of ELT().\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-functions.html\n\n','mysql> SELECT FIELD(\'ej\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 2\nmysql> SELECT FIELD(\'fo\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.6/en/string-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (519,40,'CONSTRAINT','MySQL supports foreign keys, which let you cross-reference related data\nacross tables, and foreign key constraints, which help keep this\nspread-out data consistent. The essential syntax for a foreign key\nconstraint definition in a CREATE TABLE or ALTER TABLE statement looks\nlike this:\n\n[CONSTRAINT [symbol]] FOREIGN KEY\n    [index_name] (index_col_name, ...)\n    REFERENCES tbl_name (index_col_name,...)\n    [ON DELETE reference_option]\n    [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/create-table-foreign-keys.html\n\n','CREATE TABLE product (\n    category INT NOT NULL, id INT NOT NULL,\n    price DECIMAL,\n    PRIMARY KEY(category, id)\n)   ENGINE=INNODB;\n\nCREATE TABLE customer (\n    id INT NOT NULL,\n    PRIMARY KEY (id)\n)   ENGINE=INNODB;\n\nCREATE TABLE product_order (\n    no INT NOT NULL AUTO_INCREMENT,\n    product_category INT NOT NULL,\n    product_id INT NOT NULL,\n    customer_id INT NOT NULL,\n\n    PRIMARY KEY(no),\n    INDEX (product_category, product_id),\n    INDEX (customer_id),\n\n    FOREIGN KEY (product_category, product_id)\n      REFERENCES product(category, id)\n      ON UPDATE CASCADE ON DELETE RESTRICT,\n\n    FOREIGN KEY (customer_id)\n      REFERENCES customer(id)\n)   ENGINE=INNODB;\n','http://dev.mysql.com/doc/refman/5.6/en/create-table-foreign-keys.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (520,40,'ALTER TABLESPACE','Syntax:\nALTER TABLESPACE tablespace_name\n    {ADD|DROP} DATAFILE \'file_name\'\n    [INITIAL_SIZE [=] size]\n    [WAIT]\n    ENGINE [=] engine_name\n\nThis statement can be used either to add a new data file, or to drop a\ndata file from a tablespace.\n\nThe ADD DATAFILE variant enables you to specify an initial size using\nan INITIAL_SIZE clause, where size is measured in bytes; the default\nvalue is 128M (128 megabytes). You may optionally follow this integer\nvalue with a one-letter abbreviation for an order of magnitude, similar\nto those used in my.cnf. Generally, this is one of the letters M (for\nmegabytes) or G (for gigabytes).\n\n*Note*: All MySQL Cluster Disk Data objects share the same namespace.\nThis means that each Disk Data object must be uniquely named (and not\nmerely each Disk Data object of a given type). For example, you cannot\nhave a tablespace and an data file with the same name, or an undo log\nfile and a tablespace with the same name.\n\nOn 32-bit systems, the maximum supported value for INITIAL_SIZE is 4G.\n(Bug #29186)\n\nINITIAL_SIZE is rounded, explicitly, as for CREATE TABLESPACE.\n\nOnce a data file has been created, its size cannot be changed; however,\nyou can add more data files to the tablespace using additional ALTER\nTABLESPACE ... ADD DATAFILE statements.\n\nUsing DROP DATAFILE with ALTER TABLESPACE drops the data file\n\'file_name\' from the tablespace. You cannot drop a data file from a\ntablespace which is in use by any table; in other words, the data file\nmust be empty (no extents used). See\nhttp://dev.mysql.com/doc/refman/5.6/en/mysql-cluster-disk-data-objects.\nhtml. In addition, any data file to be dropped must previously have\nbeen added to the tablespace with CREATE TABLESPACE or ALTER\nTABLESPACE.\n\nBoth ALTER TABLESPACE ... ADD DATAFILE and ALTER TABLESPACE ... DROP\nDATAFILE require an ENGINE clause which specifies the storage engine\nused by the tablespace. Currently, the only accepted values for\nengine_name are NDB and NDBCLUSTER.\n\nWAIT is parsed but otherwise ignored, and so has no effect in MySQL\n5.6. It is intended for future expansion.\n\nWhen ALTER TABLESPACE ... ADD DATAFILE is used with ENGINE = NDB, a\ndata file is created on each Cluster data node. You can verify that the\ndata files were created and obtain information about them by querying\nthe INFORMATION_SCHEMA.FILES table. For example, the following query\nshows all data files belonging to the tablespace named newts:\n\nmysql> SELECT LOGFILE_GROUP_NAME, FILE_NAME, EXTRA\n    -> FROM INFORMATION_SCHEMA.FILES\n    -> WHERE TABLESPACE_NAME = \'newts\' AND FILE_TYPE = \'DATAFILE\';\n+--------------------+--------------+----------------+\n| LOGFILE_GROUP_NAME | FILE_NAME    | EXTRA          |\n+--------------------+--------------+----------------+\n| lg_3               | newdata.dat  | CLUSTER_NODE=3 |\n| lg_3               | newdata.dat  | CLUSTER_NODE=4 |\n| lg_3               | newdata2.dat | CLUSTER_NODE=3 |\n| lg_3               | newdata2.dat | CLUSTER_NODE=4 |\n+--------------------+--------------+----------------+\n2 rows in set (0.03 sec)\n\nSee http://dev.mysql.com/doc/refman/5.6/en/files-table.html.\n\nALTER TABLESPACE is useful only with Disk Data storage for MySQL\nCluster. See\nhttp://dev.mysql.com/doc/refman/5.6/en/mysql-cluster-disk-data.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/alter-tablespace.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/alter-tablespace.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (521,23,'ENUM','ENUM(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nAn enumeration. A string object that can have only one value, chosen\nfrom the list of values \'value1\', \'value2\', ..., NULL or the special \'\'\nerror value. ENUM values are represented internally as integers.\n\nAn ENUM column can have a maximum of 65,535 distinct elements. (The\npractical limit is less than 3000.) A table can have no more than 255\nunique element list definitions among its ENUM and SET columns\nconsidered as a group. For more information on these limits, see\nhttp://dev.mysql.com/doc/refman/5.6/en/limits-frm-file.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (522,38,'STRCMP','Syntax:\nSTRCMP(expr1,expr2)\n\nSTRCMP() returns 0 if the strings are the same, -1 if the first\nargument is smaller than the second according to the current sort\norder, and 1 otherwise.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-comparison-functions.html\n\n','mysql> SELECT STRCMP(\'text\', \'text2\');\n        -> -1\nmysql> SELECT STRCMP(\'text2\', \'text\');\n        -> 1\nmysql> SELECT STRCMP(\'text\', \'text\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.6/en/string-comparison-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (523,28,'INSERT DELAYED','Syntax:\nINSERT DELAYED ...\n\nThe DELAYED option for the INSERT statement is a MySQL extension to\nstandard SQL that can be used for certain kinds of tables (such as\nMyISAM). When a client uses INSERT DELAYED, it gets an okay from the\nserver at once, and the row is queued to be inserted when the table is\nnot in use by any other thread.\n\n*Note*: INSERT DELAYED is slower than a normal INSERT if the table is\nnot otherwise in use. There is also the additional overhead for the\nserver to handle a separate thread for each table for which there are\ndelayed rows. This means that you should use INSERT DELAYED only when\nyou are really sure that you need it. As of MySQL 5.6.6, INSERT DELAYED\nis deprecated, and will be removed in a future release. Use INSERT\n(without DELAYED) instead.\n\nThe queued rows are held only in memory until they are inserted into\nthe table. This means that if you terminate mysqld forcibly (for\nexample, with kill -9) or if mysqld dies unexpectedly, any queued rows\nthat have not been written to disk are lost.\n\nThere are some constraints on the use of DELAYED:\n\no INSERT DELAYED works only with MyISAM, MEMORY, ARCHIVE, and BLACKHOLE\n  tables. For engines that do not support DELAYED, an error occurs.\n\no An error occurs for INSERT DELAYED if used with a table that has been\n  locked with LOCK TABLES because the insert must be handled by a\n  separate thread, not by the session that holds the lock.\n\no For MyISAM tables, if there are no free blocks in the middle of the\n  data file, concurrent SELECT and INSERT statements are supported.\n  Under these circumstances, you very seldom need to use INSERT DELAYED\n  with MyISAM.\n\no INSERT DELAYED should be used only for INSERT statements that specify\n  value lists. The server ignores DELAYED for INSERT ... SELECT or\n  INSERT ... ON DUPLICATE KEY UPDATE statements.\n\no Because the INSERT DELAYED statement returns immediately, before the\n  rows are inserted, you cannot use LAST_INSERT_ID() to get the\n  AUTO_INCREMENT value that the statement might generate.\n\no DELAYED rows are not visible to SELECT statements until they actually\n  have been inserted.\n\no Prior to MySQL 5.6, INSERT DELAYED was treated as a normal INSERT if\n  the statement inserted multiple rows, binary logging was enabled, and\n  the global logging format was statement-based (that is, whenever\n  binlog_format was set to STATEMENT). Beginning with MySQL 5.6, INSERT\n  DELAYED is always handled as a simple INSERT (that is, without the\n  DELAYED option) whenever the value of binlog_format is STATEMENT or\n  MIXED. (In the latter case, the statement no longer triggers a switch\n  to row-based logging, and so is logged using the statement-based\n  format.)\n\n  This does not apply when using row-based binary logging mode\n  (binlog_format set to ROW), in which INSERT DELAYED statements are\n  always executed using the DELAYED option as specified, and logged as\n  row-update events.\n\no DELAYED is ignored on slave replication servers, so that INSERT\n  DELAYED is treated as a normal INSERT on slaves. This is because\n  DELAYED could cause the slave to have different data than the master.\n\no Pending INSERT DELAYED statements are lost if a table is write locked\n  and ALTER TABLE is used to modify the table structure.\n\no INSERT DELAYED is not supported for views.\n\no INSERT DELAYED is not supported for partitioned tables.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/insert-delayed.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/insert-delayed.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (524,27,'SHOW PROCEDURE CODE','Syntax:\nSHOW PROCEDURE CODE proc_name\n\nThis statement is a MySQL extension that is available only for servers\nthat have been built with debugging support. It displays a\nrepresentation of the internal implementation of the named stored\nprocedure. A similar statement, SHOW FUNCTION CODE, displays\ninformation about stored functions (see [HELP SHOW FUNCTION CODE]).\n\nTo use either statement, you must be the owner of the routine or have\nSELECT access to the mysql.proc table.\n\nIf the named routine is available, each statement produces a result\nset. Each row in the result set corresponds to one "instruction" in the\nroutine. The first column is Pos, which is an ordinal number beginning\nwith 0. The second column is Instruction, which contains an SQL\nstatement (usually changed from the original source), or a directive\nwhich has meaning only to the stored-routine handler.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-procedure-code.html\n\n','mysql> DELIMITER //\nmysql> CREATE PROCEDURE p1 ()\n    -> BEGIN\n    ->   DECLARE fanta INT DEFAULT 55;\n    ->   DROP TABLE t2;\n    ->   LOOP\n    ->     INSERT INTO t3 VALUES (fanta);\n    ->     END LOOP;\n    ->   END//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SHOW PROCEDURE CODE p1//\n+-----+----------------------------------------+\n| Pos | Instruction                            |\n+-----+----------------------------------------+\n|   0 | set fanta@0 55                         |\n|   1 | stmt 9 "DROP TABLE t2"                 |\n|   2 | stmt 5 "INSERT INTO t3 VALUES (fanta)" |\n|   3 | jump 2                                 |\n+-----+----------------------------------------+\n4 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.6/en/show-procedure-code.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (525,23,'MEDIUMTEXT','MEDIUMTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 16,777,215 (224 - 1) characters.\nThe effective maximum length is less if the value contains multi-byte\ncharacters. Each MEDIUMTEXT value is stored using a 3-byte length\nprefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/string-type-overview.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (526,4,'LOG','Syntax:\nLOG(X), LOG(B,X)\n\nIf called with one parameter, this function returns the natural\nlogarithm of X. If X is less than or equal to 0, then NULL is returned.\n\nThe inverse of this function (when called with a single argument) is\nthe EXP() function.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT LOG(2);\n        -> 0.69314718055995\nmysql> SELECT LOG(-2);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (527,27,'SHOW COLLATION','Syntax:\nSHOW COLLATION\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement lists collations supported by the server. By default,\nthe output from SHOW COLLATION includes all available collations. The\nLIKE clause, if present, indicates which collation names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttp://dev.mysql.com/doc/refman/5.6/en/extended-show.html. For example:\n\nmysql> SHOW COLLATION LIKE \'latin1%\';\n+-------------------+---------+----+---------+----------+---------+\n| Collation         | Charset | Id | Default | Compiled | Sortlen |\n+-------------------+---------+----+---------+----------+---------+\n| latin1_german1_ci | latin1  |  5 |         |          |       0 |\n| latin1_swedish_ci | latin1  |  8 | Yes     | Yes      |       0 |\n| latin1_danish_ci  | latin1  | 15 |         |          |       0 |\n| latin1_german2_ci | latin1  | 31 |         | Yes      |       2 |\n| latin1_bin        | latin1  | 47 |         | Yes      |       0 |\n| latin1_general_ci | latin1  | 48 |         |          |       0 |\n| latin1_general_cs | latin1  | 49 |         |          |       0 |\n| latin1_spanish_ci | latin1  | 94 |         |          |       0 |\n+-------------------+---------+----+---------+----------+---------+\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/show-collation.html\n\n','','http://dev.mysql.com/doc/refman/5.6/en/show-collation.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (528,19,'!=','Syntax:\n<>, !=\n\nNot equal:\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT \'.01\' <> \'0.01\';\n        -> 1\nmysql> SELECT .01 <> \'0.01\';\n        -> 0\nmysql> SELECT \'zapp\' <> \'zappp\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (529,24,'WHILE','Syntax:\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nThe statement list within a WHILE statement is repeated as long as the\nsearch_condition expression is true. statement_list consists of one or\nmore SQL statements, each terminated by a semicolon (;) statement\ndelimiter.\n\nA WHILE statement can be labeled. For the rules regarding label use,\nsee [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/while.html\n\n','CREATE PROCEDURE dowhile()\nBEGIN\n  DECLARE v1 INT DEFAULT 5;\n\n  WHILE v1 > 0 DO\n    ...\n    SET v1 = v1 - 1;\n  END WHILE;\nEND;\n','http://dev.mysql.com/doc/refman/5.6/en/while.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (530,32,'DAYNAME','Syntax:\nDAYNAME(date)\n\nReturns the name of the weekday for date. The language used for the\nname is controlled by the value of the lc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.6/en/locale-support.html).\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html\n\n','mysql> SELECT DAYNAME(\'2007-02-03\');\n        -> \'Saturday\'\n','http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (531,4,'RADIANS','Syntax:\nRADIANS(X)\n\nReturns the argument X, converted from degrees to radians. (Note that\nπ radians equals 180 degrees.)\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html\n\n','mysql> SELECT RADIANS(90);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.6/en/mathematical-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (532,17,'COLLATION','Syntax:\nCOLLATION(str)\n\nReturns the collation of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','mysql> SELECT COLLATION(\'abc\');\n        -> \'latin1_swedish_ci\'\nmysql> SELECT COLLATION(_utf8\'abc\');\n        -> \'utf8_general_ci\'\n','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (533,19,'COALESCE','Syntax:\nCOALESCE(value,...)\n\nReturns the first non-NULL value in the list, or NULL if there are no\nnon-NULL values.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html\n\n','mysql> SELECT COALESCE(NULL,1);\n        -> 1\nmysql> SELECT COALESCE(NULL,NULL,NULL);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.6/en/comparison-operators.html');
insert into help_topic (help_topic_id,help_category_id,name,description,example,url) values (534,17,'VERSION','Syntax:\nVERSION()\n\nReturns a string that indicates the MySQL server version. The string\nuses the utf8 character set. The value might have a suffix in addition\nto the version number. See the description of the version system\nvariable in\nhttp://dev.mysql.com/doc/refman/5.6/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.6/en/information-functions.html\n\n','mysql> SELECT VERSION();\n        -> \'5.6.18-standard\'\n','http://dev.mysql.com/doc/refman/5.6/en/information-functions.html');

insert into help_keyword (help_keyword_id,name) values (0,'JOIN');
insert into help_keyword (help_keyword_id,name) values (1,'HOST');
insert into help_keyword (help_keyword_id,name) values (2,'REPEAT');
insert into help_keyword (help_keyword_id,name) values (3,'SERIALIZABLE');
insert into help_keyword (help_keyword_id,name) values (4,'REPLACE');
insert into help_keyword (help_keyword_id,name) values (5,'AT');
insert into help_keyword (help_keyword_id,name) values (6,'SCHEDULE');
insert into help_keyword (help_keyword_id,name) values (7,'RETURNS');
insert into help_keyword (help_keyword_id,name) values (8,'STARTS');
insert into help_keyword (help_keyword_id,name) values (9,'MASTER_SSL_CA');
insert into help_keyword (help_keyword_id,name) values (10,'NCHAR');
insert into help_keyword (help_keyword_id,name) values (11,'ONLY');
insert into help_keyword (help_keyword_id,name) values (12,'COLUMNS');
insert into help_keyword (help_keyword_id,name) values (13,'COMPLETION');
insert into help_keyword (help_keyword_id,name) values (14,'WORK');
insert into help_keyword (help_keyword_id,name) values (15,'DATETIME');
insert into help_keyword (help_keyword_id,name) values (16,'MODE');
insert into help_keyword (help_keyword_id,name) values (17,'OPEN');
insert into help_keyword (help_keyword_id,name) values (18,'INTEGER');
insert into help_keyword (help_keyword_id,name) values (19,'ESCAPE');
insert into help_keyword (help_keyword_id,name) values (20,'VALUE');
insert into help_keyword (help_keyword_id,name) values (21,'MASTER_SSL_VERIFY_SERVER_CERT');
insert into help_keyword (help_keyword_id,name) values (22,'SQL_BIG_RESULT');
insert into help_keyword (help_keyword_id,name) values (23,'DROP');
insert into help_keyword (help_keyword_id,name) values (24,'GEOMETRYCOLLECTIONFROMWKB');
insert into help_keyword (help_keyword_id,name) values (25,'EVENTS');
insert into help_keyword (help_keyword_id,name) values (26,'MONTH');
insert into help_keyword (help_keyword_id,name) values (27,'PROFILES');
insert into help_keyword (help_keyword_id,name) values (28,'DUPLICATE');
insert into help_keyword (help_keyword_id,name) values (29,'REPLICATION');
insert into help_keyword (help_keyword_id,name) values (30,'UNLOCK');
insert into help_keyword (help_keyword_id,name) values (31,'STATS_PERSISTENT');
insert into help_keyword (help_keyword_id,name) values (32,'INNODB');
insert into help_keyword (help_keyword_id,name) values (33,'YEAR_MONTH');
insert into help_keyword (help_keyword_id,name) values (34,'SUBJECT');
insert into help_keyword (help_keyword_id,name) values (35,'MASTER_RETRY_COUNT');
insert into help_keyword (help_keyword_id,name) values (36,'PREPARE');
insert into help_keyword (help_keyword_id,name) values (37,'LOCK');
insert into help_keyword (help_keyword_id,name) values (38,'NDB');
insert into help_keyword (help_keyword_id,name) values (39,'CHECK');
insert into help_keyword (help_keyword_id,name) values (40,'FULL');
insert into help_keyword (help_keyword_id,name) values (41,'INT4');
insert into help_keyword (help_keyword_id,name) values (42,'BY');
insert into help_keyword (help_keyword_id,name) values (43,'NO');
insert into help_keyword (help_keyword_id,name) values (44,'MINUTE');
insert into help_keyword (help_keyword_id,name) values (45,'PARTITION');
insert into help_keyword (help_keyword_id,name) values (46,'DATA');
insert into help_keyword (help_keyword_id,name) values (47,'DAY');
insert into help_keyword (help_keyword_id,name) values (48,'SHARE');
insert into help_keyword (help_keyword_id,name) values (49,'REAL');
insert into help_keyword (help_keyword_id,name) values (50,'SEPARATOR');
insert into help_keyword (help_keyword_id,name) values (51,'MESSAGE_TEXT');
insert into help_keyword (help_keyword_id,name) values (52,'MASTER_HEARTBEAT_PERIOD');
insert into help_keyword (help_keyword_id,name) values (53,'DELETE');
insert into help_keyword (help_keyword_id,name) values (54,'ON');
insert into help_keyword (help_keyword_id,name) values (55,'COLUMN_NAME');
insert into help_keyword (help_keyword_id,name) values (56,'CONNECTION');
insert into help_keyword (help_keyword_id,name) values (57,'CLOSE');
insert into help_keyword (help_keyword_id,name) values (58,'MASTER_SSL_CRLPATH');
insert into help_keyword (help_keyword_id,name) values (59,'X509');
insert into help_keyword (help_keyword_id,name) values (60,'USE');
insert into help_keyword (help_keyword_id,name) values (61,'SUBCLASS_ORIGIN');
insert into help_keyword (help_keyword_id,name) values (62,'WHERE');
insert into help_keyword (help_keyword_id,name) values (63,'PRIVILEGES');
insert into help_keyword (help_keyword_id,name) values (64,'SPATIAL');
insert into help_keyword (help_keyword_id,name) values (65,'EVENT');
insert into help_keyword (help_keyword_id,name) values (66,'SUPER');
insert into help_keyword (help_keyword_id,name) values (67,'SQL_BUFFER_RESULT');
insert into help_keyword (help_keyword_id,name) values (68,'IGNORE');
insert into help_keyword (help_keyword_id,name) values (69,'SHA2');
insert into help_keyword (help_keyword_id,name) values (70,'QUICK');
insert into help_keyword (help_keyword_id,name) values (71,'SIGNED');
insert into help_keyword (help_keyword_id,name) values (72,'SECURITY');
insert into help_keyword (help_keyword_id,name) values (73,'AUTOEXTEND_SIZE');
insert into help_keyword (help_keyword_id,name) values (74,'NDBCLUSTER');
insert into help_keyword (help_keyword_id,name) values (75,'POLYGONFROMWKB');
insert into help_keyword (help_keyword_id,name) values (76,'FALSE');
insert into help_keyword (help_keyword_id,name) values (77,'LEVEL');
insert into help_keyword (help_keyword_id,name) values (78,'FORCE');
insert into help_keyword (help_keyword_id,name) values (79,'BINARY');
insert into help_keyword (help_keyword_id,name) values (80,'TO');
insert into help_keyword (help_keyword_id,name) values (81,'CHANGE');
insert into help_keyword (help_keyword_id,name) values (82,'CURRENT_USER');
insert into help_keyword (help_keyword_id,name) values (83,'HOUR_MINUTE');
insert into help_keyword (help_keyword_id,name) values (84,'UPDATE');
insert into help_keyword (help_keyword_id,name) values (85,'PRESERVE');
insert into help_keyword (help_keyword_id,name) values (86,'TABLE_NAME');
insert into help_keyword (help_keyword_id,name) values (87,'INTO');
insert into help_keyword (help_keyword_id,name) values (88,'FEDERATED');
insert into help_keyword (help_keyword_id,name) values (89,'VARYING');
insert into help_keyword (help_keyword_id,name) values (90,'MAX_SIZE');
insert into help_keyword (help_keyword_id,name) values (91,'HOUR_SECOND');
insert into help_keyword (help_keyword_id,name) values (92,'SQL_AFTER_GTIDS');
insert into help_keyword (help_keyword_id,name) values (93,'VARIABLE');
insert into help_keyword (help_keyword_id,name) values (94,'ROLLBACK');
insert into help_keyword (help_keyword_id,name) values (95,'PROCEDURE');
insert into help_keyword (help_keyword_id,name) values (96,'TIMESTAMP');
insert into help_keyword (help_keyword_id,name) values (97,'IMPORT');
insert into help_keyword (help_keyword_id,name) values (98,'AGAINST');
insert into help_keyword (help_keyword_id,name) values (99,'CHECKSUM');
insert into help_keyword (help_keyword_id,name) values (100,'SQL_BEFORE_GTIDS');
insert into help_keyword (help_keyword_id,name) values (101,'COUNT');
insert into help_keyword (help_keyword_id,name) values (102,'LONGBINARY');
insert into help_keyword (help_keyword_id,name) values (103,'THEN');
insert into help_keyword (help_keyword_id,name) values (104,'INSERT');
insert into help_keyword (help_keyword_id,name) values (105,'ENGINES');
insert into help_keyword (help_keyword_id,name) values (106,'HANDLER');
insert into help_keyword (help_keyword_id,name) values (107,'PORT');
insert into help_keyword (help_keyword_id,name) values (108,'DAY_SECOND');
insert into help_keyword (help_keyword_id,name) values (109,'EXISTS');
insert into help_keyword (help_keyword_id,name) values (110,'MUTEX');
insert into help_keyword (help_keyword_id,name) values (111,'HELP_DATE');
insert into help_keyword (help_keyword_id,name) values (112,'RELEASE');
insert into help_keyword (help_keyword_id,name) values (113,'BOOLEAN');
insert into help_keyword (help_keyword_id,name) values (114,'MOD');
insert into help_keyword (help_keyword_id,name) values (115,'DEFAULT');
insert into help_keyword (help_keyword_id,name) values (116,'TYPE');
insert into help_keyword (help_keyword_id,name) values (117,'NO_WRITE_TO_BINLOG');
insert into help_keyword (help_keyword_id,name) values (118,'OPTIMIZE');
insert into help_keyword (help_keyword_id,name) values (119,'SQLSTATE');
insert into help_keyword (help_keyword_id,name) values (120,'RESET');
insert into help_keyword (help_keyword_id,name) values (121,'CLASS_ORIGIN');
insert into help_keyword (help_keyword_id,name) values (122,'INSTALL');
insert into help_keyword (help_keyword_id,name) values (123,'ITERATE');
insert into help_keyword (help_keyword_id,name) values (124,'DO');
insert into help_keyword (help_keyword_id,name) values (125,'BIGINT');
insert into help_keyword (help_keyword_id,name) values (126,'SET');
insert into help_keyword (help_keyword_id,name) values (127,'ISSUER');
insert into help_keyword (help_keyword_id,name) values (128,'DATE');
insert into help_keyword (help_keyword_id,name) values (129,'STATUS');
insert into help_keyword (help_keyword_id,name) values (130,'FULLTEXT');
insert into help_keyword (help_keyword_id,name) values (131,'COMMENT');
insert into help_keyword (help_keyword_id,name) values (132,'MASTER_CONNECT_RETRY');
insert into help_keyword (help_keyword_id,name) values (133,'INNER');
insert into help_keyword (help_keyword_id,name) values (134,'RELAYLOG');
insert into help_keyword (help_keyword_id,name) values (135,'STOP');
insert into help_keyword (help_keyword_id,name) values (136,'MASTER_LOG_FILE');
insert into help_keyword (help_keyword_id,name) values (137,'MRG_MYISAM');
insert into help_keyword (help_keyword_id,name) values (138,'PRECISION');
insert into help_keyword (help_keyword_id,name) values (139,'REQUIRE');
insert into help_keyword (help_keyword_id,name) values (140,'TRAILING');
insert into help_keyword (help_keyword_id,name) values (141,'PARTITIONS');
insert into help_keyword (help_keyword_id,name) values (142,'LONG');
insert into help_keyword (help_keyword_id,name) values (143,'OPTION');
insert into help_keyword (help_keyword_id,name) values (144,'REORGANIZE');
insert into help_keyword (help_keyword_id,name) values (145,'ELSE');
insert into help_keyword (help_keyword_id,name) values (146,'DEALLOCATE');
insert into help_keyword (help_keyword_id,name) values (147,'IO_THREAD');
insert into help_keyword (help_keyword_id,name) values (148,'CASE');
insert into help_keyword (help_keyword_id,name) values (149,'CIPHER');
insert into help_keyword (help_keyword_id,name) values (150,'STATS_AUTO_RECALC');
insert into help_keyword (help_keyword_id,name) values (151,'CONTINUE');
insert into help_keyword (help_keyword_id,name) values (152,'FROM');
insert into help_keyword (help_keyword_id,name) values (153,'READ');
insert into help_keyword (help_keyword_id,name) values (154,'LEFT');
insert into help_keyword (help_keyword_id,name) values (155,'ELSEIF');
insert into help_keyword (help_keyword_id,name) values (156,'MINUTE_SECOND');
insert into help_keyword (help_keyword_id,name) values (157,'COMPACT');
insert into help_keyword (help_keyword_id,name) values (158,'DEC');
insert into help_keyword (help_keyword_id,name) values (159,'FOR');
insert into help_keyword (help_keyword_id,name) values (160,'WARNINGS');
insert into help_keyword (help_keyword_id,name) values (161,'MIN_ROWS');
insert into help_keyword (help_keyword_id,name) values (162,'STRING');
insert into help_keyword (help_keyword_id,name) values (163,'CONDITION');
insert into help_keyword (help_keyword_id,name) values (164,'ROW_COUNT');
insert into help_keyword (help_keyword_id,name) values (165,'ENCLOSED');
insert into help_keyword (help_keyword_id,name) values (166,'FUNCTION');
insert into help_keyword (help_keyword_id,name) values (167,'AGGREGATE');
insert into help_keyword (help_keyword_id,name) values (168,'NUMBER');
insert into help_keyword (help_keyword_id,name) values (169,'FIELDS');
insert into help_keyword (help_keyword_id,name) values (170,'INT3');
insert into help_keyword (help_keyword_id,name) values (171,'ARCHIVE');
insert into help_keyword (help_keyword_id,name) values (172,'AVG_ROW_LENGTH');
insert into help_keyword (help_keyword_id,name) values (173,'ADD');
insert into help_keyword (help_keyword_id,name) values (174,'KILL');
insert into help_keyword (help_keyword_id,name) values (175,'FLOAT4');
insert into help_keyword (help_keyword_id,name) values (176,'TABLESPACE');
insert into help_keyword (help_keyword_id,name) values (177,'VIEW');
insert into help_keyword (help_keyword_id,name) values (178,'ALGORITHM');
insert into help_keyword (help_keyword_id,name) values (179,'REPEATABLE');
insert into help_keyword (help_keyword_id,name) values (180,'INFILE');
insert into help_keyword (help_keyword_id,name) values (181,'HELP_VERSION');
insert into help_keyword (help_keyword_id,name) values (182,'ORDER');
insert into help_keyword (help_keyword_id,name) values (183,'MASTER_SSL_CRL');
insert into help_keyword (help_keyword_id,name) values (184,'USING');
insert into help_keyword (help_keyword_id,name) values (185,'CONSTRAINT_CATALOG');
insert into help_keyword (help_keyword_id,name) values (186,'MIDDLEINT');
insert into help_keyword (help_keyword_id,name) values (187,'GRANT');
insert into help_keyword (help_keyword_id,name) values (188,'UNSIGNED');
insert into help_keyword (help_keyword_id,name) values (189,'DECIMAL');
insert into help_keyword (help_keyword_id,name) values (190,'GEOMETRYFROMTEXT');
insert into help_keyword (help_keyword_id,name) values (191,'INDEXES');
insert into help_keyword (help_keyword_id,name) values (192,'DEFAULT_AUTH');
insert into help_keyword (help_keyword_id,name) values (193,'FOREIGN');
insert into help_keyword (help_keyword_id,name) values (194,'CACHE');
insert into help_keyword (help_keyword_id,name) values (195,'HOSTS');
insert into help_keyword (help_keyword_id,name) values (196,'MYSQL_ERRNO');
insert into help_keyword (help_keyword_id,name) values (197,'COMMIT');
insert into help_keyword (help_keyword_id,name) values (198,'SCHEMAS');
insert into help_keyword (help_keyword_id,name) values (199,'LEADING');
insert into help_keyword (help_keyword_id,name) values (200,'SNAPSHOT');
insert into help_keyword (help_keyword_id,name) values (201,'CONSTRAINT_NAME');
insert into help_keyword (help_keyword_id,name) values (202,'DECLARE');
insert into help_keyword (help_keyword_id,name) values (203,'LOAD');
insert into help_keyword (help_keyword_id,name) values (204,'SQL_CACHE');
insert into help_keyword (help_keyword_id,name) values (205,'CONVERT');
insert into help_keyword (help_keyword_id,name) values (206,'DYNAMIC');
insert into help_keyword (help_keyword_id,name) values (207,'COLLATE');
insert into help_keyword (help_keyword_id,name) values (208,'POLYGONFROMTEXT');
insert into help_keyword (help_keyword_id,name) values (209,'BYTE');
insert into help_keyword (help_keyword_id,name) values (210,'GLOBAL');
insert into help_keyword (help_keyword_id,name) values (211,'LINESTRINGFROMWKB');
insert into help_keyword (help_keyword_id,name) values (212,'WHEN');
insert into help_keyword (help_keyword_id,name) values (213,'HAVING');
insert into help_keyword (help_keyword_id,name) values (214,'AS');
insert into help_keyword (help_keyword_id,name) values (215,'STARTING');
insert into help_keyword (help_keyword_id,name) values (216,'RELOAD');
insert into help_keyword (help_keyword_id,name) values (217,'AUTOCOMMIT');
insert into help_keyword (help_keyword_id,name) values (218,'REVOKE');
insert into help_keyword (help_keyword_id,name) values (219,'GRANTS');
insert into help_keyword (help_keyword_id,name) values (220,'OUTER');
insert into help_keyword (help_keyword_id,name) values (221,'CURSOR_NAME');
insert into help_keyword (help_keyword_id,name) values (222,'RANDOM_BYTES');
insert into help_keyword (help_keyword_id,name) values (223,'EXPIRE');
insert into help_keyword (help_keyword_id,name) values (224,'SQL_AFTER_MTS_GAPS');
insert into help_keyword (help_keyword_id,name) values (225,'FLOOR');
insert into help_keyword (help_keyword_id,name) values (226,'EXPLAIN');
insert into help_keyword (help_keyword_id,name) values (227,'WITH');
insert into help_keyword (help_keyword_id,name) values (228,'AFTER');
insert into help_keyword (help_keyword_id,name) values (229,'STD');
insert into help_keyword (help_keyword_id,name) values (230,'CSV');
insert into help_keyword (help_keyword_id,name) values (231,'DISABLE');
insert into help_keyword (help_keyword_id,name) values (232,'UNINSTALL');
insert into help_keyword (help_keyword_id,name) values (233,'OUTFILE');
insert into help_keyword (help_keyword_id,name) values (234,'LOW_PRIORITY');
insert into help_keyword (help_keyword_id,name) values (235,'FILE');
insert into help_keyword (help_keyword_id,name) values (236,'NODEGROUP');
insert into help_keyword (help_keyword_id,name) values (237,'SCHEMA');
insert into help_keyword (help_keyword_id,name) values (238,'SONAME');
insert into help_keyword (help_keyword_id,name) values (239,'POW');
insert into help_keyword (help_keyword_id,name) values (240,'DUAL');
insert into help_keyword (help_keyword_id,name) values (241,'MULTIPOINTFROMWKB');
insert into help_keyword (help_keyword_id,name) values (242,'INDEX');
insert into help_keyword (help_keyword_id,name) values (243,'MULTIPOINTFROMTEXT');
insert into help_keyword (help_keyword_id,name) values (244,'DEFINER');
insert into help_keyword (help_keyword_id,name) values (245,'MASTER_BIND');
insert into help_keyword (help_keyword_id,name) values (246,'REMOVE');
insert into help_keyword (help_keyword_id,name) values (247,'EXTENDED');
insert into help_keyword (help_keyword_id,name) values (248,'MULTILINESTRINGFROMWKB');
insert into help_keyword (help_keyword_id,name) values (249,'CROSS');
insert into help_keyword (help_keyword_id,name) values (250,'CONTRIBUTORS');
insert into help_keyword (help_keyword_id,name) values (251,'NATIONAL');
insert into help_keyword (help_keyword_id,name) values (252,'GROUP');
insert into help_keyword (help_keyword_id,name) values (253,'SHA');
insert into help_keyword (help_keyword_id,name) values (254,'UNDO');
insert into help_keyword (help_keyword_id,name) values (255,'IGNORE_SERVER_IDS');
insert into help_keyword (help_keyword_id,name) values (256,'MASTER_AUTO_POSITION');
insert into help_keyword (help_keyword_id,name) values (257,'ZEROFILL');
insert into help_keyword (help_keyword_id,name) values (258,'CLIENT');
insert into help_keyword (help_keyword_id,name) values (259,'MASTER_PASSWORD');
insert into help_keyword (help_keyword_id,name) values (260,'OWNER');
insert into help_keyword (help_keyword_id,name) values (261,'RELAY_LOG_FILE');
insert into help_keyword (help_keyword_id,name) values (262,'TRUE');
insert into help_keyword (help_keyword_id,name) values (263,'CHARACTER');
insert into help_keyword (help_keyword_id,name) values (264,'MASTER_USER');
insert into help_keyword (help_keyword_id,name) values (265,'SCHEMA_NAME');
insert into help_keyword (help_keyword_id,name) values (266,'TABLE');
insert into help_keyword (help_keyword_id,name) values (267,'ENGINE');
insert into help_keyword (help_keyword_id,name) values (268,'INSERT_METHOD');
insert into help_keyword (help_keyword_id,name) values (269,'CASCADE');
insert into help_keyword (help_keyword_id,name) values (270,'RELAY_LOG_POS');
insert into help_keyword (help_keyword_id,name) values (271,'SQL_CALC_FOUND_ROWS');
insert into help_keyword (help_keyword_id,name) values (272,'UNION');
insert into help_keyword (help_keyword_id,name) values (273,'MYISAM');
insert into help_keyword (help_keyword_id,name) values (274,'LEAVE');
insert into help_keyword (help_keyword_id,name) values (275,'MODIFY');
insert into help_keyword (help_keyword_id,name) values (276,'MATCH');
insert into help_keyword (help_keyword_id,name) values (277,'MASTER_LOG_POS');
insert into help_keyword (help_keyword_id,name) values (278,'DISTINCTROW');
insert into help_keyword (help_keyword_id,name) values (279,'DESC');
insert into help_keyword (help_keyword_id,name) values (280,'TIME');
insert into help_keyword (help_keyword_id,name) values (281,'NUMERIC');
insert into help_keyword (help_keyword_id,name) values (282,'EXPANSION');
insert into help_keyword (help_keyword_id,name) values (283,'CODE');
insert into help_keyword (help_keyword_id,name) values (284,'CURSOR');
insert into help_keyword (help_keyword_id,name) values (285,'GEOMETRYCOLLECTIONFROMTEXT');
insert into help_keyword (help_keyword_id,name) values (286,'CHAIN');
insert into help_keyword (help_keyword_id,name) values (287,'LOGFILE');
insert into help_keyword (help_keyword_id,name) values (288,'FLUSH');
insert into help_keyword (help_keyword_id,name) values (289,'CREATE');
insert into help_keyword (help_keyword_id,name) values (290,'DESCRIBE');
insert into help_keyword (help_keyword_id,name) values (291,'EXTENT_SIZE');
insert into help_keyword (help_keyword_id,name) values (292,'MAX_UPDATES_PER_HOUR');
insert into help_keyword (help_keyword_id,name) values (293,'INT2');
insert into help_keyword (help_keyword_id,name) values (294,'PROCESSLIST');
insert into help_keyword (help_keyword_id,name) values (295,'ENDS');
insert into help_keyword (help_keyword_id,name) values (296,'LOGS');
insert into help_keyword (help_keyword_id,name) values (297,'RECOVER');
insert into help_keyword (help_keyword_id,name) values (298,'DISCARD');
insert into help_keyword (help_keyword_id,name) values (299,'HEAP');
insert into help_keyword (help_keyword_id,name) values (300,'RETURNED_SQLSTATE');
insert into help_keyword (help_keyword_id,name) values (301,'EXCHANGE');
insert into help_keyword (help_keyword_id,name) values (302,'SOUNDS');
insert into help_keyword (help_keyword_id,name) values (303,'BETWEEN');
insert into help_keyword (help_keyword_id,name) values (304,'MULTILINESTRINGFROMTEXT');
insert into help_keyword (help_keyword_id,name) values (305,'REPAIR');
insert into help_keyword (help_keyword_id,name) values (306,'PACK_KEYS');
insert into help_keyword (help_keyword_id,name) values (307,'FAST');
insert into help_keyword (help_keyword_id,name) values (308,'VALUES');
insert into help_keyword (help_keyword_id,name) values (309,'CALL');
insert into help_keyword (help_keyword_id,name) values (310,'GET');
insert into help_keyword (help_keyword_id,name) values (311,'LOOP');
insert into help_keyword (help_keyword_id,name) values (312,'VARCHARACTER');
insert into help_keyword (help_keyword_id,name) values (313,'BEFORE');
insert into help_keyword (help_keyword_id,name) values (314,'TRUNCATE');
insert into help_keyword (help_keyword_id,name) values (315,'SHOW');
insert into help_keyword (help_keyword_id,name) values (316,'ALL');
insert into help_keyword (help_keyword_id,name) values (317,'REDUNDANT');
insert into help_keyword (help_keyword_id,name) values (318,'USER_RESOURCES');
insert into help_keyword (help_keyword_id,name) values (319,'PARTIAL');
insert into help_keyword (help_keyword_id,name) values (320,'BINLOG');
insert into help_keyword (help_keyword_id,name) values (321,'END');
insert into help_keyword (help_keyword_id,name) values (322,'SECOND');
insert into help_keyword (help_keyword_id,name) values (323,'AND');
insert into help_keyword (help_keyword_id,name) values (324,'FLOAT8');
insert into help_keyword (help_keyword_id,name) values (325,'PREV');
insert into help_keyword (help_keyword_id,name) values (326,'HOUR');
insert into help_keyword (help_keyword_id,name) values (327,'SELECT');
insert into help_keyword (help_keyword_id,name) values (328,'DATABASES');
insert into help_keyword (help_keyword_id,name) values (329,'OR');
insert into help_keyword (help_keyword_id,name) values (330,'IDENTIFIED');
insert into help_keyword (help_keyword_id,name) values (331,'WRAPPER');
insert into help_keyword (help_keyword_id,name) values (332,'MASTER_SSL_CIPHER');
insert into help_keyword (help_keyword_id,name) values (333,'SQL_SLAVE_SKIP_COUNTER');
insert into help_keyword (help_keyword_id,name) values (334,'BOTH');
insert into help_keyword (help_keyword_id,name) values (335,'BOOL');
insert into help_keyword (help_keyword_id,name) values (336,'YEAR');
insert into help_keyword (help_keyword_id,name) values (337,'MASTER_PORT');
insert into help_keyword (help_keyword_id,name) values (338,'CONCURRENT');
insert into help_keyword (help_keyword_id,name) values (339,'HELP');
insert into help_keyword (help_keyword_id,name) values (340,'UNIQUE');
insert into help_keyword (help_keyword_id,name) values (341,'TRIGGERS');
insert into help_keyword (help_keyword_id,name) values (342,'PROCESS');
insert into help_keyword (help_keyword_id,name) values (343,'OPTIONS');
insert into help_keyword (help_keyword_id,name) values (344,'RESIGNAL');
insert into help_keyword (help_keyword_id,name) values (345,'CONSISTENT');
insert into help_keyword (help_keyword_id,name) values (346,'MASTER_SSL');
insert into help_keyword (help_keyword_id,name) values (347,'DATE_ADD');
insert into help_keyword (help_keyword_id,name) values (348,'MAX_CONNECTIONS_PER_HOUR');
insert into help_keyword (help_keyword_id,name) values (349,'LIKE');
insert into help_keyword (help_keyword_id,name) values (350,'PLUGIN');
insert into help_keyword (help_keyword_id,name) values (351,'FETCH');
insert into help_keyword (help_keyword_id,name) values (352,'IN');
insert into help_keyword (help_keyword_id,name) values (353,'COLUMN');
insert into help_keyword (help_keyword_id,name) values (354,'DIAGNOSTICS');
insert into help_keyword (help_keyword_id,name) values (355,'DUMPFILE');
insert into help_keyword (help_keyword_id,name) values (356,'USAGE');
insert into help_keyword (help_keyword_id,name) values (357,'EXECUTE');
insert into help_keyword (help_keyword_id,name) values (358,'MEMORY');
insert into help_keyword (help_keyword_id,name) values (359,'CEIL');
insert into help_keyword (help_keyword_id,name) values (360,'QUERY');
insert into help_keyword (help_keyword_id,name) values (361,'MASTER_HOST');
insert into help_keyword (help_keyword_id,name) values (362,'LINES');
insert into help_keyword (help_keyword_id,name) values (363,'PLUGIN_DIR');
insert into help_keyword (help_keyword_id,name) values (364,'SQL_THREAD');
insert into help_keyword (help_keyword_id,name) values (365,'SERVER');
insert into help_keyword (help_keyword_id,name) values (366,'MAX_QUERIES_PER_HOUR');
insert into help_keyword (help_keyword_id,name) values (367,'MASTER_SSL_CERT');
insert into help_keyword (help_keyword_id,name) values (368,'MULTIPOLYGONFROMWKB');
insert into help_keyword (help_keyword_id,name) values (369,'TRANSACTION');
insert into help_keyword (help_keyword_id,name) values (370,'DAY_MINUTE');
insert into help_keyword (help_keyword_id,name) values (371,'STDDEV');
insert into help_keyword (help_keyword_id,name) values (372,'DATE_SUB');
insert into help_keyword (help_keyword_id,name) values (373,'REBUILD');
insert into help_keyword (help_keyword_id,name) values (374,'GEOMETRYFROMWKB');
insert into help_keyword (help_keyword_id,name) values (375,'INT1');
insert into help_keyword (help_keyword_id,name) values (376,'RENAME');
insert into help_keyword (help_keyword_id,name) values (377,'PARSER');
insert into help_keyword (help_keyword_id,name) values (378,'RIGHT');
insert into help_keyword (help_keyword_id,name) values (379,'ALTER');
insert into help_keyword (help_keyword_id,name) values (380,'MAX_ROWS');
insert into help_keyword (help_keyword_id,name) values (381,'SOCKET');
insert into help_keyword (help_keyword_id,name) values (382,'STRAIGHT_JOIN');
insert into help_keyword (help_keyword_id,name) values (383,'NATURAL');
insert into help_keyword (help_keyword_id,name) values (384,'VARIABLES');
insert into help_keyword (help_keyword_id,name) values (385,'ESCAPED');
insert into help_keyword (help_keyword_id,name) values (386,'SHA1');
insert into help_keyword (help_keyword_id,name) values (387,'KEY_BLOCK_SIZE');
insert into help_keyword (help_keyword_id,name) values (388,'PASSWORD');
insert into help_keyword (help_keyword_id,name) values (389,'OFFSET');
insert into help_keyword (help_keyword_id,name) values (390,'CHAR');
insert into help_keyword (help_keyword_id,name) values (391,'NEXT');
insert into help_keyword (help_keyword_id,name) values (392,'ERRORS');
insert into help_keyword (help_keyword_id,name) values (393,'SQL_LOG_BIN');
insert into help_keyword (help_keyword_id,name) values (394,'TEMPORARY');
insert into help_keyword (help_keyword_id,name) values (395,'COMMITTED');
insert into help_keyword (help_keyword_id,name) values (396,'SQL_SMALL_RESULT');
insert into help_keyword (help_keyword_id,name) values (397,'UPGRADE');
insert into help_keyword (help_keyword_id,name) values (398,'XA');
insert into help_keyword (help_keyword_id,name) values (399,'BEGIN');
insert into help_keyword (help_keyword_id,name) values (400,'DELAY_KEY_WRITE');
insert into help_keyword (help_keyword_id,name) values (401,'PROFILE');
insert into help_keyword (help_keyword_id,name) values (402,'MEDIUM');
insert into help_keyword (help_keyword_id,name) values (403,'INTERVAL');
insert into help_keyword (help_keyword_id,name) values (404,'SSL');
insert into help_keyword (help_keyword_id,name) values (405,'DAY_HOUR');
insert into help_keyword (help_keyword_id,name) values (406,'NAME');
insert into help_keyword (help_keyword_id,name) values (407,'REFERENCES');
insert into help_keyword (help_keyword_id,name) values (408,'AES_ENCRYPT');
insert into help_keyword (help_keyword_id,name) values (409,'STORAGE');
insert into help_keyword (help_keyword_id,name) values (410,'ISOLATION');
insert into help_keyword (help_keyword_id,name) values (411,'CEILING');
insert into help_keyword (help_keyword_id,name) values (412,'EVERY');
insert into help_keyword (help_keyword_id,name) values (413,'INT8');
insert into help_keyword (help_keyword_id,name) values (414,'AUTHORS');
insert into help_keyword (help_keyword_id,name) values (415,'STATS_SAMPLE_PAGES');
insert into help_keyword (help_keyword_id,name) values (416,'RESTRICT');
insert into help_keyword (help_keyword_id,name) values (417,'UNCOMMITTED');
insert into help_keyword (help_keyword_id,name) values (418,'LINESTRINGFROMTEXT');
insert into help_keyword (help_keyword_id,name) values (419,'IS');
insert into help_keyword (help_keyword_id,name) values (420,'NOT');
insert into help_keyword (help_keyword_id,name) values (421,'ANALYSE');
insert into help_keyword (help_keyword_id,name) values (422,'DATAFILE');
insert into help_keyword (help_keyword_id,name) values (423,'DES_KEY_FILE');
insert into help_keyword (help_keyword_id,name) values (424,'SIGNAL');
insert into help_keyword (help_keyword_id,name) values (425,'COMPRESSED');
insert into help_keyword (help_keyword_id,name) values (426,'START');
insert into help_keyword (help_keyword_id,name) values (427,'PLUGINS');
insert into help_keyword (help_keyword_id,name) values (428,'SAVEPOINT');
insert into help_keyword (help_keyword_id,name) values (429,'IF');
insert into help_keyword (help_keyword_id,name) values (430,'ROWS');
insert into help_keyword (help_keyword_id,name) values (431,'PRIMARY');
insert into help_keyword (help_keyword_id,name) values (432,'PURGE');
insert into help_keyword (help_keyword_id,name) values (433,'LAST');
insert into help_keyword (help_keyword_id,name) values (434,'USER');
insert into help_keyword (help_keyword_id,name) values (435,'EXIT');
insert into help_keyword (help_keyword_id,name) values (436,'KEYS');
insert into help_keyword (help_keyword_id,name) values (437,'LIMIT');
insert into help_keyword (help_keyword_id,name) values (438,'KEY');
insert into help_keyword (help_keyword_id,name) values (439,'MERGE');
insert into help_keyword (help_keyword_id,name) values (440,'UNTIL');
insert into help_keyword (help_keyword_id,name) values (441,'SQL_NO_CACHE');
insert into help_keyword (help_keyword_id,name) values (442,'DELAYED');
insert into help_keyword (help_keyword_id,name) values (443,'CONSTRAINT_SCHEMA');
insert into help_keyword (help_keyword_id,name) values (444,'ANALYZE');
insert into help_keyword (help_keyword_id,name) values (445,'CONSTRAINT');
insert into help_keyword (help_keyword_id,name) values (446,'SERIAL');
insert into help_keyword (help_keyword_id,name) values (447,'ACTION');
insert into help_keyword (help_keyword_id,name) values (448,'WRITE');
insert into help_keyword (help_keyword_id,name) values (449,'INITIAL_SIZE');
insert into help_keyword (help_keyword_id,name) values (450,'SESSION');
insert into help_keyword (help_keyword_id,name) values (451,'DATABASE');
insert into help_keyword (help_keyword_id,name) values (452,'NULL');
insert into help_keyword (help_keyword_id,name) values (453,'POWER');
insert into help_keyword (help_keyword_id,name) values (454,'USE_FRM');
insert into help_keyword (help_keyword_id,name) values (455,'TERMINATED');
insert into help_keyword (help_keyword_id,name) values (456,'SLAVE');
insert into help_keyword (help_keyword_id,name) values (457,'NVARCHAR');
insert into help_keyword (help_keyword_id,name) values (458,'ASC');
insert into help_keyword (help_keyword_id,name) values (459,'RETURN');
insert into help_keyword (help_keyword_id,name) values (460,'OPTIONALLY');
insert into help_keyword (help_keyword_id,name) values (461,'ENABLE');
insert into help_keyword (help_keyword_id,name) values (462,'DIRECTORY');
insert into help_keyword (help_keyword_id,name) values (463,'MAX_USER_CONNECTIONS');
insert into help_keyword (help_keyword_id,name) values (464,'WHILE');
insert into help_keyword (help_keyword_id,name) values (465,'LOCAL');
insert into help_keyword (help_keyword_id,name) values (466,'DISTINCT');
insert into help_keyword (help_keyword_id,name) values (467,'AES_DECRYPT');
insert into help_keyword (help_keyword_id,name) values (468,'MASTER_SSL_KEY');
insert into help_keyword (help_keyword_id,name) values (469,'NONE');
insert into help_keyword (help_keyword_id,name) values (470,'TABLES');
insert into help_keyword (help_keyword_id,name) values (471,'<>');
insert into help_keyword (help_keyword_id,name) values (472,'EXPORT');
insert into help_keyword (help_keyword_id,name) values (473,'RLIKE');
insert into help_keyword (help_keyword_id,name) values (474,'TRIGGER');
insert into help_keyword (help_keyword_id,name) values (475,'COLLATION');
insert into help_keyword (help_keyword_id,name) values (476,'SHUTDOWN');
insert into help_keyword (help_keyword_id,name) values (477,'HIGH_PRIORITY');
insert into help_keyword (help_keyword_id,name) values (478,'BTREE');
insert into help_keyword (help_keyword_id,name) values (479,'FIRST');
insert into help_keyword (help_keyword_id,name) values (480,'COALESCE');
insert into help_keyword (help_keyword_id,name) values (481,'WAIT');
insert into help_keyword (help_keyword_id,name) values (482,'CATALOG_NAME');
insert into help_keyword (help_keyword_id,name) values (483,'MASTER');
insert into help_keyword (help_keyword_id,name) values (484,'FIXED');
insert into help_keyword (help_keyword_id,name) values (485,'MULTIPOLYGONFROMTEXT');
insert into help_keyword (help_keyword_id,name) values (486,'ROW_FORMAT');

insert into help_relation (help_topic_id,help_keyword_id) values (0,0);
insert into help_relation (help_topic_id,help_keyword_id) values (449,0);
insert into help_relation (help_topic_id,help_keyword_id) values (251,1);
insert into help_relation (help_topic_id,help_keyword_id) values (127,2);
insert into help_relation (help_topic_id,help_keyword_id) values (240,3);
insert into help_relation (help_topic_id,help_keyword_id) values (271,4);
insert into help_relation (help_topic_id,help_keyword_id) values (334,4);
insert into help_relation (help_topic_id,help_keyword_id) values (485,4);
insert into help_relation (help_topic_id,help_keyword_id) values (312,5);
insert into help_relation (help_topic_id,help_keyword_id) values (477,6);
insert into help_relation (help_topic_id,help_keyword_id) values (312,6);
insert into help_relation (help_topic_id,help_keyword_id) values (59,7);
insert into help_relation (help_topic_id,help_keyword_id) values (312,8);
insert into help_relation (help_topic_id,help_keyword_id) values (363,9);
insert into help_relation (help_topic_id,help_keyword_id) values (231,10);
insert into help_relation (help_topic_id,help_keyword_id) values (342,11);
insert into help_relation (help_topic_id,help_keyword_id) values (240,11);
insert into help_relation (help_topic_id,help_keyword_id) values (495,11);
insert into help_relation (help_topic_id,help_keyword_id) values (443,12);
insert into help_relation (help_topic_id,help_keyword_id) values (277,12);
insert into help_relation (help_topic_id,help_keyword_id) values (249,12);
insert into help_relation (help_topic_id,help_keyword_id) values (485,12);
insert into help_relation (help_topic_id,help_keyword_id) values (513,12);
insert into help_relation (help_topic_id,help_keyword_id) values (477,13);
insert into help_relation (help_topic_id,help_keyword_id) values (312,13);
insert into help_relation (help_topic_id,help_keyword_id) values (342,14);
insert into help_relation (help_topic_id,help_keyword_id) values (126,15);
insert into help_relation (help_topic_id,help_keyword_id) values (311,16);
insert into help_relation (help_topic_id,help_keyword_id) values (449,16);
insert into help_relation (help_topic_id,help_keyword_id) values (13,17);
insert into help_relation (help_topic_id,help_keyword_id) values (336,17);
insert into help_relation (help_topic_id,help_keyword_id) values (443,17);
insert into help_relation (help_topic_id,help_keyword_id) values (63,17);
insert into help_relation (help_topic_id,help_keyword_id) values (266,18);
insert into help_relation (help_topic_id,help_keyword_id) values (59,18);
insert into help_relation (help_topic_id,help_keyword_id) values (205,19);
insert into help_relation (help_topic_id,help_keyword_id) values (510,20);
insert into help_relation (help_topic_id,help_keyword_id) values (271,20);
insert into help_relation (help_topic_id,help_keyword_id) values (202,20);
insert into help_relation (help_topic_id,help_keyword_id) values (319,20);
insert into help_relation (help_topic_id,help_keyword_id) values (388,20);
insert into help_relation (help_topic_id,help_keyword_id) values (363,21);
insert into help_relation (help_topic_id,help_keyword_id) values (449,22);
insert into help_relation (help_topic_id,help_keyword_id) values (520,23);
insert into help_relation (help_topic_id,help_keyword_id) values (283,23);
insert into help_relation (help_topic_id,help_keyword_id) values (386,23);
insert into help_relation (help_topic_id,help_keyword_id) values (413,23);
insert into help_relation (help_topic_id,help_keyword_id) values (6,23);
insert into help_relation (help_topic_id,help_keyword_id) values (224,23);
insert into help_relation (help_topic_id,help_keyword_id) values (402,23);
insert into help_relation (help_topic_id,help_keyword_id) values (483,23);
insert into help_relation (help_topic_id,help_keyword_id) values (281,23);
insert into help_relation (help_topic_id,help_keyword_id) values (52,23);
insert into help_relation (help_topic_id,help_keyword_id) values (147,23);
insert into help_relation (help_topic_id,help_keyword_id) values (362,23);
insert into help_relation (help_topic_id,help_keyword_id) values (220,23);
insert into help_relation (help_topic_id,help_keyword_id) values (430,23);
insert into help_relation (help_topic_id,help_keyword_id) values (513,23);
insert into help_relation (help_topic_id,help_keyword_id) values (321,24);
insert into help_relation (help_topic_id,help_keyword_id) values (228,25);
insert into help_relation (help_topic_id,help_keyword_id) values (70,25);
insert into help_relation (help_topic_id,help_keyword_id) values (96,25);
insert into help_relation (help_topic_id,help_keyword_id) values (204,26);
insert into help_relation (help_topic_id,help_keyword_id) values (48,27);
insert into help_relation (help_topic_id,help_keyword_id) values (319,28);
insert into help_relation (help_topic_id,help_keyword_id) values (111,29);
insert into help_relation (help_topic_id,help_keyword_id) values (26,30);
insert into help_relation (help_topic_id,help_keyword_id) values (249,31);
insert into help_relation (help_topic_id,help_keyword_id) values (443,32);
insert into help_relation (help_topic_id,help_keyword_id) values (249,32);
insert into help_relation (help_topic_id,help_keyword_id) values (204,33);
insert into help_relation (help_topic_id,help_keyword_id) values (111,34);
insert into help_relation (help_topic_id,help_keyword_id) values (363,35);
insert into help_relation (help_topic_id,help_keyword_id) values (25,36);
insert into help_relation (help_topic_id,help_keyword_id) values (386,36);
insert into help_relation (help_topic_id,help_keyword_id) values (495,36);
insert into help_relation (help_topic_id,help_keyword_id) values (26,37);
insert into help_relation (help_topic_id,help_keyword_id) values (52,37);
insert into help_relation (help_topic_id,help_keyword_id) values (449,37);
insert into help_relation (help_topic_id,help_keyword_id) values (115,37);
insert into help_relation (help_topic_id,help_keyword_id) values (513,37);
insert into help_relation (help_topic_id,help_keyword_id) values (249,38);
insert into help_relation (help_topic_id,help_keyword_id) values (225,39);
insert into help_relation (help_topic_id,help_keyword_id) values (249,39);
insert into help_relation (help_topic_id,help_keyword_id) values (513,39);
insert into help_relation (help_topic_id,help_keyword_id) values (443,40);
insert into help_relation (help_topic_id,help_keyword_id) values (277,40);
insert into help_relation (help_topic_id,help_keyword_id) values (166,40);
insert into help_relation (help_topic_id,help_keyword_id) values (249,40);
insert into help_relation (help_topic_id,help_keyword_id) values (505,40);
insert into help_relation (help_topic_id,help_keyword_id) values (266,41);
insert into help_relation (help_topic_id,help_keyword_id) values (334,42);
insert into help_relation (help_topic_id,help_keyword_id) values (33,42);
insert into help_relation (help_topic_id,help_keyword_id) values (249,42);
insert into help_relation (help_topic_id,help_keyword_id) values (49,42);
insert into help_relation (help_topic_id,help_keyword_id) values (111,42);
insert into help_relation (help_topic_id,help_keyword_id) values (449,42);
insert into help_relation (help_topic_id,help_keyword_id) values (485,42);
insert into help_relation (help_topic_id,help_keyword_id) values (307,42);
insert into help_relation (help_topic_id,help_keyword_id) values (450,42);
insert into help_relation (help_topic_id,help_keyword_id) values (513,42);
insert into help_relation (help_topic_id,help_keyword_id) values (519,43);
insert into help_relation (help_topic_id,help_keyword_id) values (249,43);
insert into help_relation (help_topic_id,help_keyword_id) values (204,44);
insert into help_relation (help_topic_id,help_keyword_id) values (0,45);
insert into help_relation (help_topic_id,help_keyword_id) values (271,45);
insert into help_relation (help_topic_id,help_keyword_id) values (334,45);
insert into help_relation (help_topic_id,help_keyword_id) values (33,45);
insert into help_relation (help_topic_id,help_keyword_id) values (249,45);
insert into help_relation (help_topic_id,help_keyword_id) values (319,45);
insert into help_relation (help_topic_id,help_keyword_id) values (449,45);
insert into help_relation (help_topic_id,help_keyword_id) values (485,45);
insert into help_relation (help_topic_id,help_keyword_id) values (513,45);
insert into help_relation (help_topic_id,help_keyword_id) values (251,46);
insert into help_relation (help_topic_id,help_keyword_id) values (249,46);
insert into help_relation (help_topic_id,help_keyword_id) values (116,46);
insert into help_relation (help_topic_id,help_keyword_id) values (485,46);
insert into help_relation (help_topic_id,help_keyword_id) values (204,47);
insert into help_relation (help_topic_id,help_keyword_id) values (449,48);
insert into help_relation (help_topic_id,help_keyword_id) values (421,49);
insert into help_relation (help_topic_id,help_keyword_id) values (59,49);
insert into help_relation (help_topic_id,help_keyword_id) values (450,50);
insert into help_relation (help_topic_id,help_keyword_id) values (510,51);
insert into help_relation (help_topic_id,help_keyword_id) values (202,51);
insert into help_relation (help_topic_id,help_keyword_id) values (173,51);
insert into help_relation (help_topic_id,help_keyword_id) values (363,52);
insert into help_relation (help_topic_id,help_keyword_id) values (519,53);
insert into help_relation (help_topic_id,help_keyword_id) values (33,53);
insert into help_relation (help_topic_id,help_keyword_id) values (249,53);
insert into help_relation (help_topic_id,help_keyword_id) values (477,54);
insert into help_relation (help_topic_id,help_keyword_id) values (0,54);
insert into help_relation (help_topic_id,help_keyword_id) values (519,54);
insert into help_relation (help_topic_id,help_keyword_id) values (312,54);
insert into help_relation (help_topic_id,help_keyword_id) values (510,55);
insert into help_relation (help_topic_id,help_keyword_id) values (202,55);
insert into help_relation (help_topic_id,help_keyword_id) values (173,55);
insert into help_relation (help_topic_id,help_keyword_id) values (98,56);
insert into help_relation (help_topic_id,help_keyword_id) values (249,56);
insert into help_relation (help_topic_id,help_keyword_id) values (34,57);
insert into help_relation (help_topic_id,help_keyword_id) values (63,57);
insert into help_relation (help_topic_id,help_keyword_id) values (363,58);
insert into help_relation (help_topic_id,help_keyword_id) values (111,59);
insert into help_relation (help_topic_id,help_keyword_id) values (108,60);
insert into help_relation (help_topic_id,help_keyword_id) values (36,60);
insert into help_relation (help_topic_id,help_keyword_id) values (0,60);
insert into help_relation (help_topic_id,help_keyword_id) values (510,61);
insert into help_relation (help_topic_id,help_keyword_id) values (202,61);
insert into help_relation (help_topic_id,help_keyword_id) values (173,61);
insert into help_relation (help_topic_id,help_keyword_id) values (33,62);
insert into help_relation (help_topic_id,help_keyword_id) values (49,62);
insert into help_relation (help_topic_id,help_keyword_id) values (63,62);
insert into help_relation (help_topic_id,help_keyword_id) values (107,63);
insert into help_relation (help_topic_id,help_keyword_id) values (137,63);
insert into help_relation (help_topic_id,help_keyword_id) values (111,63);
insert into help_relation (help_topic_id,help_keyword_id) values (115,64);
insert into help_relation (help_topic_id,help_keyword_id) values (513,64);
insert into help_relation (help_topic_id,help_keyword_id) values (477,65);
insert into help_relation (help_topic_id,help_keyword_id) values (312,65);
insert into help_relation (help_topic_id,help_keyword_id) values (413,65);
insert into help_relation (help_topic_id,help_keyword_id) values (195,65);
insert into help_relation (help_topic_id,help_keyword_id) values (111,66);
insert into help_relation (help_topic_id,help_keyword_id) values (449,67);
insert into help_relation (help_topic_id,help_keyword_id) values (0,68);
insert into help_relation (help_topic_id,help_keyword_id) values (334,68);
insert into help_relation (help_topic_id,help_keyword_id) values (449,68);
insert into help_relation (help_topic_id,help_keyword_id) values (319,68);
insert into help_relation (help_topic_id,help_keyword_id) values (49,68);
insert into help_relation (help_topic_id,help_keyword_id) values (485,68);
insert into help_relation (help_topic_id,help_keyword_id) values (513,68);
insert into help_relation (help_topic_id,help_keyword_id) values (299,69);
insert into help_relation (help_topic_id,help_keyword_id) values (247,70);
insert into help_relation (help_topic_id,help_keyword_id) values (225,70);
insert into help_relation (help_topic_id,help_keyword_id) values (33,70);
insert into help_relation (help_topic_id,help_keyword_id) values (126,71);
insert into help_relation (help_topic_id,help_keyword_id) values (111,72);
insert into help_relation (help_topic_id,help_keyword_id) values (108,73);
insert into help_relation (help_topic_id,help_keyword_id) values (249,74);
insert into help_relation (help_topic_id,help_keyword_id) values (55,75);
insert into help_relation (help_topic_id,help_keyword_id) values (257,75);
insert into help_relation (help_topic_id,help_keyword_id) values (209,76);
insert into help_relation (help_topic_id,help_keyword_id) values (240,77);
insert into help_relation (help_topic_id,help_keyword_id) values (0,78);
insert into help_relation (help_topic_id,help_keyword_id) values (27,79);
insert into help_relation (help_topic_id,help_keyword_id) values (151,79);
insert into help_relation (help_topic_id,help_keyword_id) values (126,79);
insert into help_relation (help_topic_id,help_keyword_id) values (151,80);
insert into help_relation (help_topic_id,help_keyword_id) values (511,80);
insert into help_relation (help_topic_id,help_keyword_id) values (363,80);
insert into help_relation (help_topic_id,help_keyword_id) values (363,81);
insert into help_relation (help_topic_id,help_keyword_id) values (513,81);
insert into help_relation (help_topic_id,help_keyword_id) values (477,82);
insert into help_relation (help_topic_id,help_keyword_id) values (312,82);
insert into help_relation (help_topic_id,help_keyword_id) values (204,83);
insert into help_relation (help_topic_id,help_keyword_id) values (519,84);
insert into help_relation (help_topic_id,help_keyword_id) values (449,84);
insert into help_relation (help_topic_id,help_keyword_id) values (319,84);
insert into help_relation (help_topic_id,help_keyword_id) values (49,84);
insert into help_relation (help_topic_id,help_keyword_id) values (477,85);
insert into help_relation (help_topic_id,help_keyword_id) values (312,85);
insert into help_relation (help_topic_id,help_keyword_id) values (510,86);
insert into help_relation (help_topic_id,help_keyword_id) values (202,86);
insert into help_relation (help_topic_id,help_keyword_id) values (173,86);
insert into help_relation (help_topic_id,help_keyword_id) values (415,87);
insert into help_relation (help_topic_id,help_keyword_id) values (271,87);
insert into help_relation (help_topic_id,help_keyword_id) values (449,87);
insert into help_relation (help_topic_id,help_keyword_id) values (319,87);
insert into help_relation (help_topic_id,help_keyword_id) values (249,88);
insert into help_relation (help_topic_id,help_keyword_id) values (145,89);
insert into help_relation (help_topic_id,help_keyword_id) values (108,90);
insert into help_relation (help_topic_id,help_keyword_id) values (204,91);
insert into help_relation (help_topic_id,help_keyword_id) values (428,92);
insert into help_relation (help_topic_id,help_keyword_id) values (331,93);
insert into help_relation (help_topic_id,help_keyword_id) values (342,94);
insert into help_relation (help_topic_id,help_keyword_id) values (511,94);
insert into help_relation (help_topic_id,help_keyword_id) values (495,94);
insert into help_relation (help_topic_id,help_keyword_id) values (12,95);
insert into help_relation (help_topic_id,help_keyword_id) values (483,95);
insert into help_relation (help_topic_id,help_keyword_id) values (443,95);
insert into help_relation (help_topic_id,help_keyword_id) values (236,95);
insert into help_relation (help_topic_id,help_keyword_id) values (184,95);
insert into help_relation (help_topic_id,help_keyword_id) values (449,95);
insert into help_relation (help_topic_id,help_keyword_id) values (104,95);
insert into help_relation (help_topic_id,help_keyword_id) values (171,95);
insert into help_relation (help_topic_id,help_keyword_id) values (524,95);
insert into help_relation (help_topic_id,help_keyword_id) values (361,96);
insert into help_relation (help_topic_id,help_keyword_id) values (60,96);
insert into help_relation (help_topic_id,help_keyword_id) values (485,97);
insert into help_relation (help_topic_id,help_keyword_id) values (513,97);
insert into help_relation (help_topic_id,help_keyword_id) values (311,98);
insert into help_relation (help_topic_id,help_keyword_id) values (215,99);
insert into help_relation (help_topic_id,help_keyword_id) values (249,99);
insert into help_relation (help_topic_id,help_keyword_id) values (428,100);
insert into help_relation (help_topic_id,help_keyword_id) values (303,101);
insert into help_relation (help_topic_id,help_keyword_id) values (232,101);
insert into help_relation (help_topic_id,help_keyword_id) values (429,101);
insert into help_relation (help_topic_id,help_keyword_id) values (406,102);
insert into help_relation (help_topic_id,help_keyword_id) values (50,103);
insert into help_relation (help_topic_id,help_keyword_id) values (37,103);
insert into help_relation (help_topic_id,help_keyword_id) values (21,103);
insert into help_relation (help_topic_id,help_keyword_id) values (109,104);
insert into help_relation (help_topic_id,help_keyword_id) values (319,104);
insert into help_relation (help_topic_id,help_keyword_id) values (523,104);
insert into help_relation (help_topic_id,help_keyword_id) values (170,104);
insert into help_relation (help_topic_id,help_keyword_id) values (443,105);
insert into help_relation (help_topic_id,help_keyword_id) values (404,105);
insert into help_relation (help_topic_id,help_keyword_id) values (422,106);
insert into help_relation (help_topic_id,help_keyword_id) values (63,106);
insert into help_relation (help_topic_id,help_keyword_id) values (251,107);
insert into help_relation (help_topic_id,help_keyword_id) values (204,108);
insert into help_relation (help_topic_id,help_keyword_id) values (344,109);
insert into help_relation (help_topic_id,help_keyword_id) values (281,109);
insert into help_relation (help_topic_id,help_keyword_id) values (312,109);
insert into help_relation (help_topic_id,help_keyword_id) values (413,109);
insert into help_relation (help_topic_id,help_keyword_id) values (362,109);
insert into help_relation (help_topic_id,help_keyword_id) values (6,109);
insert into help_relation (help_topic_id,help_keyword_id) values (402,109);
insert into help_relation (help_topic_id,help_keyword_id) values (443,110);
insert into help_relation (help_topic_id,help_keyword_id) values (453,110);
insert into help_relation (help_topic_id,help_keyword_id) values (64,111);
insert into help_relation (help_topic_id,help_keyword_id) values (342,112);
insert into help_relation (help_topic_id,help_keyword_id) values (511,112);
insert into help_relation (help_topic_id,help_keyword_id) values (495,112);
insert into help_relation (help_topic_id,help_keyword_id) values (311,113);
insert into help_relation (help_topic_id,help_keyword_id) values (278,113);
insert into help_relation (help_topic_id,help_keyword_id) values (67,114);
insert into help_relation (help_topic_id,help_keyword_id) values (356,114);
insert into help_relation (help_topic_id,help_keyword_id) values (271,115);
insert into help_relation (help_topic_id,help_keyword_id) values (344,115);
insert into help_relation (help_topic_id,help_keyword_id) values (249,115);
insert into help_relation (help_topic_id,help_keyword_id) values (368,115);
insert into help_relation (help_topic_id,help_keyword_id) values (116,115);
insert into help_relation (help_topic_id,help_keyword_id) values (319,115);
insert into help_relation (help_topic_id,help_keyword_id) values (388,115);
insert into help_relation (help_topic_id,help_keyword_id) values (513,115);
insert into help_relation (help_topic_id,help_keyword_id) values (513,116);
insert into help_relation (help_topic_id,help_keyword_id) values (247,117);
insert into help_relation (help_topic_id,help_keyword_id) values (182,117);
insert into help_relation (help_topic_id,help_keyword_id) values (325,117);
insert into help_relation (help_topic_id,help_keyword_id) values (517,117);
insert into help_relation (help_topic_id,help_keyword_id) values (325,118);
insert into help_relation (help_topic_id,help_keyword_id) values (513,118);
insert into help_relation (help_topic_id,help_keyword_id) values (510,119);
insert into help_relation (help_topic_id,help_keyword_id) values (202,119);
insert into help_relation (help_topic_id,help_keyword_id) values (285,120);
insert into help_relation (help_topic_id,help_keyword_id) values (327,120);
insert into help_relation (help_topic_id,help_keyword_id) values (148,120);
insert into help_relation (help_topic_id,help_keyword_id) values (86,120);
insert into help_relation (help_topic_id,help_keyword_id) values (510,121);
insert into help_relation (help_topic_id,help_keyword_id) values (202,121);
insert into help_relation (help_topic_id,help_keyword_id) values (173,121);
insert into help_relation (help_topic_id,help_keyword_id) values (484,122);
insert into help_relation (help_topic_id,help_keyword_id) values (72,123);
insert into help_relation (help_topic_id,help_keyword_id) values (477,124);
insert into help_relation (help_topic_id,help_keyword_id) values (312,124);
insert into help_relation (help_topic_id,help_keyword_id) values (73,124);
insert into help_relation (help_topic_id,help_keyword_id) values (529,124);
insert into help_relation (help_topic_id,help_keyword_id) values (121,125);
insert into help_relation (help_topic_id,help_keyword_id) values (186,126);
insert into help_relation (help_topic_id,help_keyword_id) values (331,126);
insert into help_relation (help_topic_id,help_keyword_id) values (271,126);
insert into help_relation (help_topic_id,help_keyword_id) values (344,126);
insert into help_relation (help_topic_id,help_keyword_id) values (334,126);
insert into help_relation (help_topic_id,help_keyword_id) values (510,126);
insert into help_relation (help_topic_id,help_keyword_id) values (202,126);
insert into help_relation (help_topic_id,help_keyword_id) values (263,126);
insert into help_relation (help_topic_id,help_keyword_id) values (116,126);
insert into help_relation (help_topic_id,help_keyword_id) values (319,126);
insert into help_relation (help_topic_id,help_keyword_id) values (513,126);
insert into help_relation (help_topic_id,help_keyword_id) values (443,126);
insert into help_relation (help_topic_id,help_keyword_id) values (249,126);
insert into help_relation (help_topic_id,help_keyword_id) values (49,126);
insert into help_relation (help_topic_id,help_keyword_id) values (342,126);
insert into help_relation (help_topic_id,help_keyword_id) values (519,126);
insert into help_relation (help_topic_id,help_keyword_id) values (102,126);
insert into help_relation (help_topic_id,help_keyword_id) values (449,126);
insert into help_relation (help_topic_id,help_keyword_id) values (254,126);
insert into help_relation (help_topic_id,help_keyword_id) values (485,126);
insert into help_relation (help_topic_id,help_keyword_id) values (111,127);
insert into help_relation (help_topic_id,help_keyword_id) values (395,128);
insert into help_relation (help_topic_id,help_keyword_id) values (75,128);
insert into help_relation (help_topic_id,help_keyword_id) values (126,128);
insert into help_relation (help_topic_id,help_keyword_id) values (204,128);
insert into help_relation (help_topic_id,help_keyword_id) values (443,129);
insert into help_relation (help_topic_id,help_keyword_id) values (433,129);
insert into help_relation (help_topic_id,help_keyword_id) values (453,129);
insert into help_relation (help_topic_id,help_keyword_id) values (122,129);
insert into help_relation (help_topic_id,help_keyword_id) values (38,129);
insert into help_relation (help_topic_id,help_keyword_id) values (184,129);
insert into help_relation (help_topic_id,help_keyword_id) values (339,129);
insert into help_relation (help_topic_id,help_keyword_id) values (119,129);
insert into help_relation (help_topic_id,help_keyword_id) values (249,130);
insert into help_relation (help_topic_id,help_keyword_id) values (115,130);
insert into help_relation (help_topic_id,help_keyword_id) values (513,130);
insert into help_relation (help_topic_id,help_keyword_id) values (108,131);
insert into help_relation (help_topic_id,help_keyword_id) values (477,131);
insert into help_relation (help_topic_id,help_keyword_id) values (312,131);
insert into help_relation (help_topic_id,help_keyword_id) values (249,131);
insert into help_relation (help_topic_id,help_keyword_id) values (115,131);
insert into help_relation (help_topic_id,help_keyword_id) values (363,132);
insert into help_relation (help_topic_id,help_keyword_id) values (0,133);
insert into help_relation (help_topic_id,help_keyword_id) values (228,134);
insert into help_relation (help_topic_id,help_keyword_id) values (293,135);
insert into help_relation (help_topic_id,help_keyword_id) values (363,136);
insert into help_relation (help_topic_id,help_keyword_id) values (249,137);
insert into help_relation (help_topic_id,help_keyword_id) values (421,138);
insert into help_relation (help_topic_id,help_keyword_id) values (111,139);
insert into help_relation (help_topic_id,help_keyword_id) values (508,140);
insert into help_relation (help_topic_id,help_keyword_id) values (142,141);
insert into help_relation (help_topic_id,help_keyword_id) values (406,142);
insert into help_relation (help_topic_id,help_keyword_id) values (137,143);
insert into help_relation (help_topic_id,help_keyword_id) values (111,143);
insert into help_relation (help_topic_id,help_keyword_id) values (513,144);
insert into help_relation (help_topic_id,help_keyword_id) values (50,145);
insert into help_relation (help_topic_id,help_keyword_id) values (37,145);
insert into help_relation (help_topic_id,help_keyword_id) values (386,146);
insert into help_relation (help_topic_id,help_keyword_id) values (293,147);
insert into help_relation (help_topic_id,help_keyword_id) values (428,147);
insert into help_relation (help_topic_id,help_keyword_id) values (50,148);
insert into help_relation (help_topic_id,help_keyword_id) values (37,148);
insert into help_relation (help_topic_id,help_keyword_id) values (111,149);
insert into help_relation (help_topic_id,help_keyword_id) values (249,150);
insert into help_relation (help_topic_id,help_keyword_id) values (422,151);
insert into help_relation (help_topic_id,help_keyword_id) values (228,152);
insert into help_relation (help_topic_id,help_keyword_id) values (443,152);
insert into help_relation (help_topic_id,help_keyword_id) values (508,152);
insert into help_relation (help_topic_id,help_keyword_id) values (33,152);
insert into help_relation (help_topic_id,help_keyword_id) values (70,152);
insert into help_relation (help_topic_id,help_keyword_id) values (449,152);
insert into help_relation (help_topic_id,help_keyword_id) values (342,153);
insert into help_relation (help_topic_id,help_keyword_id) values (240,153);
insert into help_relation (help_topic_id,help_keyword_id) values (26,153);
insert into help_relation (help_topic_id,help_keyword_id) values (495,153);
insert into help_relation (help_topic_id,help_keyword_id) values (63,153);
insert into help_relation (help_topic_id,help_keyword_id) values (0,154);
insert into help_relation (help_topic_id,help_keyword_id) values (21,155);
insert into help_relation (help_topic_id,help_keyword_id) values (204,156);
insert into help_relation (help_topic_id,help_keyword_id) values (249,157);
insert into help_relation (help_topic_id,help_keyword_id) values (373,158);
insert into help_relation (help_topic_id,help_keyword_id) values (443,159);
insert into help_relation (help_topic_id,help_keyword_id) values (422,159);
insert into help_relation (help_topic_id,help_keyword_id) values (182,159);
insert into help_relation (help_topic_id,help_keyword_id) values (358,159);
insert into help_relation (help_topic_id,help_keyword_id) values (449,159);
insert into help_relation (help_topic_id,help_keyword_id) values (486,159);
insert into help_relation (help_topic_id,help_keyword_id) values (443,160);
insert into help_relation (help_topic_id,help_keyword_id) values (429,160);
insert into help_relation (help_topic_id,help_keyword_id) values (249,161);
insert into help_relation (help_topic_id,help_keyword_id) values (59,162);
insert into help_relation (help_topic_id,help_keyword_id) values (358,163);
insert into help_relation (help_topic_id,help_keyword_id) values (173,164);
insert into help_relation (help_topic_id,help_keyword_id) values (485,165);
insert into help_relation (help_topic_id,help_keyword_id) values (301,166);
insert into help_relation (help_topic_id,help_keyword_id) values (443,166);
insert into help_relation (help_topic_id,help_keyword_id) values (433,166);
insert into help_relation (help_topic_id,help_keyword_id) values (283,166);
insert into help_relation (help_topic_id,help_keyword_id) values (59,166);
insert into help_relation (help_topic_id,help_keyword_id) values (171,166);
insert into help_relation (help_topic_id,help_keyword_id) values (483,166);
insert into help_relation (help_topic_id,help_keyword_id) values (212,166);
insert into help_relation (help_topic_id,help_keyword_id) values (374,166);
insert into help_relation (help_topic_id,help_keyword_id) values (220,166);
insert into help_relation (help_topic_id,help_keyword_id) values (384,166);
insert into help_relation (help_topic_id,help_keyword_id) values (59,167);
insert into help_relation (help_topic_id,help_keyword_id) values (173,168);
insert into help_relation (help_topic_id,help_keyword_id) values (443,169);
insert into help_relation (help_topic_id,help_keyword_id) values (485,169);
insert into help_relation (help_topic_id,help_keyword_id) values (139,170);
insert into help_relation (help_topic_id,help_keyword_id) values (249,171);
insert into help_relation (help_topic_id,help_keyword_id) values (249,172);
insert into help_relation (help_topic_id,help_keyword_id) values (513,172);
insert into help_relation (help_topic_id,help_keyword_id) values (108,173);
insert into help_relation (help_topic_id,help_keyword_id) values (520,173);
insert into help_relation (help_topic_id,help_keyword_id) values (39,173);
insert into help_relation (help_topic_id,help_keyword_id) values (513,173);
insert into help_relation (help_topic_id,help_keyword_id) values (98,174);
insert into help_relation (help_topic_id,help_keyword_id) values (352,175);
insert into help_relation (help_topic_id,help_keyword_id) values (108,176);
insert into help_relation (help_topic_id,help_keyword_id) values (520,176);
insert into help_relation (help_topic_id,help_keyword_id) values (224,176);
insert into help_relation (help_topic_id,help_keyword_id) values (513,176);
insert into help_relation (help_topic_id,help_keyword_id) values (507,177);
insert into help_relation (help_topic_id,help_keyword_id) values (281,177);
insert into help_relation (help_topic_id,help_keyword_id) values (92,177);
insert into help_relation (help_topic_id,help_keyword_id) values (52,178);
insert into help_relation (help_topic_id,help_keyword_id) values (115,178);
insert into help_relation (help_topic_id,help_keyword_id) values (513,178);
insert into help_relation (help_topic_id,help_keyword_id) values (240,179);
insert into help_relation (help_topic_id,help_keyword_id) values (334,180);
insert into help_relation (help_topic_id,help_keyword_id) values (485,180);
insert into help_relation (help_topic_id,help_keyword_id) values (105,181);
insert into help_relation (help_topic_id,help_keyword_id) values (33,182);
insert into help_relation (help_topic_id,help_keyword_id) values (449,182);
insert into help_relation (help_topic_id,help_keyword_id) values (49,182);
insert into help_relation (help_topic_id,help_keyword_id) values (513,182);
insert into help_relation (help_topic_id,help_keyword_id) values (450,182);
insert into help_relation (help_topic_id,help_keyword_id) values (363,183);
insert into help_relation (help_topic_id,help_keyword_id) values (0,184);
insert into help_relation (help_topic_id,help_keyword_id) values (51,184);
insert into help_relation (help_topic_id,help_keyword_id) values (33,184);
insert into help_relation (help_topic_id,help_keyword_id) values (510,185);
insert into help_relation (help_topic_id,help_keyword_id) values (202,185);
insert into help_relation (help_topic_id,help_keyword_id) values (173,185);
insert into help_relation (help_topic_id,help_keyword_id) values (139,186);
insert into help_relation (help_topic_id,help_keyword_id) values (137,187);
insert into help_relation (help_topic_id,help_keyword_id) values (111,187);
insert into help_relation (help_topic_id,help_keyword_id) values (421,188);
insert into help_relation (help_topic_id,help_keyword_id) values (266,188);
insert into help_relation (help_topic_id,help_keyword_id) values (373,188);
insert into help_relation (help_topic_id,help_keyword_id) values (126,188);
insert into help_relation (help_topic_id,help_keyword_id) values (278,188);
insert into help_relation (help_topic_id,help_keyword_id) values (352,188);
insert into help_relation (help_topic_id,help_keyword_id) values (329,188);
insert into help_relation (help_topic_id,help_keyword_id) values (90,189);
insert into help_relation (help_topic_id,help_keyword_id) values (59,189);
insert into help_relation (help_topic_id,help_keyword_id) values (126,189);
insert into help_relation (help_topic_id,help_keyword_id) values (481,190);
insert into help_relation (help_topic_id,help_keyword_id) values (443,191);
insert into help_relation (help_topic_id,help_keyword_id) values (428,192);
insert into help_relation (help_topic_id,help_keyword_id) values (519,193);
insert into help_relation (help_topic_id,help_keyword_id) values (251,193);
insert into help_relation (help_topic_id,help_keyword_id) values (249,193);
insert into help_relation (help_topic_id,help_keyword_id) values (513,193);
insert into help_relation (help_topic_id,help_keyword_id) values (415,194);
insert into help_relation (help_topic_id,help_keyword_id) values (61,194);
insert into help_relation (help_topic_id,help_keyword_id) values (86,194);
insert into help_relation (help_topic_id,help_keyword_id) values (341,195);
insert into help_relation (help_topic_id,help_keyword_id) values (443,195);
insert into help_relation (help_topic_id,help_keyword_id) values (510,196);
insert into help_relation (help_topic_id,help_keyword_id) values (202,196);
insert into help_relation (help_topic_id,help_keyword_id) values (173,196);
insert into help_relation (help_topic_id,help_keyword_id) values (342,197);
insert into help_relation (help_topic_id,help_keyword_id) values (495,197);
insert into help_relation (help_topic_id,help_keyword_id) values (443,198);
insert into help_relation (help_topic_id,help_keyword_id) values (93,198);
insert into help_relation (help_topic_id,help_keyword_id) values (508,199);
insert into help_relation (help_topic_id,help_keyword_id) values (342,200);
insert into help_relation (help_topic_id,help_keyword_id) values (495,200);
insert into help_relation (help_topic_id,help_keyword_id) values (510,201);
insert into help_relation (help_topic_id,help_keyword_id) values (202,201);
insert into help_relation (help_topic_id,help_keyword_id) values (173,201);
insert into help_relation (help_topic_id,help_keyword_id) values (422,202);
insert into help_relation (help_topic_id,help_keyword_id) values (358,202);
insert into help_relation (help_topic_id,help_keyword_id) values (486,202);
insert into help_relation (help_topic_id,help_keyword_id) values (368,202);
insert into help_relation (help_topic_id,help_keyword_id) values (415,203);
insert into help_relation (help_topic_id,help_keyword_id) values (485,203);
insert into help_relation (help_topic_id,help_keyword_id) values (449,204);
insert into help_relation (help_topic_id,help_keyword_id) values (126,205);
insert into help_relation (help_topic_id,help_keyword_id) values (459,205);
insert into help_relation (help_topic_id,help_keyword_id) values (249,206);
insert into help_relation (help_topic_id,help_keyword_id) values (344,207);
insert into help_relation (help_topic_id,help_keyword_id) values (249,207);
insert into help_relation (help_topic_id,help_keyword_id) values (116,207);
insert into help_relation (help_topic_id,help_keyword_id) values (469,208);
insert into help_relation (help_topic_id,help_keyword_id) values (515,209);
insert into help_relation (help_topic_id,help_keyword_id) values (331,210);
insert into help_relation (help_topic_id,help_keyword_id) values (240,210);
insert into help_relation (help_topic_id,help_keyword_id) values (102,210);
insert into help_relation (help_topic_id,help_keyword_id) values (444,210);
insert into help_relation (help_topic_id,help_keyword_id) values (339,210);
insert into help_relation (help_topic_id,help_keyword_id) values (504,211);
insert into help_relation (help_topic_id,help_keyword_id) values (50,212);
insert into help_relation (help_topic_id,help_keyword_id) values (37,212);
insert into help_relation (help_topic_id,help_keyword_id) values (449,213);
insert into help_relation (help_topic_id,help_keyword_id) values (0,214);
insert into help_relation (help_topic_id,help_keyword_id) values (26,214);
insert into help_relation (help_topic_id,help_keyword_id) values (449,214);
insert into help_relation (help_topic_id,help_keyword_id) values (485,215);
insert into help_relation (help_topic_id,help_keyword_id) values (111,216);
insert into help_relation (help_topic_id,help_keyword_id) values (342,217);
insert into help_relation (help_topic_id,help_keyword_id) values (137,218);
insert into help_relation (help_topic_id,help_keyword_id) values (443,219);
insert into help_relation (help_topic_id,help_keyword_id) values (364,219);
insert into help_relation (help_topic_id,help_keyword_id) values (0,220);
insert into help_relation (help_topic_id,help_keyword_id) values (510,221);
insert into help_relation (help_topic_id,help_keyword_id) values (202,221);
insert into help_relation (help_topic_id,help_keyword_id) values (173,221);
insert into help_relation (help_topic_id,help_keyword_id) values (140,222);
insert into help_relation (help_topic_id,help_keyword_id) values (471,223);
insert into help_relation (help_topic_id,help_keyword_id) values (428,224);
insert into help_relation (help_topic_id,help_keyword_id) values (121,225);
insert into help_relation (help_topic_id,help_keyword_id) values (142,226);
insert into help_relation (help_topic_id,help_keyword_id) values (311,227);
insert into help_relation (help_topic_id,help_keyword_id) values (249,227);
insert into help_relation (help_topic_id,help_keyword_id) values (115,227);
insert into help_relation (help_topic_id,help_keyword_id) values (111,227);
insert into help_relation (help_topic_id,help_keyword_id) values (513,227);
insert into help_relation (help_topic_id,help_keyword_id) values (513,228);
insert into help_relation (help_topic_id,help_keyword_id) values (394,229);
insert into help_relation (help_topic_id,help_keyword_id) values (249,230);
insert into help_relation (help_topic_id,help_keyword_id) values (485,230);
insert into help_relation (help_topic_id,help_keyword_id) values (477,231);
insert into help_relation (help_topic_id,help_keyword_id) values (312,231);
insert into help_relation (help_topic_id,help_keyword_id) values (513,231);
insert into help_relation (help_topic_id,help_keyword_id) values (164,232);
insert into help_relation (help_topic_id,help_keyword_id) values (449,233);
insert into help_relation (help_topic_id,help_keyword_id) values (271,234);
insert into help_relation (help_topic_id,help_keyword_id) values (26,234);
insert into help_relation (help_topic_id,help_keyword_id) values (334,234);
insert into help_relation (help_topic_id,help_keyword_id) values (33,234);
insert into help_relation (help_topic_id,help_keyword_id) values (319,234);
insert into help_relation (help_topic_id,help_keyword_id) values (49,234);
insert into help_relation (help_topic_id,help_keyword_id) values (485,234);
insert into help_relation (help_topic_id,help_keyword_id) values (111,235);
insert into help_relation (help_topic_id,help_keyword_id) values (108,236);
insert into help_relation (help_topic_id,help_keyword_id) values (443,237);
insert into help_relation (help_topic_id,help_keyword_id) values (344,237);
insert into help_relation (help_topic_id,help_keyword_id) values (418,237);
insert into help_relation (help_topic_id,help_keyword_id) values (362,237);
insert into help_relation (help_topic_id,help_keyword_id) values (116,237);
insert into help_relation (help_topic_id,help_keyword_id) values (59,238);
insert into help_relation (help_topic_id,help_keyword_id) values (401,239);
insert into help_relation (help_topic_id,help_keyword_id) values (157,240);
insert into help_relation (help_topic_id,help_keyword_id) values (512,241);
insert into help_relation (help_topic_id,help_keyword_id) values (443,242);
insert into help_relation (help_topic_id,help_keyword_id) values (0,242);
insert into help_relation (help_topic_id,help_keyword_id) values (249,242);
insert into help_relation (help_topic_id,help_keyword_id) values (415,242);
insert into help_relation (help_topic_id,help_keyword_id) values (52,242);
insert into help_relation (help_topic_id,help_keyword_id) values (61,242);
insert into help_relation (help_topic_id,help_keyword_id) values (39,242);
insert into help_relation (help_topic_id,help_keyword_id) values (419,242);
insert into help_relation (help_topic_id,help_keyword_id) values (115,242);
insert into help_relation (help_topic_id,help_keyword_id) values (513,242);
insert into help_relation (help_topic_id,help_keyword_id) values (229,243);
insert into help_relation (help_topic_id,help_keyword_id) values (477,244);
insert into help_relation (help_topic_id,help_keyword_id) values (312,244);
insert into help_relation (help_topic_id,help_keyword_id) values (363,245);
insert into help_relation (help_topic_id,help_keyword_id) values (513,246);
insert into help_relation (help_topic_id,help_keyword_id) values (247,247);
insert into help_relation (help_topic_id,help_keyword_id) values (142,247);
insert into help_relation (help_topic_id,help_keyword_id) values (155,248);
insert into help_relation (help_topic_id,help_keyword_id) values (0,249);
insert into help_relation (help_topic_id,help_keyword_id) values (443,250);
insert into help_relation (help_topic_id,help_keyword_id) values (4,250);
insert into help_relation (help_topic_id,help_keyword_id) values (145,251);
insert into help_relation (help_topic_id,help_keyword_id) values (231,251);
insert into help_relation (help_topic_id,help_keyword_id) values (108,252);
insert into help_relation (help_topic_id,help_keyword_id) values (381,252);
insert into help_relation (help_topic_id,help_keyword_id) values (449,252);
insert into help_relation (help_topic_id,help_keyword_id) values (488,253);
insert into help_relation (help_topic_id,help_keyword_id) values (422,254);
insert into help_relation (help_topic_id,help_keyword_id) values (363,255);
insert into help_relation (help_topic_id,help_keyword_id) values (363,256);
insert into help_relation (help_topic_id,help_keyword_id) values (421,257);
insert into help_relation (help_topic_id,help_keyword_id) values (266,257);
insert into help_relation (help_topic_id,help_keyword_id) values (373,257);
insert into help_relation (help_topic_id,help_keyword_id) values (278,257);
insert into help_relation (help_topic_id,help_keyword_id) values (352,257);
insert into help_relation (help_topic_id,help_keyword_id) values (329,257);
insert into help_relation (help_topic_id,help_keyword_id) values (111,258);
insert into help_relation (help_topic_id,help_keyword_id) values (363,259);
insert into help_relation (help_topic_id,help_keyword_id) values (251,260);
insert into help_relation (help_topic_id,help_keyword_id) values (363,261);
insert into help_relation (help_topic_id,help_keyword_id) values (209,262);
insert into help_relation (help_topic_id,help_keyword_id) values (186,263);
insert into help_relation (help_topic_id,help_keyword_id) values (443,263);
insert into help_relation (help_topic_id,help_keyword_id) values (344,263);
insert into help_relation (help_topic_id,help_keyword_id) values (231,263);
insert into help_relation (help_topic_id,help_keyword_id) values (334,263);
insert into help_relation (help_topic_id,help_keyword_id) values (249,263);
insert into help_relation (help_topic_id,help_keyword_id) values (145,263);
insert into help_relation (help_topic_id,help_keyword_id) values (116,263);
insert into help_relation (help_topic_id,help_keyword_id) values (449,263);
insert into help_relation (help_topic_id,help_keyword_id) values (485,263);
insert into help_relation (help_topic_id,help_keyword_id) values (363,264);
insert into help_relation (help_topic_id,help_keyword_id) values (510,265);
insert into help_relation (help_topic_id,help_keyword_id) values (202,265);
insert into help_relation (help_topic_id,help_keyword_id) values (173,265);
insert into help_relation (help_topic_id,help_keyword_id) values (443,266);
insert into help_relation (help_topic_id,help_keyword_id) values (247,266);
insert into help_relation (help_topic_id,help_keyword_id) values (65,266);
insert into help_relation (help_topic_id,help_keyword_id) values (249,266);
insert into help_relation (help_topic_id,help_keyword_id) values (325,266);
insert into help_relation (help_topic_id,help_keyword_id) values (426,266);
insert into help_relation (help_topic_id,help_keyword_id) values (517,266);
insert into help_relation (help_topic_id,help_keyword_id) values (402,266);
insert into help_relation (help_topic_id,help_keyword_id) values (156,266);
insert into help_relation (help_topic_id,help_keyword_id) values (225,266);
insert into help_relation (help_topic_id,help_keyword_id) values (215,266);
insert into help_relation (help_topic_id,help_keyword_id) values (39,266);
insert into help_relation (help_topic_id,help_keyword_id) values (119,266);
insert into help_relation (help_topic_id,help_keyword_id) values (513,266);
insert into help_relation (help_topic_id,help_keyword_id) values (108,267);
insert into help_relation (help_topic_id,help_keyword_id) values (520,267);
insert into help_relation (help_topic_id,help_keyword_id) values (443,267);
insert into help_relation (help_topic_id,help_keyword_id) values (453,267);
insert into help_relation (help_topic_id,help_keyword_id) values (249,267);
insert into help_relation (help_topic_id,help_keyword_id) values (224,267);
insert into help_relation (help_topic_id,help_keyword_id) values (513,267);
insert into help_relation (help_topic_id,help_keyword_id) values (249,268);
insert into help_relation (help_topic_id,help_keyword_id) values (519,269);
insert into help_relation (help_topic_id,help_keyword_id) values (281,269);
insert into help_relation (help_topic_id,help_keyword_id) values (249,269);
insert into help_relation (help_topic_id,help_keyword_id) values (402,269);
insert into help_relation (help_topic_id,help_keyword_id) values (363,270);
insert into help_relation (help_topic_id,help_keyword_id) values (449,271);
insert into help_relation (help_topic_id,help_keyword_id) values (416,272);
insert into help_relation (help_topic_id,help_keyword_id) values (249,273);
insert into help_relation (help_topic_id,help_keyword_id) values (175,274);
insert into help_relation (help_topic_id,help_keyword_id) values (513,275);
insert into help_relation (help_topic_id,help_keyword_id) values (311,276);
insert into help_relation (help_topic_id,help_keyword_id) values (363,277);
insert into help_relation (help_topic_id,help_keyword_id) values (449,278);
insert into help_relation (help_topic_id,help_keyword_id) values (449,279);
insert into help_relation (help_topic_id,help_keyword_id) values (142,279);
insert into help_relation (help_topic_id,help_keyword_id) values (450,279);
insert into help_relation (help_topic_id,help_keyword_id) values (423,280);
insert into help_relation (help_topic_id,help_keyword_id) values (203,280);
insert into help_relation (help_topic_id,help_keyword_id) values (126,280);
insert into help_relation (help_topic_id,help_keyword_id) values (373,281);
insert into help_relation (help_topic_id,help_keyword_id) values (311,282);
insert into help_relation (help_topic_id,help_keyword_id) values (301,283);
insert into help_relation (help_topic_id,help_keyword_id) values (524,283);
insert into help_relation (help_topic_id,help_keyword_id) values (486,284);
insert into help_relation (help_topic_id,help_keyword_id) values (390,285);
insert into help_relation (help_topic_id,help_keyword_id) values (342,286);
insert into help_relation (help_topic_id,help_keyword_id) values (108,287);
insert into help_relation (help_topic_id,help_keyword_id) values (381,287);
insert into help_relation (help_topic_id,help_keyword_id) values (182,288);
insert into help_relation (help_topic_id,help_keyword_id) values (86,288);
insert into help_relation (help_topic_id,help_keyword_id) values (507,289);
insert into help_relation (help_topic_id,help_keyword_id) values (108,289);
insert into help_relation (help_topic_id,help_keyword_id) values (344,289);
insert into help_relation (help_topic_id,help_keyword_id) values (59,289);
insert into help_relation (help_topic_id,help_keyword_id) values (171,289);
insert into help_relation (help_topic_id,help_keyword_id) values (156,289);
insert into help_relation (help_topic_id,help_keyword_id) values (418,289);
insert into help_relation (help_topic_id,help_keyword_id) values (374,289);
insert into help_relation (help_topic_id,help_keyword_id) values (115,289);
insert into help_relation (help_topic_id,help_keyword_id) values (307,289);
insert into help_relation (help_topic_id,help_keyword_id) values (12,289);
insert into help_relation (help_topic_id,help_keyword_id) values (443,289);
insert into help_relation (help_topic_id,help_keyword_id) values (16,289);
insert into help_relation (help_topic_id,help_keyword_id) values (249,289);
insert into help_relation (help_topic_id,help_keyword_id) values (251,289);
insert into help_relation (help_topic_id,help_keyword_id) values (212,289);
insert into help_relation (help_topic_id,help_keyword_id) values (312,289);
insert into help_relation (help_topic_id,help_keyword_id) values (39,289);
insert into help_relation (help_topic_id,help_keyword_id) values (195,289);
insert into help_relation (help_topic_id,help_keyword_id) values (142,290);
insert into help_relation (help_topic_id,help_keyword_id) values (108,291);
insert into help_relation (help_topic_id,help_keyword_id) values (111,292);
insert into help_relation (help_topic_id,help_keyword_id) values (128,293);
insert into help_relation (help_topic_id,help_keyword_id) values (443,294);
insert into help_relation (help_topic_id,help_keyword_id) values (505,294);
insert into help_relation (help_topic_id,help_keyword_id) values (312,295);
insert into help_relation (help_topic_id,help_keyword_id) values (27,296);
insert into help_relation (help_topic_id,help_keyword_id) values (443,296);
insert into help_relation (help_topic_id,help_keyword_id) values (151,296);
insert into help_relation (help_topic_id,help_keyword_id) values (495,297);
insert into help_relation (help_topic_id,help_keyword_id) values (513,298);
insert into help_relation (help_topic_id,help_keyword_id) values (249,299);
insert into help_relation (help_topic_id,help_keyword_id) values (173,300);
insert into help_relation (help_topic_id,help_keyword_id) values (513,301);
insert into help_relation (help_topic_id,help_keyword_id) values (460,302);
insert into help_relation (help_topic_id,help_keyword_id) values (83,303);
insert into help_relation (help_topic_id,help_keyword_id) values (320,304);
insert into help_relation (help_topic_id,help_keyword_id) values (247,305);
insert into help_relation (help_topic_id,help_keyword_id) values (513,305);
insert into help_relation (help_topic_id,help_keyword_id) values (249,306);
insert into help_relation (help_topic_id,help_keyword_id) values (225,307);
insert into help_relation (help_topic_id,help_keyword_id) values (271,308);
insert into help_relation (help_topic_id,help_keyword_id) values (319,308);
insert into help_relation (help_topic_id,help_keyword_id) values (438,309);
insert into help_relation (help_topic_id,help_keyword_id) values (173,310);
insert into help_relation (help_topic_id,help_keyword_id) values (188,311);
insert into help_relation (help_topic_id,help_keyword_id) values (145,312);
insert into help_relation (help_topic_id,help_keyword_id) values (151,313);
insert into help_relation (help_topic_id,help_keyword_id) values (426,314);
insert into help_relation (help_topic_id,help_keyword_id) values (513,314);
insert into help_relation (help_topic_id,help_keyword_id) values (107,315);
insert into help_relation (help_topic_id,help_keyword_id) values (301,315);
insert into help_relation (help_topic_id,help_keyword_id) values (186,315);
insert into help_relation (help_topic_id,help_keyword_id) values (303,315);
insert into help_relation (help_topic_id,help_keyword_id) values (433,315);
insert into help_relation (help_topic_id,help_keyword_id) values (4,315);
insert into help_relation (help_topic_id,help_keyword_id) values (336,315);
insert into help_relation (help_topic_id,help_keyword_id) values (156,315);
insert into help_relation (help_topic_id,help_keyword_id) values (7,315);
insert into help_relation (help_topic_id,help_keyword_id) values (404,315);
insert into help_relation (help_topic_id,help_keyword_id) values (339,315);
insert into help_relation (help_topic_id,help_keyword_id) values (119,315);
insert into help_relation (help_topic_id,help_keyword_id) values (12,315);
insert into help_relation (help_topic_id,help_keyword_id) values (443,315);
insert into help_relation (help_topic_id,help_keyword_id) values (277,315);
insert into help_relation (help_topic_id,help_keyword_id) values (444,315);
insert into help_relation (help_topic_id,help_keyword_id) values (48,315);
insert into help_relation (help_topic_id,help_keyword_id) values (122,315);
insert into help_relation (help_topic_id,help_keyword_id) values (18,315);
insert into help_relation (help_topic_id,help_keyword_id) values (341,315);
insert into help_relation (help_topic_id,help_keyword_id) values (166,315);
insert into help_relation (help_topic_id,help_keyword_id) values (195,315);
insert into help_relation (help_topic_id,help_keyword_id) values (228,315);
insert into help_relation (help_topic_id,help_keyword_id) values (24,315);
insert into help_relation (help_topic_id,help_keyword_id) values (453,315);
insert into help_relation (help_topic_id,help_keyword_id) values (93,315);
insert into help_relation (help_topic_id,help_keyword_id) values (524,315);
insert into help_relation (help_topic_id,help_keyword_id) values (260,315);
insert into help_relation (help_topic_id,help_keyword_id) values (27,315);
insert into help_relation (help_topic_id,help_keyword_id) values (418,315);
insert into help_relation (help_topic_id,help_keyword_id) values (527,315);
insert into help_relation (help_topic_id,help_keyword_id) values (419,315);
insert into help_relation (help_topic_id,help_keyword_id) values (96,315);
insert into help_relation (help_topic_id,help_keyword_id) values (38,315);
insert into help_relation (help_topic_id,help_keyword_id) values (212,315);
insert into help_relation (help_topic_id,help_keyword_id) values (184,315);
insert into help_relation (help_topic_id,help_keyword_id) values (429,315);
insert into help_relation (help_topic_id,help_keyword_id) values (70,315);
insert into help_relation (help_topic_id,help_keyword_id) values (364,315);
insert into help_relation (help_topic_id,help_keyword_id) values (505,315);
insert into help_relation (help_topic_id,help_keyword_id) values (285,316);
insert into help_relation (help_topic_id,help_keyword_id) values (416,316);
insert into help_relation (help_topic_id,help_keyword_id) values (137,316);
insert into help_relation (help_topic_id,help_keyword_id) values (449,316);
insert into help_relation (help_topic_id,help_keyword_id) values (111,316);
insert into help_relation (help_topic_id,help_keyword_id) values (249,317);
insert into help_relation (help_topic_id,help_keyword_id) values (182,318);
insert into help_relation (help_topic_id,help_keyword_id) values (249,319);
insert into help_relation (help_topic_id,help_keyword_id) values (70,320);
insert into help_relation (help_topic_id,help_keyword_id) values (445,320);
insert into help_relation (help_topic_id,help_keyword_id) values (37,321);
insert into help_relation (help_topic_id,help_keyword_id) values (50,321);
insert into help_relation (help_topic_id,help_keyword_id) values (183,321);
insert into help_relation (help_topic_id,help_keyword_id) values (21,321);
insert into help_relation (help_topic_id,help_keyword_id) values (495,321);
insert into help_relation (help_topic_id,help_keyword_id) values (188,321);
insert into help_relation (help_topic_id,help_keyword_id) values (127,321);
insert into help_relation (help_topic_id,help_keyword_id) values (529,321);
insert into help_relation (help_topic_id,help_keyword_id) values (204,322);
insert into help_relation (help_topic_id,help_keyword_id) values (83,323);
insert into help_relation (help_topic_id,help_keyword_id) values (177,323);
insert into help_relation (help_topic_id,help_keyword_id) values (421,324);
insert into help_relation (help_topic_id,help_keyword_id) values (63,325);
insert into help_relation (help_topic_id,help_keyword_id) values (204,326);
insert into help_relation (help_topic_id,help_keyword_id) values (271,327);
insert into help_relation (help_topic_id,help_keyword_id) values (449,327);
insert into help_relation (help_topic_id,help_keyword_id) values (319,327);
insert into help_relation (help_topic_id,help_keyword_id) values (170,327);
insert into help_relation (help_topic_id,help_keyword_id) values (142,327);
insert into help_relation (help_topic_id,help_keyword_id) values (443,328);
insert into help_relation (help_topic_id,help_keyword_id) values (93,328);
insert into help_relation (help_topic_id,help_keyword_id) values (79,329);
insert into help_relation (help_topic_id,help_keyword_id) values (334,330);
insert into help_relation (help_topic_id,help_keyword_id) values (111,330);
insert into help_relation (help_topic_id,help_keyword_id) values (307,330);
insert into help_relation (help_topic_id,help_keyword_id) values (251,331);
insert into help_relation (help_topic_id,help_keyword_id) values (363,332);
insert into help_relation (help_topic_id,help_keyword_id) values (102,333);
insert into help_relation (help_topic_id,help_keyword_id) values (508,334);
insert into help_relation (help_topic_id,help_keyword_id) values (66,335);
insert into help_relation (help_topic_id,help_keyword_id) values (278,335);
insert into help_relation (help_topic_id,help_keyword_id) values (204,336);
insert into help_relation (help_topic_id,help_keyword_id) values (363,337);
insert into help_relation (help_topic_id,help_keyword_id) values (334,338);
insert into help_relation (help_topic_id,help_keyword_id) values (485,338);
insert into help_relation (help_topic_id,help_keyword_id) values (466,339);
insert into help_relation (help_topic_id,help_keyword_id) values (68,339);
insert into help_relation (help_topic_id,help_keyword_id) values (513,340);
insert into help_relation (help_topic_id,help_keyword_id) values (18,341);
insert into help_relation (help_topic_id,help_keyword_id) values (443,341);
insert into help_relation (help_topic_id,help_keyword_id) values (111,342);
insert into help_relation (help_topic_id,help_keyword_id) values (201,343);
insert into help_relation (help_topic_id,help_keyword_id) values (251,343);
insert into help_relation (help_topic_id,help_keyword_id) values (202,344);
insert into help_relation (help_topic_id,help_keyword_id) values (342,345);
insert into help_relation (help_topic_id,help_keyword_id) values (495,345);
insert into help_relation (help_topic_id,help_keyword_id) values (363,346);
insert into help_relation (help_topic_id,help_keyword_id) values (204,347);
insert into help_relation (help_topic_id,help_keyword_id) values (111,348);
insert into help_relation (help_topic_id,help_keyword_id) values (443,349);
insert into help_relation (help_topic_id,help_keyword_id) values (460,349);
insert into help_relation (help_topic_id,help_keyword_id) values (443,350);
insert into help_relation (help_topic_id,help_keyword_id) values (164,350);
insert into help_relation (help_topic_id,help_keyword_id) values (484,350);
insert into help_relation (help_topic_id,help_keyword_id) values (208,351);
insert into help_relation (help_topic_id,help_keyword_id) values (228,352);
insert into help_relation (help_topic_id,help_keyword_id) values (311,352);
insert into help_relation (help_topic_id,help_keyword_id) values (70,352);
insert into help_relation (help_topic_id,help_keyword_id) values (449,352);
insert into help_relation (help_topic_id,help_keyword_id) values (513,353);
insert into help_relation (help_topic_id,help_keyword_id) values (173,354);
insert into help_relation (help_topic_id,help_keyword_id) values (449,355);
insert into help_relation (help_topic_id,help_keyword_id) values (111,356);
insert into help_relation (help_topic_id,help_keyword_id) values (51,357);
insert into help_relation (help_topic_id,help_keyword_id) values (111,357);
insert into help_relation (help_topic_id,help_keyword_id) values (449,358);
insert into help_relation (help_topic_id,help_keyword_id) values (472,359);
insert into help_relation (help_topic_id,help_keyword_id) values (311,360);
insert into help_relation (help_topic_id,help_keyword_id) values (98,360);
insert into help_relation (help_topic_id,help_keyword_id) values (86,360);
insert into help_relation (help_topic_id,help_keyword_id) values (363,361);
insert into help_relation (help_topic_id,help_keyword_id) values (334,362);
insert into help_relation (help_topic_id,help_keyword_id) values (485,362);
insert into help_relation (help_topic_id,help_keyword_id) values (428,363);
insert into help_relation (help_topic_id,help_keyword_id) values (293,364);
insert into help_relation (help_topic_id,help_keyword_id) values (428,364);
insert into help_relation (help_topic_id,help_keyword_id) values (201,365);
insert into help_relation (help_topic_id,help_keyword_id) values (251,365);
insert into help_relation (help_topic_id,help_keyword_id) values (6,365);
insert into help_relation (help_topic_id,help_keyword_id) values (111,366);
insert into help_relation (help_topic_id,help_keyword_id) values (363,367);
insert into help_relation (help_topic_id,help_keyword_id) values (71,368);
insert into help_relation (help_topic_id,help_keyword_id) values (342,369);
insert into help_relation (help_topic_id,help_keyword_id) values (240,369);
insert into help_relation (help_topic_id,help_keyword_id) values (204,370);
insert into help_relation (help_topic_id,help_keyword_id) values (221,371);
insert into help_relation (help_topic_id,help_keyword_id) values (204,372);
insert into help_relation (help_topic_id,help_keyword_id) values (513,373);
insert into help_relation (help_topic_id,help_keyword_id) values (82,374);
insert into help_relation (help_topic_id,help_keyword_id) values (278,375);
insert into help_relation (help_topic_id,help_keyword_id) values (477,376);
insert into help_relation (help_topic_id,help_keyword_id) values (65,376);
insert into help_relation (help_topic_id,help_keyword_id) values (379,376);
insert into help_relation (help_topic_id,help_keyword_id) values (513,376);
insert into help_relation (help_topic_id,help_keyword_id) values (249,377);
insert into help_relation (help_topic_id,help_keyword_id) values (115,377);
insert into help_relation (help_topic_id,help_keyword_id) values (513,377);
insert into help_relation (help_topic_id,help_keyword_id) values (0,378);
insert into help_relation (help_topic_id,help_keyword_id) values (520,379);
insert into help_relation (help_topic_id,help_keyword_id) values (477,379);
insert into help_relation (help_topic_id,help_keyword_id) values (236,379);
insert into help_relation (help_topic_id,help_keyword_id) values (92,379);
insert into help_relation (help_topic_id,help_keyword_id) values (111,379);
insert into help_relation (help_topic_id,help_keyword_id) values (201,379);
insert into help_relation (help_topic_id,help_keyword_id) values (381,379);
insert into help_relation (help_topic_id,help_keyword_id) values (39,379);
insert into help_relation (help_topic_id,help_keyword_id) values (116,379);
insert into help_relation (help_topic_id,help_keyword_id) values (471,379);
insert into help_relation (help_topic_id,help_keyword_id) values (384,379);
insert into help_relation (help_topic_id,help_keyword_id) values (513,379);
insert into help_relation (help_topic_id,help_keyword_id) values (249,380);
insert into help_relation (help_topic_id,help_keyword_id) values (251,381);
insert into help_relation (help_topic_id,help_keyword_id) values (0,382);
insert into help_relation (help_topic_id,help_keyword_id) values (449,382);
insert into help_relation (help_topic_id,help_keyword_id) values (0,383);
insert into help_relation (help_topic_id,help_keyword_id) values (443,384);
insert into help_relation (help_topic_id,help_keyword_id) values (444,384);
insert into help_relation (help_topic_id,help_keyword_id) values (485,385);
insert into help_relation (help_topic_id,help_keyword_id) values (488,386);
insert into help_relation (help_topic_id,help_keyword_id) values (249,387);
insert into help_relation (help_topic_id,help_keyword_id) values (251,388);
insert into help_relation (help_topic_id,help_keyword_id) values (254,388);
insert into help_relation (help_topic_id,help_keyword_id) values (471,388);
insert into help_relation (help_topic_id,help_keyword_id) values (111,388);
insert into help_relation (help_topic_id,help_keyword_id) values (307,388);
insert into help_relation (help_topic_id,help_keyword_id) values (428,388);
insert into help_relation (help_topic_id,help_keyword_id) values (449,389);
insert into help_relation (help_topic_id,help_keyword_id) values (515,390);
insert into help_relation (help_topic_id,help_keyword_id) values (126,390);
insert into help_relation (help_topic_id,help_keyword_id) values (63,391);
insert into help_relation (help_topic_id,help_keyword_id) values (303,392);
insert into help_relation (help_topic_id,help_keyword_id) values (443,392);
insert into help_relation (help_topic_id,help_keyword_id) values (263,393);
insert into help_relation (help_topic_id,help_keyword_id) values (402,394);
insert into help_relation (help_topic_id,help_keyword_id) values (240,395);
insert into help_relation (help_topic_id,help_keyword_id) values (449,396);
insert into help_relation (help_topic_id,help_keyword_id) values (225,397);
insert into help_relation (help_topic_id,help_keyword_id) values (116,397);
insert into help_relation (help_topic_id,help_keyword_id) values (495,398);
insert into help_relation (help_topic_id,help_keyword_id) values (342,399);
insert into help_relation (help_topic_id,help_keyword_id) values (183,399);
insert into help_relation (help_topic_id,help_keyword_id) values (495,399);
insert into help_relation (help_topic_id,help_keyword_id) values (249,400);
insert into help_relation (help_topic_id,help_keyword_id) values (260,401);
insert into help_relation (help_topic_id,help_keyword_id) values (225,402);
insert into help_relation (help_topic_id,help_keyword_id) values (312,403);
insert into help_relation (help_topic_id,help_keyword_id) values (204,403);
insert into help_relation (help_topic_id,help_keyword_id) values (111,404);
insert into help_relation (help_topic_id,help_keyword_id) values (204,405);
insert into help_relation (help_topic_id,help_keyword_id) values (116,406);
insert into help_relation (help_topic_id,help_keyword_id) values (519,407);
insert into help_relation (help_topic_id,help_keyword_id) values (249,407);
insert into help_relation (help_topic_id,help_keyword_id) values (111,407);
insert into help_relation (help_topic_id,help_keyword_id) values (498,408);
insert into help_relation (help_topic_id,help_keyword_id) values (404,409);
insert into help_relation (help_topic_id,help_keyword_id) values (240,410);
insert into help_relation (help_topic_id,help_keyword_id) values (503,411);
insert into help_relation (help_topic_id,help_keyword_id) values (312,412);
insert into help_relation (help_topic_id,help_keyword_id) values (329,413);
insert into help_relation (help_topic_id,help_keyword_id) values (7,414);
insert into help_relation (help_topic_id,help_keyword_id) values (443,414);
insert into help_relation (help_topic_id,help_keyword_id) values (249,415);
insert into help_relation (help_topic_id,help_keyword_id) values (519,416);
insert into help_relation (help_topic_id,help_keyword_id) values (281,416);
insert into help_relation (help_topic_id,help_keyword_id) values (402,416);
insert into help_relation (help_topic_id,help_keyword_id) values (240,417);
insert into help_relation (help_topic_id,help_keyword_id) values (294,418);
insert into help_relation (help_topic_id,help_keyword_id) values (310,419);
insert into help_relation (help_topic_id,help_keyword_id) values (113,419);
insert into help_relation (help_topic_id,help_keyword_id) values (243,419);
insert into help_relation (help_topic_id,help_keyword_id) values (200,419);
insert into help_relation (help_topic_id,help_keyword_id) values (310,420);
insert into help_relation (help_topic_id,help_keyword_id) values (113,420);
insert into help_relation (help_topic_id,help_keyword_id) values (344,420);
insert into help_relation (help_topic_id,help_keyword_id) values (312,420);
insert into help_relation (help_topic_id,help_keyword_id) values (420,420);
insert into help_relation (help_topic_id,help_keyword_id) values (104,421);
insert into help_relation (help_topic_id,help_keyword_id) values (108,422);
insert into help_relation (help_topic_id,help_keyword_id) values (520,422);
insert into help_relation (help_topic_id,help_keyword_id) values (182,423);
insert into help_relation (help_topic_id,help_keyword_id) values (510,424);
insert into help_relation (help_topic_id,help_keyword_id) values (249,425);
insert into help_relation (help_topic_id,help_keyword_id) values (342,426);
insert into help_relation (help_topic_id,help_keyword_id) values (495,426);
insert into help_relation (help_topic_id,help_keyword_id) values (428,426);
insert into help_relation (help_topic_id,help_keyword_id) values (24,427);
insert into help_relation (help_topic_id,help_keyword_id) values (511,428);
insert into help_relation (help_topic_id,help_keyword_id) values (256,429);
insert into help_relation (help_topic_id,help_keyword_id) values (344,429);
insert into help_relation (help_topic_id,help_keyword_id) values (413,429);
insert into help_relation (help_topic_id,help_keyword_id) values (6,429);
insert into help_relation (help_topic_id,help_keyword_id) values (402,429);
insert into help_relation (help_topic_id,help_keyword_id) values (21,429);
insert into help_relation (help_topic_id,help_keyword_id) values (281,429);
insert into help_relation (help_topic_id,help_keyword_id) values (312,429);
insert into help_relation (help_topic_id,help_keyword_id) values (362,429);
insert into help_relation (help_topic_id,help_keyword_id) values (334,430);
insert into help_relation (help_topic_id,help_keyword_id) values (513,431);
insert into help_relation (help_topic_id,help_keyword_id) values (151,432);
insert into help_relation (help_topic_id,help_keyword_id) values (63,433);
insert into help_relation (help_topic_id,help_keyword_id) values (251,434);
insert into help_relation (help_topic_id,help_keyword_id) values (379,434);
insert into help_relation (help_topic_id,help_keyword_id) values (471,434);
insert into help_relation (help_topic_id,help_keyword_id) values (430,434);
insert into help_relation (help_topic_id,help_keyword_id) values (307,434);
insert into help_relation (help_topic_id,help_keyword_id) values (428,434);
insert into help_relation (help_topic_id,help_keyword_id) values (422,435);
insert into help_relation (help_topic_id,help_keyword_id) values (443,436);
insert into help_relation (help_topic_id,help_keyword_id) values (419,436);
insert into help_relation (help_topic_id,help_keyword_id) values (513,436);
insert into help_relation (help_topic_id,help_keyword_id) values (228,437);
insert into help_relation (help_topic_id,help_keyword_id) values (33,437);
insert into help_relation (help_topic_id,help_keyword_id) values (70,437);
insert into help_relation (help_topic_id,help_keyword_id) values (449,437);
insert into help_relation (help_topic_id,help_keyword_id) values (49,437);
insert into help_relation (help_topic_id,help_keyword_id) values (63,437);
insert into help_relation (help_topic_id,help_keyword_id) values (519,438);
insert into help_relation (help_topic_id,help_keyword_id) values (39,438);
insert into help_relation (help_topic_id,help_keyword_id) values (319,438);
insert into help_relation (help_topic_id,help_keyword_id) values (249,438);
insert into help_relation (help_topic_id,help_keyword_id) values (513,438);
insert into help_relation (help_topic_id,help_keyword_id) values (249,439);
insert into help_relation (help_topic_id,help_keyword_id) values (127,440);
insert into help_relation (help_topic_id,help_keyword_id) values (449,441);
insert into help_relation (help_topic_id,help_keyword_id) values (271,442);
insert into help_relation (help_topic_id,help_keyword_id) values (319,442);
insert into help_relation (help_topic_id,help_keyword_id) values (523,442);
insert into help_relation (help_topic_id,help_keyword_id) values (510,443);
insert into help_relation (help_topic_id,help_keyword_id) values (202,443);
insert into help_relation (help_topic_id,help_keyword_id) values (173,443);
insert into help_relation (help_topic_id,help_keyword_id) values (517,444);
insert into help_relation (help_topic_id,help_keyword_id) values (513,444);
insert into help_relation (help_topic_id,help_keyword_id) values (249,445);
insert into help_relation (help_topic_id,help_keyword_id) values (513,445);
insert into help_relation (help_topic_id,help_keyword_id) values (249,446);
insert into help_relation (help_topic_id,help_keyword_id) values (388,446);
insert into help_relation (help_topic_id,help_keyword_id) values (519,447);
insert into help_relation (help_topic_id,help_keyword_id) values (249,447);
insert into help_relation (help_topic_id,help_keyword_id) values (342,448);
insert into help_relation (help_topic_id,help_keyword_id) values (240,448);
insert into help_relation (help_topic_id,help_keyword_id) values (26,448);
insert into help_relation (help_topic_id,help_keyword_id) values (495,448);
insert into help_relation (help_topic_id,help_keyword_id) values (108,449);
insert into help_relation (help_topic_id,help_keyword_id) values (520,449);
insert into help_relation (help_topic_id,help_keyword_id) values (331,450);
insert into help_relation (help_topic_id,help_keyword_id) values (240,450);
insert into help_relation (help_topic_id,help_keyword_id) values (444,450);
insert into help_relation (help_topic_id,help_keyword_id) values (339,450);
insert into help_relation (help_topic_id,help_keyword_id) values (443,451);
insert into help_relation (help_topic_id,help_keyword_id) values (251,451);
insert into help_relation (help_topic_id,help_keyword_id) values (344,451);
insert into help_relation (help_topic_id,help_keyword_id) values (418,451);
insert into help_relation (help_topic_id,help_keyword_id) values (362,451);
insert into help_relation (help_topic_id,help_keyword_id) values (116,451);
insert into help_relation (help_topic_id,help_keyword_id) values (310,452);
insert into help_relation (help_topic_id,help_keyword_id) values (519,452);
insert into help_relation (help_topic_id,help_keyword_id) values (200,452);
insert into help_relation (help_topic_id,help_keyword_id) values (258,453);
insert into help_relation (help_topic_id,help_keyword_id) values (247,454);
insert into help_relation (help_topic_id,help_keyword_id) values (485,455);
insert into help_relation (help_topic_id,help_keyword_id) values (341,456);
insert into help_relation (help_topic_id,help_keyword_id) values (285,456);
insert into help_relation (help_topic_id,help_keyword_id) values (477,456);
insert into help_relation (help_topic_id,help_keyword_id) values (312,456);
insert into help_relation (help_topic_id,help_keyword_id) values (122,456);
insert into help_relation (help_topic_id,help_keyword_id) values (293,456);
insert into help_relation (help_topic_id,help_keyword_id) values (428,456);
insert into help_relation (help_topic_id,help_keyword_id) values (145,457);
insert into help_relation (help_topic_id,help_keyword_id) values (449,458);
insert into help_relation (help_topic_id,help_keyword_id) values (450,458);
insert into help_relation (help_topic_id,help_keyword_id) values (262,459);
insert into help_relation (help_topic_id,help_keyword_id) values (485,460);
insert into help_relation (help_topic_id,help_keyword_id) values (477,461);
insert into help_relation (help_topic_id,help_keyword_id) values (312,461);
insert into help_relation (help_topic_id,help_keyword_id) values (513,461);
insert into help_relation (help_topic_id,help_keyword_id) values (249,462);
insert into help_relation (help_topic_id,help_keyword_id) values (116,462);
insert into help_relation (help_topic_id,help_keyword_id) values (111,463);
insert into help_relation (help_topic_id,help_keyword_id) values (529,464);
insert into help_relation (help_topic_id,help_keyword_id) values (247,465);
insert into help_relation (help_topic_id,help_keyword_id) values (182,465);
insert into help_relation (help_topic_id,help_keyword_id) values (26,465);
insert into help_relation (help_topic_id,help_keyword_id) values (334,465);
insert into help_relation (help_topic_id,help_keyword_id) values (325,465);
insert into help_relation (help_topic_id,help_keyword_id) values (485,465);
insert into help_relation (help_topic_id,help_keyword_id) values (517,465);
insert into help_relation (help_topic_id,help_keyword_id) values (270,466);
insert into help_relation (help_topic_id,help_keyword_id) values (58,466);
insert into help_relation (help_topic_id,help_keyword_id) values (462,466);
insert into help_relation (help_topic_id,help_keyword_id) values (409,466);
insert into help_relation (help_topic_id,help_keyword_id) values (232,466);
insert into help_relation (help_topic_id,help_keyword_id) values (416,466);
insert into help_relation (help_topic_id,help_keyword_id) values (449,466);
insert into help_relation (help_topic_id,help_keyword_id) values (450,466);
insert into help_relation (help_topic_id,help_keyword_id) values (264,467);
insert into help_relation (help_topic_id,help_keyword_id) values (363,468);
insert into help_relation (help_topic_id,help_keyword_id) values (111,469);
insert into help_relation (help_topic_id,help_keyword_id) values (336,470);
insert into help_relation (help_topic_id,help_keyword_id) values (443,470);
insert into help_relation (help_topic_id,help_keyword_id) values (166,470);
insert into help_relation (help_topic_id,help_keyword_id) values (26,470);
insert into help_relation (help_topic_id,help_keyword_id) values (528,471);
insert into help_relation (help_topic_id,help_keyword_id) values (182,472);
insert into help_relation (help_topic_id,help_keyword_id) values (20,473);
insert into help_relation (help_topic_id,help_keyword_id) values (443,474);
insert into help_relation (help_topic_id,help_keyword_id) values (16,474);
insert into help_relation (help_topic_id,help_keyword_id) values (147,474);
insert into help_relation (help_topic_id,help_keyword_id) values (443,475);
insert into help_relation (help_topic_id,help_keyword_id) values (527,475);
insert into help_relation (help_topic_id,help_keyword_id) values (111,476);
insert into help_relation (help_topic_id,help_keyword_id) values (449,477);
insert into help_relation (help_topic_id,help_keyword_id) values (319,477);
insert into help_relation (help_topic_id,help_keyword_id) values (115,478);
insert into help_relation (help_topic_id,help_keyword_id) values (249,479);
insert into help_relation (help_topic_id,help_keyword_id) values (63,479);
insert into help_relation (help_topic_id,help_keyword_id) values (513,479);
insert into help_relation (help_topic_id,help_keyword_id) values (513,480);
insert into help_relation (help_topic_id,help_keyword_id) values (108,481);
insert into help_relation (help_topic_id,help_keyword_id) values (520,481);
insert into help_relation (help_topic_id,help_keyword_id) values (510,482);
insert into help_relation (help_topic_id,help_keyword_id) values (202,482);
insert into help_relation (help_topic_id,help_keyword_id) values (173,482);
insert into help_relation (help_topic_id,help_keyword_id) values (27,483);
insert into help_relation (help_topic_id,help_keyword_id) values (38,483);
insert into help_relation (help_topic_id,help_keyword_id) values (151,483);
insert into help_relation (help_topic_id,help_keyword_id) values (363,483);
insert into help_relation (help_topic_id,help_keyword_id) values (148,483);
insert into help_relation (help_topic_id,help_keyword_id) values (373,484);
insert into help_relation (help_topic_id,help_keyword_id) values (249,484);
insert into help_relation (help_topic_id,help_keyword_id) values (367,485);
insert into help_relation (help_topic_id,help_keyword_id) values (249,486);

