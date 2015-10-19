@echo off
goto check_Permissions

:check_Permissions
    ::echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        ::echo Success: Administrative permissions confirmed.
		echo %Username% > \\defsus\ComputersWithRights\ByUser\%ComputerName%.txt
		echo %ComputerName% > \\defsus\ComputersWithRights\ByComputer\%Username%.txt
    ) else (
        ::echo Failure: Current permissions inadequate.
		echo %Username% > \\defsus\ComputersWithoutRights\ByUser\%ComputerName%.txt
		echo %ComputerName% > \\defsus\ComputersWithoutRights\ByComputer\%Username%.txt
    )

