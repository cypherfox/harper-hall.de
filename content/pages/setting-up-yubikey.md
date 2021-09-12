---
title: "Setting up the YubiKey"
date: 2021-08-01
#thumbnail: "img/placeholder.png"
tags:
  - "yubikey"
categories:
  - "Software Engineering"
#menu: main
---


This is my adpation of https://github.com/drduh/YubiKey-Guide

Here I skip the machine setup covery by Dr. Duh. The short of it is: you need a machine with a current kernal that is disconnecte from the network.

Below are my choices and changes. This is even more opinionated than his document.

# Creating Keys

Setup the environment:

```
$ export GNUPGHOME=$(mktemp -d)
$ wget -O $GNUPGHOME/gpg.conf https://raw.githubusercontent.com/drduh/config/master/gpg.conf
```

## Generate a Pin

```
$ tr -dc '[:upper:]' < /dev/urandom | fold -w 20 | head -n1
```

Write down the pin and keep in safe place. Who ever gets the pin and the yubikey will own you!

## Generate a master key

Run this command using the default language, as the localized version only accepts locallized command keys, that may differ from the ones documented here.

Take the PIN into your clipboard before you begin, as the Password dialog will not allow you to switch focus.

```
$ LANG=C gpg --expert --full-generate-key
```

Select `8` (RSA with own capabilities) and remove all capabilities except `Certitify` (See the section on the [Master Key]()https://github.com/drduh/YubiKey-Guide#master-key) in Dr. Duh's guide.


Enter your name and email address, leave the comment field empty.

Export the key ID as a variable. It will be given in a format `<algorithm><key length>/<key ID>`, e.g. `rsa4096/0xAF3E7A88447EB2DB` close to the end of the output from the key generation command.

```
$ export KEYID=0xAF3E7A88447EB2DB
```

## Sub-Keys

Edit key

```
$ LANG=C gpg --expert --edit-key $KEYID
```

Add a signing key with the command `addkey` then select `(4) RSA (sign only)` and choose 4096 bits of key length. Make key valid for 2 years.

Add an encrpytion key with the command `addkey` then select `(6) RSA (enrcrypt only)` and choose 4096 bits of key length. Make key valid for 2 years.


Add an authentication key. There is no pre-provided template for the so after the command `addkey` select `(8) RSA (set your own capabilities` and configure the allowed actions to only show `Authenticate` and choose 4096 bits of key length. Set the validity to 2 years.


## Verify

If you have not already, install the `hopenpgp-tools` for Ubuntu

```
$ sudo apt-get install hopenpgp-tools
```

verfiy that best practices are kept. The check will print an error for the the unlimited validity of the master key and a warning for the lack of an embedded cross certification of the Authorization key.

```
$ gog --export $KEYID | hokey lint
```

## Export the private keys

(Take Passphrase into clipboard first)

```
LANG=C gpg --armor --export-secret-keys $KEYID > $GNUPGHOME/mastersub.key
LANG=C gpg --armor --export-secret-subkeys $KEYID > $GNUPGHOME/mastersub.key
```

Also export a revocation cert for the master key

```
LANG=C gpg --output $GNUPGHOME/revoke.asc --gen-revoke $KEYID
```

## make the public key available

```
LANG=C gpg --armor --export $KEYID > $GNUPGHOME/gpg-$KEYID-$(date +%F).txt
```

This should then be uploaded to a keyserver

# Upload to smartcard

```
LANG=C gpg --edit-card
```


# Use the Yubikey on a different computer

After installing GnuPG (and possibly wget), based on the operating system execute the following:

```
cd
mkdir .gnupg
chmod go-rx .gnupg
cd .gnupg
wget https://raw.githubusercontent.com/drduh/config/master/gpg.conf
```

Then copy the file `$GNUPGHOME/gpg-$KEYID-$(date +%F).txt` to the new machine. We will assume `$PUBKEYFILE` to be the name of the file created on the target machine.
Then import the public keys:

```
gpg --import $PUBKEYFILE
```


