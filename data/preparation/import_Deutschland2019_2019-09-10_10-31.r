# Dieses Script liest eine CSV-Datendatei in GNU R ein.
# Beim Einlesen werden fuer alle Variablen Beschriftungen (comment) angelegt.
# Die Beschriftungen fuer Werte wird ebenfalls als Attribute (attr) abgelegt.

# ds_file = file.choose()
setwd("D:/Henrik/Seafile/Meine Bibliothek/Henrik Jochen/Papers/SD Papers/SD Projekt Daten Henrik/Articles/Fictitious Issues/Analysis/Data") # PC Home
ds_file = "rdata_Deutschland2019_2019-09-10_10-31.csv"

ds = read.table(
  file=ds_file, encoding="UTF-8",
  header = FALSE, sep = "\t", quote = "\"",
  dec = ".", row.names = "CASE",
  col.names = c(
    "CASE","SERIAL","REF","QUESTNNR","MODE","STARTED","XP33_01","XP33_01a",
    "XP33_02","XP33_02a","XP33_03","XP33_03a","XP33_04","XP33_04a","XP33_05",
    "XP33_05a","XP33_06","XP33_06a","XP33_07","XP33_07a","XP33_08","XP33_08a",
    "XP33_09","XP33_09a","XP33_10","XP33_10a","XP33_11","XP33_11a","XP33_12",
    "XP33_12a","XP33_13","XP33_13a","XP33_14","XP33_14a","XP33_15","XP33_15a",
    "XP33_16","XP33_16a","XP33_17","XP33_17a","XP33_18","XP33_18a","XP33_19",
    "XP33_19a","XP33_20","XP33_20a","XP33_21","XP33_21a","XP33_22","XP33_22a",
    "XP33_23","XP33_23a","XP33_24","XP33_24a","XP33_25","XP33_25a","XP33_26",
    "XP33_26a","XP33_27","XP33_27a","XP33_28","XP33_28a","XP33_29","XP33_29a",
    "XP33_30","XP33_30a","XP33_31","XP33_31a","XP33_32","XP33_32a","XP33_33",
    "XP33_33a","XP33_34","XP33_34a","XP33_35","XP33_35a","XP33_36","XP33_36a",
    "XP34_01","XP34_01a","XP34_02","XP34_02a","XP34_03","XP34_03a","XP34_04",
    "XP34_04a","XP34_05","XP34_05a","XP34_06","XP34_06a","XP34_07","XP34_07a",
    "XP34_08","XP34_08a","XP34_09","XP34_09a","XP34_10","XP34_10a","XP34_11",
    "XP34_11a","XP34_12","XP34_12a","XP34_13","XP34_13a","XP34_14","XP34_14a",
    "XP34_15","XP34_15a","XP34_16","XP34_16a","XP34_17","XP34_17a","XP34_18",
    "XP34_18a","XP34_19","XP34_19a","XP34_20","XP34_20a","XP34_21","XP34_21a",
    "XP34_22","XP34_22a","XP34_23","XP34_23a","XP34_24","XP34_24a","XP34_25",
    "XP34_25a","XP34_26","XP34_26a","XP34_27","XP34_27a","XP34_28","XP34_28a",
    "XP34_29","XP34_29a","XP34_30","XP34_30a","XP34_31","XP34_31a","XP34_32",
    "XP34_32a","XP34_33","XP34_33a","XP34_34","XP34_34a","XP34_35","XP34_35a",
    "XP34_36","XP34_36a","XP35_01","XP35_01a","XP35_02","XP35_02a","XP35_03",
    "XP35_03a","XP35_04","XP35_04a","XP35_05","XP35_05a","XP35_06","XP35_06a",
    "XP35_07","XP35_07a","XP35_08","XP35_08a","XP35_09","XP35_09a","XP35_10",
    "XP35_10a","XP35_11","XP35_11a","XP35_12","XP35_12a","XP35_13","XP35_13a",
    "XP35_14","XP35_14a","XP35_15","XP35_15a","XP35_16","XP35_16a","XP35_17",
    "XP35_17a","XP35_18","XP35_18a","XP35_19","XP35_19a","XP35_20","XP35_20a",
    "XP35_21","XP35_21a","XP35_22","XP35_22a","XP35_23","XP35_23a","XP35_24",
    "XP35_24a","XP35_25","XP35_25a","XP35_26","XP35_26a","XP35_27","XP35_27a",
    "XP35_28","XP35_28a","XP35_29","XP35_29a","XP35_30","XP35_30a","XP35_31",
    "XP35_31a","XP35_32","XP35_32a","XP35_33","XP35_33a","XP35_34","XP35_34a",
    "XP35_35","XP35_35a","XP35_36","XP35_36a","SD35_01","SD35_01a","SD35_02",
    "SD35_02a","SD35_03","SD35_03a","SD35_04","SD35_04a","SD35_05","SD35_05a",
    "SD35_06","SD35_06a","SD35_07","SD35_07a","SD35_08","SD35_08a","SD35_09",
    "SD35_09a","SD35_10","SD35_10a","SD35_11","SD35_11a","SD35_12","SD35_12a",
    "SD35_13","SD35_13a","SD35_14","SD35_14a","SD35_15","SD35_15a","SD35_16",
    "SD35_16a","SD35_17","SD35_17a","SD35_18","SD35_18a","SD40_19","SD40_19a",
    "SD40_20","SD40_20a","SD40_21","SD40_21a","SD40_22","SD40_22a","SD40_23",
    "SD40_23a","SD40_24","SD40_24a","SD40_25","SD40_25a","SD40_26","SD40_26a",
    "BI06_01","BI06_01a","BI06_02","BI06_02a","BI06_03","BI06_03a","BI06_04",
    "BI06_04a","BI06_05","BI06_05a","BI06_06","BI06_06a","BI06_07","BI06_07a",
    "BI06_08","BI06_08a","BI06_09","BI06_09a","BI06_10","BI06_10a","BI06_11",
    "BI06_11a","BI06_12","BI06_12a","BI06_13","BI06_13a","BI06_14","BI06_14a",
    "BI06_15","BI06_15a","BI06_16","BI06_16a","BI06_17","BI06_17a","DG02","DG03_01",
    "DG04_01","DG05","DG06","DG07","DG08","DG08_07","DG09","DG10","DG11","DG12_01",
    "DG12_01a","DG13","DG14","DG16","DG19_01","DG19_01a","DG20_01","DG20_01a",
    "MT01_01","MT01_01a","MT02_01","MT02_02","MT02_03","MT02_04","PL01_01",
    "PL01_02","PL01_03","PL01_04","PL01_05","IE01_01","IE01_02","IE02_01","IE03",
    "ZG01_01","ZG01_02","ZG01_04","ZG01_05","ZG01_06","ZG01_07","ZG01_08","ZG01_10",
    "FI01_02","FI01_02a","FI01_03","FI01_03a","FI01_04","FI01_04a","FI01_05",
    "FI01_05a","FI01_06","FI01_06a","FI01_07","FI01_07a","FI01_08","FI01_08a",
    "FI01_09","FI01_09a","FI01_10","FI01_10a","FI01_11","FI01_11a","FI01_12",
    "FI01_12a","FI01_13","FI01_13a","FI01_14","FI01_14a","FI01_15","FI01_15a",
    "FI02_02","FI02_02a","FI02_03","FI02_03a","FI02_04","FI02_04a","FI02_05",
    "FI02_05a","FI02_06","FI02_06a","FI02_07","FI02_07a","FI02_08","FI02_08a",
    "FI02_09","FI02_09a","FI02_10","FI02_10a","FI02_11","FI02_11a","FI02_12",
    "FI02_12a","FI02_13","FI02_13a","FI02_14","FI02_14a","FI02_15","FI02_15a",
    "FI03_02","FI03_02a","FI03_03","FI03_03a","FI03_04","FI03_04a","FI03_05",
    "FI03_05a","FI03_06","FI03_06a","FI03_07","FI03_07a","FI03_08","FI03_08a",
    "FI03_09","FI03_09a","FI03_10","FI03_10a","FI03_11","FI03_11a","FI03_12",
    "FI03_12a","FI03_13","FI03_13a","FI03_14","FI03_14a","FI03_15","FI03_15a",
    "FI04_02","FI04_02a","FI04_03","FI04_03a","FI04_04","FI04_04a","FI04_05",
    "FI04_05a","FI04_06","FI04_06a","FI04_07","FI04_07a","FI04_08","FI04_08a",
    "FI04_09","FI04_09a","FI04_10","FI04_10a","FI04_11","FI04_11a","FI04_12",
    "FI04_12a","FI04_13","FI04_13a","FI04_14","FI04_14a","FI04_15","FI04_15a",
    "FI06_CP","FI06","DQ01_01","DQ02_01","DQ02_02","DQ02_03","DQ02_04","DQ02_05",
    "DQ03_01","DQ03_02","DQ03_03","DQ03_04","DQ04_01","DQ05_01","DQ06","DQ07",
    "DQ08","DQ09_01","DQ09_02","DQ09_03","DQ09_04","DQ10_01","DQ12","DQ13_01",
    "DQ13_01a","DQ14_01","DQ14_02","DQ14_03","DQ14_04","DQ15_01","DQ15_01a",
    "DQ15_02","DQ15_02a","DQ15_03","DQ15_03a","LL01","LL02","LL03","LL04","LL05",
    "LL06","LL07","LL08","LL09_01","LL09_02","LL09_03","LL09_04","LL10","LL11_01",
    "LL11_02","LL11_03","LL12","LL13_01","LL13_01a","LL14_01","LL14_02","LL14_03",
    "LL14_04","LL15_01","LL15_01a","LL16_01","LL16_01a","LL19_01","LL19_01a",
    "LL20_01","LL20_01a","SL01","SL02","SL03","SL04","SL05","SL06","SL07","SL08",
    "SL09_01","SL09_02","SL09_03","SL09_04","SL10","SL11_01","SL11_02","SL11_03",
    "SL12","SL13_01","SL13_01a","SL14_01","SL14_02","SL14_03","SL14_04","SL15_01",
    "SL15_01a","SL16_01","SL16_01a","SL19_01","SL19_01a","SL20_01","SL20_01a",
    "FG01_CP","FG01","SC01","SC02","SC05","R001_CP","R001","R002_RV1","R005_01",
    "R006_01","R007_01","TIME001","TIME002","TIME003","TIME004","TIME005","TIME006",
    "TIME007","TIME008","TIME009","TIME010","TIME011","TIME012","TIME013","TIME014",
    "TIME015","TIME016","TIME017","TIME018","TIME019","TIME020","TIME021","TIME022",
    "TIME023","TIME024","TIME025","TIME026","TIME027","TIME028","TIME029","TIME030",
    "TIME031","TIME032","TIME033","TIME034","TIME035","TIME036","TIME037","TIME038",
    "TIME039","TIME040","TIME041","TIME_SUM","MAILSENT","LASTDATA","FINISHED",
    "Q_VIEWER","LASTPAGE","MAXPAGE","MISSING","MISSREL","TIME_RSI","DEG_TIME"
  ),
  as.is = TRUE,
  colClasses = c(
    CASE="numeric", SERIAL="character", REF="character", QUESTNNR="character",
    MODE="character", STARTED="POSIXct", XP33_01="numeric", XP33_01a="numeric",
    XP33_02="numeric", XP33_02a="numeric", XP33_03="numeric",
    XP33_03a="numeric", XP33_04="numeric", XP33_04a="numeric",
    XP33_05="numeric", XP33_05a="numeric", XP33_06="numeric",
    XP33_06a="numeric", XP33_07="numeric", XP33_07a="numeric",
    XP33_08="numeric", XP33_08a="numeric", XP33_09="numeric",
    XP33_09a="numeric", XP33_10="numeric", XP33_10a="numeric",
    XP33_11="numeric", XP33_11a="numeric", XP33_12="numeric",
    XP33_12a="numeric", XP33_13="numeric", XP33_13a="numeric",
    XP33_14="numeric", XP33_14a="numeric", XP33_15="numeric",
    XP33_15a="numeric", XP33_16="numeric", XP33_16a="numeric",
    XP33_17="numeric", XP33_17a="numeric", XP33_18="numeric",
    XP33_18a="numeric", XP33_19="numeric", XP33_19a="numeric",
    XP33_20="numeric", XP33_20a="numeric", XP33_21="numeric",
    XP33_21a="numeric", XP33_22="numeric", XP33_22a="numeric",
    XP33_23="numeric", XP33_23a="numeric", XP33_24="numeric",
    XP33_24a="numeric", XP33_25="numeric", XP33_25a="numeric",
    XP33_26="numeric", XP33_26a="numeric", XP33_27="numeric",
    XP33_27a="numeric", XP33_28="numeric", XP33_28a="numeric",
    XP33_29="numeric", XP33_29a="numeric", XP33_30="numeric",
    XP33_30a="numeric", XP33_31="numeric", XP33_31a="numeric",
    XP33_32="numeric", XP33_32a="numeric", XP33_33="numeric",
    XP33_33a="numeric", XP33_34="numeric", XP33_34a="numeric",
    XP33_35="numeric", XP33_35a="numeric", XP33_36="numeric",
    XP33_36a="numeric", XP34_01="numeric", XP34_01a="numeric",
    XP34_02="numeric", XP34_02a="numeric", XP34_03="numeric",
    XP34_03a="numeric", XP34_04="numeric", XP34_04a="numeric",
    XP34_05="numeric", XP34_05a="numeric", XP34_06="numeric",
    XP34_06a="numeric", XP34_07="numeric", XP34_07a="numeric",
    XP34_08="numeric", XP34_08a="numeric", XP34_09="numeric",
    XP34_09a="numeric", XP34_10="numeric", XP34_10a="numeric",
    XP34_11="numeric", XP34_11a="numeric", XP34_12="numeric",
    XP34_12a="numeric", XP34_13="numeric", XP34_13a="numeric",
    XP34_14="numeric", XP34_14a="numeric", XP34_15="numeric",
    XP34_15a="numeric", XP34_16="numeric", XP34_16a="numeric",
    XP34_17="numeric", XP34_17a="numeric", XP34_18="numeric",
    XP34_18a="numeric", XP34_19="numeric", XP34_19a="numeric",
    XP34_20="numeric", XP34_20a="numeric", XP34_21="numeric",
    XP34_21a="numeric", XP34_22="numeric", XP34_22a="numeric",
    XP34_23="numeric", XP34_23a="numeric", XP34_24="numeric",
    XP34_24a="numeric", XP34_25="numeric", XP34_25a="numeric",
    XP34_26="numeric", XP34_26a="numeric", XP34_27="numeric",
    XP34_27a="numeric", XP34_28="numeric", XP34_28a="numeric",
    XP34_29="numeric", XP34_29a="numeric", XP34_30="numeric",
    XP34_30a="numeric", XP34_31="numeric", XP34_31a="numeric",
    XP34_32="numeric", XP34_32a="numeric", XP34_33="numeric",
    XP34_33a="numeric", XP34_34="numeric", XP34_34a="numeric",
    XP34_35="numeric", XP34_35a="numeric", XP34_36="numeric",
    XP34_36a="numeric", XP35_01="numeric", XP35_01a="numeric",
    XP35_02="numeric", XP35_02a="numeric", XP35_03="numeric",
    XP35_03a="numeric", XP35_04="numeric", XP35_04a="numeric",
    XP35_05="numeric", XP35_05a="numeric", XP35_06="numeric",
    XP35_06a="numeric", XP35_07="numeric", XP35_07a="numeric",
    XP35_08="numeric", XP35_08a="numeric", XP35_09="numeric",
    XP35_09a="numeric", XP35_10="numeric", XP35_10a="numeric",
    XP35_11="numeric", XP35_11a="numeric", XP35_12="numeric",
    XP35_12a="numeric", XP35_13="numeric", XP35_13a="numeric",
    XP35_14="numeric", XP35_14a="numeric", XP35_15="numeric",
    XP35_15a="numeric", XP35_16="numeric", XP35_16a="numeric",
    XP35_17="numeric", XP35_17a="numeric", XP35_18="numeric",
    XP35_18a="numeric", XP35_19="numeric", XP35_19a="numeric",
    XP35_20="numeric", XP35_20a="numeric", XP35_21="numeric",
    XP35_21a="numeric", XP35_22="numeric", XP35_22a="numeric",
    XP35_23="numeric", XP35_23a="numeric", XP35_24="numeric",
    XP35_24a="numeric", XP35_25="numeric", XP35_25a="numeric",
    XP35_26="numeric", XP35_26a="numeric", XP35_27="numeric",
    XP35_27a="numeric", XP35_28="numeric", XP35_28a="numeric",
    XP35_29="numeric", XP35_29a="numeric", XP35_30="numeric",
    XP35_30a="numeric", XP35_31="numeric", XP35_31a="numeric",
    XP35_32="numeric", XP35_32a="numeric", XP35_33="numeric",
    XP35_33a="numeric", XP35_34="numeric", XP35_34a="numeric",
    XP35_35="numeric", XP35_35a="numeric", XP35_36="numeric",
    XP35_36a="numeric", SD35_01="numeric", SD35_01a="numeric",
    SD35_02="numeric", SD35_02a="numeric", SD35_03="numeric",
    SD35_03a="numeric", SD35_04="numeric", SD35_04a="numeric",
    SD35_05="numeric", SD35_05a="numeric", SD35_06="numeric",
    SD35_06a="numeric", SD35_07="numeric", SD35_07a="numeric",
    SD35_08="numeric", SD35_08a="numeric", SD35_09="numeric",
    SD35_09a="numeric", SD35_10="numeric", SD35_10a="numeric",
    SD35_11="numeric", SD35_11a="numeric", SD35_12="numeric",
    SD35_12a="numeric", SD35_13="numeric", SD35_13a="numeric",
    SD35_14="numeric", SD35_14a="numeric", SD35_15="numeric",
    SD35_15a="numeric", SD35_16="numeric", SD35_16a="numeric",
    SD35_17="numeric", SD35_17a="numeric", SD35_18="numeric",
    SD35_18a="numeric", SD40_19="numeric", SD40_19a="numeric",
    SD40_20="numeric", SD40_20a="numeric", SD40_21="numeric",
    SD40_21a="numeric", SD40_22="numeric", SD40_22a="numeric",
    SD40_23="numeric", SD40_23a="numeric", SD40_24="numeric",
    SD40_24a="numeric", SD40_25="numeric", SD40_25a="numeric",
    SD40_26="numeric", SD40_26a="numeric", BI06_01="numeric",
    BI06_01a="numeric", BI06_02="numeric", BI06_02a="numeric",
    BI06_03="numeric", BI06_03a="numeric", BI06_04="numeric",
    BI06_04a="numeric", BI06_05="numeric", BI06_05a="numeric",
    BI06_06="numeric", BI06_06a="numeric", BI06_07="numeric",
    BI06_07a="numeric", BI06_08="numeric", BI06_08a="numeric",
    BI06_09="numeric", BI06_09a="numeric", BI06_10="numeric",
    BI06_10a="numeric", BI06_11="numeric", BI06_11a="numeric",
    BI06_12="numeric", BI06_12a="numeric", BI06_13="numeric",
    BI06_13a="numeric", BI06_14="numeric", BI06_14a="numeric",
    BI06_15="numeric", BI06_15a="numeric", BI06_16="numeric",
    BI06_16a="numeric", BI06_17="numeric", BI06_17a="numeric", DG02="numeric",
    DG03_01="character", DG04_01="character", DG05="numeric", DG06="numeric",
    DG07="numeric", DG08="numeric", DG08_07="character", DG09="numeric",
    DG10="numeric", DG11="numeric", DG12_01="character", DG12_01a="logical",
    DG13="numeric", DG14="numeric", DG16="numeric", DG19_01="numeric",
    DG19_01a="logical", DG20_01="character", DG20_01a="logical",
    MT01_01="numeric", MT01_01a="logical", MT02_01="numeric", MT02_02="numeric",
    MT02_03="numeric", MT02_04="numeric", PL01_01="numeric", PL01_02="numeric",
    PL01_03="numeric", PL01_04="numeric", PL01_05="numeric", IE01_01="numeric",
    IE01_02="numeric", IE02_01="numeric", IE03="numeric", ZG01_01="numeric",
    ZG01_02="numeric", ZG01_04="numeric", ZG01_05="numeric", ZG01_06="numeric",
    ZG01_07="numeric", ZG01_08="numeric", ZG01_10="numeric", FI01_02="numeric",
    FI01_02a="numeric", FI01_03="numeric", FI01_03a="numeric",
    FI01_04="numeric", FI01_04a="numeric", FI01_05="numeric",
    FI01_05a="numeric", FI01_06="numeric", FI01_06a="numeric",
    FI01_07="numeric", FI01_07a="numeric", FI01_08="numeric",
    FI01_08a="numeric", FI01_09="numeric", FI01_09a="numeric",
    FI01_10="numeric", FI01_10a="numeric", FI01_11="numeric",
    FI01_11a="numeric", FI01_12="numeric", FI01_12a="numeric",
    FI01_13="numeric", FI01_13a="numeric", FI01_14="numeric",
    FI01_14a="numeric", FI01_15="numeric", FI01_15a="numeric",
    FI02_02="numeric", FI02_02a="numeric", FI02_03="numeric",
    FI02_03a="numeric", FI02_04="numeric", FI02_04a="numeric",
    FI02_05="numeric", FI02_05a="numeric", FI02_06="numeric",
    FI02_06a="numeric", FI02_07="numeric", FI02_07a="numeric",
    FI02_08="numeric", FI02_08a="numeric", FI02_09="numeric",
    FI02_09a="numeric", FI02_10="numeric", FI02_10a="numeric",
    FI02_11="numeric", FI02_11a="numeric", FI02_12="numeric",
    FI02_12a="numeric", FI02_13="numeric", FI02_13a="numeric",
    FI02_14="numeric", FI02_14a="numeric", FI02_15="numeric",
    FI02_15a="numeric", FI03_02="numeric", FI03_02a="numeric",
    FI03_03="numeric", FI03_03a="numeric", FI03_04="numeric",
    FI03_04a="numeric", FI03_05="numeric", FI03_05a="numeric",
    FI03_06="numeric", FI03_06a="numeric", FI03_07="numeric",
    FI03_07a="numeric", FI03_08="numeric", FI03_08a="numeric",
    FI03_09="numeric", FI03_09a="numeric", FI03_10="numeric",
    FI03_10a="numeric", FI03_11="numeric", FI03_11a="numeric",
    FI03_12="numeric", FI03_12a="numeric", FI03_13="numeric",
    FI03_13a="numeric", FI03_14="numeric", FI03_14a="numeric",
    FI03_15="numeric", FI03_15a="numeric", FI04_02="numeric",
    FI04_02a="numeric", FI04_03="numeric", FI04_03a="numeric",
    FI04_04="numeric", FI04_04a="numeric", FI04_05="numeric",
    FI04_05a="numeric", FI04_06="numeric", FI04_06a="numeric",
    FI04_07="numeric", FI04_07a="numeric", FI04_08="numeric",
    FI04_08a="numeric", FI04_09="numeric", FI04_09a="numeric",
    FI04_10="numeric", FI04_10a="numeric", FI04_11="numeric",
    FI04_11a="numeric", FI04_12="numeric", FI04_12a="numeric",
    FI04_13="numeric", FI04_13a="numeric", FI04_14="numeric",
    FI04_14a="numeric", FI04_15="numeric", FI04_15a="numeric",
    FI06_CP="numeric", FI06="numeric", DQ01_01="numeric", DQ02_01="numeric",
    DQ02_02="numeric", DQ02_03="numeric", DQ02_04="numeric", DQ02_05="numeric",
    DQ03_01="numeric", DQ03_02="numeric", DQ03_03="numeric", DQ03_04="numeric",
    DQ04_01="numeric", DQ05_01="numeric", DQ06="numeric", DQ07="numeric",
    DQ08="numeric", DQ09_01="numeric", DQ09_02="numeric", DQ09_03="numeric",
    DQ09_04="numeric", DQ10_01="numeric", DQ12="numeric", DQ13_01="numeric",
    DQ13_01a="logical", DQ14_01="numeric", DQ14_02="numeric", DQ14_03="numeric",
    DQ14_04="numeric", DQ15_01="numeric", DQ15_01a="logical", DQ15_02="numeric",
    DQ15_02a="logical", DQ15_03="numeric", DQ15_03a="logical", LL01="numeric",
    LL02="numeric", LL03="numeric", LL04="numeric", LL05="numeric",
    LL06="numeric", LL07="numeric", LL08="numeric", LL09_01="numeric",
    LL09_02="numeric", LL09_03="numeric", LL09_04="numeric", LL10="numeric",
    LL11_01="character", LL11_02="character", LL11_03="character",
    LL12="numeric", LL13_01="numeric", LL13_01a="logical", LL14_01="numeric",
    LL14_02="numeric", LL14_03="numeric", LL14_04="numeric", LL15_01="numeric",
    LL15_01a="logical", LL16_01="numeric", LL16_01a="logical",
    LL19_01="numeric", LL19_01a="logical", LL20_01="numeric",
    LL20_01a="logical", SL01="numeric", SL02="numeric", SL03="numeric",
    SL04="numeric", SL05="numeric", SL06="numeric", SL07="numeric",
    SL08="numeric", SL09_01="numeric", SL09_02="numeric", SL09_03="numeric",
    SL09_04="numeric", SL10="numeric", SL11_01="character", SL11_02="character",
    SL11_03="character", SL12="numeric", SL13_01="numeric", SL13_01a="logical",
    SL14_01="numeric", SL14_02="numeric", SL14_03="numeric", SL14_04="numeric",
    SL15_01="numeric", SL15_01a="logical", SL16_01="numeric",
    SL16_01a="logical", SL19_01="numeric", SL19_01a="logical",
    SL20_01="numeric", SL20_01a="logical", FG01_CP="numeric", FG01="numeric",
    SC01="numeric", SC02="numeric", SC05="numeric", R001_CP="numeric",
    R001="numeric", R002_RV1="character", R005_01="character",
    R006_01="character", R007_01="character", TIME001="integer",
    TIME002="integer", TIME003="integer", TIME004="integer", TIME005="integer",
    TIME006="integer", TIME007="integer", TIME008="integer", TIME009="integer",
    TIME010="integer", TIME011="integer", TIME012="integer", TIME013="integer",
    TIME014="integer", TIME015="integer", TIME016="integer", TIME017="integer",
    TIME018="integer", TIME019="integer", TIME020="integer", TIME021="integer",
    TIME022="integer", TIME023="integer", TIME024="integer", TIME025="integer",
    TIME026="integer", TIME027="integer", TIME028="integer", TIME029="integer",
    TIME030="integer", TIME031="integer", TIME032="integer", TIME033="integer",
    TIME034="integer", TIME035="integer", TIME036="integer", TIME037="integer",
    TIME038="integer", TIME039="integer", TIME040="integer", TIME041="integer",
    TIME_SUM="integer", MAILSENT="POSIXct", LASTDATA="POSIXct",
    FINISHED="logical", Q_VIEWER="logical", LASTPAGE="numeric",
    MAXPAGE="numeric", MISSING="numeric", MISSREL="numeric", TIME_RSI="numeric",
    DEG_TIME="numeric"
  ),
  skip = 1,
  check.names = TRUE, fill = TRUE,
  strip.white = FALSE, blank.lines.skip = TRUE,
  comment.char = "",
  na.strings = ""
)

rm(ds_file)

attr(ds, "project") = "Deutschland2019"
attr(ds, "description") = "Leben in Deutschland 2019 RESPONDI"
attr(ds, "date") = "2019-09-10 10:31:58"
attr(ds, "server") = "https://www.soscisurvey.de"

# Variable und Value Labels
ds$XP33_01 = factor(ds$XP33_01, levels=c("1"), labels=c("Weiter"), ordered=FALSE)
ds$XP33_02 = factor(ds$XP33_02, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_03 = factor(ds$XP33_03, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_04 = factor(ds$XP33_04, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_05 = factor(ds$XP33_05, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_06 = factor(ds$XP33_06, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_07 = factor(ds$XP33_07, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_08 = factor(ds$XP33_08, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_09 = factor(ds$XP33_09, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_10 = factor(ds$XP33_10, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_11 = factor(ds$XP33_11, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_12 = factor(ds$XP33_12, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_13 = factor(ds$XP33_13, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_14 = factor(ds$XP33_14, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_15 = factor(ds$XP33_15, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_16 = factor(ds$XP33_16, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_17 = factor(ds$XP33_17, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_18 = factor(ds$XP33_18, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_19 = factor(ds$XP33_19, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_20 = factor(ds$XP33_20, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_21 = factor(ds$XP33_21, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_22 = factor(ds$XP33_22, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_23 = factor(ds$XP33_23, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_24 = factor(ds$XP33_24, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_25 = factor(ds$XP33_25, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_26 = factor(ds$XP33_26, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_27 = factor(ds$XP33_27, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_28 = factor(ds$XP33_28, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_29 = factor(ds$XP33_29, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_30 = factor(ds$XP33_30, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_31 = factor(ds$XP33_31, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_32 = factor(ds$XP33_32, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_33 = factor(ds$XP33_33, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_34 = factor(ds$XP33_34, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_35 = factor(ds$XP33_35, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP33_36 = factor(ds$XP33_36, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_01 = factor(ds$XP34_01, levels=c("1"), labels=c("Weiter"), ordered=FALSE)
ds$XP34_02 = factor(ds$XP34_02, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_03 = factor(ds$XP34_03, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_04 = factor(ds$XP34_04, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_05 = factor(ds$XP34_05, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_06 = factor(ds$XP34_06, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_07 = factor(ds$XP34_07, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_08 = factor(ds$XP34_08, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_09 = factor(ds$XP34_09, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_10 = factor(ds$XP34_10, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_11 = factor(ds$XP34_11, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_12 = factor(ds$XP34_12, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_13 = factor(ds$XP34_13, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_14 = factor(ds$XP34_14, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_15 = factor(ds$XP34_15, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_16 = factor(ds$XP34_16, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_17 = factor(ds$XP34_17, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_18 = factor(ds$XP34_18, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_19 = factor(ds$XP34_19, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_20 = factor(ds$XP34_20, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_21 = factor(ds$XP34_21, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_22 = factor(ds$XP34_22, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_23 = factor(ds$XP34_23, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_24 = factor(ds$XP34_24, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_25 = factor(ds$XP34_25, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_26 = factor(ds$XP34_26, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_27 = factor(ds$XP34_27, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_28 = factor(ds$XP34_28, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_29 = factor(ds$XP34_29, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_30 = factor(ds$XP34_30, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_31 = factor(ds$XP34_31, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_32 = factor(ds$XP34_32, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_33 = factor(ds$XP34_33, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_34 = factor(ds$XP34_34, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_35 = factor(ds$XP34_35, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP34_36 = factor(ds$XP34_36, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_01 = factor(ds$XP35_01, levels=c("1"), labels=c("Weiter"), ordered=FALSE)
ds$XP35_02 = factor(ds$XP35_02, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_03 = factor(ds$XP35_03, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_04 = factor(ds$XP35_04, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_05 = factor(ds$XP35_05, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_06 = factor(ds$XP35_06, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_07 = factor(ds$XP35_07, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_08 = factor(ds$XP35_08, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_09 = factor(ds$XP35_09, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_10 = factor(ds$XP35_10, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_11 = factor(ds$XP35_11, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_12 = factor(ds$XP35_12, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_13 = factor(ds$XP35_13, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_14 = factor(ds$XP35_14, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_15 = factor(ds$XP35_15, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_16 = factor(ds$XP35_16, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_17 = factor(ds$XP35_17, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_18 = factor(ds$XP35_18, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_19 = factor(ds$XP35_19, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_20 = factor(ds$XP35_20, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_21 = factor(ds$XP35_21, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_22 = factor(ds$XP35_22, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_23 = factor(ds$XP35_23, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_24 = factor(ds$XP35_24, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_25 = factor(ds$XP35_25, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_26 = factor(ds$XP35_26, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_27 = factor(ds$XP35_27, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_28 = factor(ds$XP35_28, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_29 = factor(ds$XP35_29, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_30 = factor(ds$XP35_30, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_31 = factor(ds$XP35_31, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_32 = factor(ds$XP35_32, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_33 = factor(ds$XP35_33, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_34 = factor(ds$XP35_34, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_35 = factor(ds$XP35_35, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$XP35_36 = factor(ds$XP35_36, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$SD35_01 = factor(ds$SD35_01, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_02 = factor(ds$SD35_02, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_03 = factor(ds$SD35_03, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_04 = factor(ds$SD35_04, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_05 = factor(ds$SD35_05, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_06 = factor(ds$SD35_06, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_07 = factor(ds$SD35_07, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_08 = factor(ds$SD35_08, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_09 = factor(ds$SD35_09, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_10 = factor(ds$SD35_10, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_11 = factor(ds$SD35_11, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_12 = factor(ds$SD35_12, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_13 = factor(ds$SD35_13, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_14 = factor(ds$SD35_14, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_15 = factor(ds$SD35_15, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_16 = factor(ds$SD35_16, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_17 = factor(ds$SD35_17, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD35_18 = factor(ds$SD35_18, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD40_19 = factor(ds$SD40_19, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD40_20 = factor(ds$SD40_20, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD40_21 = factor(ds$SD40_21, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD40_22 = factor(ds$SD40_22, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD40_23 = factor(ds$SD40_23, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD40_24 = factor(ds$SD40_24, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD40_25 = factor(ds$SD40_25, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$SD40_26 = factor(ds$SD40_26, levels=c("1","2","3","4","5","6"), labels=c("1 sehr verwerflich","2 verwerflich","3 weder noch/neutral","4 erwuenscht","5 sehr erwuenscht","weiter"), ordered=FALSE)
ds$BI06_01 = factor(ds$BI06_01, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_02 = factor(ds$BI06_02, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_03 = factor(ds$BI06_03, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_04 = factor(ds$BI06_04, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_05 = factor(ds$BI06_05, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_06 = factor(ds$BI06_06, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_07 = factor(ds$BI06_07, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_08 = factor(ds$BI06_08, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_09 = factor(ds$BI06_09, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_10 = factor(ds$BI06_10, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_11 = factor(ds$BI06_11, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_12 = factor(ds$BI06_12, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_13 = factor(ds$BI06_13, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_14 = factor(ds$BI06_14, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_15 = factor(ds$BI06_15, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_16 = factor(ds$BI06_16, levels=c("1","2","3","4","5","6"), labels=c("1 stimme gar nicht zu","2","3","4","5 stimme voll und ganz zu","weiter"), ordered=FALSE)
ds$BI06_17 = factor(ds$BI06_17, levels=c("1","2","3","4","5","6"), labels=c("1 sehr schwach","2 schwach","3 teils/teils","4 stark","5 sehr stark","weiter"), ordered=FALSE)
ds$DG02 = factor(ds$DG02, levels=c("1","2","3","-1","-9"), labels=c("maennlich","weiblich","anderes","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DG05 = factor(ds$DG05, levels=c("1","2","3","-1","-2","-9"), labels=c("nur die deutsche Staatsangehoerigkeit","die deutsche und eine andere Staatsangehoerigkeit","eine andere Staatsangehoerigkeit","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DG06 = factor(ds$DG06, levels=c("1","2","-1","-2","-9"), labels=c("ja","nein","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DG07 = factor(ds$DG07, levels=c("1","2","3","4","5","-1","-2","-9"), labels=c("ledig","verlobt","verheiratet oder Vergleichbares","verwitwet","geschieden","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DG08 = factor(ds$DG08, levels=c("1","2","3","4","5","6","7","8","-1","-2","-9"), labels=c("noch Schueler","ohne Abschluss von der Schule gegangen","(qualifizierter/erweiterter) Hauptschulabschluss / Volksschulabschluss / Polytechnische Oberschule (POS) Abschluss 8. Klasse (DDR-Abschluss)","Realschulabschluss / Mittlere Reife / Fachhochschulreife / Polytechnische Oberschule (POS) 10. Klasse (DDR-Abschluss)","Fachhochschulreife","Abitur / Hochschulreife / Fachabitur / Erweiterte Oberschule (EOS) (DDR-Abschluss)","auslaendischer Schulabschluss, und zwar:","sonstiger Schulabschluss","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DG09 = factor(ds$DG09, levels=c("1","2","3","4","5","6","7","8","9","10","-1","-2","-9"), labels=c("noch in Ausbildung","keine Qualifikation","angelernt (Berufsgrundbildungsjahr, medizinischer Hilfsberuf, einjaehrige Schulen des Gesundheitswesens, Berufsfachschulen, Teilfacharbeiterabschluss)","abgeschlossene Lehre, Laufbahnpruefung mittl. Dienst, Abschlusszeugnis Medizin, Assistent, Krankenschwester/-pfleger, berufsqual. Abschluss, Berufsfachschule/Kolleg","Meister-/Techniker- oder gleichwertiger Fachschulabschluss (inkl. Fachschule der ehemaligen DDR), Abschluss einer Fachakademie","anderer beruflicher Abschluss","Bachelor","Master, Diplom, Magister, Staatsexamen","Promotion, Habilitation","anderer Studienabschluss","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DG10 = factor(ds$DG10, levels=c("1","2","3","4","5","6","7","-1","-2","-9"), labels=c("vollzeiterwerbstaetig","teilzeiterwerbstaetig","geringfuegig erwerbstaetig, im Minijob mit bis zu 450Euro Gehalt","zur Zeit arbeitslos","in Schule, Ausbildung, Lehre oder Studium","Rentner oder Pensionaer","Hausfrau oder Hausmann, oder aus anderen Gruenden nicht erwerbstaetig","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DG11 = factor(ds$DG11, levels=c("1","2","3","4","5","6","7","8","-1","-2","-9"), labels=c("Beamte/r / Angestellte/r im oeffentlichen Dienst","Arbeiter/in","Angestellte/r","selbststaendig im Handel, Gewerbe, Industrie, Dienstleistung, u.a.","akademischer freier Beruf","selbststaendige/r Landwirt/in, Genossenschaftsbauer","in Ausbildung, Student/in","noch nie gearbeitet","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DG13 = factor(ds$DG13, levels=c("1","2","3","4","5","6","7","-1","-2","-9"), labels=c("Roemisch-Katholische Kirche","Evangelische Kirche","andere christliche Gemeinschaft","Islam/islamische Religionsgemeinschaft","Judentum/juedische Religionsgemeinschaft","andere Religionsgemeinschaft","keine Religionsgemeinschaft","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DG14 = factor(ds$DG14, levels=c("1","2","3","4","5","-1","-2","-9"), labels=c("sehr religioes","religioes","mittel","wenig religioes","gar nicht religioes","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DG16 = factor(ds$DG16, levels=c("1","2","3","4","5","6","7","8","9","-1","-2","-9"), labels=c("unter 500Euro","500-1000Euro","1001-1500Euro","1501-2000Euro","2001-2500Euro","2501-3000Euro","3001-3500Euro","3501-4000Euro","mehr als 4000Euro","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$IE03 = factor(ds$IE03, levels=c("1","2","-1","-2","-9"), labels=c("Ja","Nein","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$FI01_02 = factor(ds$FI01_02, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_03 = factor(ds$FI01_03, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_04 = factor(ds$FI01_04, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_05 = factor(ds$FI01_05, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_06 = factor(ds$FI01_06, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_07 = factor(ds$FI01_07, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_08 = factor(ds$FI01_08, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_09 = factor(ds$FI01_09, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_10 = factor(ds$FI01_10, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_11 = factor(ds$FI01_11, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_12 = factor(ds$FI01_12, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_13 = factor(ds$FI01_13, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_14 = factor(ds$FI01_14, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI01_15 = factor(ds$FI01_15, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI02_02 = factor(ds$FI02_02, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_03 = factor(ds$FI02_03, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_04 = factor(ds$FI02_04, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_05 = factor(ds$FI02_05, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_06 = factor(ds$FI02_06, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_07 = factor(ds$FI02_07, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_08 = factor(ds$FI02_08, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_09 = factor(ds$FI02_09, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_10 = factor(ds$FI02_10, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_11 = factor(ds$FI02_11, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_12 = factor(ds$FI02_12, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_13 = factor(ds$FI02_13, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_14 = factor(ds$FI02_14, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI02_15 = factor(ds$FI02_15, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI03_02 = factor(ds$FI03_02, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_03 = factor(ds$FI03_03, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_04 = factor(ds$FI03_04, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_05 = factor(ds$FI03_05, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_06 = factor(ds$FI03_06, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_07 = factor(ds$FI03_07, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_08 = factor(ds$FI03_08, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_09 = factor(ds$FI03_09, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_10 = factor(ds$FI03_10, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_11 = factor(ds$FI03_11, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_12 = factor(ds$FI03_12, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_13 = factor(ds$FI03_13, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_14 = factor(ds$FI03_14, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI03_15 = factor(ds$FI03_15, levels=c("1","2","3"), labels=c("eher gut","eher schlecht","weiter"), ordered=FALSE)
ds$FI04_02 = factor(ds$FI04_02, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_03 = factor(ds$FI04_03, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_04 = factor(ds$FI04_04, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_05 = factor(ds$FI04_05, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_06 = factor(ds$FI04_06, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_07 = factor(ds$FI04_07, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_08 = factor(ds$FI04_08, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_09 = factor(ds$FI04_09, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_10 = factor(ds$FI04_10, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_11 = factor(ds$FI04_11, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_12 = factor(ds$FI04_12, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_13 = factor(ds$FI04_13, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_14 = factor(ds$FI04_14, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$FI04_15 = factor(ds$FI04_15, levels=c("1","2","3","4"), labels=c("eher gut","eher schlecht","kenne ich nicht","weiter"), ordered=FALSE)
ds$DQ06 = factor(ds$DQ06, levels=c("1","2","-1","-2","-9"), labels=c("Ja","Nein","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DQ07 = factor(ds$DQ07, levels=c("1","2","-1","-2","-9"), labels=c("Ja","Nein","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DQ08 = factor(ds$DQ08, levels=c("1","2","-1","-2","-9"), labels=c("Ja","Nein","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$DQ12 = factor(ds$DQ12, levels=c("1","2","-1","-2","-9"), labels=c("Ja","Nein","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$LL01 = factor(ds$LL01, levels=c("1","2","3","4","5","-1","-2","-9"), labels=c("0","1","2","3","4","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$LL02 = factor(ds$LL02, levels=c("1","2","3","4","5","6","-1","-2","-9"), labels=c("0","1","2","3","4","5","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$LL03 = factor(ds$LL03, levels=c("1","2","3","4","5","-1","-2","-9"), labels=c("0","1","2","3","4","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$LL04 = factor(ds$LL04, levels=c("1","2","3","4","5","-9"), labels=c("0","1","2","3","4","[NA] nicht beantwortet"), ordered=FALSE)
ds$LL05 = factor(ds$LL05, levels=c("1","2","-9"), labels=c("Ich habe die Fragetechnik nun verstanden.","Ich habe die Fragetechnik nicht verstanden. Ich will es noch einmal probieren.","[NA] nicht beantwortet"), ordered=FALSE)
ds$LL06 = factor(ds$LL06, levels=c("1","2","3","4","5","-1","-2","-9"), labels=c("0","1","2","3","4","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$LL07 = factor(ds$LL07, levels=c("1","2","3","4","5","-1","-2","-9"), labels=c("0","1","2","3","4","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$LL08 = factor(ds$LL08, levels=c("1","2","3","4","5","-1","-2","-9"), labels=c("0","1","2","3","4","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$LL10 = factor(ds$LL10, levels=c("1","2","3","4","5","-1","-2","-9"), labels=c("0","1","2","3","4","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$LL12 = factor(ds$LL12, levels=c("1","2","3","4","5","-1","-2","-9"), labels=c("0","1","2","3","4","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$SL01 = factor(ds$SL01, levels=c("1","2","3","4","-9"), labels=c("0","1","2","3","[NA] nicht beantwortet"), ordered=FALSE)
ds$SL02 = factor(ds$SL02, levels=c("1","2","3","4","5","-1","-2","-9"), labels=c("0","1","2","3","4","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$SL03 = factor(ds$SL03, levels=c("1","2","3","4","-1","-2","-9"), labels=c("0","1","2","3","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$SL04 = factor(ds$SL04, levels=c("1","2","3","4","-9"), labels=c("0","1","2","3","[NA] nicht beantwortet"), ordered=FALSE)
ds$SL05 = factor(ds$SL05, levels=c("1","2","-9"), labels=c("Ich habe die Fragetechnik nun verstanden.","Ich habe die Fragetechnik nicht verstanden. Ich will es noch einmal probieren.","[NA] nicht beantwortet"), ordered=FALSE)
ds$SL06 = factor(ds$SL06, levels=c("1","2","3","4","-1","-2","-9"), labels=c("0","1","2","3","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$SL07 = factor(ds$SL07, levels=c("1","2","3","4","-1","-2","-9"), labels=c("0","1","2","3","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$SL08 = factor(ds$SL08, levels=c("1","2","3","4","-1","-2","-9"), labels=c("0","1","2","3","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$SL10 = factor(ds$SL10, levels=c("1","2","3","4","-1","-2","-9"), labels=c("0","1","2","3","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$SL12 = factor(ds$SL12, levels=c("1","2","3","4","-1","-2","-9"), labels=c("0","1","2","3","[NA] weiss nicht","[NA] keine Angabe","[NA] nicht beantwortet"), ordered=FALSE)
ds$SC01 = factor(ds$SC01, levels=c("1","2","3","4","5","-9"), labels=c("18 bis 29 Jahre alt","30 bis 39 Jahre alt","40 bis 49 Jahre alt","50 bis 59 Jahre alt","60 bis 69 Jahre alt","[NA] nicht beantwortet"), ordered=FALSE)
ds$SC02 = factor(ds$SC02, levels=c("1","2","-9"), labels=c("Mann","Frau","[NA] nicht beantwortet"), ordered=FALSE)
ds$SC05 = factor(ds$SC05, levels=c("1","2","-9"), labels=c("Ja","Nein","[NA] nicht beantwortet"), ordered=FALSE)
attr(ds$XP33_01a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_02a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_03a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_04a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_05a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_06a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_07a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_08a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_09a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_10a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_11a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_12a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_13a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_14a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_15a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_16a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_17a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_18a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_19a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_20a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_21a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_22a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_23a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_24a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_25a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_26a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_27a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_28a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_29a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_30a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_31a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_32a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_33a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_34a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_35a,"-1") = "Keine Messung moeglich"
attr(ds$XP33_36a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_01a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_02a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_03a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_04a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_05a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_06a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_07a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_08a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_09a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_10a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_11a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_12a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_13a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_14a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_15a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_16a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_17a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_18a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_19a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_20a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_21a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_22a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_23a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_24a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_25a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_26a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_27a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_28a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_29a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_30a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_31a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_32a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_33a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_34a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_35a,"-1") = "Keine Messung moeglich"
attr(ds$XP34_36a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_01a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_02a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_03a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_04a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_05a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_06a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_07a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_08a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_09a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_10a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_11a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_12a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_13a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_14a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_15a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_16a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_17a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_18a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_19a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_20a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_21a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_22a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_23a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_24a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_25a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_26a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_27a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_28a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_29a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_30a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_31a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_32a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_33a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_34a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_35a,"-1") = "Keine Messung moeglich"
attr(ds$XP35_36a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_01a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_02a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_03a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_04a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_05a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_06a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_07a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_08a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_09a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_10a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_11a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_12a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_13a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_14a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_15a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_16a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_17a,"-1") = "Keine Messung moeglich"
attr(ds$SD35_18a,"-1") = "Keine Messung moeglich"
attr(ds$SD40_19a,"-1") = "Keine Messung moeglich"
attr(ds$SD40_20a,"-1") = "Keine Messung moeglich"
attr(ds$SD40_21a,"-1") = "Keine Messung moeglich"
attr(ds$SD40_22a,"-1") = "Keine Messung moeglich"
attr(ds$SD40_23a,"-1") = "Keine Messung moeglich"
attr(ds$SD40_24a,"-1") = "Keine Messung moeglich"
attr(ds$SD40_25a,"-1") = "Keine Messung moeglich"
attr(ds$SD40_26a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_01a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_02a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_03a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_04a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_05a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_06a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_07a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_08a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_09a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_10a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_11a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_12a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_13a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_14a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_15a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_16a,"-1") = "Keine Messung moeglich"
attr(ds$BI06_17a,"-1") = "Keine Messung moeglich"
attr(ds$DG12_01a,"F") = "nicht gewaehlt"
attr(ds$DG12_01a,"T") = "ausgewaehlt"
attr(ds$DG19_01a,"F") = "nicht gewaehlt"
attr(ds$DG19_01a,"T") = "ausgewaehlt"
attr(ds$DG20_01a,"F") = "nicht gewaehlt"
attr(ds$DG20_01a,"T") = "ausgewaehlt"
attr(ds$MT01_01a,"F") = "nicht gewaehlt"
attr(ds$MT01_01a,"T") = "ausgewaehlt"
attr(ds$MT02_01,"1") = "stimme gar nicht zu [1]"
attr(ds$MT02_01,"2") = "[2]"
attr(ds$MT02_01,"3") = "[3]"
attr(ds$MT02_01,"4") = "[4]"
attr(ds$MT02_01,"5") = "stimme voll und ganz zu [5]"
attr(ds$MT02_01,"-1") = "weiss nicht"
attr(ds$MT02_01,"-2") = "keine Angabe"
attr(ds$MT02_02,"1") = "stimme gar nicht zu [1]"
attr(ds$MT02_02,"2") = "[2]"
attr(ds$MT02_02,"3") = "[3]"
attr(ds$MT02_02,"4") = "[4]"
attr(ds$MT02_02,"5") = "stimme voll und ganz zu [5]"
attr(ds$MT02_02,"-1") = "weiss nicht"
attr(ds$MT02_02,"-2") = "keine Angabe"
attr(ds$MT02_03,"1") = "stimme gar nicht zu [1]"
attr(ds$MT02_03,"2") = "[2]"
attr(ds$MT02_03,"3") = "[3]"
attr(ds$MT02_03,"4") = "[4]"
attr(ds$MT02_03,"5") = "stimme voll und ganz zu [5]"
attr(ds$MT02_03,"-1") = "weiss nicht"
attr(ds$MT02_03,"-2") = "keine Angabe"
attr(ds$MT02_04,"1") = "stimme gar nicht zu [1]"
attr(ds$MT02_04,"2") = "[2]"
attr(ds$MT02_04,"3") = "[3]"
attr(ds$MT02_04,"4") = "[4]"
attr(ds$MT02_04,"5") = "stimme voll und ganz zu [5]"
attr(ds$MT02_04,"-1") = "weiss nicht"
attr(ds$MT02_04,"-2") = "keine Angabe"
attr(ds$PL01_01,"1") = "stimme gar nicht zu [1]"
attr(ds$PL01_01,"2") = "[2]"
attr(ds$PL01_01,"3") = "[3]"
attr(ds$PL01_01,"4") = "[4]"
attr(ds$PL01_01,"5") = "stimme voll und ganz zu [5]"
attr(ds$PL01_01,"-1") = "weiss nicht"
attr(ds$PL01_01,"-2") = "keine Angabe"
attr(ds$PL01_02,"1") = "stimme gar nicht zu [1]"
attr(ds$PL01_02,"2") = "[2]"
attr(ds$PL01_02,"3") = "[3]"
attr(ds$PL01_02,"4") = "[4]"
attr(ds$PL01_02,"5") = "stimme voll und ganz zu [5]"
attr(ds$PL01_02,"-1") = "weiss nicht"
attr(ds$PL01_02,"-2") = "keine Angabe"
attr(ds$PL01_03,"1") = "stimme gar nicht zu [1]"
attr(ds$PL01_03,"2") = "[2]"
attr(ds$PL01_03,"3") = "[3]"
attr(ds$PL01_03,"4") = "[4]"
attr(ds$PL01_03,"5") = "stimme voll und ganz zu [5]"
attr(ds$PL01_03,"-1") = "weiss nicht"
attr(ds$PL01_03,"-2") = "keine Angabe"
attr(ds$PL01_04,"1") = "stimme gar nicht zu [1]"
attr(ds$PL01_04,"2") = "[2]"
attr(ds$PL01_04,"3") = "[3]"
attr(ds$PL01_04,"4") = "[4]"
attr(ds$PL01_04,"5") = "stimme voll und ganz zu [5]"
attr(ds$PL01_04,"-1") = "weiss nicht"
attr(ds$PL01_04,"-2") = "keine Angabe"
attr(ds$PL01_05,"1") = "stimme gar nicht zu [1]"
attr(ds$PL01_05,"2") = "[2]"
attr(ds$PL01_05,"3") = "[3]"
attr(ds$PL01_05,"4") = "[4]"
attr(ds$PL01_05,"5") = "stimme voll und ganz zu [5]"
attr(ds$PL01_05,"-1") = "weiss nicht"
attr(ds$PL01_05,"-2") = "keine Angabe"
attr(ds$IE01_01,"1") = "stimme gar nicht zu [1]"
attr(ds$IE01_01,"2") = "[2]"
attr(ds$IE01_01,"3") = "[3]"
attr(ds$IE01_01,"4") = "[4]"
attr(ds$IE01_01,"5") = "stimme voll und ganz zu [5]"
attr(ds$IE01_01,"-1") = "weiss nicht"
attr(ds$IE01_01,"-2") = "keine Angabe"
attr(ds$IE01_02,"1") = "stimme gar nicht zu [1]"
attr(ds$IE01_02,"2") = "[2]"
attr(ds$IE01_02,"3") = "[3]"
attr(ds$IE01_02,"4") = "[4]"
attr(ds$IE01_02,"5") = "stimme voll und ganz zu [5]"
attr(ds$IE01_02,"-1") = "weiss nicht"
attr(ds$IE01_02,"-2") = "keine Angabe"
attr(ds$IE02_01,"1") = "sehr schlecht [1]"
attr(ds$IE02_01,"2") = "schlecht [2]"
attr(ds$IE02_01,"3") = "mittel [3]"
attr(ds$IE02_01,"4") = "gut [4]"
attr(ds$IE02_01,"5") = "sehr gut [5]"
attr(ds$IE02_01,"-1") = "weiss nicht"
attr(ds$IE02_01,"-2") = "keine Angabe"
attr(ds$ZG01_01,"1") = "gar nicht [1]"
attr(ds$ZG01_01,"2") = "selten [2]"
attr(ds$ZG01_01,"3") = "hin und wieder [3]"
attr(ds$ZG01_01,"4") = "haeufig [4]"
attr(ds$ZG01_01,"5") = "sehr haeufig [5]"
attr(ds$ZG01_01,"-1") = "weiss nicht"
attr(ds$ZG01_01,"-2") = "keine Angabe"
attr(ds$ZG01_02,"1") = "gar nicht [1]"
attr(ds$ZG01_02,"2") = "selten [2]"
attr(ds$ZG01_02,"3") = "hin und wieder [3]"
attr(ds$ZG01_02,"4") = "haeufig [4]"
attr(ds$ZG01_02,"5") = "sehr haeufig [5]"
attr(ds$ZG01_02,"-1") = "weiss nicht"
attr(ds$ZG01_02,"-2") = "keine Angabe"
attr(ds$ZG01_04,"1") = "gar nicht [1]"
attr(ds$ZG01_04,"2") = "selten [2]"
attr(ds$ZG01_04,"3") = "hin und wieder [3]"
attr(ds$ZG01_04,"4") = "haeufig [4]"
attr(ds$ZG01_04,"5") = "sehr haeufig [5]"
attr(ds$ZG01_04,"-1") = "weiss nicht"
attr(ds$ZG01_04,"-2") = "keine Angabe"
attr(ds$ZG01_05,"1") = "gar nicht [1]"
attr(ds$ZG01_05,"2") = "selten [2]"
attr(ds$ZG01_05,"3") = "hin und wieder [3]"
attr(ds$ZG01_05,"4") = "haeufig [4]"
attr(ds$ZG01_05,"5") = "sehr haeufig [5]"
attr(ds$ZG01_05,"-1") = "weiss nicht"
attr(ds$ZG01_05,"-2") = "keine Angabe"
attr(ds$ZG01_06,"1") = "gar nicht [1]"
attr(ds$ZG01_06,"2") = "selten [2]"
attr(ds$ZG01_06,"3") = "hin und wieder [3]"
attr(ds$ZG01_06,"4") = "haeufig [4]"
attr(ds$ZG01_06,"5") = "sehr haeufig [5]"
attr(ds$ZG01_06,"-1") = "weiss nicht"
attr(ds$ZG01_06,"-2") = "keine Angabe"
attr(ds$ZG01_07,"1") = "gar nicht [1]"
attr(ds$ZG01_07,"2") = "selten [2]"
attr(ds$ZG01_07,"3") = "hin und wieder [3]"
attr(ds$ZG01_07,"4") = "haeufig [4]"
attr(ds$ZG01_07,"5") = "sehr haeufig [5]"
attr(ds$ZG01_07,"-1") = "weiss nicht"
attr(ds$ZG01_07,"-2") = "keine Angabe"
attr(ds$ZG01_08,"1") = "gar nicht [1]"
attr(ds$ZG01_08,"2") = "selten [2]"
attr(ds$ZG01_08,"3") = "hin und wieder [3]"
attr(ds$ZG01_08,"4") = "haeufig [4]"
attr(ds$ZG01_08,"5") = "sehr haeufig [5]"
attr(ds$ZG01_08,"-1") = "weiss nicht"
attr(ds$ZG01_08,"-2") = "keine Angabe"
attr(ds$ZG01_10,"1") = "gar nicht [1]"
attr(ds$ZG01_10,"2") = "selten [2]"
attr(ds$ZG01_10,"3") = "hin und wieder [3]"
attr(ds$ZG01_10,"4") = "haeufig [4]"
attr(ds$ZG01_10,"5") = "sehr haeufig [5]"
attr(ds$ZG01_10,"-1") = "weiss nicht"
attr(ds$ZG01_10,"-2") = "keine Angabe"
attr(ds$FI01_02a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_03a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_04a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_05a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_06a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_07a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_08a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_09a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_10a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_11a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_12a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_13a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_14a,"-1") = "Keine Messung moeglich"
attr(ds$FI01_15a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_02a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_03a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_04a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_05a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_06a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_07a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_08a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_09a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_10a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_11a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_12a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_13a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_14a,"-1") = "Keine Messung moeglich"
attr(ds$FI02_15a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_02a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_03a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_04a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_05a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_06a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_07a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_08a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_09a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_10a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_11a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_12a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_13a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_14a,"-1") = "Keine Messung moeglich"
attr(ds$FI03_15a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_02a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_03a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_04a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_05a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_06a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_07a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_08a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_09a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_10a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_11a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_12a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_13a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_14a,"-1") = "Keine Messung moeglich"
attr(ds$FI04_15a,"-1") = "Keine Messung moeglich"
attr(ds$FI06,"1") = "FI01"
attr(ds$FI06,"2") = "FI02"
attr(ds$FI06,"3") = "FI03"
attr(ds$FI06,"4") = "FI04"
attr(ds$DQ01_01,"1") = "Ja"
attr(ds$DQ01_01,"2") = "Nein"
attr(ds$DQ01_01,"-1") = "weiss nicht"
attr(ds$DQ01_01,"-2") = "keine Angabe"
attr(ds$DQ02_01,"1") = "Ja"
attr(ds$DQ02_01,"2") = "Nein"
attr(ds$DQ02_01,"-1") = "weiss nicht"
attr(ds$DQ02_01,"-2") = "keine Angabe"
attr(ds$DQ02_02,"1") = "Ja"
attr(ds$DQ02_02,"2") = "Nein"
attr(ds$DQ02_02,"-1") = "weiss nicht"
attr(ds$DQ02_02,"-2") = "keine Angabe"
attr(ds$DQ02_03,"1") = "Ja"
attr(ds$DQ02_03,"2") = "Nein"
attr(ds$DQ02_03,"-1") = "weiss nicht"
attr(ds$DQ02_03,"-2") = "keine Angabe"
attr(ds$DQ02_04,"1") = "Ja"
attr(ds$DQ02_04,"2") = "Nein"
attr(ds$DQ02_04,"-1") = "weiss nicht"
attr(ds$DQ02_04,"-2") = "keine Angabe"
attr(ds$DQ02_05,"1") = "Ja"
attr(ds$DQ02_05,"2") = "Nein"
attr(ds$DQ02_05,"-1") = "weiss nicht"
attr(ds$DQ02_05,"-2") = "keine Angabe"
attr(ds$DQ03_01,"1") = "wahr"
attr(ds$DQ03_01,"2") = "falsch"
attr(ds$DQ03_01,"-1") = "weiss nicht"
attr(ds$DQ03_01,"-2") = "keine Angabe"
attr(ds$DQ03_02,"1") = "wahr"
attr(ds$DQ03_02,"2") = "falsch"
attr(ds$DQ03_02,"-1") = "weiss nicht"
attr(ds$DQ03_02,"-2") = "keine Angabe"
attr(ds$DQ03_03,"1") = "wahr"
attr(ds$DQ03_03,"2") = "falsch"
attr(ds$DQ03_03,"-1") = "weiss nicht"
attr(ds$DQ03_03,"-2") = "keine Angabe"
attr(ds$DQ03_04,"1") = "wahr"
attr(ds$DQ03_04,"2") = "falsch"
attr(ds$DQ03_04,"-1") = "weiss nicht"
attr(ds$DQ03_04,"-2") = "keine Angabe"
attr(ds$DQ04_01,"1") = "ueberhaupt nicht [1]"
attr(ds$DQ04_01,"2") = "[2]"
attr(ds$DQ04_01,"3") = "[3]"
attr(ds$DQ04_01,"4") = "[4]"
attr(ds$DQ04_01,"5") = "sehr stark [5]"
attr(ds$DQ04_01,"-1") = "weiss nicht"
attr(ds$DQ04_01,"-2") = "keine Angabe"
attr(ds$DQ05_01,"1") = "Sehr links [0]"
attr(ds$DQ05_01,"2") = " [1]"
attr(ds$DQ05_01,"3") = " [2]"
attr(ds$DQ05_01,"4") = " [3]"
attr(ds$DQ05_01,"5") = " [4]"
attr(ds$DQ05_01,"6") = "Mitte [5]"
attr(ds$DQ05_01,"7") = " [6]"
attr(ds$DQ05_01,"8") = " [7]"
attr(ds$DQ05_01,"9") = " [8]"
attr(ds$DQ05_01,"10") = " [9]"
attr(ds$DQ05_01,"11") = "Sehr rechts [10]"
attr(ds$DQ05_01,"-1") = "weiss nicht"
attr(ds$DQ05_01,"-2") = "keine Angabe"
attr(ds$DQ09_01,"1") = "Ja"
attr(ds$DQ09_01,"2") = "Nein"
attr(ds$DQ09_01,"-1") = "weiss nicht"
attr(ds$DQ09_01,"-2") = "keine Angabe"
attr(ds$DQ09_02,"1") = "Ja"
attr(ds$DQ09_02,"2") = "Nein"
attr(ds$DQ09_02,"-1") = "weiss nicht"
attr(ds$DQ09_02,"-2") = "keine Angabe"
attr(ds$DQ09_03,"1") = "Ja"
attr(ds$DQ09_03,"2") = "Nein"
attr(ds$DQ09_03,"-1") = "weiss nicht"
attr(ds$DQ09_03,"-2") = "keine Angabe"
attr(ds$DQ09_04,"1") = "Ja"
attr(ds$DQ09_04,"2") = "Nein"
attr(ds$DQ09_04,"-1") = "weiss nicht"
attr(ds$DQ09_04,"-2") = "keine Angabe"
attr(ds$DQ10_01,"1") = "Ja"
attr(ds$DQ10_01,"2") = "Nein"
attr(ds$DQ10_01,"-1") = "weiss nicht"
attr(ds$DQ10_01,"-2") = "keine Angabe"
attr(ds$DQ13_01a,"F") = "nicht gewaehlt"
attr(ds$DQ13_01a,"T") = "ausgewaehlt"
attr(ds$DQ14_01,"1") = "Ja"
attr(ds$DQ14_01,"2") = "Nein"
attr(ds$DQ14_01,"-1") = "weiss nicht"
attr(ds$DQ14_01,"-2") = "keine Angabe"
attr(ds$DQ14_02,"1") = "Ja"
attr(ds$DQ14_02,"2") = "Nein"
attr(ds$DQ14_02,"-1") = "weiss nicht"
attr(ds$DQ14_02,"-2") = "keine Angabe"
attr(ds$DQ14_03,"1") = "Ja"
attr(ds$DQ14_03,"2") = "Nein"
attr(ds$DQ14_03,"-1") = "weiss nicht"
attr(ds$DQ14_03,"-2") = "keine Angabe"
attr(ds$DQ14_04,"1") = "Ja"
attr(ds$DQ14_04,"2") = "Nein"
attr(ds$DQ14_04,"-1") = "weiss nicht"
attr(ds$DQ14_04,"-2") = "keine Angabe"
attr(ds$DQ15_01a,"F") = "nicht gewaehlt"
attr(ds$DQ15_01a,"T") = "ausgewaehlt"
attr(ds$DQ15_02a,"F") = "nicht gewaehlt"
attr(ds$DQ15_02a,"T") = "ausgewaehlt"
attr(ds$DQ15_03a,"F") = "nicht gewaehlt"
attr(ds$DQ15_03a,"T") = "ausgewaehlt"
attr(ds$LL09_01,"1") = "0"
attr(ds$LL09_01,"2") = "1"
attr(ds$LL09_01,"3") = "2"
attr(ds$LL09_01,"4") = "3"
attr(ds$LL09_01,"5") = "4"
attr(ds$LL09_01,"-1") = "weiss nicht"
attr(ds$LL09_01,"-2") = "keine Angabe"
attr(ds$LL09_02,"1") = "0"
attr(ds$LL09_02,"2") = "1"
attr(ds$LL09_02,"3") = "2"
attr(ds$LL09_02,"4") = "3"
attr(ds$LL09_02,"5") = "4"
attr(ds$LL09_02,"-1") = "weiss nicht"
attr(ds$LL09_02,"-2") = "keine Angabe"
attr(ds$LL09_03,"1") = "0"
attr(ds$LL09_03,"2") = "1"
attr(ds$LL09_03,"3") = "2"
attr(ds$LL09_03,"4") = "3"
attr(ds$LL09_03,"5") = "4"
attr(ds$LL09_03,"-1") = "weiss nicht"
attr(ds$LL09_03,"-2") = "keine Angabe"
attr(ds$LL09_04,"1") = "0"
attr(ds$LL09_04,"2") = "1"
attr(ds$LL09_04,"3") = "2"
attr(ds$LL09_04,"4") = "3"
attr(ds$LL09_04,"5") = "4"
attr(ds$LL09_04,"-1") = "weiss nicht"
attr(ds$LL09_04,"-2") = "keine Angabe"
attr(ds$LL13_01a,"F") = "nicht gewaehlt"
attr(ds$LL13_01a,"T") = "ausgewaehlt"
attr(ds$LL14_01,"1") = "0"
attr(ds$LL14_01,"2") = "1"
attr(ds$LL14_01,"3") = "2"
attr(ds$LL14_01,"4") = "3"
attr(ds$LL14_01,"5") = "4"
attr(ds$LL14_01,"-1") = "weiss nicht"
attr(ds$LL14_01,"-2") = "keine Angabe"
attr(ds$LL14_02,"1") = "0"
attr(ds$LL14_02,"2") = "1"
attr(ds$LL14_02,"3") = "2"
attr(ds$LL14_02,"4") = "3"
attr(ds$LL14_02,"5") = "4"
attr(ds$LL14_02,"-1") = "weiss nicht"
attr(ds$LL14_02,"-2") = "keine Angabe"
attr(ds$LL14_03,"1") = "0"
attr(ds$LL14_03,"2") = "1"
attr(ds$LL14_03,"3") = "2"
attr(ds$LL14_03,"4") = "3"
attr(ds$LL14_03,"5") = "4"
attr(ds$LL14_03,"-1") = "weiss nicht"
attr(ds$LL14_03,"-2") = "keine Angabe"
attr(ds$LL14_04,"1") = "0"
attr(ds$LL14_04,"2") = "1"
attr(ds$LL14_04,"3") = "2"
attr(ds$LL14_04,"4") = "3"
attr(ds$LL14_04,"5") = "4"
attr(ds$LL14_04,"-1") = "weiss nicht"
attr(ds$LL14_04,"-2") = "keine Angabe"
attr(ds$LL15_01a,"F") = "nicht gewaehlt"
attr(ds$LL15_01a,"T") = "ausgewaehlt"
attr(ds$LL16_01a,"F") = "nicht gewaehlt"
attr(ds$LL16_01a,"T") = "ausgewaehlt"
attr(ds$LL19_01a,"F") = "nicht gewaehlt"
attr(ds$LL19_01a,"T") = "ausgewaehlt"
attr(ds$LL20_01a,"F") = "nicht gewaehlt"
attr(ds$LL20_01a,"T") = "ausgewaehlt"
attr(ds$SL09_01,"1") = "0"
attr(ds$SL09_01,"2") = "1"
attr(ds$SL09_01,"3") = "2"
attr(ds$SL09_01,"4") = "3"
attr(ds$SL09_01,"-1") = "weiss nicht"
attr(ds$SL09_01,"-2") = "keine Angabe"
attr(ds$SL09_02,"1") = "0"
attr(ds$SL09_02,"2") = "1"
attr(ds$SL09_02,"3") = "2"
attr(ds$SL09_02,"4") = "3"
attr(ds$SL09_02,"-1") = "weiss nicht"
attr(ds$SL09_02,"-2") = "keine Angabe"
attr(ds$SL09_03,"1") = "0"
attr(ds$SL09_03,"2") = "1"
attr(ds$SL09_03,"3") = "2"
attr(ds$SL09_03,"4") = "3"
attr(ds$SL09_03,"-1") = "weiss nicht"
attr(ds$SL09_03,"-2") = "keine Angabe"
attr(ds$SL09_04,"1") = "0"
attr(ds$SL09_04,"2") = "1"
attr(ds$SL09_04,"3") = "2"
attr(ds$SL09_04,"4") = "3"
attr(ds$SL09_04,"-1") = "weiss nicht"
attr(ds$SL09_04,"-2") = "keine Angabe"
attr(ds$SL13_01a,"F") = "nicht gewaehlt"
attr(ds$SL13_01a,"T") = "ausgewaehlt"
attr(ds$SL14_01,"1") = "0"
attr(ds$SL14_01,"2") = "1"
attr(ds$SL14_01,"3") = "2"
attr(ds$SL14_01,"4") = "3"
attr(ds$SL14_01,"-1") = "weiss nicht"
attr(ds$SL14_01,"-2") = "keine Angabe"
attr(ds$SL14_02,"1") = "0"
attr(ds$SL14_02,"2") = "1"
attr(ds$SL14_02,"3") = "2"
attr(ds$SL14_02,"4") = "3"
attr(ds$SL14_02,"-1") = "weiss nicht"
attr(ds$SL14_02,"-2") = "keine Angabe"
attr(ds$SL14_03,"1") = "0"
attr(ds$SL14_03,"2") = "1"
attr(ds$SL14_03,"3") = "2"
attr(ds$SL14_03,"4") = "3"
attr(ds$SL14_03,"-1") = "weiss nicht"
attr(ds$SL14_03,"-2") = "keine Angabe"
attr(ds$SL14_04,"1") = "0"
attr(ds$SL14_04,"2") = "1"
attr(ds$SL14_04,"3") = "2"
attr(ds$SL14_04,"4") = "3"
attr(ds$SL14_04,"-1") = "weiss nicht"
attr(ds$SL14_04,"-2") = "keine Angabe"
attr(ds$SL15_01a,"F") = "nicht gewaehlt"
attr(ds$SL15_01a,"T") = "ausgewaehlt"
attr(ds$SL16_01a,"F") = "nicht gewaehlt"
attr(ds$SL16_01a,"T") = "ausgewaehlt"
attr(ds$SL19_01a,"F") = "nicht gewaehlt"
attr(ds$SL19_01a,"T") = "ausgewaehlt"
attr(ds$SL20_01a,"F") = "nicht gewaehlt"
attr(ds$SL20_01a,"T") = "ausgewaehlt"
attr(ds$FG01,"1") = "Faking good"
attr(ds$FG01,"2") = "Faking bad "
attr(ds$FG01,"3") = "No faking "
attr(ds$FG01,"4") = "No faking"
attr(ds$R001,"1") = "DQ"
attr(ds$R001,"2") = "DQ"
attr(ds$R001,"3") = "LL"
attr(ds$R001,"4") = "LL"
attr(ds$R001,"5") = "LL"
attr(ds$R001,"6") = "LL"
attr(ds$R001,"7") = "LL"
attr(ds$R001,"8") = "SL"
attr(ds$R001,"9") = "SL"
attr(ds$R001,"10") = "SL"
attr(ds$R001,"11") = "SL"
attr(ds$R001,"12") = "SL"
attr(ds$FINISHED,"F") = "abgebrochen"
attr(ds$FINISHED,"T") = "ausgefuellt"
attr(ds$Q_VIEWER,"F") = "Teilnehmer"
attr(ds$Q_VIEWER,"T") = "Durchklicker"
comment(ds$SERIAL) = "Seriennummer (sofern verwendet)"
comment(ds$REF) = "Referenz (sofern im Link angegeben)"
comment(ds$QUESTNNR) = "Fragebogen, der im Interview verwendet wurde"
comment(ds$MODE) = "Interview-Modus"
comment(ds$STARTED) = "Zeitpunkt zu dem das Interview begonnen hat (Europe/Berlin)"
comment(ds$XP33_01) = "Xenophobie RL: Ich habe den Eindruck, dass u..."
comment(ds$XP33_01a) = "Xenophobie RL: Ich habe den Eindruck, dass u... Reaktionszeit [ms]"
comment(ds$XP33_02) = "Xenophobie RL: Ich habe den Eindruck, dass u..."
comment(ds$XP33_02a) = "Xenophobie RL: Ich habe den Eindruck, dass u... Reaktionszeit [ms]"
comment(ds$XP33_03) = "Xenophobie RL: Mich aergert es, wenn Muslime ..."
comment(ds$XP33_03a) = "Xenophobie RL: Mich aergert es, wenn Muslime ... Reaktionszeit [ms]"
comment(ds$XP33_04) = "Xenophobie RL: Ich koennte mir vorstellen, mi..."
comment(ds$XP33_04a) = "Xenophobie RL: Ich koennte mir vorstellen, mi... Reaktionszeit [ms]"
comment(ds$XP33_05) = "Xenophobie RL: Die in Deutschland lebenden M..."
comment(ds$XP33_05a) = "Xenophobie RL: Die in Deutschland lebenden M... Reaktionszeit [ms]"
comment(ds$XP33_06) = "Xenophobie RL: Der Islam passt in die deutsc..."
comment(ds$XP33_06a) = "Xenophobie RL: Der Islam passt in die deutsc... Reaktionszeit [ms]"
comment(ds$XP33_07) = "Xenophobie RL: Die Ausuebung des islamischen ..."
comment(ds$XP33_07a) = "Xenophobie RL: Die Ausuebung des islamischen ... Reaktionszeit [ms]"
comment(ds$XP33_08) = "Xenophobie RL: Ich sehe die demokratischen P..."
comment(ds$XP33_08a) = "Xenophobie RL: Ich sehe die demokratischen P... Reaktionszeit [ms]"
comment(ds$XP33_09) = "Xenophobie RL: Ich kann nachvollziehen, wenn..."
comment(ds$XP33_09a) = "Xenophobie RL: Ich kann nachvollziehen, wenn... Reaktionszeit [ms]"
comment(ds$XP33_10) = "Xenophobie RL: Ich empfinde oft Solidaritaet ..."
comment(ds$XP33_10a) = "Xenophobie RL: Ich empfinde oft Solidaritaet ... Reaktionszeit [ms]"
comment(ds$XP33_11) = "Xenophobie RL: Es waere fuer mich in Ordnung w..."
comment(ds$XP33_11a) = "Xenophobie RL: Es waere fuer mich in Ordnung w... Reaktionszeit [ms]"
comment(ds$XP33_12) = "Xenophobie RL: Der Grund dafuer, warum Frauen..."
comment(ds$XP33_12a) = "Xenophobie RL: Der Grund dafuer, warum Frauen... Reaktionszeit [ms]"
comment(ds$XP33_13) = "Xenophobie RL: Es ist mir unangenehm, wenn i..."
comment(ds$XP33_13a) = "Xenophobie RL: Es ist mir unangenehm, wenn i... Reaktionszeit [ms]"
comment(ds$XP33_14) = "Xenophobie RL: Ich habe Mitleid mit homosexu..."
comment(ds$XP33_14a) = "Xenophobie RL: Ich habe Mitleid mit homosexu... Reaktionszeit [ms]"
comment(ds$XP33_15) = "Xenophobie RL: Ich koennte mir vorstellen, mi..."
comment(ds$XP33_15a) = "Xenophobie RL: Ich koennte mir vorstellen, mi... Reaktionszeit [ms]"
comment(ds$XP33_16) = "Xenophobie RL: Die Entwicklung von Kindern l..."
comment(ds$XP33_16a) = "Xenophobie RL: Die Entwicklung von Kindern l... Reaktionszeit [ms]"
comment(ds$XP33_17) = "Xenophobie RL: Juden haben auf der Welt zu v..."
comment(ds$XP33_17a) = "Xenophobie RL: Juden haben auf der Welt zu v... Reaktionszeit [ms]"
comment(ds$XP33_18) = "Xenophobie RL: Juden sind in Deutschland gut..."
comment(ds$XP33_18a) = "Xenophobie RL: Juden sind in Deutschland gut... Reaktionszeit [ms]"
comment(ds$XP33_19) = "Xenophobie RL: Ich wuerde in einem Stadtviert..."
comment(ds$XP33_19a) = "Xenophobie RL: Ich wuerde in einem Stadtviert... Reaktionszeit [ms]"
comment(ds$XP33_20) = "Xenophobie RL: Durch ihr Verhalten sind die ..."
comment(ds$XP33_20a) = "Xenophobie RL: Durch ihr Verhalten sind die ... Reaktionszeit [ms]"
comment(ds$XP33_21) = "Xenophobie RL: Man sollte den in Deutschland..."
comment(ds$XP33_21a) = "Xenophobie RL: Man sollte den in Deutschland... Reaktionszeit [ms]"
comment(ds$XP33_22) = "Xenophobie RL: Auslaender sind eine Bereicher..."
comment(ds$XP33_22a) = "Xenophobie RL: Auslaender sind eine Bereicher... Reaktionszeit [ms]"
comment(ds$XP33_23) = "Xenophobie RL: Ich koennte mir gut vorstellen..."
comment(ds$XP33_23a) = "Xenophobie RL: Ich koennte mir gut vorstellen... Reaktionszeit [ms]"
comment(ds$XP33_24) = "Xenophobie RL: Es ist klar, dass Auslaender h..."
comment(ds$XP33_24a) = "Xenophobie RL: Es ist klar, dass Auslaender h... Reaktionszeit [ms]"
comment(ds$XP33_25) = "Xenophobie RL: Die meisten Asylbewerber komm..."
comment(ds$XP33_25a) = "Xenophobie RL: Die meisten Asylbewerber komm... Reaktionszeit [ms]"
comment(ds$XP33_26) = "Xenophobie RL: Ich habe Mitgefuehl fuer die No..."
comment(ds$XP33_26a) = "Xenophobie RL: Ich habe Mitgefuehl fuer die No... Reaktionszeit [ms]"
comment(ds$XP33_27) = "Xenophobie RL: Es waere fuer mich in Ordnung w..."
comment(ds$XP33_27a) = "Xenophobie RL: Es waere fuer mich in Ordnung w... Reaktionszeit [ms]"
comment(ds$XP33_28) = "Xenophobie RL: Die moralischen und religioese..."
comment(ds$XP33_28a) = "Xenophobie RL: Die moralischen und religioese... Reaktionszeit [ms]"
comment(ds$XP33_29) = "Xenophobie RL: Viele Foerderungen von Behinde..."
comment(ds$XP33_29a) = "Xenophobie RL: Viele Foerderungen von Behinde... Reaktionszeit [ms]"
comment(ds$XP33_30) = "Xenophobie RL: Die Paralympischen Spiele sin..."
comment(ds$XP33_30a) = "Xenophobie RL: Die Paralympischen Spiele sin... Reaktionszeit [ms]"
comment(ds$XP33_31) = "Xenophobie RL: Ich finde es okay, wenn ein M..."
comment(ds$XP33_31a) = "Xenophobie RL: Ich finde es okay, wenn ein M... Reaktionszeit [ms]"
comment(ds$XP33_32) = "Xenophobie RL: Ich finde, dass geistig behin..."
comment(ds$XP33_32a) = "Xenophobie RL: Ich finde, dass geistig behin... Reaktionszeit [ms]"
comment(ds$XP33_33) = "Xenophobie RL: Uebergewichtige Menschen in De..."
comment(ds$XP33_33a) = "Xenophobie RL: Uebergewichtige Menschen in De... Reaktionszeit [ms]"
comment(ds$XP33_34) = "Xenophobie RL: Das Gewicht einer Person sagt..."
comment(ds$XP33_34a) = "Xenophobie RL: Das Gewicht einer Person sagt... Reaktionszeit [ms]"
comment(ds$XP33_35) = "Xenophobie RL: Ich kann mir gut vorstellen m..."
comment(ds$XP33_35a) = "Xenophobie RL: Ich kann mir gut vorstellen m... Reaktionszeit [ms]"
comment(ds$XP33_36) = "Xenophobie RL: Uebergewichtige Menschen sind ..."
comment(ds$XP33_36a) = "Xenophobie RL: Uebergewichtige Menschen sind ... Reaktionszeit [ms]"
comment(ds$XP34_01) = "Xenophobie RL FAKE: Ich habe den Eindruck, dass u..."
comment(ds$XP34_01a) = "Xenophobie RL FAKE: Ich habe den Eindruck, dass u... Reaktionszeit [ms]"
comment(ds$XP34_02) = "Xenophobie RL FAKE: Ich habe den Eindruck, dass u..."
comment(ds$XP34_02a) = "Xenophobie RL FAKE: Ich habe den Eindruck, dass u... Reaktionszeit [ms]"
comment(ds$XP34_03) = "Xenophobie RL FAKE: Mich aergert es, wenn Muslime ..."
comment(ds$XP34_03a) = "Xenophobie RL FAKE: Mich aergert es, wenn Muslime ... Reaktionszeit [ms]"
comment(ds$XP34_04) = "Xenophobie RL FAKE: Ich koennte mir vorstellen, mi..."
comment(ds$XP34_04a) = "Xenophobie RL FAKE: Ich koennte mir vorstellen, mi... Reaktionszeit [ms]"
comment(ds$XP34_05) = "Xenophobie RL FAKE: Die in Deutschland lebenden M..."
comment(ds$XP34_05a) = "Xenophobie RL FAKE: Die in Deutschland lebenden M... Reaktionszeit [ms]"
comment(ds$XP34_06) = "Xenophobie RL FAKE: Der Islam passt in die deutsc..."
comment(ds$XP34_06a) = "Xenophobie RL FAKE: Der Islam passt in die deutsc... Reaktionszeit [ms]"
comment(ds$XP34_07) = "Xenophobie RL FAKE: Die Ausuebung des islamischen ..."
comment(ds$XP34_07a) = "Xenophobie RL FAKE: Die Ausuebung des islamischen ... Reaktionszeit [ms]"
comment(ds$XP34_08) = "Xenophobie RL FAKE: Ich sehe die demokratischen P..."
comment(ds$XP34_08a) = "Xenophobie RL FAKE: Ich sehe die demokratischen P... Reaktionszeit [ms]"
comment(ds$XP34_09) = "Xenophobie RL FAKE: Ich kann nachvollziehen, wenn..."
comment(ds$XP34_09a) = "Xenophobie RL FAKE: Ich kann nachvollziehen, wenn... Reaktionszeit [ms]"
comment(ds$XP34_10) = "Xenophobie RL FAKE: Ich empfinde oft Solidaritaet ..."
comment(ds$XP34_10a) = "Xenophobie RL FAKE: Ich empfinde oft Solidaritaet ... Reaktionszeit [ms]"
comment(ds$XP34_11) = "Xenophobie RL FAKE: Es waere fuer mich in Ordnung w..."
comment(ds$XP34_11a) = "Xenophobie RL FAKE: Es waere fuer mich in Ordnung w... Reaktionszeit [ms]"
comment(ds$XP34_12) = "Xenophobie RL FAKE: Der Grund dafuer, warum Frauen..."
comment(ds$XP34_12a) = "Xenophobie RL FAKE: Der Grund dafuer, warum Frauen... Reaktionszeit [ms]"
comment(ds$XP34_13) = "Xenophobie RL FAKE: Es ist mir unangenehm, wenn i..."
comment(ds$XP34_13a) = "Xenophobie RL FAKE: Es ist mir unangenehm, wenn i... Reaktionszeit [ms]"
comment(ds$XP34_14) = "Xenophobie RL FAKE: Ich habe Mitleid mit homosexu..."
comment(ds$XP34_14a) = "Xenophobie RL FAKE: Ich habe Mitleid mit homosexu... Reaktionszeit [ms]"
comment(ds$XP34_15) = "Xenophobie RL FAKE: Ich koennte mir vorstellen, mi..."
comment(ds$XP34_15a) = "Xenophobie RL FAKE: Ich koennte mir vorstellen, mi... Reaktionszeit [ms]"
comment(ds$XP34_16) = "Xenophobie RL FAKE: Die Entwicklung von Kindern l..."
comment(ds$XP34_16a) = "Xenophobie RL FAKE: Die Entwicklung von Kindern l... Reaktionszeit [ms]"
comment(ds$XP34_17) = "Xenophobie RL FAKE: Juden haben auf der Welt zu v..."
comment(ds$XP34_17a) = "Xenophobie RL FAKE: Juden haben auf der Welt zu v... Reaktionszeit [ms]"
comment(ds$XP34_18) = "Xenophobie RL FAKE: Juden sind in Deutschland gut..."
comment(ds$XP34_18a) = "Xenophobie RL FAKE: Juden sind in Deutschland gut... Reaktionszeit [ms]"
comment(ds$XP34_19) = "Xenophobie RL FAKE: Ich wuerde in einem Stadtviert..."
comment(ds$XP34_19a) = "Xenophobie RL FAKE: Ich wuerde in einem Stadtviert... Reaktionszeit [ms]"
comment(ds$XP34_20) = "Xenophobie RL FAKE: Durch ihr Verhalten sind die ..."
comment(ds$XP34_20a) = "Xenophobie RL FAKE: Durch ihr Verhalten sind die ... Reaktionszeit [ms]"
comment(ds$XP34_21) = "Xenophobie RL FAKE: Man sollte den in Deutschland..."
comment(ds$XP34_21a) = "Xenophobie RL FAKE: Man sollte den in Deutschland... Reaktionszeit [ms]"
comment(ds$XP34_22) = "Xenophobie RL FAKE: Auslaender sind eine Bereicher..."
comment(ds$XP34_22a) = "Xenophobie RL FAKE: Auslaender sind eine Bereicher... Reaktionszeit [ms]"
comment(ds$XP34_23) = "Xenophobie RL FAKE: Ich koennte mir gut vorstellen..."
comment(ds$XP34_23a) = "Xenophobie RL FAKE: Ich koennte mir gut vorstellen... Reaktionszeit [ms]"
comment(ds$XP34_24) = "Xenophobie RL FAKE: Es ist klar, dass Auslaender h..."
comment(ds$XP34_24a) = "Xenophobie RL FAKE: Es ist klar, dass Auslaender h... Reaktionszeit [ms]"
comment(ds$XP34_25) = "Xenophobie RL FAKE: Die meisten Asylbewerber komm..."
comment(ds$XP34_25a) = "Xenophobie RL FAKE: Die meisten Asylbewerber komm... Reaktionszeit [ms]"
comment(ds$XP34_26) = "Xenophobie RL FAKE: Ich habe Mitgefuehl fuer die No..."
comment(ds$XP34_26a) = "Xenophobie RL FAKE: Ich habe Mitgefuehl fuer die No... Reaktionszeit [ms]"
comment(ds$XP34_27) = "Xenophobie RL FAKE: Es waere fuer mich in Ordnung w..."
comment(ds$XP34_27a) = "Xenophobie RL FAKE: Es waere fuer mich in Ordnung w... Reaktionszeit [ms]"
comment(ds$XP34_28) = "Xenophobie RL FAKE: Die moralischen und religioese..."
comment(ds$XP34_28a) = "Xenophobie RL FAKE: Die moralischen und religioese... Reaktionszeit [ms]"
comment(ds$XP34_29) = "Xenophobie RL FAKE: Viele Foerderungen von Behinde..."
comment(ds$XP34_29a) = "Xenophobie RL FAKE: Viele Foerderungen von Behinde... Reaktionszeit [ms]"
comment(ds$XP34_30) = "Xenophobie RL FAKE: Die Paralympischen Spiele sin..."
comment(ds$XP34_30a) = "Xenophobie RL FAKE: Die Paralympischen Spiele sin... Reaktionszeit [ms]"
comment(ds$XP34_31) = "Xenophobie RL FAKE: Ich finde es okay, wenn ein M..."
comment(ds$XP34_31a) = "Xenophobie RL FAKE: Ich finde es okay, wenn ein M... Reaktionszeit [ms]"
comment(ds$XP34_32) = "Xenophobie RL FAKE: Ich finde, dass geistig behin..."
comment(ds$XP34_32a) = "Xenophobie RL FAKE: Ich finde, dass geistig behin... Reaktionszeit [ms]"
comment(ds$XP34_33) = "Xenophobie RL FAKE: Uebergewichtige Menschen in De..."
comment(ds$XP34_33a) = "Xenophobie RL FAKE: Uebergewichtige Menschen in De... Reaktionszeit [ms]"
comment(ds$XP34_34) = "Xenophobie RL FAKE: Das Gewicht einer Person sagt..."
comment(ds$XP34_34a) = "Xenophobie RL FAKE: Das Gewicht einer Person sagt... Reaktionszeit [ms]"
comment(ds$XP34_35) = "Xenophobie RL FAKE: Ich kann mir gut vorstellen m..."
comment(ds$XP34_35a) = "Xenophobie RL FAKE: Ich kann mir gut vorstellen m... Reaktionszeit [ms]"
comment(ds$XP34_36) = "Xenophobie RL FAKE: Uebergewichtige Menschen sind ..."
comment(ds$XP34_36a) = "Xenophobie RL FAKE: Uebergewichtige Menschen sind ... Reaktionszeit [ms]"
comment(ds$XP35_01) = "Xenophobie RL FAKE BAD: Ich habe den Eindruck, dass u..."
comment(ds$XP35_01a) = "Xenophobie RL FAKE BAD: Ich habe den Eindruck, dass u... Reaktionszeit [ms]"
comment(ds$XP35_02) = "Xenophobie RL FAKE BAD: Ich habe den Eindruck, dass u..."
comment(ds$XP35_02a) = "Xenophobie RL FAKE BAD: Ich habe den Eindruck, dass u... Reaktionszeit [ms]"
comment(ds$XP35_03) = "Xenophobie RL FAKE BAD: Mich aergert es, wenn Muslime ..."
comment(ds$XP35_03a) = "Xenophobie RL FAKE BAD: Mich aergert es, wenn Muslime ... Reaktionszeit [ms]"
comment(ds$XP35_04) = "Xenophobie RL FAKE BAD: Ich koennte mir vorstellen, mi..."
comment(ds$XP35_04a) = "Xenophobie RL FAKE BAD: Ich koennte mir vorstellen, mi... Reaktionszeit [ms]"
comment(ds$XP35_05) = "Xenophobie RL FAKE BAD: Die in Deutschland lebenden M..."
comment(ds$XP35_05a) = "Xenophobie RL FAKE BAD: Die in Deutschland lebenden M... Reaktionszeit [ms]"
comment(ds$XP35_06) = "Xenophobie RL FAKE BAD: Der Islam passt in die deutsc..."
comment(ds$XP35_06a) = "Xenophobie RL FAKE BAD: Der Islam passt in die deutsc... Reaktionszeit [ms]"
comment(ds$XP35_07) = "Xenophobie RL FAKE BAD: Die Ausuebung des islamischen ..."
comment(ds$XP35_07a) = "Xenophobie RL FAKE BAD: Die Ausuebung des islamischen ... Reaktionszeit [ms]"
comment(ds$XP35_08) = "Xenophobie RL FAKE BAD: Ich sehe die demokratischen P..."
comment(ds$XP35_08a) = "Xenophobie RL FAKE BAD: Ich sehe die demokratischen P... Reaktionszeit [ms]"
comment(ds$XP35_09) = "Xenophobie RL FAKE BAD: Ich kann nachvollziehen, wenn..."
comment(ds$XP35_09a) = "Xenophobie RL FAKE BAD: Ich kann nachvollziehen, wenn... Reaktionszeit [ms]"
comment(ds$XP35_10) = "Xenophobie RL FAKE BAD: Ich empfinde oft Solidaritaet ..."
comment(ds$XP35_10a) = "Xenophobie RL FAKE BAD: Ich empfinde oft Solidaritaet ... Reaktionszeit [ms]"
comment(ds$XP35_11) = "Xenophobie RL FAKE BAD: Es waere fuer mich in Ordnung w..."
comment(ds$XP35_11a) = "Xenophobie RL FAKE BAD: Es waere fuer mich in Ordnung w... Reaktionszeit [ms]"
comment(ds$XP35_12) = "Xenophobie RL FAKE BAD: Der Grund dafuer, warum Frauen..."
comment(ds$XP35_12a) = "Xenophobie RL FAKE BAD: Der Grund dafuer, warum Frauen... Reaktionszeit [ms]"
comment(ds$XP35_13) = "Xenophobie RL FAKE BAD: Es ist mir unangenehm, wenn i..."
comment(ds$XP35_13a) = "Xenophobie RL FAKE BAD: Es ist mir unangenehm, wenn i... Reaktionszeit [ms]"
comment(ds$XP35_14) = "Xenophobie RL FAKE BAD: Ich habe Mitleid mit homosexu..."
comment(ds$XP35_14a) = "Xenophobie RL FAKE BAD: Ich habe Mitleid mit homosexu... Reaktionszeit [ms]"
comment(ds$XP35_15) = "Xenophobie RL FAKE BAD: Ich koennte mir vorstellen, mi..."
comment(ds$XP35_15a) = "Xenophobie RL FAKE BAD: Ich koennte mir vorstellen, mi... Reaktionszeit [ms]"
comment(ds$XP35_16) = "Xenophobie RL FAKE BAD: Die Entwicklung von Kindern l..."
comment(ds$XP35_16a) = "Xenophobie RL FAKE BAD: Die Entwicklung von Kindern l... Reaktionszeit [ms]"
comment(ds$XP35_17) = "Xenophobie RL FAKE BAD: Juden haben auf der Welt zu v..."
comment(ds$XP35_17a) = "Xenophobie RL FAKE BAD: Juden haben auf der Welt zu v... Reaktionszeit [ms]"
comment(ds$XP35_18) = "Xenophobie RL FAKE BAD: Juden sind in Deutschland gut..."
comment(ds$XP35_18a) = "Xenophobie RL FAKE BAD: Juden sind in Deutschland gut... Reaktionszeit [ms]"
comment(ds$XP35_19) = "Xenophobie RL FAKE BAD: Ich wuerde in einem Stadtviert..."
comment(ds$XP35_19a) = "Xenophobie RL FAKE BAD: Ich wuerde in einem Stadtviert... Reaktionszeit [ms]"
comment(ds$XP35_20) = "Xenophobie RL FAKE BAD: Durch ihr Verhalten sind die ..."
comment(ds$XP35_20a) = "Xenophobie RL FAKE BAD: Durch ihr Verhalten sind die ... Reaktionszeit [ms]"
comment(ds$XP35_21) = "Xenophobie RL FAKE BAD: Man sollte den in Deutschland..."
comment(ds$XP35_21a) = "Xenophobie RL FAKE BAD: Man sollte den in Deutschland... Reaktionszeit [ms]"
comment(ds$XP35_22) = "Xenophobie RL FAKE BAD: Auslaender sind eine Bereicher..."
comment(ds$XP35_22a) = "Xenophobie RL FAKE BAD: Auslaender sind eine Bereicher... Reaktionszeit [ms]"
comment(ds$XP35_23) = "Xenophobie RL FAKE BAD: Ich koennte mir gut vorstellen..."
comment(ds$XP35_23a) = "Xenophobie RL FAKE BAD: Ich koennte mir gut vorstellen... Reaktionszeit [ms]"
comment(ds$XP35_24) = "Xenophobie RL FAKE BAD: Es ist klar, dass Auslaender h..."
comment(ds$XP35_24a) = "Xenophobie RL FAKE BAD: Es ist klar, dass Auslaender h... Reaktionszeit [ms]"
comment(ds$XP35_25) = "Xenophobie RL FAKE BAD: Die meisten Asylbewerber komm..."
comment(ds$XP35_25a) = "Xenophobie RL FAKE BAD: Die meisten Asylbewerber komm... Reaktionszeit [ms]"
comment(ds$XP35_26) = "Xenophobie RL FAKE BAD: Ich habe Mitgefuehl fuer die No..."
comment(ds$XP35_26a) = "Xenophobie RL FAKE BAD: Ich habe Mitgefuehl fuer die No... Reaktionszeit [ms]"
comment(ds$XP35_27) = "Xenophobie RL FAKE BAD: Es waere fuer mich in Ordnung w..."
comment(ds$XP35_27a) = "Xenophobie RL FAKE BAD: Es waere fuer mich in Ordnung w... Reaktionszeit [ms]"
comment(ds$XP35_28) = "Xenophobie RL FAKE BAD: Die moralischen und religioese..."
comment(ds$XP35_28a) = "Xenophobie RL FAKE BAD: Die moralischen und religioese... Reaktionszeit [ms]"
comment(ds$XP35_29) = "Xenophobie RL FAKE BAD: Viele Foerderungen von Behinde..."
comment(ds$XP35_29a) = "Xenophobie RL FAKE BAD: Viele Foerderungen von Behinde... Reaktionszeit [ms]"
comment(ds$XP35_30) = "Xenophobie RL FAKE BAD: Die Paralympischen Spiele sin..."
comment(ds$XP35_30a) = "Xenophobie RL FAKE BAD: Die Paralympischen Spiele sin... Reaktionszeit [ms]"
comment(ds$XP35_31) = "Xenophobie RL FAKE BAD: Ich finde es okay, wenn ein M..."
comment(ds$XP35_31a) = "Xenophobie RL FAKE BAD: Ich finde es okay, wenn ein M... Reaktionszeit [ms]"
comment(ds$XP35_32) = "Xenophobie RL FAKE BAD: Ich finde, dass geistig behin..."
comment(ds$XP35_32a) = "Xenophobie RL FAKE BAD: Ich finde, dass geistig behin... Reaktionszeit [ms]"
comment(ds$XP35_33) = "Xenophobie RL FAKE BAD: Uebergewichtige Menschen in De..."
comment(ds$XP35_33a) = "Xenophobie RL FAKE BAD: Uebergewichtige Menschen in De... Reaktionszeit [ms]"
comment(ds$XP35_34) = "Xenophobie RL FAKE BAD: Das Gewicht einer Person sagt..."
comment(ds$XP35_34a) = "Xenophobie RL FAKE BAD: Das Gewicht einer Person sagt... Reaktionszeit [ms]"
comment(ds$XP35_35) = "Xenophobie RL FAKE BAD: Ich kann mir gut vorstellen m..."
comment(ds$XP35_35a) = "Xenophobie RL FAKE BAD: Ich kann mir gut vorstellen m... Reaktionszeit [ms]"
comment(ds$XP35_36) = "Xenophobie RL FAKE BAD: Uebergewichtige Menschen sind ..."
comment(ds$XP35_36a) = "Xenophobie RL FAKE BAD: Uebergewichtige Menschen sind ... Reaktionszeit [ms]"
comment(ds$SD35_01) = "SD_heikel: keine Nachrichten im oeffentli..."
comment(ds$SD35_01a) = "SD_heikel: keine Nachrichten im oeffentli... Reaktionszeit [ms]"
comment(ds$SD35_02) = "SD_heikel: nur wenige Politiker mit Name..."
comment(ds$SD35_02a) = "SD_heikel: nur wenige Politiker mit Name... Reaktionszeit [ms]"
comment(ds$SD35_03) = "SD_heikel: Verschwoerungstheorien"
comment(ds$SD35_03a) = "SD_heikel: Verschwoerungstheorien Reaktionszeit [ms]"
comment(ds$SD35_04) = "SD_heikel: Bundestagswahl"
comment(ds$SD35_04a) = "SD_heikel: Bundestagswahl Reaktionszeit [ms]"
comment(ds$SD35_05) = "SD_heikel: DieLinke"
comment(ds$SD35_05a) = "SD_heikel: DieLinke Reaktionszeit [ms]"
comment(ds$SD35_06) = "SD_heikel: Alternative fuer Deutschland"
comment(ds$SD35_06a) = "SD_heikel: Alternative fuer Deutschland Reaktionszeit [ms]"
comment(ds$SD35_07) = "SD_heikel: Juden als Bundeskanzler"
comment(ds$SD35_07a) = "SD_heikel: Juden als Bundeskanzler Reaktionszeit [ms]"
comment(ds$SD35_08) = "SD_heikel: Moslem als Bundeskanzler"
comment(ds$SD35_08a) = "SD_heikel: Moslem als Bundeskanzler Reaktionszeit [ms]"
comment(ds$SD35_09) = "SD_heikel: Homosexuellen als Bundeskanzler"
comment(ds$SD35_09a) = "SD_heikel: Homosexuellen als Bundeskanzler Reaktionszeit [ms]"
comment(ds$SD35_10) = "SD_heikel: eingebuergerte Person als Bundeskanzle"
comment(ds$SD35_10a) = "SD_heikel: eingebuergerte Person als Bundeskanzle Reaktionszeit [ms]"
comment(ds$SD35_11) = "SD_heikel: Fluechtlinge"
comment(ds$SD35_11a) = "SD_heikel: Fluechtlinge Reaktionszeit [ms]"
comment(ds$SD35_12) = "SD_heikel: Punkte in Flensburg"
comment(ds$SD35_12a) = "SD_heikel: Punkte in Flensburg Reaktionszeit [ms]"
comment(ds$SD35_13) = "SD_heikel: schwarzfahren"
comment(ds$SD35_13a) = "SD_heikel: schwarzfahren Reaktionszeit [ms]"
comment(ds$SD35_14) = "SD_heikel: Marihuana"
comment(ds$SD35_14a) = "SD_heikel: Marihuana Reaktionszeit [ms]"
comment(ds$SD35_15) = "SD_heikel: Ladendiebstahl"
comment(ds$SD35_15a) = "SD_heikel: Ladendiebstahl Reaktionszeit [ms]"
comment(ds$SD35_16) = "SD_heikel: Blut spenden"
comment(ds$SD35_16a) = "SD_heikel: Blut spenden Reaktionszeit [ms]"
comment(ds$SD35_17) = "SD_heikel: Frau mit vielen Maennern schlaeft"
comment(ds$SD35_17a) = "SD_heikel: Frau mit vielen Maennern schlaeft Reaktionszeit [ms]"
comment(ds$SD35_18) = "SD_heikel: Mann mit vielen Frauen"
comment(ds$SD35_18a) = "SD_heikel: Mann mit vielen Frauen Reaktionszeit [ms]"
comment(ds$SD40_19) = "SD_xeno: Muslime"
comment(ds$SD40_19a) = "SD_xeno: Muslime Reaktionszeit [ms]"
comment(ds$SD40_20) = "SD_xeno: Frauen"
comment(ds$SD40_20a) = "SD_xeno: Frauen Reaktionszeit [ms]"
comment(ds$SD40_21) = "SD_xeno: Homosexuelle"
comment(ds$SD40_21a) = "SD_xeno: Homosexuelle Reaktionszeit [ms]"
comment(ds$SD40_22) = "SD_xeno: Juden"
comment(ds$SD40_22a) = "SD_xeno: Juden Reaktionszeit [ms]"
comment(ds$SD40_23) = "SD_xeno: Auslaender"
comment(ds$SD40_23a) = "SD_xeno: Auslaender Reaktionszeit [ms]"
comment(ds$SD40_24) = "SD_xeno: Asylbewerber"
comment(ds$SD40_24a) = "SD_xeno: Asylbewerber Reaktionszeit [ms]"
comment(ds$SD40_25) = "SD_xeno: Behinderte"
comment(ds$SD40_25a) = "SD_xeno: Behinderte Reaktionszeit [ms]"
comment(ds$SD40_26) = "SD_xeno: Uebergewichtige"
comment(ds$SD40_26a) = "SD_xeno: Uebergewichtige Reaktionszeit [ms]"
comment(ds$BI06_01) = "BIDR16: Meine Entscheidungen sind manchmal unklug."
comment(ds$BI06_01a) = "BIDR16: Meine Entscheidungen sind manchmal unklug. Reaktionszeit [ms]"
comment(ds$BI06_02) = "BIDR16: In meinem Leben habe ich jede Herausforderung bewaeltigt, der ich gegenuebergestanden bin."
comment(ds$BI06_02a) = "BIDR16: In meinem Leben habe ich jede Herausforderung bewaeltigt, der ich gegenuebergestanden bin. Reaktionszeit [ms]"
comment(ds$BI06_03) = "BIDR16: Manchmal brauche ich Hilfe von anderen, um Dinge zu erledigen."
comment(ds$BI06_03a) = "BIDR16: Manchmal brauche ich Hilfe von anderen, um Dinge zu erledigen. Reaktionszeit [ms]"
comment(ds$BI06_04) = "BIDR16: Ich bin meistens derjenige, der die grossen Ideen hat."
comment(ds$BI06_04a) = "BIDR16: Ich bin meistens derjenige, der die grossen Ideen hat. Reaktionszeit [ms]"
comment(ds$BI06_05) = "BIDR16: Manchmal luege ich, wenn es die Situation erfordert."
comment(ds$BI06_05a) = "BIDR16: Manchmal luege ich, wenn es die Situation erfordert. Reaktionszeit [ms]"
comment(ds$BI06_06) = "BIDR16: Es ist schon einmal vorgekommen, dass ich jemanden ausgenutzt habe."
comment(ds$BI06_06a) = "BIDR16: Es ist schon einmal vorgekommen, dass ich jemanden ausgenutzt habe. Reaktionszeit [ms]"
comment(ds$BI06_07) = "BIDR16: Ich fluche nie."
comment(ds$BI06_07a) = "BIDR16: Ich fluche nie. Reaktionszeit [ms]"
comment(ds$BI06_08) = "BIDR16: Wenn ich hoere, wie Leute private Dinge besprechen, versuche ich, nicht mitzuhoeren."
comment(ds$BI06_08a) = "BIDR16: Wenn ich hoere, wie Leute private Dinge besprechen, versuche ich, nicht mitzuhoeren. Reaktionszeit [ms]"
comment(ds$BI06_09) = "BIDR16: Ich weiss immer, warum ich etwas mag."
comment(ds$BI06_09a) = "BIDR16: Ich weiss immer, warum ich etwas mag. Reaktionszeit [ms]"
comment(ds$BI06_10) = "BIDR16: Wenn ich sehr emotional bin, dann kann ich nicht mehr klar denken."
comment(ds$BI06_10a) = "BIDR16: Wenn ich sehr emotional bin, dann kann ich nicht mehr klar denken. Reaktionszeit [ms]"
comment(ds$BI06_11) = "BIDR16: Ich ziehe manchmal den Kuerzeren, weil ich mich nicht schnell genug entscheiden kann."
comment(ds$BI06_11a) = "BIDR16: Ich ziehe manchmal den Kuerzeren, weil ich mich nicht schnell genug entscheiden kann. Reaktionszeit [ms]"
comment(ds$BI06_12) = "BIDR16: Ich bin mir meiner Urteile sehr sicher."
comment(ds$BI06_12a) = "BIDR16: Ich bin mir meiner Urteile sehr sicher. Reaktionszeit [ms]"
comment(ds$BI06_13) = "BIDR16: Es aergert mich manchmal, wenn ich meinen Willen nicht durchsetzen kann."
comment(ds$BI06_13a) = "BIDR16: Es aergert mich manchmal, wenn ich meinen Willen nicht durchsetzen kann. Reaktionszeit [ms]"
comment(ds$BI06_14) = "BIDR16: Ich habe noch nie Schadenfreude empfunden."
comment(ds$BI06_14a) = "BIDR16: Ich habe noch nie Schadenfreude empfunden. Reaktionszeit [ms]"
comment(ds$BI06_15) = "BIDR16: Ich muss zugeben, dass Rache manchmal suess ist."
comment(ds$BI06_15a) = "BIDR16: Ich muss zugeben, dass Rache manchmal suess ist. Reaktionszeit [ms]"
comment(ds$BI06_16) = "BIDR16: Ich habe noch nie etwas getan, was ich wirklich bereue."
comment(ds$BI06_16a) = "BIDR16: Ich habe noch nie etwas getan, was ich wirklich bereue. Reaktionszeit [ms]"
comment(ds$BI06_17) = "BIDR16: Opportunity Frage 1"
comment(ds$BI06_17a) = "BIDR16: Opportunity Frage 1 Reaktionszeit [ms]"
comment(ds$DG02) = "Geschlecht"
comment(ds$DG03_01) = "Geburtsjahr: Jahr"
comment(ds$DG04_01) = "Migrant: Jahr"
comment(ds$DG05) = "Staatsangehoerigkeit"
comment(ds$DG06) = "Beziehungsstatus"
comment(ds$DG07) = "Familienstand"
comment(ds$DG08) = "Bildung"
comment(ds$DG08_07) = "Bildung: auslaendischer Schulabschluss, und zwar"
comment(ds$DG09) = "Ausbildungsabschluss"
comment(ds$DG10) = "Erwerbssituation"
comment(ds$DG11) = "Berufliche Stellung"
comment(ds$DG12_01) = "Haushaltsgroesse: Anzahl"
comment(ds$DG12_01a) = "Haushaltsgroesse: Anzahl: weiss nicht"
comment(ds$DG13) = "Konfession"
comment(ds$DG14) = "Religiositaet"
comment(ds$DG16) = "Einkommen, kategorisiert"
comment(ds$DG19_01) = "Einkommen: Monatliches Nettoeinkommen in Euro"
comment(ds$DG19_01a) = "Einkommen: Monatliches Nettoeinkommen in Euro: keine Angabe"
comment(ds$DG20_01) = "Anz Kinder: Anzahl"
comment(ds$DG20_01a) = "Anz Kinder: Anzahl: weiss nicht"
comment(ds$MT01_01) = "Umfrageerfahrung: Anzahl der teilgenommenen Umfragen"
comment(ds$MT01_01a) = "Umfrageerfahrung: Anzahl der teilgenommenen Umfragen: weiss nicht"
comment(ds$MT02_01) = "Motivation: Umfragen sind sehr wichtig fuer Wissenschaft, Politik und Wirtschaft."
comment(ds$MT02_02) = "Motivation: Die Ergebnisse von Meinungsumfragen finde ich immer sehr interessant."
comment(ds$MT02_03) = "Motivation: Die Ergebnisse von Umfragen sind in den meisten Faellen richtig."
comment(ds$MT02_04) = "Motivation: Die Teilnahme an Umfragen ist in meinem eigenen Interesse."
comment(ds$PL01_01) = "Politik allgemein: In Deutschland kann man seine politische Meinung frei sagen."
comment(ds$PL01_02) = "Politik allgemein: Die weltweite politische Lage ist ausser Kontrolle geraten."
comment(ds$PL01_03) = "Politik allgemein: Ich habe Vertrauen in den Staat."
comment(ds$PL01_04) = "Politik allgemein: Man kann der klassischen Presse insgesamt - also Radio, Fernsehen und Zeitungen - vertrauen."
comment(ds$PL01_05) = "Politik allgemein: Ich habe Vertrauen in die Wissenschaft."
comment(ds$IE01_01) = "Interview Evaluation: Zur Beantwortung des Fragebogens haette ich gerne mehr Zeit gehabt."
comment(ds$IE01_02) = "Interview Evaluation: Bei der Beantwortung des Fragebogens war es mir ganz besonders wichtig, moeglichst genau zu antworten."
comment(ds$IE02_01) = "Anonymitaet: Anonymitaet der Befragung"
comment(ds$IE03) = "Gelogen?"
comment(ds$ZG01_01) = "Einstellungszugaenglichkeit: Muslime"
comment(ds$ZG01_02) = "Einstellungszugaenglichkeit: Frauen - speziell in Bezug auf Geschlechterunterschiede, Gleichstellung usw."
comment(ds$ZG01_04) = "Einstellungszugaenglichkeit: homosexuelle Menschen"
comment(ds$ZG01_05) = "Einstellungszugaenglichkeit: Juden"
comment(ds$ZG01_06) = "Einstellungszugaenglichkeit: Auslaender"
comment(ds$ZG01_07) = "Einstellungszugaenglichkeit: Asylbewerber"
comment(ds$ZG01_08) = "Einstellungszugaenglichkeit: Menschen mit Behinderungen"
comment(ds$ZG01_10) = "Einstellungszugaenglichkeit: uebergewichtige Menschen"
comment(ds$FI01_02) = "FI1 ohne kenne ich nicht, spontan: Bundeswehr"
comment(ds$FI01_02a) = "FI1 ohne kenne ich nicht, spontan: Bundeswehr Reaktionszeit [ms]"
comment(ds$FI01_03) = "FI1 ohne kenne ich nicht, spontan: Aerzte ohne Grenzen"
comment(ds$FI01_03a) = "FI1 ohne kenne ich nicht, spontan: Aerzte ohne Grenzen Reaktionszeit [ms]"
comment(ds$FI01_04) = "FI1 ohne kenne ich nicht, spontan: Umweltgerichtshof"
comment(ds$FI01_04a) = "FI1 ohne kenne ich nicht, spontan: Umweltgerichtshof Reaktionszeit [ms]"
comment(ds$FI01_05) = "FI1 ohne kenne ich nicht, spontan: Die Vereinten Nationen, auch ..."
comment(ds$FI01_05a) = "FI1 ohne kenne ich nicht, spontan: Die Vereinten Nationen, auch ... Reaktionszeit [ms]"
comment(ds$FI01_06) = "FI1 ohne kenne ich nicht, spontan: Deutsches Kuestenhilfswerk"
comment(ds$FI01_06a) = "FI1 ohne kenne ich nicht, spontan: Deutsches Kuestenhilfswerk Reaktionszeit [ms]"
comment(ds$FI01_07) = "FI1 ohne kenne ich nicht, spontan: Greenpeace"
comment(ds$FI01_07a) = "FI1 ohne kenne ich nicht, spontan: Greenpeace Reaktionszeit [ms]"
comment(ds$FI01_08) = "FI1 ohne kenne ich nicht, spontan: Die Prager Initiative fuer Ene..."
comment(ds$FI01_08a) = "FI1 ohne kenne ich nicht, spontan: Die Prager Initiative fuer Ene... Reaktionszeit [ms]"
comment(ds$FI01_09) = "FI1 ohne kenne ich nicht, spontan: Deutsches Nuklearforum"
comment(ds$FI01_09a) = "FI1 ohne kenne ich nicht, spontan: Deutsches Nuklearforum Reaktionszeit [ms]"
comment(ds$FI01_10) = "FI1 ohne kenne ich nicht, spontan: Das Bundeskriminalamt, kurz BKA"
comment(ds$FI01_10a) = "FI1 ohne kenne ich nicht, spontan: Das Bundeskriminalamt, kurz BKA Reaktionszeit [ms]"
comment(ds$FI01_11) = "FI1 ohne kenne ich nicht, spontan: Rosa-Luxemburg-Stiftung"
comment(ds$FI01_11a) = "FI1 ohne kenne ich nicht, spontan: Rosa-Luxemburg-Stiftung Reaktionszeit [ms]"
comment(ds$FI01_12) = "FI1 ohne kenne ich nicht, spontan: Konrad-Adenauer-Stiftung"
comment(ds$FI01_12a) = "FI1 ohne kenne ich nicht, spontan: Konrad-Adenauer-Stiftung Reaktionszeit [ms]"
comment(ds$FI01_13) = "FI1 ohne kenne ich nicht, spontan: Herbert-Schmaar-Stiftung"
comment(ds$FI01_13a) = "FI1 ohne kenne ich nicht, spontan: Herbert-Schmaar-Stiftung Reaktionszeit [ms]"
comment(ds$FI01_14) = "FI1 ohne kenne ich nicht, spontan: Der Weltklimarat, auch IPCC g..."
comment(ds$FI01_14a) = "FI1 ohne kenne ich nicht, spontan: Der Weltklimarat, auch IPCC g... Reaktionszeit [ms]"
comment(ds$FI01_15) = "FI1 ohne kenne ich nicht, spontan: Die World Space Agency"
comment(ds$FI01_15a) = "FI1 ohne kenne ich nicht, spontan: Die World Space Agency Reaktionszeit [ms]"
comment(ds$FI02_02) = "FI2 explizit kenne nicht, spontan: Bundeswehr"
comment(ds$FI02_02a) = "FI2 explizit kenne nicht, spontan: Bundeswehr Reaktionszeit [ms]"
comment(ds$FI02_03) = "FI2 explizit kenne nicht, spontan: Aerzte ohne Grenzen"
comment(ds$FI02_03a) = "FI2 explizit kenne nicht, spontan: Aerzte ohne Grenzen Reaktionszeit [ms]"
comment(ds$FI02_04) = "FI2 explizit kenne nicht, spontan: Umweltgerichtshof"
comment(ds$FI02_04a) = "FI2 explizit kenne nicht, spontan: Umweltgerichtshof Reaktionszeit [ms]"
comment(ds$FI02_05) = "FI2 explizit kenne nicht, spontan: Die Vereinten Nationen, auch ..."
comment(ds$FI02_05a) = "FI2 explizit kenne nicht, spontan: Die Vereinten Nationen, auch ... Reaktionszeit [ms]"
comment(ds$FI02_06) = "FI2 explizit kenne nicht, spontan: Deutsches Kuestenhilfswerk"
comment(ds$FI02_06a) = "FI2 explizit kenne nicht, spontan: Deutsches Kuestenhilfswerk Reaktionszeit [ms]"
comment(ds$FI02_07) = "FI2 explizit kenne nicht, spontan: Greenpeace"
comment(ds$FI02_07a) = "FI2 explizit kenne nicht, spontan: Greenpeace Reaktionszeit [ms]"
comment(ds$FI02_08) = "FI2 explizit kenne nicht, spontan: Die Prager Initiative fuer Ene..."
comment(ds$FI02_08a) = "FI2 explizit kenne nicht, spontan: Die Prager Initiative fuer Ene... Reaktionszeit [ms]"
comment(ds$FI02_09) = "FI2 explizit kenne nicht, spontan: Deutsches Nuklearforum"
comment(ds$FI02_09a) = "FI2 explizit kenne nicht, spontan: Deutsches Nuklearforum Reaktionszeit [ms]"
comment(ds$FI02_10) = "FI2 explizit kenne nicht, spontan: Das Bundeskriminalamt, kurz BKA"
comment(ds$FI02_10a) = "FI2 explizit kenne nicht, spontan: Das Bundeskriminalamt, kurz BKA Reaktionszeit [ms]"
comment(ds$FI02_11) = "FI2 explizit kenne nicht, spontan: Rosa-Luxemburg-Stiftung"
comment(ds$FI02_11a) = "FI2 explizit kenne nicht, spontan: Rosa-Luxemburg-Stiftung Reaktionszeit [ms]"
comment(ds$FI02_12) = "FI2 explizit kenne nicht, spontan: Konrad-Adenauer-Stiftung"
comment(ds$FI02_12a) = "FI2 explizit kenne nicht, spontan: Konrad-Adenauer-Stiftung Reaktionszeit [ms]"
comment(ds$FI02_13) = "FI2 explizit kenne nicht, spontan: Herbert-Schmaar-Stiftung"
comment(ds$FI02_13a) = "FI2 explizit kenne nicht, spontan: Herbert-Schmaar-Stiftung Reaktionszeit [ms]"
comment(ds$FI02_14) = "FI2 explizit kenne nicht, spontan: Der Weltklimarat, auch IPCC g..."
comment(ds$FI02_14a) = "FI2 explizit kenne nicht, spontan: Der Weltklimarat, auch IPCC g... Reaktionszeit [ms]"
comment(ds$FI02_15) = "FI2 explizit kenne nicht, spontan: Die World Space Agency"
comment(ds$FI02_15a) = "FI2 explizit kenne nicht, spontan: Die World Space Agency Reaktionszeit [ms]"
comment(ds$FI03_02) = "FI3 ohne kenne ich nicht, nachdenken: Bundeswehr"
comment(ds$FI03_02a) = "FI3 ohne kenne ich nicht, nachdenken: Bundeswehr Reaktionszeit [ms]"
comment(ds$FI03_03) = "FI3 ohne kenne ich nicht, nachdenken: Aerzte ohne Grenzen"
comment(ds$FI03_03a) = "FI3 ohne kenne ich nicht, nachdenken: Aerzte ohne Grenzen Reaktionszeit [ms]"
comment(ds$FI03_04) = "FI3 ohne kenne ich nicht, nachdenken: Umweltgerichtshof"
comment(ds$FI03_04a) = "FI3 ohne kenne ich nicht, nachdenken: Umweltgerichtshof Reaktionszeit [ms]"
comment(ds$FI03_05) = "FI3 ohne kenne ich nicht, nachdenken: Die Vereinten Nationen, auch ..."
comment(ds$FI03_05a) = "FI3 ohne kenne ich nicht, nachdenken: Die Vereinten Nationen, auch ... Reaktionszeit [ms]"
comment(ds$FI03_06) = "FI3 ohne kenne ich nicht, nachdenken: Deutsches Kuestenhilfswerk"
comment(ds$FI03_06a) = "FI3 ohne kenne ich nicht, nachdenken: Deutsches Kuestenhilfswerk Reaktionszeit [ms]"
comment(ds$FI03_07) = "FI3 ohne kenne ich nicht, nachdenken: Greenpeace"
comment(ds$FI03_07a) = "FI3 ohne kenne ich nicht, nachdenken: Greenpeace Reaktionszeit [ms]"
comment(ds$FI03_08) = "FI3 ohne kenne ich nicht, nachdenken: Die Prager Initiative fuer Ene..."
comment(ds$FI03_08a) = "FI3 ohne kenne ich nicht, nachdenken: Die Prager Initiative fuer Ene... Reaktionszeit [ms]"
comment(ds$FI03_09) = "FI3 ohne kenne ich nicht, nachdenken: Deutsches Nuklearforum"
comment(ds$FI03_09a) = "FI3 ohne kenne ich nicht, nachdenken: Deutsches Nuklearforum Reaktionszeit [ms]"
comment(ds$FI03_10) = "FI3 ohne kenne ich nicht, nachdenken: Das Bundeskriminalamt, kurz BKA"
comment(ds$FI03_10a) = "FI3 ohne kenne ich nicht, nachdenken: Das Bundeskriminalamt, kurz BKA Reaktionszeit [ms]"
comment(ds$FI03_11) = "FI3 ohne kenne ich nicht, nachdenken: Rosa-Luxemburg-Stiftung"
comment(ds$FI03_11a) = "FI3 ohne kenne ich nicht, nachdenken: Rosa-Luxemburg-Stiftung Reaktionszeit [ms]"
comment(ds$FI03_12) = "FI3 ohne kenne ich nicht, nachdenken: Konrad-Adenauer-Stiftung"
comment(ds$FI03_12a) = "FI3 ohne kenne ich nicht, nachdenken: Konrad-Adenauer-Stiftung Reaktionszeit [ms]"
comment(ds$FI03_13) = "FI3 ohne kenne ich nicht, nachdenken: Herbert-Schmaar-Stiftung"
comment(ds$FI03_13a) = "FI3 ohne kenne ich nicht, nachdenken: Herbert-Schmaar-Stiftung Reaktionszeit [ms]"
comment(ds$FI03_14) = "FI3 ohne kenne ich nicht, nachdenken: Der Weltklimarat, auch IPCC g..."
comment(ds$FI03_14a) = "FI3 ohne kenne ich nicht, nachdenken: Der Weltklimarat, auch IPCC g... Reaktionszeit [ms]"
comment(ds$FI03_15) = "FI3 ohne kenne ich nicht, nachdenken: Die World Space Agency"
comment(ds$FI03_15a) = "FI3 ohne kenne ich nicht, nachdenken: Die World Space Agency Reaktionszeit [ms]"
comment(ds$FI04_02) = "FI4 explizit kenne ich nicht, nachdenken: Bundeswehr"
comment(ds$FI04_02a) = "FI4 explizit kenne ich nicht, nachdenken: Bundeswehr Reaktionszeit [ms]"
comment(ds$FI04_03) = "FI4 explizit kenne ich nicht, nachdenken: Aerzte ohne Grenzen"
comment(ds$FI04_03a) = "FI4 explizit kenne ich nicht, nachdenken: Aerzte ohne Grenzen Reaktionszeit [ms]"
comment(ds$FI04_04) = "FI4 explizit kenne ich nicht, nachdenken: Umweltgerichtshof"
comment(ds$FI04_04a) = "FI4 explizit kenne ich nicht, nachdenken: Umweltgerichtshof Reaktionszeit [ms]"
comment(ds$FI04_05) = "FI4 explizit kenne ich nicht, nachdenken: Die Vereinten Nationen, auch ..."
comment(ds$FI04_05a) = "FI4 explizit kenne ich nicht, nachdenken: Die Vereinten Nationen, auch ... Reaktionszeit [ms]"
comment(ds$FI04_06) = "FI4 explizit kenne ich nicht, nachdenken: Deutsches Kuestenhilfswerk"
comment(ds$FI04_06a) = "FI4 explizit kenne ich nicht, nachdenken: Deutsches Kuestenhilfswerk Reaktionszeit [ms]"
comment(ds$FI04_07) = "FI4 explizit kenne ich nicht, nachdenken: Greenpeace"
comment(ds$FI04_07a) = "FI4 explizit kenne ich nicht, nachdenken: Greenpeace Reaktionszeit [ms]"
comment(ds$FI04_08) = "FI4 explizit kenne ich nicht, nachdenken: Die Prager Initiative fuer Ene..."
comment(ds$FI04_08a) = "FI4 explizit kenne ich nicht, nachdenken: Die Prager Initiative fuer Ene... Reaktionszeit [ms]"
comment(ds$FI04_09) = "FI4 explizit kenne ich nicht, nachdenken: Deutsches Nuklearforum"
comment(ds$FI04_09a) = "FI4 explizit kenne ich nicht, nachdenken: Deutsches Nuklearforum Reaktionszeit [ms]"
comment(ds$FI04_10) = "FI4 explizit kenne ich nicht, nachdenken: Das Bundeskriminalamt, kurz BKA"
comment(ds$FI04_10a) = "FI4 explizit kenne ich nicht, nachdenken: Das Bundeskriminalamt, kurz BKA Reaktionszeit [ms]"
comment(ds$FI04_11) = "FI4 explizit kenne ich nicht, nachdenken: Rosa-Luxemburg-Stiftung"
comment(ds$FI04_11a) = "FI4 explizit kenne ich nicht, nachdenken: Rosa-Luxemburg-Stiftung Reaktionszeit [ms]"
comment(ds$FI04_12) = "FI4 explizit kenne ich nicht, nachdenken: Konrad-Adenauer-Stiftung"
comment(ds$FI04_12a) = "FI4 explizit kenne ich nicht, nachdenken: Konrad-Adenauer-Stiftung Reaktionszeit [ms]"
comment(ds$FI04_13) = "FI4 explizit kenne ich nicht, nachdenken: Herbert-Schmaar-Stiftung"
comment(ds$FI04_13a) = "FI4 explizit kenne ich nicht, nachdenken: Herbert-Schmaar-Stiftung Reaktionszeit [ms]"
comment(ds$FI04_14) = "FI4 explizit kenne ich nicht, nachdenken: Der Weltklimarat, auch IPCC g..."
comment(ds$FI04_14a) = "FI4 explizit kenne ich nicht, nachdenken: Der Weltklimarat, auch IPCC g... Reaktionszeit [ms]"
comment(ds$FI04_15) = "FI4 explizit kenne ich nicht, nachdenken: Die World Space Agency"
comment(ds$FI04_15a) = "FI4 explizit kenne ich nicht, nachdenken: Die World Space Agency Reaktionszeit [ms]"
comment(ds$FI06_CP) = "randomFI: Vollstaendige Leerungen der Urne bisher"
comment(ds$FI06) = "randomFI: Gezogener Code"
comment(ds$DQ01_01) = "DQ Tagesschau: Haben Sie gestern die Tagesschau um 20 Uhr gesehen?"
comment(ds$DQ02_01) = "FIDQ Poltitiker: Angela Merkel?"
comment(ds$DQ02_02) = "FIDQ Poltitiker: Andrea Nahles?"
comment(ds$DQ02_03) = "FIDQ Poltitiker: Heiner Nahlmeier?"
comment(ds$DQ02_04) = "FIDQ Poltitiker: Peter Strombovski von der Partei \"Alternative fuer Deutschland\"?"
comment(ds$DQ02_05) = "FIDQ Poltitiker: Ursula von der Leyen?"
comment(ds$DQ03_01) = "DQ Verschwoerungstheorien: Die Anschlaege vom 11. September 2001 in New York auf das World Trade Center wurden von der US-Regierung inszeniert."
comment(ds$DQ03_02) = "DQ Verschwoerungstheorien: Der amerikanische Praesident Donald Trump hatte eine Affaere mit einer Pornodarstellerin."
comment(ds$DQ03_03) = "DQ Verschwoerungstheorien: Die Erde ist eine Scheibe, also flach."
comment(ds$DQ03_04) = "DQ Verschwoerungstheorien: Impfungen loesen geistige Behinderungen, z.B. Autismus, aus."
comment(ds$DQ04_01) = "Politik Interesse: Wenn 1 \"ueberhaupt nicht\" und 5 \"sehr stark\" bedeutet, wie stark interessieren Sie sich fuer Politik?"
comment(ds$DQ05_01) = "Rechts-Links Selbst Einschaetzung: Wo wuerden Sie sich einstufen?"
comment(ds$DQ06) = "DQ Wahlen Filter"
comment(ds$DQ07) = "DQ Wahlen DieLinke"
comment(ds$DQ08) = "DQ Wahlen AfD"
comment(ds$DQ09_01) = "DQ Bundeskanzler: Kommt ein Jude fuer Sie als Bundeskanzler in Frage?"
comment(ds$DQ09_02) = "DQ Bundeskanzler: Kommt ein Moslem fuer Sie als Bundeskanzler in Frage?"
comment(ds$DQ09_03) = "DQ Bundeskanzler: Kommt ein homosexueller Kandidat fuer Sie als Bundeskanzler in Frage?"
comment(ds$DQ09_04) = "DQ Bundeskanzler: Kommt eine eingebuergerte Person fuer Sie als Bundeskanzler in Frage?"
comment(ds$DQ10_01) = "DQ Fluechtlinge: In Deutschland koennten noch mehr Fluechtlinge aufgenommen werden."
comment(ds$DQ12) = "DQ Flensburg dichotom"
comment(ds$DQ13_01) = "DQ Flensburg Zahl: Wie viele Punkte in Flensburg haben Sie?"
comment(ds$DQ13_01a) = "DQ Flensburg Zahl: Wie viele Punkte in Flensburg haben Sie?: keine Angabe"
comment(ds$DQ14_01) = "DQ heikel: bewusst Bus oder Bahn benutzt, ohne im Besitz einer Fahrkarte zu sein (umgangssprachlich: Schwarzfahren)?"
comment(ds$DQ14_02) = "DQ heikel: Marihuana oder Haschisch geraucht?"
comment(ds$DQ14_03) = "DQ heikel: einen Ladendiebstahl begangen?"
comment(ds$DQ14_04) = "DQ heikel: Blut gespendet?"
comment(ds$DQ15_01) = "DQ Freizeit: Wie haeufig haben Sie im vergangenen Jahr eine kulturelle Veranstaltung z.B. Kino, Konzert, Theater, Lesung besucht?"
comment(ds$DQ15_01a) = "DQ Freizeit: Wie haeufig haben Sie im vergangenen Jahr eine kulturelle Veranstaltung z.B. Kino, Konzert, Theater, Lesung besucht?: keine Angabe"
comment(ds$DQ15_02) = "DQ Freizeit: Wie haeufig waren Sie im vergangenen Jahr zum Essen in einem Restaurant?"
comment(ds$DQ15_02a) = "DQ Freizeit: Wie haeufig waren Sie im vergangenen Jahr zum Essen in einem Restaurant?: keine Angabe"
comment(ds$DQ15_03) = "DQ Freizeit: Wie viele verschiedene Sexpartner hatten Sie im Verlauf Ihres Lebens?"
comment(ds$DQ15_03a) = "DQ Freizeit: Wie viele verschiedene Sexpartner hatten Sie im Verlauf Ihres Lebens?: keine Angabe"
comment(ds$LL01) = "LL Tagesschau"
comment(ds$LL02) = "FILL Politiker"
comment(ds$LL03) = "LL Verschwoerungstheorien"
comment(ds$LL04) = "Testfrage"
comment(ds$LL05) = "Testfrage falsch"
comment(ds$LL06) = "LL Wahlen Filter"
comment(ds$LL07) = "LL Wahlen DieLinke"
comment(ds$LL08) = "LL Wahlen AfD"
comment(ds$LL09_01) = "LL Bundeskanzler: ...ein Jude als Bundeskanzler in Frage?"
comment(ds$LL09_02) = "LL Bundeskanzler: ...ein Moslem als Bundeskanzler in Frage?"
comment(ds$LL09_03) = "LL Bundeskanzler: ...ein homosexueller Kandidat als Bundeskanzler in Frage?"
comment(ds$LL09_04) = "LL Bundeskanzler: ...eine eingebuergerte Person als Bundeskanzler in Frage?"
comment(ds$LL10) = "LL Fluechtlinge"
comment(ds$LL11_01) = "LL Wahlen Personen: [01]"
comment(ds$LL11_02) = "LL Wahlen Personen: [02]"
comment(ds$LL11_03) = "LL Wahlen Personen: [03]"
comment(ds$LL12) = "LL Flensburg"
comment(ds$LL13_01) = "LL Flensburg Zahl: Wie viele Punkte in Flensburg haben Ihr naechster Nachbar und Sie selbst zusammengezaehlt?"
comment(ds$LL13_01a) = "LL Flensburg Zahl: Wie viele Punkte in Flensburg haben Ihr naechster Nachbar und Sie selbst zusammengezaehlt?: weiss nicht"
comment(ds$LL14_01) = "LL heikel: bewusst Bus oder Bahn benutzt, ohne im Besitz einer Fahrkarte zu sein (umgangssprachlich: Schwarzfahren)?"
comment(ds$LL14_02) = "LL heikel: Marihuana oder Haschisch geraucht."
comment(ds$LL14_03) = "LL heikel: einen Ladendiebstahl begangen?"
comment(ds$LL14_04) = "LL heikel: Blut gespendet?"
comment(ds$LL15_01) = "LL Freizeit: Gesamtsumme aus Frage 1 und Frage 2"
comment(ds$LL15_01a) = "LL Freizeit: Gesamtsumme aus Frage 1 und Frage 2: keine Angabe"
comment(ds$LL16_01) = "kulturelle Veranstaltung:  ... Haeufigkeit angeben"
comment(ds$LL16_01a) = "kulturelle Veranstaltung:  ... Haeufigkeit angeben: keine Angabe"
comment(ds$LL19_01) = "LL Einkommen: Gesamtsumme aus Frage 1 und Frage 2"
comment(ds$LL19_01a) = "LL Einkommen: Gesamtsumme aus Frage 1 und Frage 2: keine Angabe"
comment(ds$LL20_01) = "Bushaltestelle:  ... Entfernung in Metern"
comment(ds$LL20_01a) = "Bushaltestelle:  ... Entfernung in Metern: weiss nicht"
comment(ds$SL01) = "SL Tagesschau"
comment(ds$SL02) = "FISL Politiker"
comment(ds$SL03) = "SL Verschwoerungstheorien"
comment(ds$SL04) = "Testfrage"
comment(ds$SL05) = "Testfrage falsch"
comment(ds$SL06) = "SL Wahlen Filter"
comment(ds$SL07) = "SL Wahlen DieLinke"
comment(ds$SL08) = "SL Wahlen AfD"
comment(ds$SL09_01) = "SL Bundeskanzler: ...ein Jude als Bundeskanzler in Frage?"
comment(ds$SL09_02) = "SL Bundeskanzler: ...ein Moslem als Bundeskanzler in Frage?"
comment(ds$SL09_03) = "SL Bundeskanzler: ...ein homosexueller Kandidat als Bundeskanzler in Frage?"
comment(ds$SL09_04) = "SL Bundeskanzler: ...eine eingebuergerte Person als Bundeskanzler in Frage?"
comment(ds$SL10) = "SL Fluechtlinge"
comment(ds$SL11_01) = "SL Wahlen Personen: [01]"
comment(ds$SL11_02) = "SL Wahlen Personen: [02]"
comment(ds$SL11_03) = "SL Wahlen Personen: [03]"
comment(ds$SL12) = "SL Flensburg"
comment(ds$SL13_01) = "SL Flensburg Zahl: Wie viele Punkte in Flensburg hat Ihr naechster Nachbar?"
comment(ds$SL13_01a) = "SL Flensburg Zahl: Wie viele Punkte in Flensburg hat Ihr naechster Nachbar?: weiss nicht"
comment(ds$SL14_01) = "SL heikel: bewusst Bus oder Bahn benutzt, ohne im Besitz einer Fahrkarte zu sein (umgangssprachlich: Schwarzfahren)?"
comment(ds$SL14_02) = "SL heikel: Marihuana oder Haschisch geraucht."
comment(ds$SL14_03) = "SL heikel: einen Ladendiebstahl begangen?"
comment(ds$SL14_04) = "SL heikel: Blut gespendet?"
comment(ds$SL15_01) = "SL Freizeit: Gesamtsumme aus Frage 1 und Frage 2"
comment(ds$SL15_01a) = "SL Freizeit: Gesamtsumme aus Frage 1 und Frage 2: keine Angabe"
comment(ds$SL16_01) = "Restaurant:  ... Haeufigkeit angeben"
comment(ds$SL16_01a) = "Restaurant:  ... Haeufigkeit angeben: keine Angabe"
comment(ds$SL19_01) = "SL Einkommen: Gesamtsumme aus Frage 1 und Frage 2"
comment(ds$SL19_01a) = "SL Einkommen: Gesamtsumme aus Frage 1 und Frage 2: keine Angabe"
comment(ds$SL20_01) = "Supermarkt:  ... Entfernung in Metern"
comment(ds$SL20_01a) = "Supermarkt:  ... Entfernung in Metern: weiss nicht"
comment(ds$FG01_CP) = "Experiment Faking Good Treatment: Vollstaendige Leerungen der Urne bisher"
comment(ds$FG01) = "Experiment Faking Good Treatment: Gezogener Code"
comment(ds$SC01) = "Altersgruppen"
comment(ds$SC02) = "Geschlecht"
comment(ds$SC05) = "Screenout"
comment(ds$R001_CP) = "Randomisierung Frageboegen: Vollstaendige Leerungen der Urne bisher"
comment(ds$R001) = "Randomisierung Frageboegen: Gezogener Code"
comment(ds$R002_RV1) = "POST/GET-Variable: tic"
comment(ds$R005_01) = "SPLIT: Split"
comment(ds$R006_01) = "Finished: finished"
comment(ds$R007_01) = "tic memory: tic memory"
comment(ds$TIME001) = "Verweildauer Seite 1"
comment(ds$TIME002) = "Verweildauer Seite 2"
comment(ds$TIME003) = "Verweildauer Seite 3"
comment(ds$TIME004) = "Verweildauer Seite 4"
comment(ds$TIME005) = "Verweildauer Seite 5"
comment(ds$TIME006) = "Verweildauer Seite 6"
comment(ds$TIME007) = "Verweildauer Seite 7"
comment(ds$TIME008) = "Verweildauer Seite 8"
comment(ds$TIME009) = "Verweildauer Seite 9"
comment(ds$TIME010) = "Verweildauer Seite 10"
comment(ds$TIME011) = "Verweildauer Seite 11"
comment(ds$TIME012) = "Verweildauer Seite 12"
comment(ds$TIME013) = "Verweildauer Seite 13"
comment(ds$TIME014) = "Verweildauer Seite 14"
comment(ds$TIME015) = "Verweildauer Seite 15"
comment(ds$TIME016) = "Verweildauer Seite 16"
comment(ds$TIME017) = "Verweildauer Seite 17"
comment(ds$TIME018) = "Verweildauer Seite 18"
comment(ds$TIME019) = "Verweildauer Seite 19"
comment(ds$TIME020) = "Verweildauer Seite 20"
comment(ds$TIME021) = "Verweildauer Seite 21"
comment(ds$TIME022) = "Verweildauer Seite 22"
comment(ds$TIME023) = "Verweildauer Seite 23"
comment(ds$TIME024) = "Verweildauer Seite 24"
comment(ds$TIME025) = "Verweildauer Seite 25"
comment(ds$TIME026) = "Verweildauer Seite 26"
comment(ds$TIME027) = "Verweildauer Seite 27"
comment(ds$TIME028) = "Verweildauer Seite 28"
comment(ds$TIME029) = "Verweildauer Seite 29"
comment(ds$TIME030) = "Verweildauer Seite 30"
comment(ds$TIME031) = "Verweildauer Seite 31"
comment(ds$TIME032) = "Verweildauer Seite 32"
comment(ds$TIME033) = "Verweildauer Seite 33"
comment(ds$TIME034) = "Verweildauer Seite 34"
comment(ds$TIME035) = "Verweildauer Seite 35"
comment(ds$TIME036) = "Verweildauer Seite 36"
comment(ds$TIME037) = "Verweildauer Seite 37"
comment(ds$TIME038) = "Verweildauer Seite 38"
comment(ds$TIME039) = "Verweildauer Seite 39"
comment(ds$TIME040) = "Verweildauer Seite 40"
comment(ds$TIME041) = "Verweildauer Seite 41"
comment(ds$TIME_SUM) = "Verweildauer gesamt (ohne Ausreisser)"
comment(ds$MAILSENT) = "Versandzeitpunkt der Einladungsmail (nur fuer nicht-anonyme Adressaten)"
comment(ds$LASTDATA) = "Zeitpunkt als der Datensatz das letzte mal geaendert wurde"
comment(ds$FINISHED) = "Wurde die Befragung abgeschlossen (letzte Seite erreicht)?"
comment(ds$Q_VIEWER) = "Hat der Teilnehmer den Fragebogen nur angesehen, ohne die Pflichtfragen zu beantworten?"
comment(ds$LASTPAGE) = "Seite, die der Teilnehmer zuletzt bearbeitet hat"
comment(ds$MAXPAGE) = "Letzte Seite, die im Fragebogen bearbeitet wurde"
comment(ds$MISSING) = "Anteil fehlender Antworten in Prozent"
comment(ds$MISSREL) = "Anteil fehlender Antworten (gewichtet nach Relevanz)"
comment(ds$TIME_RSI) = "Maluspunkte fuer schnelles Ausfuellen"
comment(ds$DEG_TIME) = "Maluspunkte fuer schnelles Ausfuellen"



# Assure that the comments are retained in subsets
as.data.frame.avector = as.data.frame.vector
`[.avector` <- function(x,i,...) {
  r <- NextMethod("[")
  mostattributes(r) <- attributes(x)
  r
}
ds_tmp = data.frame(
  lapply(ds, function(x) {
    structure( x, class = c("avector", class(x) ) )
  } )
)
mostattributes(ds_tmp) = attributes(ds)
ds = ds_tmp
rm(ds_tmp)

# Save Dataframe as csv
# This is simply the prepared dataframe from sosci 
# Further recoding needs to be done 
write.csv( ds, file = "sdData_v01.csv")
