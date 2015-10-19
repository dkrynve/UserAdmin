@echo off
goto check_Permissions

:check_Permissions
    ::echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        ::echo Success: Administrative permissions confirmed.
		echo %ComputerName% > \\defsus\ComputersWithRights\ByUser\%Username%.txt
		echo %Username% > \\defsus\ComputersWithRights\ByComputer\%ComputerName%.txt
    ) else (
        ::echo Failure: Current permissions inadequate.
		echo %ComputerName% > \\defsus\ComputersWithoutRights\ByUser\%Username%.txt
		echo %Username% > \\defsus\ComputersWithoutRights\ByComputer\%ComputerName%.txt
    )

