@echo off
echo ===================================================
echo Hotel Dwarkesh - Android Release Keystore Generator
echo ===================================================
keytool -genkeypair -v -keystore hotel-dwarkesh.keystore -alias dwarkesh -keyalg RSA -keysize 2048 -validity 10000 -storepass dwarkesh2026 -keypass dwarkesh2026 -dname "CN=HotelDwarkesh,OU=App,O=Dwarkesh,L=Kheralu,ST=Gujarat,C=IN"
echo.
echo Keystore created successfully: hotel-dwarkesh.keystore
echo Alias: dwarkesh
echo Password: dwarkesh2026
echo ===================================================
pause
