
sudo -v

sudo apt-get update && sudo apt-get -y upgrade 
sudo apt install -y fish bat unzip curl net-tools wget

sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza


sh -c "$(curl -fsSL https://starship.rs/install.sh)" -f -y

mkdir -p ~/.config/fish/ && cd ~/.config/fish/ && wget -NS "https://raw.githubusercontent.com/sfa786/Setup/main/Linux/config.fish"
cd ~/.config/ && wget -NS "https://raw.githubusercontent.com/sfa786/Setup/main/Common/starship.toml"  && cd ~/.config/fish 


chsh
/usr/bin/fish
