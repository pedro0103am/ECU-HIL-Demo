'-------------------------------------------------------------------------------
'-- VBS script file
'-- Created on 10/20/2014 13:36:07
'-- Author: 
'-- Comment: 
'-------------------------------------------------------------------------------
Option Explicit  'Forces the explicit declaration of all the variables in a script.

Dim TDMSPath

Dim TestName
TDMSPath = Data.GetChannel("TDMS_File_Name").Values(1)
Call Data.Root.Clear()
Call DataFileLoad(TDMSPath,"TDMS","")


TestName = Split( Cstr(Data.Root.Properties("Name").Value), "_", -1, vbTextCompare)

Call ChnUnitConvert("[1]/System Time","/System Time","s")
Call ChnOffset("[1]/System Time","/System Time",0,"first value offset")


Call Report.LoadLayout("C:\Users\PasswordIsNI\Documents\HIL ECU demo 2014\Diadem Files\CC1.TDR")
Call Report.Refresh

Call Report.Sheets.ExportToPDF("C:\Users\PasswordIsNI\Documents\HIL ECU demo 2014\Reports\" & TestName(0) & "_results/CC.PDF" ,False)
Call Data.Root.Clear()