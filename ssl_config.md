#SSL config

We use the [LetsEncrypt](https://letsencrypt.org/) to generate the certificate and used in `Tomcat` server.

Before you go ahead, please make sure you have one valid domain name which is pointed a specific server.

## How to use

### Domain Binding

To generate the certificate, LetsEncrypt needs to verify the domain name. So please bind the domain name to your server
and ssh login that server.

Notes: You have to login to the server otherwise the certificate generation would fail.

### Generate Certificate and Sign Keystore

#### 1. Installing LetsEncrypt

```
$ git clone https://github.com/letsencrypt/letsencrypt
$ cd letsencrypt
$ ./letsencrypt-auto --help

```

#### 2. Generate Certificate

```
$ ./letsencrypt-auto certonly

```

It would raise up and interaction window and you should choose `2 Automatically use a temporary webserver (standalone)`. Then input the domain name `mydomain.com` in the input field.

```
/etc/letsencrypt/live/mydomain.com
```
You can find the below pem files in this directory.

```
$:/etc/letsencrypt/live/mydomain.com# ls
cert.pem  chain.pem  fullchain.pem  privkey.pem
```

#### 3. Sign the Keystore

Open your terminal and do like so:

```
openssl pkcs12 -export -in ../fullchain.pem -inkey ../privkey.pem -out fullchain_and_key.p12 -name tomcat
```
You will be asked to provide a password (called yourPKCS12pass). You will need it in the next step.

Now that you have our PKCS12 keystore, you can use Java's keytool to generate a JKS from our PKCS12 file like so:

```
keytool -importkeystore -deststorepass yourJKSpass -destkeypass youKeyPass -destkeystore MyDSKeyStore.jks -srckeystore fullchain_and_key.p12 -srcstoretype PKCS12 -srcstorepass yourPKCS12pass -alias tomcat
```

This will give you a file called  MyDSKeyStore.jks. Now you are ready to configure tomcat for HTTPS.

#### 4. Config Tomcat

Go to the tomcat config directory (may be different depending on how you install it):

```
$ cd /app/tomcat/server/conf
```

Edit `server.xml` with vi, and uncomment `Connector` tag like below:

```
<Connector port="8443" protocol="org.apache.coyote.http11.Http11Protocol"
  URIEncoding="UTF-8"
  maxThreads="150"
  SSLEnabled="true"
  scheme="https"
  secure="true"
  clientAuth="false"
  sslProtocol="TLS"
  keystoreFile="/volume1/NetBackup/myds_certs/MyDSKeyStore.jks"
  keystorePass="yourJKSpass"
  keyAlias="tomcat"
  keyPass="yourKeyPass"/>
```

And restart your tomcat server. `mydomain.com:8443`

#### 5. Verify whether it works

You can test whether you configure the SSL correctly with command:

```
$ openssl s_client -connect melo.myds.me:8443
```

Or you can test it in the website: [Whatsmychaincert](https://whatsmychaincert.com/)

### Enjoy it

Congratulations, you can now access your website with https. Enjoy it and please renew it when the certificate due.
