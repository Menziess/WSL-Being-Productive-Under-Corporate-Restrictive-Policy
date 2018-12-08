# WSL - Windows Subsystem for Linux

Big corporations may hinder an employees productivity with restrictive policies, narrowing the employees toolset down to Internet Explorer 11, Microsoft command line, Putty, and other installables. Some corporations even shut down Windows Store, so that the employee is not able to install Windows Subsystem for Linux.

## 1. Activate Subsystem

1. Press the `windows key`
1. Search for `Powershell`
1. Right click and `Run as administrator`
1. `Paste`:

    ```bash
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    ```

1. Press `Y`

## 2. Install Distribution

> **Note:** Ubuntu 1804 is commonly used, so we'll use that as an example.

1. `Download` Distribution:

    ```bash
    Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing
    ```

1. `Rename` the file extension and `extract`:

    ```bash
    Rename-Item ~/Ubuntu.appx ~/Ubuntu.zip
    Expand-Archive ~/Ubuntu.zip ~/Ubuntu
    ```

1. In the target folder, `execute ubuntu1804.exe`

## 3. Enable Network for Apt

1. Edit the apt config file:

    ```bash
    sudo nano /etc/apt/apt.conf
    ```

1. Paste the following (with right mouse button):

    ```bash
    Acquire::http::Proxy "http://<username>:<password>@<proxyurl>:<proxyport>";
    ```

1. Press `ctrl-x` + `y` to save and exit
1. Download updates:

    ```bash
    sudo apt update -y
    sudo apt dist-upgrade
    ```

## 4. Set Proxy Variables

1. Edit environment file:

    ```bash
    sudo nano /etc/environment
    ```

1. Add the following lines:

    ```bash
    http_proxy="http://<username>:<password>@<proxyurl>:<proxyport>"
    https_proxy="http://<username>:<password>@<proxyurl>:<proxyport>"
    ftp_proxy="http://<username>:<password>@<proxyurl>:<proxyport>"
    ```
