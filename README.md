# Bastille-vaultwarden
Alternative implementation of the Bitwarden server API written in Rust and compatible with upstream Bitwarden clients*, perfect for self-hosted deployment where running the official resource-heavy service might not be ideal.

Install Vaultwarden in a FreeBSD Jail environment
Installation overview using XigmanasNAS Bastille Extension Gui

## Jail Setup
1. From the main screen select Extension/Bastille

2. Click ADD [+] button

3. Name (any name will work): vaultwarden

4. Configure Network Properties to your liking

5. Base Release: 12.3-Release (or newer)

6. Jail Type: 
- [ ] Create a thick container.
- [x] Enable VNET(VIMAGE).
- [ ] Create an empty container.
- [x] Start after creation.
- [x] Auto start on boot.

7. Click Create

8. Click Save

9. Restart the jail.


## Applying the Vaultwarden template to the newly created jail

1. SSH to your Xigmanas Server

2. BOOTSTRAP the template
`bastille bootstrap https://github.com/DarkenLight/Bastille-Bastille-vaultwarden`

3. Apply the Template to the TARGATE jail.
`bastille template vaultwarden DarkenLight/Bastille-Bastille-vaultwarden`


## Thanks to Vaultwarden Developers
https://github.com/dani-garcia/vaultwarden
