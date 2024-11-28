redIADS = SkynetIADS:create("EMPIRE")

---debug settings remove from here on if you do not wan"t any output on what the IADS is doing by default
local iadsDebug = redIADS:getDebugSettings()
iadsDebug.IADSStatus = true
iadsDebug.radarWentDark = true
iadsDebug.contacts = true
iadsDebug.radarWentLive = true
iadsDebug.noWorkingCommmandCenter = true
iadsDebug.ewRadarNoConnection = true
iadsDebug.samNoConnection = false
iadsDebug.addedEWRadar = false
iadsDebug.hasNoPower = false
iadsDebug.harmDefence = true
iadsDebug.samSiteStatusEnvOutput = true
iadsDebug.earlyWarningRadarStatusEnvOutput = true
iadsDebug.commandCenterStatusEnvOutput = true
---end remove debug ---

--Adding SAMs to IADS by group name prefix
redIADS:addSAMSitesByPrefix("SAM")

--Adding EWR sites to IADS (ADC/Brigade EWRs by prefix rule, S-300 BIG BIRDs manually)
redIADS:addEarlyWarningRadarsByPrefix("EWR")
redIADS:addEarlyWarningRadar("SAM-S300-79TH-SR")
redIADS:addEarlyWarningRadar("SAM-S300-78TH-SR")
redIADS:addEarlyWarningRadar("SAM-S300-77TH-SR")
redIADS:addEarlyWarningRadar("SAM-S300-83RD-SR")
redIADS:addEarlyWarningRadar("SAM-S300-84TH-SR")
redIADS:addEarlyWarningRadar("SAM-S300-85TH-SR")

--implementing IADS C2 topography [NOTE: S-300 Regiments with 54K6 are able to control on-net EWRs organic to an S-300 complex, but not dissimilar SAM systems]
    --Nodes for ADC D4M1s
local connectionNodeLatakiaADC = StaticObject.getByName("LATAKIA-ADC-C2")
local connectionNodeTripoliADC = StaticObject.getByName("TRIPOLI-ADC-C2")
local connectionNodeAleppoADC = StaticObject.getByName("ALEPPO-ADC-C2")
local connectionNodeBeirutADC = StaticObject.getByName("BEIRUT-ADC-C2")
local connectionNodeHaifaADC = StaticObject.getByName("HAIFA-ADC-C2")
local connectionNodeDamascusADC = StaticObject.getByName("DAMASCUS-ADC-C2")
local connectionNode101BDE = StaticObject.getByName("101-AD-BDE-C2")
local connectionNode102BDE = StaticObject.getByName("102-AD-BDE-C2")
local connectionNode201BDE = StaticObject.getByName("201-AD-BDE-C2")
local connectionNode202BDE = StaticObject.getByName("202-AD-BDE-C2")
local connectionNode300BDE = StaticObject.getByName("300-AD-BDE-C2")
local connectionNode400BDE = StaticObject.getByName("400-AD-BDE-C2")

    --Nodes for S-300 54K6
local connectionNode85th = Unit.getByName("SAM-S300-85TH-C2")
local connectionNode84th = Unit.getByName("SAM-S300-84TH-C2")
local connectionNode83rd = Unit.getByName("SAM-S300-83RD-C2")    
local connectionNode79th = Unit.getByName("SAM-S300-79TH-C2")
local connectionNode78th = Unit.getByName("SAM-S300-78TH-C2")
local connectionNode77th = Unit.getByName("SAM-S300-77TH-C2")

--NW Air Defense Sector Command Center (Doing this ***after*** creating connection nodes, otherwise mist freaks out!)
local nwSectorCommand = StaticObject.getByName("NW-SECTOR-COMMAND")
local swSectorCommand = StaticObject.getByName("SW-SECTOR-COMMAND")
local cSectorCommand = StaticObject.getByName("C-SECTOR-COMMAND")
local nSectorCommand = StaticObject.getByName("N-SECTOR-COMMAND")
redIADS:addCommandCenter(nwSectorCommand):addConnectionNode(connectionNodeLatakiaADC, connectionNodeTripoliADC, connectionNodeAleppoADC, connectionNode101BDE, connectionNode102BDE)
redIADS:addCommandCenter(swSectorCommand):addConnectionNode(connectionNodeBeirutADC, connectionNodeHaifaADC, connectionNodeDamascusADC, connectionNode201BDE, connectionNode202BDE)
redIADS:addCommandCenter(cSectorCommand):addConnectionNode(connectionNode300BDE)
redIADS:addCommandCenter(nSectorCommand):addConnectionNode(connectionNode400BDE)

--Connecting S300 complexes to respective ADC D4M1s
redIADS:getSAMSiteByGroupName("SAM-S300-79TH-RGT"):addConnectionNode(connectionNodeLatakiaADC)
redIADS:getSAMSiteByGroupName("SAM-S300-78TH-RGT"):addConnectionNode(connectionNodeTripoliADC)
redIADS:getSAMSiteByGroupName("SAM-S300-77TH-RGT"):addConnectionNode(connectionNodeAleppoADC)
redIADS:getSAMSiteByGroupName("SAM-S300-83RD-RGT"):addConnectionNode(connectionNodeBeirutADC)
redIADS:getSAMSiteByGroupName("SAM-S300-84TH-RGT"):addConnectionNode(connectionNodeHaifaADC)
redIADS:getSAMSiteByGroupName("SAM-S300-85TH-RGT"):addConnectionNode(connectionNodeDamascusADC)
redIADS:getSAMSiteByGroupName("SAM-S300-101-BDE-1-BN"):addConnectionNode(connectionNode101BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-101-BDE-2-BN"):addConnectionNode(connectionNode101BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-102-BDE-1-BN"):addConnectionNode(connectionNode102BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-102-BDE-2-BN"):addConnectionNode(connectionNode102BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-201-BDE-1-BN"):addConnectionNode(connectionNode201BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-201-BDE-2-BN"):addConnectionNode(connectionNode201BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-202-BDE-1-BN"):addConnectionNode(connectionNode202BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-202-BDE-2-BN"):addConnectionNode(connectionNode202BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-300-BDE-1-BN"):addConnectionNode(connectionNode300BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-300-BDE-2-BN"):addConnectionNode(connectionNode300BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-400-BDE-1-BN"):addConnectionNode(connectionNode400BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-400-BDE-2-BN"):addConnectionNode(connectionNode400BDE)

--Search/early warning radars networked through D4M1 and 54K6
    --Latakia ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-79TH-SR"):addConnectionNode(connectionNodeLatakiaADC, connectionNode79th)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-LATAKIA"):addConnectionNode(connectionNodeLatakiaADC, connectionNode79th)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-LATAKIA"):addConnectionNode(connectionNodeLatakiaADC, connectionNode79th)

    --Tripoli ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-78TH-SR"):addConnectionNode(connectionNodeTripoliADC, connectionNode78th)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-TRIPOLI"):addConnectionNode(connectionNodeTripoliADC, connectionNode78th)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-TRIPOLI"):addConnectionNode(connectionNodeTripoliADC, connectionNode78th)

    --Aleppo ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-77TH-SR"):addConnectionNode(connectionNodeAleppoADC, connectionNode77th)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-ALEPPO"):addConnectionNode(connectionNodeAleppoADC, connectionNode77th)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-ALEPPO"):addConnectionNode(connectionNodeAleppoADC, connectionNode77th)

    --Beirut ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-83RD-SR"):addConnectionNode(connectionNodeBeirutADC, connectionNode83rd)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-BEIRUT"):addConnectionNode(connectionNodeBeirutADC, connectionNode83rd)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-BEIRUT"):addConnectionNode(connectionNodeBeirutADC, connectionNode83rd)

    --Haifa ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-84TH-SR"):addConnectionNode(connectionNodeHaifaADC, connectionNode84th)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-HAIFA"):addConnectionNode(connectionNodeHaifaADC, connectionNode84th)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-HAIFA"):addConnectionNode(connectionNodeHaifaADC, connectionNode84th)

    --Damascus ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-85TH-SR"):addConnectionNode(connectionNodeDamascusADC, connectionNode85th)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-DAMASCUS"):addConnectionNode(connectionNodeDamascusADC, connectionNode85th)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-DAMASCUS"):addConnectionNode(connectionNodeDamascusADC, connectionNode85th)
    
    --10th Independent Air Defense Corps
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-101-AD-BDE"):addConnectionNode(connectionNode101BDE)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-102-AD-BDE"):addConnectionNode(connectionNode102BDE)

    --20th Independent Air Defense Corps
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-201-AD-BDE"):addConnectionNode(connectionNode201BDE)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-202-AD-BDE"):addConnectionNode(connectionNode202BDE)

    --30th Independent Air Defense Corps
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-300-AD-BDE"):addConnectionNode(connectionNode300BDE)

    --40th Independent Air Defense Corps
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-400-AD-BDE"):addConnectionNode(connectionNode400BDE)
    

--Buk Regiments networked per battery through D4M1
    --Latakia ADC
redIADS:getSAMSiteByGroupName("SAM-SA17-790TH-BTY-A"):addConnectionNode(connectionNodeLatakiaADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-790TH-BTY-B"):addConnectionNode(connectionNodeLatakiaADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-790TH-BTY-C"):addConnectionNode(connectionNodeLatakiaADC)

    --Tripoli ADC
redIADS:getSAMSiteByGroupName("SAM-SA17-780TH-BTY-A"):addConnectionNode(connectionNodeTripoliADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-780TH-BTY-B"):addConnectionNode(connectionNodeTripoliADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-780TH-BTY-C"):addConnectionNode(connectionNodeTripoliADC)

    --Aleppo ADC
redIADS:getSAMSiteByGroupName("SAM-SA17-770TH-BTY-A"):addConnectionNode(connectionNodeAleppoADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-770TH-BTY-B"):addConnectionNode(connectionNodeAleppoADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-770TH-BTY-C"):addConnectionNode(connectionNodeAleppoADC)

    --Beirut ADC
redIADS:getSAMSiteByGroupName("SAM-SA17-830TH-BTY-A"):addConnectionNode(connectionNodeBeirutADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-830TH-BTY-B"):addConnectionNode(connectionNodeBeirutADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-830TH-BTY-C"):addConnectionNode(connectionNodeBeirutADC)

    --Beirut ADC
redIADS:getSAMSiteByGroupName("SAM-SA17-840TH-BTY-A"):addConnectionNode(connectionNodeHaifaADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-840TH-BTY-B"):addConnectionNode(connectionNodeHaifaADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-840TH-BTY-C"):addConnectionNode(connectionNodeHaifaADC)

    --Damascus ADC
redIADS:getSAMSiteByGroupName("SAM-SA17-850TH-BTY-A"):addConnectionNode(connectionNodeDamascusADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-850TH-BTY-B"):addConnectionNode(connectionNodeDamascusADC)
redIADS:getSAMSiteByGroupName("SAM-SA17-850TH-BTY-C"):addConnectionNode(connectionNodeDamascusADC)

    --10th Independent Air Defense Corps
redIADS:getSAMSiteByGroupName("SAM-SA17-101-BDE-3-BN"):addConnectionNode(connectionNode101BDE)
redIADS:getSAMSiteByGroupName("SAM-SA17-101-BDE-4-BN"):addConnectionNode(connectionNode101BDE)
redIADS:getSAMSiteByGroupName("SAM-SA17-102-BDE-3-BN"):addConnectionNode(connectionNode102BDE)
redIADS:getSAMSiteByGroupName("SAM-SA17-102-BDE-4-BN"):addConnectionNode(connectionNode102BDE)

    --20th Independent Air Defense Corps
redIADS:getSAMSiteByGroupName("SAM-SA17-201-BDE-3-BN"):addConnectionNode(connectionNode201BDE)
redIADS:getSAMSiteByGroupName("SAM-SA17-201-BDE-4-BN"):addConnectionNode(connectionNode201BDE)
redIADS:getSAMSiteByGroupName("SAM-SA17-202-BDE-3-BN"):addConnectionNode(connectionNode202BDE)
redIADS:getSAMSiteByGroupName("SAM-SA17-202-BDE-4-BN"):addConnectionNode(connectionNode202BDE)

    --30th Independent Air Defense Corps
redIADS:getSAMSiteByGroupName("SAM-SA17-300-BDE-3-BN"):addConnectionNode(connectionNode300BDE)
redIADS:getSAMSiteByGroupName("SAM-SA17-300-BDE-4-BN"):addConnectionNode(connectionNode300BDE)

    --40th Independent Air Defense Corps
redIADS:getSAMSiteByGroupName("SAM-SA17-400-BDE-3-BN"):addConnectionNode(connectionNode400BDE)
redIADS:getSAMSiteByGroupName("SAM-SA17-400-BDE-4-BN"):addConnectionNode(connectionNode400BDE)

--Tor PD batteries networked through D4M1
    --Latakia ADC
redIADS:getSAMSiteByGroupName("SAM-SA15-LATAKIA-PD-BTY-A"):addConnectionNode(connectionNodeLatakiaADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-LATAKIA-PD-BTY-B"):addConnectionNode(connectionNodeLatakiaADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-LATAKIA-PD-BTY-C"):addConnectionNode(connectionNodeLatakiaADC)

    --Tripoli ADC
redIADS:getSAMSiteByGroupName("SAM-SA15-TRIPOLI-PD-BTY-A"):addConnectionNode(connectionNodeTripoliADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-TRIPOLI-PD-BTY-B"):addConnectionNode(connectionNodeTripoliADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-TRIPOLI-PD-BTY-C"):addConnectionNode(connectionNodeTripoliADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-TRIPOLI-PD-BTY-D"):addConnectionNode(connectionNodeTripoliADC)

    --Aleppo ADC
redIADS:getSAMSiteByGroupName("SAM-SA15-ALEPPO-PD-BTY-A"):addConnectionNode(connectionNodeAleppoADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-ALEPPO-PD-BTY-B"):addConnectionNode(connectionNodeAleppoADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-ALEPPO-PD-BTY-C"):addConnectionNode(connectionNodeAleppoADC)

    --Beirut ADC
redIADS:getSAMSiteByGroupName("SAM-SA15-BEIRUT-PD-BTY-A"):addConnectionNode(connectionNodeBeirutADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-BEIRUT-PD-BTY-B"):addConnectionNode(connectionNodeBeirutADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-BEIRUT-PD-BTY-C"):addConnectionNode(connectionNodeBeirutADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-BEIRUT-PD-BTY-D"):addConnectionNode(connectionNodeBeirutADC)

    --Haifa ADC
redIADS:getSAMSiteByGroupName("SAM-SA15-HAIFA-PD-BTY-A"):addConnectionNode(connectionNodeHaifaADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-HAIFA-PD-BTY-B"):addConnectionNode(connectionNodeHaifaADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-HAIFA-PD-BTY-C"):addConnectionNode(connectionNodeHaifaADC)

    --Damascus ADC
redIADS:getSAMSiteByGroupName("SAM-SA15-DAMASCUS-PD-BTY-A"):addConnectionNode(connectionNodeDamascusADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-DAMASCUS-PD-BTY-B"):addConnectionNode(connectionNodeDamascusADC)
redIADS:getSAMSiteByGroupName("SAM-SA15-DAMASCUS-PD-BTY-C"):addConnectionNode(connectionNodeDamascusADC)
    
    --10th Independent Air Defense Corps
redIADS:getSAMSiteByGroupName("SAM-SA15-101-BDE-PD-BTY"):addConnectionNode(connectionNode101BDE)
redIADS:getSAMSiteByGroupName("SAM-SA15-102-BDE-PD-BTY"):addConnectionNode(connectionNode102BDE)

    --20th Independent Air Defense Corps
redIADS:getSAMSiteByGroupName("SAM-SA15-201-BDE-PD-BTY"):addConnectionNode(connectionNode201BDE)
redIADS:getSAMSiteByGroupName("SAM-SA15-202-BDE-PD-BTY"):addConnectionNode(connectionNode202BDE)

    --30th Independent Air Defense Corps
redIADS:getSAMSiteByGroupName("SAM-SA15-300-BDE-PD-BTY"):addConnectionNode(connectionNode300BDE)

    --40th Independent Air Defense Corps
redIADS:getSAMSiteByGroupName("SAM-SA15-400-BDE-PD-BTY"):addConnectionNode(connectionNode400BDE)

--Creating objects from ADC Point Defense Batteries to pass as PD providers
    --Latakia ADC
local latakiaPointDefenseBtyA = redIADS:getSAMSiteByGroupName("SAM-SA15-LATAKIA-PD-BTY-A")
local latakiaPointDefenseBtyB = redIADS:getSAMSiteByGroupName("SAM-SA15-LATAKIA-PD-BTY-B")
local latakiaPointDefenseBtyC = redIADS:getSAMSiteByGroupName("SAM-SA15-LATAKIA-PD-BTY-C")
    
    --Tripoli ADC
local tripoliPointDefenseBtyA = redIADS:getSAMSiteByGroupName("SAM-SA15-TRIPOLI-PD-BTY-A")
local tripoliPointDefenseBtyB = redIADS:getSAMSiteByGroupName("SAM-SA15-TRIPOLI-PD-BTY-B")
local tripoliPointDefenseBtyC = redIADS:getSAMSiteByGroupName("SAM-SA15-TRIPOLI-PD-BTY-C")
local tripoliPointDefenseBtyD = redIADS:getSAMSiteByGroupName("SAM-SA15-TRIPOLI-PD-BTY-D")
local tripoliPointDefense708thBtyC = redIADS:getSAMSiteByGroupName("SAM-SA17-780TH-BTY-C")

--Nominating ADC Point Defense batteries as providers to EWRs/LORAD
    --Latakia ADC
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-LATAKIA"):addPointDefence(latakiaPointDefenseBtyC)
redIADS:getSAMSiteByGroupName("SAM-SA17-790TH-BTY-A"):addPointDefence(latakiaPointDefenseBtyB)
redIADS:getSAMSiteByGroupName("SAM-SA17-790TH-BTY-B"):addPointDefence(latakiaPointDefenseBtyB)
redIADS:getSAMSiteByGroupName("SAM-S300-79TH-RGT"):addPointDefence(latakiaPointDefenseBtyA)

    --Tripoli ADC
redIADS:getSAMSiteByGroupName("SAM-S300-78TH-RGT"):addPointDefence(tripoliPointDefenseBtyC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-TRIPOLI"):addPointDefence(tripoliPointDefenseBtyA, tripoliPointDefense708thBtyC)

--activate the radio menu to toggle IADS Status output
redIADS:addRadioMenu()

redIADS:activate()