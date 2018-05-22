# Changing_File_Naming
When you start any project that involve data management and version control, it is crucial the protocol you implemented to name and organized the files and folder structures. Nonetheless, changes may occur; you and your team may decide to follow a different guideline for naming and organize your files/folders. This code can be useful in case you face such a situation and need to change your files.

#Original Folder and Name structure

      CODE_YEAR_SURVEY \
                       \CODE_YEAR_SURVEY_V1_X\DATA\ORIGINAL
                       \CODE_YEAR_PERIOD1_SURVEY_V1_X_COLECTION1\DATA\STANDARD
                       \CODE_YEAR_PERIOD1_SURVEY_V1_X__V1_X_COLECTION2\DATA\HARMONIZED
                       \CODE_YEAR_PERIOD2_SURVEY_V1_X_COLECTION1\DATA\STANDARD
                       \CODE_YEAR_PERIOD2_SURVEY_V1_X__V1_X_COLECTION2\DATA\HARMONIZED

#New folder and Name structure

      CODE_YEAR_SURVEY \
                       \CODE_YEAR_SURVEY-PERIOD1_V1_X_COLECTION1\DATA\ORIGINAL
                       \CODE_YEAR_SURVEY-PERIOD1_V1_X_COLECTION1\DATA\STANDARD
                       \CODE_YEAR_SURVEY-PERIOD1_V1_X__V1_X_COLECTION2\DATA\HARMONIZED
                       \CODE_YEAR_SURVEY-PERIOD2_V1_X_COLECTION1\DATA\ORIGINAL
                       \CODE_YEAR_SURVEY-PERIOD2_V1_X_COLECTION1\DATA\STANDARD
                       \CODE_YEAR_SURVEY-PERIOD2_V1_X__V1_X_COLECTION2\DATA\HARMONIZED
