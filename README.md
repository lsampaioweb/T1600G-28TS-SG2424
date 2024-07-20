# T1600G-28TS-SG2424
Scripts to Setup the Switch Tplink SFP T1600G-28TS-SG2424.

#### Options you can execute:
0. Exit.
1. Setup Switch from Zero to Hero!
2. Prepare Host Machine.
3. Set static IP
4. Enable SSH.
5. Enable Password Encryption.
6. Create Bot User.
7. Set Link Aggregation Control Protocol (LACP).
8. Set Vlans.
9. Set PVID.
10. Enable IPV4 routing.
11. Set Interfaces.
12. Set IPv4 Static Routing to Default Gateway.
13. Set System Time from NTP Server.
14. Enable HTTPS.
15. Disable HTTP.
16. Set Jumbo Size.
17. Enable DoS Defend.
18. Set Device Description.
19. Set SDM Preference.
20. Enable Remote Logging.
21. Disable Telnet.
22. Enable EEE.
23. Upgrade Firmware.
24. Backup.
25. Reboot.
26. Reset with Factory Settings.
27. Restore Settings from Latest Backup.

#### Credentials:
1. Create a strong password for the admin user and store it in the secret manager. After you hit enter, a password will be asked.
```bash
    secret-tool store --label="switch-user-admin" password "switch-user-admin"
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

#### Add ip in the hosts file:
1. Add the switch's ip in the hosts file so we can connect using its name and not its ip.
```bash
    sudo nano /etc/hosts
    192.168.0.3 switch.lan.homelab
```

#### Run:
1. Run the application on the terminal.
```bash
    ./Setup.sh
    or
    ./Setup.sh <option number>
```
