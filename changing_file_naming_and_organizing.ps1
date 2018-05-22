
# When you start any project that involve data management and version control, it is crucial the protocol you implemented to name and organized the files and folder structures. Nonetheless, changes may occur; you and your team may decide to follow a different guideline for naming and organize your files/folders. This code can be useful in case you face such a situation and need to change your files.
#Original Folder and Name structure
#      CODE_YEAR_SURVEY \
#                       \CODE_YEAR_SURVEY_V1_X\DATA\ORIGINAL
#                       \CODE_YEAR_PERIOD1_SURVEY_V1_X_COLECTION1\DATA\STANDARD
#                       \CODE_YEAR_PERIOD1_SURVEY_V1_X__V1_X_COLECTION2\DATA\HARMONIZED
#                       \CODE_YEAR_PERIOD2_SURVEY_V1_X_COLECTION1\DATA\STANDARD
#                       \CODE_YEAR_PERIOD2_SURVEY_V1_X__V1_X_COLECTION2\DATA\HARMONIZED

#New folder and Name structure
#      CODE_YEAR_SURVEY \
#                       \CODE_YEAR_SURVEY-PERIOD1_V1_X_COLECTION1\DATA\ORIGINAL
#                       \CODE_YEAR_SURVEY-PERIOD1_V1_X_COLECTION1\DATA\STANDARD
#                       \CODE_YEAR_SURVEY-PERIOD1_V1_X__V1_X_COLECTION2\DATA\HARMONIZED
#                       \CODE_YEAR_SURVEY-PERIOD2_V1_X_COLECTION1\DATA\ORIGINAL
#                       \CODE_YEAR_SURVEY-PERIOD2_V1_X_COLECTION1\DATA\STANDARD
#                       \CODE_YEAR_SURVEY-PERIOD2_V1_X__V1_X_COLECTION2\DATA\HARMONIZED



##Intructions:
# I. Replace the follow macros with the actual folder and a new folder where the new structure will be saved
$oldLABLAC=C:\oldStructure
$newLABLAC=C:\newStructure
$colection1=col1
$colection2=col2


### After this point, no modification needed

# 1.Get sub-folders informacion for each 1st level folder because the names changes among folders
$Folders1=Get-ChildItem -Path $oldFOLDER
foreach($Folder1 in $Folders1)
{
    $Folder1.Name
    $Elements=$Folder1.Name.Split("_")
    $Country=$Elements[0]
    $Year=$Elements[1]
    $Survey=$Elements[2]

    $Folders2=Get-ChildItem -Path $oldFOLDER\$Folder1\  
    # a. get all the 2nd level folders. May vary accross 1st level countries. In this case the folder name is country-year.
    foreach($Folder2 in $Folders2)     
    {
    $Folder2.Name
    #b Move subfolder3 into corresponding subfolder2
    $subfolderemelents=$Folder2.Name.Split("_")
    If ($subfolderemelents[6] -eq $colection1) {
    
     $period=$subfolderemelents[2]
     $master=$subfolderemelents[4]
     $newname1=$Country+"_"+$Year+"_"+$Survey+"-"+$period+"_"+$master+"_M"

     $newname1
      Copy-item -path $oldFOLDER\$Folder1\$Folder2  -destination $newFOLDER\$Country\$Folder1\$newname1 -Recurse 
      Rename-item -path $newFOLDER\$Country\$Folder1\$newname1\Data\$Folder2.dta -NewName "$newname1.dta"
      Copy-item -path $oldFOLDER\$Folder1\$Country"_"$Year"_"$Survey"_"$master"_M"\Data  -destination $newFOLDER\$Country\$Folder1\$newname1 -Recurse -Force
      Copy-item -path $oldFOLDER\$Folder1\$Country"_"$Year"_"$Survey"_"$master"_M"\Doc  -destination $newFOLDER\$Country\$Folder1\$newname1 -Recurse -Force
      Copy-item -path $oldFOLDER\$Folder1\$Country"_"$Year"_"$Survey"_"$master"_M"\Programs  -destination $newFOLDER\$Country\$Folder1\$newname1 -Recurse -Force

    } elseif ($subfolderemelents[8] -eq $colection2) {

     $period=$subfolderemelents[2]
     $master=$subfolderemelents[4]
     $altern=$subfolderemelents[6]
     $newname2=$Country+"_"+$Year+"_"+$Survey+"-"+$period+"_"+$master+"_M_"+$altern+"_A_"+"lablac-01"

     $newname2
        Copy-item -path $oldFOLDER\$Folder1\$Folder2 -destination $newFOLDER\$Country\$Folder1\$newname2 -Recurse  -Force
        Rename-item -path $newFOLDER\$Country\$Folder1\$newname2\Data\Harmonized\$Folder2.dta -NewName "$newname2.dta"
       
       }
        
    }
}





##FIN