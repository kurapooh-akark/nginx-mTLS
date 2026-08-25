@REM  サーバ証明書の作成

 REM  --------------------------------------------------
 REM  共通定義の読み込み
 REM  --------------------------------------------------
call %~dp0define.bat

 REM  --------------------------------------------------
 REM  サーバ証明書（中間CAで署名）
 REM  --------------------------------------------------
set server_key=%SECRET_DIR%\server.key
set server_csr=%SECRET_DIR%\server.csr
set server_cnf=%CONFIG_DIR%\server.cnf
set server_crt=%PUBLIC_DIR%\server.crt
set server_chain_crt=%PUBLIC_DIR%\server_chain.crt

@REM  サーバ証明書の秘密鍵を作成
@REM      RSA鍵長 = 2048 bit
openssl genrsa -out %server_key% 2048

@REM  サーバ証明書の証明書署名要求（CSR）を作成
openssl req -new -key %server_key% -out %server_csr% -config %server_cnf%

@REM  中間 CA で署名してサーバ証明書を発行
@REM      有効期限 = 825 日（27か月）
@REM      （目安） 12か月～27か月 程度
openssl x509 -req -days 825 -in %server_csr% -CA %intermediate_ca_crt% -CAkey %intermediate_ca_key% -CAcreateserial -out %server_crt% -extfile %server_cnf% -extensions req_ext

@REM  証明書チェーンを作成
copy /b %server_crt% + %intermediate_ca_crt% %server_chain_crt%

 REM  --------------------------------------------------
 REM  終了
 REM  --------------------------------------------------
pause
