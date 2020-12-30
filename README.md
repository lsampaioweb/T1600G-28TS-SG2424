# T1600G-28TS-SG2424
Scripts to Setup the Switch Tplink SFP T1600G-28TS-SG2424.

#### Options you can execute:
1. Exit.
2. Setup Switch from Zero to Hero!
3. Prepare Host Machine.
4. Enable SSH.
5. Upgrade Firmware.
6. Enable Password Encryption.
7. Create Bot User.
8. Set System Time from NTP Server.
9. Enable Remote Logging.
10. Enable HTTPS.
11. Disable HTTP.
12. Set Jumbo Size.
13. Enable DoS Defend.
14. Set Device Description.
15. Enable EEE.
16. Set SDM Preference.
17. Disable Telnet.
18. Backup.

#### Credentials:
1. Create a strong password for the admin user and store it in the **MacOSX** Keychain.
```bash
    security add-generic-password -U -a $USER -s "tplink_user_admin" -j "Password for the admin user in the TP-Link Switch." -w $(openssl rand -base64 32 | colrm 33)
```    

2. Retrieve the admin's password.
```bash
    security find-generic-password -a $USER -s "tplink_user_admin" -w | tr -d '\n' | pbcopy
```

3. Add your email as the contact-info, but in order to avoid spammer, encode it in base64.
```bash
    echo "your-email@something.com" | base64
```

4. Decode your email from base64 to use it as the contact-info.
```bash
    echo "eW91ci1lbWFpbEBzb21ldGhpbmcuY29tCg==" | base64 --decode
```
