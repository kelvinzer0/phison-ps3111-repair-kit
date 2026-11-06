@echo off
for %%m in (fw.bin) do (
if %%~zm EQU 1479168 goto :s1479168
if %%~zm EQU 1544704 goto :s1544704
if %%~zm EQU 1547776 goto :s1547776
goto :ends
)

:s1547776
if not exist phison_fw_convert.exe goto no_cvt
phison_fw_convert.exe fw.bin fwr.bin
for %%m in (fwr.bin) do (
if %%~zm NEQ 1544704 goto :ends
)
copy /b 0m + fwr.bin + 2 fw.exe
del fwr.bin
goto :end

:s1544704
copy /b 0m + fw.bin + 2 fw.exe
goto :end

:s1479168
if not exist 64k goto no64k
for %%m in (64k) do (
if %%~zm NEQ 65536 goto :no64k
)
copy /b 0ms + fw.bin + 64k + 2 fw.exe
goto :end

:nocvt
cls
color 0C
echo Error! phison_fw_convert.exe file not found.
echo -----
echo Ошибка! Файл phison_fw_convert.exe найден.
pause
goto :end

:no64k
cls
color 0C
echo Error! 64k file not found or wrong size.
echo -----
echo Ошибка! Файл 64k найден или неверного размера.
pause
goto :end

:ends
cls
color 0C
echo Error! Firmware file fw.bin not found or unsupported size. Rename supported firmware image file to fw.bin and place it in this directory.
echo -----
echo Ошибка! Файл прошивки fw.bin не найден или имеет неподдерживаемый размер. Переименуйте подходящий файл прошивки в fw.bin и поместите в этот каталог.
pause
goto :end

:end
color 07
