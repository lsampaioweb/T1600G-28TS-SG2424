# T1600G-28TS-SG2424
Scripts to Setup the Switch Tplink SFP T1600G-28TS SG2424.

#### Options you can execute:
1. Exit.
2. Setup Switch from Zero to Hero!
3. Prepare Host Machine.
4. Enable SSH.
5. Upgrade Firmware.

#### Credentials:
1. Create a strong password for the admin user and store it in the **MacOSX** Keychain.
```bash
    security add-generic-password -U -a $USER -s "tplink_user_admin" -j "Password for the admin user in the TP-Link Switch." -w $(openssl rand -base64 32 | colrm 33)
```    

2. Retrieve the admin's password.
```bash
    security find-generic-password -a $USER -s "tplink_user_admin" -w | pbcopy
```
