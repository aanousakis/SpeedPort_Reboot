# SpeedPort_Reboot
Bash script to restart the ZTE SpeedPort Entry 2i modem from terminal.

## Configuration 
User's credentials and modem's ip address are required in order to execute the script


### Credentials

Username and password are stored in the credentials file

```bash
username=<username>
password=<password>
```

### Default IP address
The default ip address is stored in the script.sh file.

```bash
router_ip='http://192.168.1.1'
```


## Execution 


```bash
cd SpeedPort_Reboot
./script.sh
```