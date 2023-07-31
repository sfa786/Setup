
sudo -v


sudo apt-get update && sudo apt-get -y upgrade 
sudo apt install -y fish bat unzip curl net-tools wget
EXA_VERSION=$(curl -s "https://api.github.com/repos/ogham/exa/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo exa.zip "https://github.com/ogham/exa/releases/latest/download/exa-linux-x86_64-v${EXA_VERSION}.zip"
sudo unzip -q -o exa.zip bin/exa -d /usr/local
rm -rf exa.zip
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -f -y
mkdir -p ~/.config/fish/ && cd ~/.config/fish/ && wget -NS "https://raw.githubusercontent.com/sfa786/Setup/main/Linux/config.fish"
cd ~/.config/ && wget -NS "https://raw.githubusercontent.com/sfa786/Setup/main/Common/starship.toml"  && cd ~/.config/fish 


chsh
/usr/bin/fish
