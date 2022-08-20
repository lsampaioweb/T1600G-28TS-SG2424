# T1600G-28TS-SG2424
Scripts to Setup the Switch Tplink SFP T1600G-28TS-SG2424.

#### Options you can execute:
1. Exit.
2. Setup Switch from Zero to Hero!
3. Prepare Host Machine.
4. Set static IP
5. Enable SSH.
6. Enable Password Encryption.
7. Create Bot User.
8. Set Link Aggregation Control Protocol (LACP).
9. Set Vlans.
10. Set PVID.
11. Enable IPV4 routing.
12. Set Interfaces.
13. Set IPv4 Static Routing to Default Gateway.
14. Set System Time from NTP Server.
15. Enable HTTPS.
16. Disable HTTP.
17. Set Jumbo Size.
18. Enable DoS Defend.
19. Set Device Description.
20. Set SDM Preference.
21. Enable Remote Logging.
22. Disable Telnet.
23. Enable EEE.
24. Upgrade Firmware.
25. Backup.
26. Reboot.
27. Reset with Factory Settings.
28. Restore Settings from Latest Backup.

#### Run:
1. Run the application on the terminal.
```bash
    ./Setup.sh
```    

#### Credentials:
1. Create a strong password for the admin user and store it in the secret manager.
```bash
    secret-tool store --label="switch-user-admin" password
```    

2. Retrieve the admin's password.
```bash
    secret-tool lookup password "switch-user-admin"
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
