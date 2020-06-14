ECHO OFF
TITLE MOVING FILES SCRIPT
COLOR d7
IF EXIST _MAIN_FILES_FOLDER (

  ECHO OK: The main folder has been found.
  ECHO OK: Moving files ...
  
  IF EXIST _LIST_OF_FILES_TO_MOVE (
    FOR %%i IN (_MAIN_FILES_FOLDER/*) DO (
      FOR /F "tokens=*" %%A in (_LIST_OF_FILES_TO_BE_MOVED.txt) DO (
        IF %%i == %%A (
          ECHO OK: A match was found ...
          ECHO OK: Moving file ...
          MOVE _MAIN_FILES_FOLDER\%%i _MOVED_FILES_FOLDER
          ECHO OK: File was moved successfully!
        ) ELSE (
          ECHO ERROR: No match was found!
        )
      )
    )
  ) ELSE (
    ECHO ERROR: Text file is missing.
  )

) ELSE (
  ECHO ERROR: Main folder was not found.
)

PAUSE