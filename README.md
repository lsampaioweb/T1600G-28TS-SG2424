# T1600G-28TS-SG2424
Scripts to Setup the Switch Tplink SFP T1600G-28TS-SG2424.

#### Options you can execute:
1. Exit.
2. Setup Switch from Zero to Hero!
3. Prepare Host Machine.
4. Change from DHCP to static IP.
5. Set IPv4 Static Routing to Default Gateway.
6. Enable SSH.
7. Enable Password Encryption.
8. Create Bot User.
9. Set System Time from NTP Server.
10. Enable Remote Logging.
11. Enable HTTPS.
12. Disable HTTP.
13. Set Jumbo Size.
14. Enable DoS Defend.
15. Set Device Description.
16. Enable EEE.
17. Set Link Aggregation Control Protocol (LACP).
18. Set Vlans.
19. Set PVID.
20. Set Interfaces.
21. Set DHCP.
22. Disable Telnet.
23. Set SDM Preference.
24. Upgrade Firmware.
25. Backup.
26. Reboot.
27. Reset with Factory Settings.
28. Restore Settings from Latest Backup.

#### Run:
1. Run the application on the terminal.
```bash
    ./setup.sh
```    

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
1. Add your email as the contact-info, but in order to avoid spammers, encode it in base64.
```bash
    echo "your-email@something.com" | base64
```

2. Decode your email from base64 to use it as the contact-info.
```bash
    echo "eW91ci1lbWFpbEBzb21ldGhpbmcuY29tCg==" | base64 --decode
```
