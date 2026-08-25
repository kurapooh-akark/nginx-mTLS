@REM  ルートCA、中間CAの作成

 REM  --------------------------------------------------
 REM  共通定義の読み込み
 REM  --------------------------------------------------
call %~dp0define.bat

 REM  --------------------------------------------------
 REM  ルート CA
 REM  --------------------------------------------------

@REM  サブジェクト
set SUBJECT_ROOT_CA=/C=%SUBJECT_C%/ST=%SUBJECT_ST%/O=%SUBJECT_O%/CN=%SUBJECT_CN_ROOT%

@REM  ルート CA の秘密鍵を作成
@REM      RSA鍵長 = 4096 bit
openssl genrsa -out %root_ca_key% 4096

@REM  ルート CA を作成
@REM      有効期限 = 7300 日（20年）
@REM      （目安） 10年～20年 程度
openssl req -new -x509 -days 7300 -key %root_ca_key% -out %root_ca_crt% -subj "%SUBJECT_ROOT_CA%"

 REM  --------------------------------------------------
 REM  中間 CA
 REM  --------------------------------------------------

@REM  サブジェクト
set SUBJECT_INTM_CA=/C=%SUBJECT_C%/ST=%SUBJECT_ST%/O=%SUBJECT_O%/CN=%SUBJECT_CN_INTM%

@REM  中間 CA の秘密鍵を作成
@REM      RSA鍵長 = 4096 bit
openssl genrsa -out %intermediate_ca_key% 4096

@REM  中間 CA の証明書署名要求（CSR）を作成
openssl req -new -key %intermediate_ca_key% -out %intermediate_ca_csr% -subj "%SUBJECT_INTM_CA%"

@REM  ルート CA で署名して中間 CA 証明書を発行
@REM      有効期限 = 3650 日（10年）
@REM      （目安） 数年～10年 程度
openssl x509 -req -days 3650 -in %intermediate_ca_csr% -CA %root_ca_crt% -CAkey %root_ca_key% -CAcreateserial -out %intermediate_ca_crt% -extfile %intermediate_ca_cnf% -extensions v3_intermediate_ca

@REM  CA 証明書チェーンを作成
copy /b %intermediate_ca_crt% + %root_ca_crt% %ca_chain_crt%

 REM  --------------------------------------------------
 REM  終了
 REM  --------------------------------------------------
pause
