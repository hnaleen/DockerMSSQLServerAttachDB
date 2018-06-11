# Using MS SQL server windows base image
FROM microsoft/mssql-server-windows-developer
 
# Create directoty for database files
RUN powershell -Command "mkdir C:\\SQLServer"

#copy the database files from host to container
COPY DB C:\\SQLServer

#Create directory for entry points and other misc files
RUN powershell -Command "mkdir C:\\NOVA"

#copy the misc files from host to container
COPY misc C:\\NOVA

# set environment variables
ENV SA_PASSWORD=Nova@7610
 
ENV ACCEPT_EULA=Y

# TODO read these file names from a shell script/env_file !!!!!
ENV ATTACH_DBS="[{'dbName':'TeamCI_Stella_R82','dbFiles':['C:\\\\SQLServer\\\\Spider3_1.mdf','C:\\\\SQLServer\\\\ACTIVITY_3.ndf','C:\\\\SQLServer\\\\ACTIVITY_IDX_4.ndf','C:\\\\SQLServer\\\\APPLOG_9.ndf','C:\\\\SQLServer\\\\ARCHIVE04_10.ndf','C:\\\\SQLServer\\\\ARCHIVE05_11.ndf','C:\\\\SQLServer\\\\ARCHIVE06_12.ndf','C:\\\\SQLServer\\\\ARCHIVE07_13.ndf','C:\\\\SQLServer\\\\ARCHIVE08_14.ndf','C:\\\\SQLServer\\\\BINARY_16.ndf','C:\\\\SQLServer\\\\cc_17.ndf','C:\\\\SQLServer\\\\cc_binary_18.ndf','C:\\\\SQLServer\\\\cc_binary_history_19.ndf','C:\\\\SQLServer\\\\cc_fts_51.ndf','C:\\\\SQLServer\\\\cc_history_20.ndf','C:\\\\SQLServer\\\\DATUM_5.ndf','C:\\\\SQLServer\\\\DATUM_IDX_6.ndf','C:\\\\SQLServer\\\\elearning_53.ndf','C:\\\\SQLServer\\\\elearning_binary_54.ndf','C:\\\\SQLServer\\\\elearning_binary_history_55.ndf','C:\\\\SQLServer\\\\elearning_history_56.ndf','C:\\\\SQLServer\\\\eped_59.ndf','C:\\\\SQLServer\\\\eped_binary_60.ndf','C:\\\\SQLServer\\\\eped_binary_history_61.ndf','C:\\\\SQLServer\\\\eped_history_62.ndf','C:\\\\SQLServer\\\\fluidbalance_29.ndf','C:\\\\SQLServer\\\\fluidbalance_binary_30.ndf','C:\\\\SQLServer\\\\fluidbalance_binary_history_31.ndf','C:\\\\SQLServer\\\\fluidbalance_history_32.ndf','C:\\\\SQLServer\\\\link_63.ndf','C:\\\\SQLServer\\\\link_history_64.ndf','C:\\\\SQLServer\\\\LOG_7.ndf','C:\\\\SQLServer\\\\LOG_IDX_8.ndf','C:\\\\SQLServer\\\\MAIN_15.ndf','C:\\\\SQLServer\\\\medmigration_47.ndf','C:\\\\SQLServer\\\\medmigration_binary_48.ndf','C:\\\\SQLServer\\\\medmigration_binary_history_49.ndf','C:\\\\SQLServer\\\\medmigration_history_50.ndf','C:\\\\SQLServer\\\\medprodcatdist_43.ndf','C:\\\\SQLServer\\\\medprodcatdist_binary_44.ndf','C:\\\\SQLServer\\\\medprodcatdist_binary_history_45.ndf','C:\\\\SQLServer\\\\medprodcatdist_history_46.ndf','C:\\\\SQLServer\\\\med_33.ndf','C:\\\\SQLServer\\\\med_binary_34.ndf','C:\\\\SQLServer\\\\med_binary_history_35.ndf','C:\\\\SQLServer\\\\med_fts_52.ndf','C:\\\\SQLServer\\\\med_history_36.ndf','C:\\\\SQLServer\\\\med_prod_cat_37.ndf','C:\\\\SQLServer\\\\med_prod_cat_history_38.ndf','C:\\\\SQLServer\\\\MESSENGER_57.ndf','C:\\\\SQLServer\\\\MESSENGER_BINARY_58.ndf','C:\\\\SQLServer\\\\nova_39.ndf','C:\\\\SQLServer\\\\nova_binary_40.ndf','C:\\\\SQLServer\\\\nova_binary_history_41.ndf','C:\\\\SQLServer\\\\nova_history_42.ndf','C:\\\\SQLServer\\\\overviews_25.ndf','C:\\\\SQLServer\\\\overviews_binary_26.ndf','C:\\\\SQLServer\\\\overviews_binary_history_27.ndf','C:\\\\SQLServer\\\\overviews_history_28.ndf','C:\\\\SQLServer\\\\referral_21.ndf','C:\\\\SQLServer\\\\referral_binary_22.ndf','C:\\\\SQLServer\\\\referral_binary_history_23.ndf','C:\\\\SQLServer\\\\referral_history_24.ndf','C:\\\\SQLServer\\\\Spider3_log_2.ldf']}]"

# Start the SQL server, wait 10 seconds and create spider3 user
CMD start C:\\NOVA\\create_spider.bat ; .\start -sa_password $env:sa_password -ACCEPT_EULA $env:ACCEPT_EULA -attach_dbs \"$env:attach_dbs\" -Verbose


