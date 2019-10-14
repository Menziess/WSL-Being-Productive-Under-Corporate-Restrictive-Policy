# WSL Being Productive Under Corporate Restrictive Policy

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

## 3. Enable Network for apt, curl, and wget

1. Enter your username, password, and proxy settings in the script:

    ```bash
    echo export http_proxy=\"http://<username>:<password>@<proxy-url>:<proxy-port>/\" >> ~/.bashrc
    echo insecure >> ~/.curlrc
    source ~/.bashrc
    source ~/.curlrc
    ```
    
## 4. Set Proxy Variables

1. Run the script in this repo to set additional proxy settings, install Pipenv and Pyenv:

    ```bash
    curl https://raw.githubusercontent.com/Menziess/WSL-Being-Productive-Under-Corporate-Restrictive-Policy/master/mad_scientist.sh | bash
    ```
    
1. Download updates:

    ```bash
    sudo apt update -y
    sudo apt dist-upgrade
    ```
