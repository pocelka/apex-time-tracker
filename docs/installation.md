# Installation & Un-Installation

This page describes how to install and un-install application. This guide assumes that you are familiar with SQLcl. Due to installation process SQL*Plus is not supported. Installation is split to the following blocks:

- User creation (Optional): It is recommended to install time tracker to new schema, however components can be also installed to any existing user.
- PL/SQL backend and APEX front end installation.

## Create User

To create new user ask you DBA to run the following script:

```bash
cd database
sqlcl [connection string] as sysdba @create_user.sql
```

## Application Installation

To install backend and frontend components, navigate to repository root directory and execute the following:

```bash
sqlcl [connection string]

lb update -changelog-file ./changelogs/changelog_master.xml -override-app-id [app id] -override-app-schema [schema] -override-app-workspace [workspace] -log
lb tag -tag "[tag]" -log

exit
```

No errors should be produced by Liquibase.

## Un-Installation

To completely un-install the application execute the following script as application owner:

```bash
cd database
sqlcl [connection string] @uninstall.sql
exit
```

If no errors are produced in ```uninstall.log```, application is considered as successfully uninstalled and DBA can drop the user.
