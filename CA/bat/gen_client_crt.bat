@REM  クライアント証明書の作成

 REM  --------------------------------------------------
 REM  共通定義の読み込み
 REM  --------------------------------------------------
call %~dp0define.bat

 REM  --------------------------------------------------
 REM  クライアント証明書（中間CAで署名）
 REM  --------------------------------------------------
set client_key=%SECRET_DIR%\client.key
set client_csr=%SECRET_DIR%\client.csr
set client_crt=%PUBLIC_DIR%\client.crt
set client_pfx=%SECRET_DIR%\client.pfx

@set /p SUBJECT_CN="CNを入力してください："
set SUBJECT_CLIENT_CSR=/C=%SUBJECT_C%/O=%SUBJECT_O%/CN=%SUBJECT_CN%

@REM  クライアント証明書の秘密鍵を作成
@REM      RSA鍵長 = 2048 bit
openssl genrsa -out %client_key% 2048

@REM  クライアント証明書の証明書署名要求（CSR）を作成
openssl req -new -key %client_key% -out %client_csr% -subj %SUBJECT_CLIENT_CSR%

@REM  中間 CA で署名してサーバ証明書を発行
@REM      有効期限 = 365 日（12か月）
@REM      （目安） ルールなし
openssl x509 -req -days 365 -in %client_csr% -CA %intermediate_ca_crt% -CAkey %intermediate_ca_key% -CAcreateserial -out %client_crt%

@REM  中間 CA 証明書を含めた PKCS#12 (.pfx) を作成
@REM  （注意）パスワード入力を求められる
openssl pkcs12 -export -out %client_pfx% -inkey %client_key% -in %client_crt% -certfile %ca_chain_crt%

 REM  --------------------------------------------------
 REM  終了
 REM  --------------------------------------------------
pause
