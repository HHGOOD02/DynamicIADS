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


--implementing IADS C2 topography [NOTE: S-300 Regiments with 54K6 are able to control on-net EWRs organic to an S-300 complex, but not dissimilar SAM systems]
    --Nodes for ADC D4M1s
local connectionNodeLatakiaADC = StaticObject.getByName("LATAKIA-ADC-C2")
local connectionNodeTripoliADC = StaticObject.getByName("TRIPOLI-ADC-C2")
local connectionNodeAleppoADC = StaticObject.getByName("ALEPPO-ADC-C2")

    --Nodes for S-300 54K6
local conenctionNode79th = Unit.getByName("SAM-S300-79TH-C2")
local connectionNode78th = Unit.getByName("SAM-S300-78TH-C2")
local connectionNode77th = Unit.getByName("SAM-S300-77TH-C2")

--NW Air Defense Sector Command Center (Doing this ***after*** creating connection nodes, otherwise mist freaks out!)
local nwSectorCommand = StaticObject.getByName("NW-SECTOR-COMMAND")
redIADS:addCommandCenter(nwSectorCommand):addConnectionNode(connectionNodeLatakiaADC, connectionNodeTripoliADC, connectionNodeAleppoADC)

--Connecting S300 complexes to respective ADC D4M1s
redIADS:getSAMSiteByGroupName("SAM-S300-79TH-RGT"):addConnectionNode(connectionNodeLatakiaADC)
redIADS:getSAMSiteByGroupName("SAM-S300-78TH-RGT"):addConnectionNode(connectionNodeTripoliADC)
redIADS:getSAMSiteByGroupName("SAM-S300-77TH-RGT"):addConnectionNode(connectionNodeAleppoADC)

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