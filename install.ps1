write-host "Opening browser windows for some tools" -foregroundcolor green
start https://www.1password.com

write-host "Installing Chocolatey" -foregroundcolor green
write-host "Setting execution policy ByPass" -foregroundcolor yellow
Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

write-host "Registering chocolatey as package manager" -foregroundcolor green
get-packageprovider -name chocolatey
set-packagesource -name chocolatey

write-host "Refreshing environment variables" -foregroundcolor green
refreshenv

write-host "Configuring chocolatey cache folder" -foregroundcolor green
New-Variable -Name CACHE_DIR -Value $HOME\ChocolateyCache
mkdir $CACHE_DIR
choco config set cacheLocation $CACHE_DIR

write-host "Installing all programs using chocolatey" -foregroundcolor green
choco install googlechrome firefox evernote todoist atom -y
choco install jdk8 maven git sourcetree dropbox intellijidea-ultimate nvm -y
choco install superputty docker docker-compose docker-machine virtualbox docker-kitematic -y

write-host "Configuring installed packages" -foregroundcolor green
refreshenv
nvm install latest
docker-machine create default

write-host "Resetting chocolatey cache"
rm -r $CACHE_DIR\*
