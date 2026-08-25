@REM  共通定義

 REM  --------------------------------------------------
 REM  CA の属性
 REM  --------------------------------------------------

@REM  サブジェクト
set SUBJECT_C=JP
set SUBJECT_ST=Tokyo
set SUBJECT_O=MyCompany

set SUBJECT_CN_ROOT=MyRootCA
set SUBJECT_CN_INTM=MyIntermediateCA

 REM  --------------------------------------------------
 REM  パス
 REM  --------------------------------------------------

@REM  OpenSSL のパスを通す
set PATH=%PATH%;C:\Program Files\OpenSSL-Win64\bin

 REM  --------------------------------------------------
 REM  ファイルパス
 REM  --------------------------------------------------

@REM  ファイルパス
set CONFIG_DIR=..\conf

@REM  シークレット
set SECRET_DIR=..\keys_secret
mkdir %SECRET_DIR% > NUL 2>&1

@REM  公開情報
set PUBLIC_DIR=..\keys_public
mkdir %PUBLIC_DIR% > NUL 2>&1

@REM  ルート CA
set root_ca_key=%SECRET_DIR%\root_ca.key
set root_ca_crt=%PUBLIC_DIR%\root_ca.crt

@REM  中間 CA
set intermediate_ca_key=%SECRET_DIR%\intermediate_ca.key
set intermediate_ca_csr=%SECRET_DIR%\intermediate_ca.csr
set intermediate_ca_cnf=%CONFIG_DIR%\intermediate_ca.cnf
set intermediate_ca_crt=%PUBLIC_DIR%\intermediate_ca.crt
set ca_chain_crt=%PUBLIC_DIR%\ca_chain.crt
