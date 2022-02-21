@echo off

set PROGRAM="%~1"
set OUT="%TEMP%\\out.txt"

:: Incorrect arguments count
%PROGRAM% %~dp0\\incorrectArgumentsCountInput.txt > %OUT% && goto err
fc %OUT% %~dp0\\incorrectArgumentsCountOutputCorrect.txt || goto err
echo Test 1 passed

:: Nonexistent input file
%PROGRAM% %~dp0\\nonexistentInput.txt %~dp0\\nonexistentOutput.txt > %OUT% && goto err
fc %OUT% %~dp0\\nonexistentOutputCorrect.txt || goto err
echo Test 2 passed

:: Start cell at the end
%PROGRAM% %~dp0\\startCellEndInput.txt %~dp0\\startCellEndOutput.txt || goto err
fc %~dp0\\startCellEndOutput.txt %~dp0\\startCellEndOutputCorrect.txt || goto err
echo Test 3 passed

:: Start cell at the start
%PROGRAM% %~dp0\\startCellStartInput.txt %~dp0\\startCellStartOutput.txt || goto err
fc %~dp0\\startCellStartOutput.txt %~dp0\\startCellStartOutputCorrect.txt || goto err
echo Test 4 passed

:: Standard
%PROGRAM% %~dp0\\standardInput.txt %~dp0\\standardOutput.txt || goto err
fc %~dp0\\standardOutput.txt %~dp0\\standardOutputCorrect.txt || goto err
echo Test 5 passed

echo All tests passed
exit /B 0

:err
echo Program testing failed
exit /B 1