Opt("TrayIconHide", 1)

$size0 = FileGetSize ( @ScriptDir & "\ocrimg.ini" )
If @error Then
;    MsgBox(16, "Ошибка", "Файл настроек не найден")
    Exit - 1
EndIf

$focr = IniRead("ocrimg.ini", "General", "focr_dir", "c:\focr")
$target = IniRead("ocrimg.ini", "General", "target", "rezocr.txt")

$size0 = FileGetSize ( $focr & "\focr.exe" )
If @error Then
;    MsgBox(16, "Ошибка", "Файл программы не найден")
    Exit - 1
EndIf

If $CmdLine[0] = 0 Then
   $size0 = FileGetSize ( @ScriptDir & "\turbobit_net_v50_GDL_03.png" )
   If @error Then
;       MsgBox(16, "Ошибка", "Графический файл не найден")
       Exit - 1
    Else
       $source = @ScriptDir & "\turbobit_net_v50_GDL_03.png"
    EndIf
Else
    $source = $CmdLine[1]
EndIf

$command = "" & $focr & "\focr.exe " & $source & " " & @ScriptDir & "\" & $target & ""
$rez = RunWait( $command, $focr, @SW_HIDE)
Exit $rez