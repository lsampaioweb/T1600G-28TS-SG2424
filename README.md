# T1600G-28TS-SG2424
Scripts to Setup the Switch Tplink SFP T1600G-28TS-SG2424.

#### Options you can execute:
1. Exit.
2. Setup Switch from Zero to Hero!
3. Prepare Host Machine.
4. Enable SSH.
5. Enable Password Encryption.
6. Create Bot User.
7. Set System Time from NTP Server.
8. Enable Remote Logging.
9. Enable HTTPS.
10. Disable HTTP.
11. Set Jumbo Size.
12. Enable DoS Defend.
13. Set Device Description.
14. Enable EEE.
15. Set SDM Preference.
16. Disable Telnet.
17. Upgrade Firmware.
18. Backup.
19. Reboot.
20. Reset with Factory Settings.
21. Restore Settings from Latest Backup.

#### Credentials:
1. Create a strong password for the admin user and store it in the **MacOSX** Keychain.
```bash
    security add-generic-password -U -a $USER -s "tplink_user_admin" -j "Password for the admin user in the TP-Link Switch." -w $(openssl rand -base64 32 | colrm 33)
```    

2. Retrieve the admin's password.
```bash
    security find-generic-password -a $USER -s "tplink_user_admin" -w | tr -d '\n' | pbcopy
```

#### Contact-Info:
1. Add your email as the contact-info, but in order to avoid spammer, encode it in base64.
```bash
    echo "your-email@something.com" | base64
```

2. Decode your email from base64 to use it as the contact-info.
```bash
    echo "eW91ci1lbWFpbEBzb21ldGhpbmcuY29tCg==" | base64 --decode
```
