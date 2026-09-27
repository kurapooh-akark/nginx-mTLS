@REM  Wake On Lan による PC の起動

 REM  --------------------------------------------------
 REM  コードページ変更（パワーシェルの文字化け対策）
 REM  --------------------------------------------------

chcp 65001 > nul

 REM  --------------------------------------------------
 REM  マジックパケット の設定値
 REM  --------------------------------------------------

@REM 起動したいPCのMACアドレスを指定（ハイフン区切りまたはコロン区切り）
set MAC_ADDRESS=00-00-00-00-00-00

@REM ブロードキャストアドレス（通常はこのままでOKです）
set BROADCAST_IP=255.255.255.255

@REM ポート番号（通常は9または7）
set PORT=9

 REM  --------------------------------------------------
 REM  マジックパケット の送信
 REM  --------------------------------------------------

@echo MACアドレス [%MAC_ADDRESS%] へマジックパケットを送信します...

powershell -Command ^
    "$mac = '%MAC_ADDRESS%'.Replace('-', '').Replace(':', '');" ^
    "$byte = [byte[]](,0xFF * 6);" ^
    "for ($i = 0; $i -lt 16; $i++) { " ^
    "    for ($j = 0; $j -lt 6; $j++) { " ^
    "        $byte += [Convert]::ToByte($mac.Substring($j * 2, 2), 16) " ^
    "    } " ^
    "};" ^
    "$client = New-Object System.Net.Sockets.UdpClient;" ^
    "$client.Client.EnableBroadcast = $true;" ^
    "$ip = [System.Net.IPAddress]::Parse('%BROADCAST_IP%');" ^
    "$endpoint = New-Object System.Net.IPEndPoint($ip, %PORT%);" ^
    "$client.Send($byte, $byte.Length, $endpoint) | Out-Null;" ^
    "$client.Dispose();"

 REM  --------------------------------------------------
 REM  終了
 REM  --------------------------------------------------
pause
