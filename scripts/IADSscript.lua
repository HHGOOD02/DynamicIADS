do

redIADS = SkynetIADS:create("EMPIRE")

local iadsDebug = redIADS:getDebugSettings()  
iadsDebug.IADSStatus = true
iadsDebug.contacts = true

--[[
iadsDebug.radarWentDark = true
iadsDebug.radarWentLive = true
iadsDebug.ewRadarNoConnection = true
iadsDebug.samNoConnection = true
iadsDebug.jammerProbability = true
iadsDebug.addedEWRadar = true
iadsDebug.hasNoPower = true
iadsDebug.addedSAMSite = true
iadsDebug.warnings = true
iadsDebug.harmDefence = true
iadsDebug.samSiteStatusEnvOutput = true
iadsDebug.earlyWarningRadarStatusEnvOutput = true
--]]

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

--implementing IADS C2 topography

--NW Air Defense Sector Command Center (Doing this ***after*** creating connection nodes, otherwise mist freaks out!)
local nwSectorCommand = StaticObject.getByName("NW-SECTOR-COMMAND")
local swSectorCommand = StaticObject.getByName("SW-SECTOR-COMMAND")
local cSectorCommand = StaticObject.getByName("C-SECTOR-COMMAND")
local nSectorCommand = StaticObject.getByName("N-SECTOR-COMMAND")
local af_Command = StaticObject.getByName("EMPIRE-AIR-DEFENSE-COMMAND")
redIADS:addCommandCenter(nwSectorCommand):addConnectionNode(af_Command)
redIADS:addCommandCenter(swSectorCommand):addConnectionNode(af_Command)
redIADS:addCommandCenter(cSectorCommand):addConnectionNode(af_Command)
redIADS:addCommandCenter(nSectorCommand):addConnectionNode(af_Command)
redIADS:addCommandCenter(af_Command)

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

--Connecting S300 complexes to respective ADC/Brigade D4M1s
    --NW Sector Command
redIADS:getSAMSiteByGroupName("SAM-S300-79TH-RGT"):addConnectionNode(connectionNodeLatakiaADC)
redIADS:getSAMSiteByGroupName("SAM-S300-78TH-RGT"):addConnectionNode(connectionNodeTripoliADC)
redIADS:getSAMSiteByGroupName("SAM-S300-77TH-RGT"):addConnectionNode(connectionNodeAleppoADC)
redIADS:getSAMSiteByGroupName("SAM-S300-101-BDE-1-BN"):addConnectionNode(connectionNode101BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-101-BDE-2-BN"):addConnectionNode(connectionNode101BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-102-BDE-1-BN"):addConnectionNode(connectionNode102BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-102-BDE-2-BN"):addConnectionNode(connectionNode102BDE)

    --SW Sector Command
redIADS:getSAMSiteByGroupName("SAM-S300-83RD-RGT"):addConnectionNode(connectionNodeBeirutADC)
redIADS:getSAMSiteByGroupName("SAM-S300-84TH-RGT"):addConnectionNode(connectionNodeHaifaADC)
redIADS:getSAMSiteByGroupName("SAM-S300-85TH-RGT"):addConnectionNode(connectionNodeDamascusADC)
redIADS:getSAMSiteByGroupName("SAM-S300-201-BDE-1-BN"):addConnectionNode(connectionNode201BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-201-BDE-2-BN"):addConnectionNode(connectionNode201BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-202-BDE-1-BN"):addConnectionNode(connectionNode202BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-202-BDE-2-BN"):addConnectionNode(connectionNode202BDE)

    --Central Sector Command
redIADS:getSAMSiteByGroupName("SAM-S300-300-BDE-1-BN"):addConnectionNode(connectionNode300BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-300-BDE-2-BN"):addConnectionNode(connectionNode300BDE)

    --Northern Sector Command
redIADS:getSAMSiteByGroupName("SAM-S300-400-BDE-1-BN"):addConnectionNode(connectionNode400BDE)
redIADS:getSAMSiteByGroupName("SAM-S300-400-BDE-2-BN"):addConnectionNode(connectionNode400BDE)

--Connecting Search/Early Warning Radars to respective ADC/Brigade D4M1s
    --Latakia ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-79TH-SR"):addConnectionNode(connectionNodeLatakiaADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-LATAKIA"):addConnectionNode(connectionNodeLatakiaADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-LATAKIA"):addConnectionNode(connectionNodeLatakiaADC)

    --Tripoli ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-78TH-SR"):addConnectionNode(connectionNodeTripoliADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-TRIPOLI"):addConnectionNode(connectionNodeTripoliADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-TRIPOLI"):addConnectionNode(connectionNodeTripoliADC)

    --Aleppo ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-77TH-SR"):addConnectionNode(connectionNodeAleppoADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-ALEPPO"):addConnectionNode(connectionNodeAleppoADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-ALEPPO"):addConnectionNode(connectionNodeAleppoADC)

    --Beirut ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-83RD-SR"):addConnectionNode(connectionNodeBeirutADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-BEIRUT"):addConnectionNode(connectionNodeBeirutADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-BEIRUT"):addConnectionNode(connectionNodeBeirutADC)

    --Haifa ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-84TH-SR"):addConnectionNode(connectionNodeHaifaADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-HAIFA"):addConnectionNode(connectionNodeHaifaADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-HAIFA"):addConnectionNode(connectionNodeHaifaADC)

    --Damascus ADC
redIADS:getEarlyWarningRadarByUnitName("SAM-S300-85TH-SR"):addConnectionNode(connectionNodeDamascusADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-DAMASCUS"):addConnectionNode(connectionNodeDamascusADC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-DAMASCUS"):addConnectionNode(connectionNodeDamascusADC)
    
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
redIADS:getSAMSiteByGroupName("SAM-SA15-ALEPPO-PD-BTY-D"):addConnectionNode(connectionNodeAleppoADC)

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
local latakiaPointDefenseBtyC = redIADS:getSAMSiteByGroupName("SAM-SA15-LATAKIA-PD-BTY-C")

    --Tripoli ADC
local tripoliPointDefenseBtyA = redIADS:getSAMSiteByGroupName("SAM-SA15-TRIPOLI-PD-BTY-A")
local tripoliPointDefenseBtyB = redIADS:getSAMSiteByGroupName("SAM-SA15-TRIPOLI-PD-BTY-B")
local tripoliPointDefenseBtyC = redIADS:getSAMSiteByGroupName("SAM-SA15-TRIPOLI-PD-BTY-C")
local tripoliPointDefense708thBtyC = redIADS:getSAMSiteByGroupName("SAM-SA17-780TH-BTY-C")

    --Aleppo ADC
local aleppoPointDefense770thBtyA = redIADS:getSAMSiteByGroupName("SAM-SA17-770TH-BTY-A")
local aleppoPointDefenseBtyC = redIADS:getSAMSiteByGroupName("SAM-SA15-ALEPPO-PD-BTY-C")
local aleppoPointDefenseBtyD = redIADS:getSAMSiteByGroupName("SAM-SA15-ALEPPO-PD-BTY-D")

    --Damascus ADC
local damascusPointDefenseBtyC = redIADS:getSAMSiteByGroupName("SAM-SA15-DAMASCUS-PD-BTY-C")
local damascusPointDefenseBtyA = redIADS:getSAMSiteByGroupName("SAM-SA15-DAMASCUS-PD-BTY-A")
local damascusPointDefense850thBtyA = redIADS:getSAMSiteByGroupName("SAM-SA17-850TH-BTY-A")
local damascusPointDefense850thBtyC = redIADS:getSAMSiteByGroupName("SAM-SA17-850TH-BTY-C")

    --Haifa ADC
local haifaPointDefenseBtyA = redIADS:getSAMSiteByGroupName("SAM-SA15-HAIFA-PD-BTY-A")
local haifaPointDefenseBtyB = redIADS:getSAMSiteByGroupName("SAM-SA15-HAIFA-PD-BTY-B")
local haifaPointDefenseBtyC = redIADS:getSAMSiteByGroupName("SAM-SA15-HAIFA-PD-BTY-C")


--Nominating ADC Point Defense batteries as providers to EWRs/LORAD
    --Latakia ADC
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-LATAKIA"):addPointDefence(latakiaPointDefenseBtyC)
redIADS:getSAMSiteByGroupName("SAM-S300-79TH-RGT"):addPointDefence(latakiaPointDefenseBtyA)

    --Tripoli ADC
redIADS:getSAMSiteByGroupName("SAM-S300-78TH-RGT"):addPointDefence(tripoliPointDefenseBtyC)
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-TRIPOLI"):addPointDefence(tripoliPointDefenseBtyA, tripoliPointDefenseBtyB, tripoliPointDefense708thBtyC)

    --Aleppo ADC
redIADS:getEarlyWarningRadarByUnitName("EWR-LRDG-ALEPPO"):addPointDefence(aleppoPointDefense770thBtyA)
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-ALEPPO"):addPointDefence(aleppoPointDefenseBtyC)
redIADS:getSAMSiteByGroupName("SAM-S300-77TH-RGT"):addPointDefence(aleppoPointDefenseBtyD)

    --Damascus ADC
redIADS:getEarlyWarningRadarByUnitName("EWR-LA-LRDG-DAMASCUS"):addPointDefence(damascusPointDefense850thBtyC)
redIADS:getSAMSiteByGroupName("SAM-S300-85TH-RGT"):addPointDefence(damascusPointDefense850thBtyA, damascusPointDefense850thBtyC, damascusPointDefense850thBtyA, damascusPointDefense850thBtyC)

    --Haifa ADC
redIADS:getSAMSiteByGroupName("SAM-S300-84TH-RGT"):addPointDefence(haifaPointDefenseBtyA, haifaPointDefenseBtyB, haifaPointDefenseBtyC)

--Activate the radio menu to toggle IADS Status output
--redIADS:addRadioMenu()

redIADS:activate()

--Setting up MOOSE A2A GCI/CAP
    
--Initializing a SET GROUP object and using Skynet's MOOSE integration to pass the redIADS EWR network data  
DetectionSetGroup = SET_GROUP:New()
redIADS:addMooseSetGroup(DetectionSetGroup)

--Creating a detection object which groups detected aircraft within a 20km sphere
Detection = DETECTION_AREAS:New( DetectionSetGroup, 20000 )

--Initializing Air to Air Dispatcher using the Detection object
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

--Setting A2A and GCI engagement radii to 150km and 200km respectively
A2ADispatcher:SetEngageRadius(150000)
A2ADispatcher:SetGciRadius(200000)

--Creating and passing data for a border using the waypoints of a late activated group called "EMPIRE-BORDER"
EmpireBorderZone = ZONE_POLYGON:New("EMPIRE-BORDER", GROUP:FindByName("EMPIRE-BORDER"))
A2ADispatcher:SetBorderZone(EmpireBorderZone)

--Setting up IAA-CAF Squadrons (Regiments)

    --Configuring Squadron defaults
A2ADispatcher:SetDefaultTakeOffFromParkingCold()
A2ADispatcher:SetDefaultLandingAtEngineShutdown()

    --1st Fighter Division
A2ADispatcher:SetSquadron("101st Fighter Regiment", "Ramat David", "Su-27", 12) -- CAP @ STEELTOE STATION
A2ADispatcher:SetSquadron("102nd Fighter Regiment", "Ramat David", "Su-27", 12) -- GCI
A2ADispatcher:SetSquadron("103rd Fighter Regiment", "Ramat David", "Su-27", 12) -- GCI

        --Setting flight size to 2 aircraft
A2ADispatcher:SetSquadronGrouping("101st Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("102nd Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("103rd Fighter Regiment", 2)

    --2nd Fighter Division
A2ADispatcher:SetSquadron("201st Fighter Regiment", "Damascus", "Mig-29", 12) -- CAP @ ANGEL STATION
A2ADispatcher:SetSquadron("202nd Fighter Regiment", "Marj Ruhayyii", "Mig-29", 12) -- GCI
A2ADispatcher:SetSquadron("203rd Fighter Regiment", "Marj Ruhayyii", "Mig-29", 12) -- GCI

        --Setting flight size to 2 aircraft
A2ADispatcher:SetSquadronGrouping("201st Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("202nd Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("203rd Fighter Regiment", 2)

        --Adjusting sortie overhead
A2ADispatcher:SetSquadronOverhead("201st Fighter Regiment", 1.5)
A2ADispatcher:SetSquadronOverhead("202nd Fighter Regiment", 1.5)
A2ADispatcher:SetSquadronOverhead("203rd Fighter Regiment", 1.5)

    --3rd Fighter Division
A2ADispatcher:SetSquadron("301st Fighter Regiment", "Al-Dumayr", "Su-27", 12) -- CAP @ POSEIDON STATION
A2ADispatcher:SetSquadron("302nd Fighter Regiment", "Al-Dumayr", "Su-27", 12) -- GCI
A2ADispatcher:SetSquadron("303rd Fighter Regiment", "Al-Dumayr", "Su-27", 12) -- CAP @ POSEIDON STATION

        --Setting flight size to 2 aircraft
A2ADispatcher:SetSquadronGrouping("301st Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("302nd Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("303rd Fighter Regiment", 2)

    --4th Fighter Division
A2ADispatcher:SetSquadron("401st Fighter Regiment", "Shayrat", "Su-27", 12) -- GCI
A2ADispatcher:SetSquadron("402nd Fighter Regiment", "Shayrat", "Su-27", 12) -- CAP @ CHARLIE STATION
A2ADispatcher:SetSquadron("403rd Fighter Regiment", "Shayrat", "Su-27", 12) -- CAP @ CHARLIE STATION

        --Setting flight size to 2 aircraft
A2ADispatcher:SetSquadronGrouping("401st Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("402nd Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("403rd Fighter Regiment", 2)

    --5th Fighter Division
A2ADispatcher:SetSquadron("501st Fighter Regiment", "Hama", "Mig-29", 12) -- CAP @ TOPHAT STATION
A2ADispatcher:SetSquadron("502nd Fighter Regiment", "Hama", "Mig-29", 12) -- GCI
A2ADispatcher:SetSquadron("503rd Fighter Regiment", "Hama", "Mig-29", 12) -- GCI

        --Setting flight size to 2 aircraft
A2ADispatcher:SetSquadronGrouping("501st Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("502nd Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("503rd Fighter Regiment", 2)

        --Adjusting sortie overhead
A2ADispatcher:SetSquadronOverhead("501st Fighter Regiment", 1.5)
A2ADispatcher:SetSquadronOverhead("502nd Fighter Regiment", 1.5)
A2ADispatcher:SetSquadronOverhead("503rd Fighter Regiment", 1.5)

    --6th Fighter Division
A2ADispatcher:SetSquadron("601st Fighter Regiment", "Abu al-Duhur", "Su-27", 12) -- CAP @ WHISKEY STATION
A2ADispatcher:SetSquadron("602nd Fighter Regiment", "Abu al-Duhur", "Su-27", 12) -- GCI
A2ADispatcher:SetSquadron("603rd Fighter Regiment", "Abu al-Duhur", "Su-27", 12) -- CAP @ TOPHAT STATION

        --Setting flight size to 2 aircraft
A2ADispatcher:SetSquadronGrouping("601st Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("602nd Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("603rd Fighter Regiment", 2)

    --7th Fighter Division
A2ADispatcher:SetSquadron("701st Fighter Regiment", "Jirah", "Su-27", 12) -- CAP @ WHISKEY STATION
A2ADispatcher:SetSquadron("702nd Fighter Regiment", "Jirah", "Su-27", 12) -- GCI
A2ADispatcher:SetSquadron("703rd Fighter Regiment", "Tabqa", "Su-27", 12) -- CAP @ BACKPLATE STATION

        --Setting flight size to 2 aircraft
A2ADispatcher:SetSquadronGrouping("701st Fighter Regiment", 2) 
A2ADispatcher:SetSquadronGrouping("702nd Fighter Regiment", 2)
A2ADispatcher:SetSquadronGrouping("703rd Fighter Regiment", 2) 

--Initializing CAP Stations from Trigger Zones
CAPStationBACKPLATE = ZONE:New("CAP-BACKPLATE")
CAPStationWHISKEY = ZONE:New("CAP-WHISKEY")
CAPStationTOPHAT = ZONE:New("CAP-TOPHAT")
CAPStationCHARLIE = ZONE:New("CAP-CHARLIE")
CAPStationANGEL = ZONE:New("CAP-ANGEL")
CAPStationPOSEIDON = Zone:New("CAP-POSEIDON")
CAPStationSTEELTOE = Zoine:New("CAP-STEELTOE")

--Assigning CAP Missions

    --BACKPLATE STATION
A2ADispatcher:SetSquadronCap("703rd Fighter Regiment", CAPStationBACKPLATE, 6000, 10000, 600, 800, 800, 1200, "BARO")
A2ADispatcher:SetSquadronCapInterval("703rd Fighter Regiment", 2, 30, 120, 1)

    --WHISKEY STATION
A2ADispatcher:SetSquadronCap("701st Fighter Regiment", CAPStationWHISKEY, 6000, 10000, 600, 800, 800, 1200, "BARO")
A2ADispatcher:SetSquadronCapInterval("701st Fighter Regiment", 1, 30, 120, 1)

A2ADispatcher:SetSquadronCap("601st Fighter Regiment", CAPStationWHISKEY, 6000, 10000, 600, 800, 800, 1200, "BARO")
A2ADispatcher:SetSquadronCapInterval("601st Fighter Regiment", 1, 30, 120, 1)

    --TOPHAT STATION
A2ADispatcher:SetSquadronCap("603rd Fighter Regiment", CAPStationTOPHAT, 6000, 10000, 600, 800, 800, 1200, "BARO")
A2ADispatcher:SetSquadronCapInterval("603rd Fighter Regiment", 1, 30, 120, 1)

A2ADispatcher:SetSquadronCap("501st Fighter Regiment", CAPStationTOPHAT, 6000, 10000, 600, 800, 800, 1200, "BARO")
A2ADispatcher:SetSquadronCapInterval("501st Fighter Regiment", 1, 30, 120, 1)

    --CHARLIE STATION
A2ADispatcher:SetSquadronCap("402nd Fighter Regiment", CAPStationCHARLIE, 6000, 10000, 600, 800, 800, 1200, "BARO")
A2ADispatcher:SetSquadronCapInterval("402nd Fighter Regiment", 1, 30, 120, 1)

A2ADispatcher:SetSquadronCap("403rd Fighter Regiment", CAPStationCHARLIE, 6000, 10000, 600, 800, 800, 1200, "BARO")
A2ADispatcher:SetSquadronCapInterval("403rd Fighter Regiment", 1, 30, 120, 1)

    --ANGEL STATION
A2ADispatcher:SetSquadronCap("201st Fighter Regiment", CAPStationANGEL, 6000, 10000, 600, 800, 800, 1200, "BARO")
A2ADispatcher:SetSquadronCapInterval("201st Fighter Regiment", 2, 30, 120, 1)

    --POSEIDON STATION
A2ADispatcher:SetSquadronCap("301st Fighter Regiment", CAPStationPOSEIDON, 6000, 10000, 600, 800, 800, 1200, "BARO")
A2ADispatcher:SetSquadronCapInterval("301st Fighter Regiment", 1, 30, 120, 1)

A2ADispatcher:SetSquadronCap("303rd Fighter Regiment", CAPStationPOSEIDON, 6000, 10000, 600, 800, 800, 1200, "BARO")
A2ADispatcher:SetSquadronCapInterval("303rd Fighter Regiment", 1, 30, 120, 1)

    --STEELTOE STATION
A2ADispatcher:SetSquadronCap("101st Fighter Regiment", CAPStationSTEELTOE, 6000, 10000, 600, 800, 800, 1200, "BARO")
A2ADispatcher:SetSquadronCapInterval("101st Fighter Regiment", 2, 30, 120, 1)

--Assigning GCI Missions

A2ADispatcher:SetSquadronGci("102nd Fighter Regiment", 800, 1200)
A2ADispatcher:SetSquadronGci("103rd Fighter Regiment", 800, 1200)

A2ADispatcher:SetSquadronGci("202nd Fighter Regiment", 800, 1200)
A2ADispatcher:SetSquadronGci("203rd Fighter Regiment", 800, 1200)

A2ADispatcher:SetSquadronGci("302nd Fighter Regiment", 800, 1200)

A2ADispatcher:SetSquadronGci("401st Fighter Regiment", 800, 1200)

A2ADispatcher:SetSquadronGci("502nd Fighter Regiment", 800, 1200)
A2ADispatcher:SetSquadronGci("503rd Fighter Regiment", 800, 1200)

A2ADispatcher:SetSquadronGci("602nd Fighter Regiment", 800, 1200)

A2ADispatcher:SetSquadronGci("702nd Fighter Regiment", 800, 1200)

--Showing Display
A2ADispatcher:SetTacticalDisplay(true)

--Activates A2ADispatcher
A2ADispatcher:Start()

--test to see which groups are added and removed to the SET_GROUP at runtime by Skynet:
function outputNames()
	env.info("IADS Radar Groups added by Skynet:")
	env.info(DetectionSetGroup:GetObjectNames())
end

mist.scheduleFunction(outputNames, self, 1, 2)
--end test

end