#!/bin/bash

clear

RANDOMUSERNAME="sanatan"

if id "$RANDOMUSERNAME" &>/dev/null; then
	echo "User '$RANDOMUSERNAME' Already Exists."
else
	while true; do
	    read -s -p "Enter Password For S.A.N.A.T.A.N User : " PASSWORD1
	    echo
	    read -s -p "Confirm password : " PASSWORD2
	    echo

	    if [[ "$PASSWORD1" == "$PASSWORD2" ]]; then
		RANDOMPASSWORD="$PASSWORD1"
		break
	    else
		echo "Passwords Do Not Match. Try Again."
	    fi
	done
fi

sudo apt-get update && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y curl

# ==============================================================================
# 1. DOCKER OFFICIAL REPOSITORY SETUP
# ==============================================================================
if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
    echo "Setting up Docker official repository..."
    # Create directory for keyrings if it doesn't exist
    sudo mkdir -p /etc/apt/keyrings
    
    # Download Docker's official GPG key
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
else
    echo "Docker repository already configured. Skipping setup."
fi

# ==============================================================================
# 2. HASHICORP OFFICIAL REPOSITORY SETUP
# ==============================================================================
if [ ! -f /etc/apt/sources.list.d/hashicorp.list ]; then
    echo "Setting up HashiCorp official repository..."
    # Download HashiCorp's official GPG key
    sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/hashicorp-archive-keyring.gpg
    sudo chmod a+r /etc/apt/keyrings/hashicorp-archive-keyring.gpg

    # Add the repository to Apt sources
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
      sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
else
    echo "HashiCorp repository already configured. Skipping setup."
fi

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y ant attr axel curl expect gedit git ipcalc ipset iptables jq plink p7zip-full parallel putty putty-tools pv rsync s3fs socat sshpass terminator tmux tree ufw wget whois yad net-tools python3-full python3-pip build-essential gcc gdb lzip mysql-client mtr ncdu nmap  tk wireguard-tools ttyd mc   texlive-binaries netbase net-tools markdown retext mailutils plocate libgts-bin lvm2 gettext openjdk-21-jdk ant curl git ipcalc ipset iptables jq mc nano nmap openssl parallel pv socat ssh sshpass ufw wget lsof putty pv rsync putty-tools expect terraform vagrant net-tools ttyd ca-certificates curl gnupg tmux cron mysql-client net-tools libvirt-dev docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin terraform vagrant rename maven inotify-tools acl

sudo vagrant plugin install vagrant-disksize vagrant-vbguest vagrant-libvirt
sudo pip3 install mysql-connector-python pycryptodome bcrypt --break-system-packages

echo "virtualbox-ext-pack virtualbox-ext-pack/license select true" | sudo debconf-set-selections
echo "virtualbox-ext-pack virtualbox-ext-pack/license seen true" | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y virtualbox virtualbox-ext-pack virtualbox-ext-pack virtualbox

if id "$RANDOMUSERNAME" &>/dev/null; then
	echo "User '$RANDOMUSERNAME' Already Exists."
else
	sudo useradd -d /home/$RANDOMUSERNAME -s /bin/bash -m $RANDOMUSERNAME
	sudo usermod -p $(echo "$RANDOMPASSWORD" | openssl passwd -1 -stdin) $RANDOMUSERNAME
	sudo usermod -aG sudo $RANDOMUSERNAME
	sudo chfn -f "S.A.N.A.T.A.N" $RANDOMUSERNAME
	sudo rm -f /etc/sudoers.d/$RANDOMUSERNAME-user
	echo "$RANDOMUSERNAME ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$RANDOMUSERNAME-user > /dev/null
	sudo mkdir -p /home/$RANDOMUSERNAME/.ssh
	sudo chown -R $RANDOMUSERNAME:$RANDOMUSERNAME /home/$RANDOMUSERNAME/.ssh
	sudo chmod -R u=rwx,g=rwx,o=rwx /home/$RANDOMUSERNAME/.ssh
	sudo chown -R $RANDOMUSERNAME:$RANDOMUSERNAME /home/$RANDOMUSERNAME
	sudo chmod -R u=rwx,g=rwx,o=rwx /home/$RANDOMUSERNAME

	sudo groupadd docker
	sudo usermod -aG docker $RANDOMUSERNAME 

	echo "$RANDOMPASSWORD" | su - $RANDOMUSERNAME -c 'pip3 install mysql-connector-python pycryptodome bcrypt jupyter_server --break-system-packages'
	echo "$RANDOMPASSWORD" | su - $RANDOMUSERNAME -c 'vagrant plugin install vagrant-disksize vagrant-vbguest vagrant-libvirt'
fi

# Define the raw lines containing all your listed commands and packages
RAW_DATA=(
"ant curl git ipcalc ipset iptables jq mc nano nmap openssl parallel pv socat ssh sshpass ufw wget lsof putty pv rsync putty-tools expect"
"adduser alsa ant apg apt attr awk axel bash bc busybox code containerd cpp cron curl dash dc debconf dpkg ebtables ed editor eject eog evolution expect file firefox ftp gcc gdb gedit gettext git gjs gpg grep gzip host hostname idle info init ipcalc ipset iptables jq less locate login logrotate lpr lsof lzip lzma make man markdown mc mount mtr nano ncdu nmap openssl orca p7zip parallel parted passwd patch perl ping pip plink putty pv python3 rsync runc s3fs sed snap socat ssh sshpass strace sudo systemctl systemd tar telnet terminator terraform time tmux tree ufw unzip vagrant virtualbox vlc wget which whois xxd yad zip"
"adduser alsa ant apg apt attr awk axel bash bc busybox code containerd cpp cron curl dash dc debconf dpkg ebtables ed editor eject eog evolution expect file firefox ftp gcc gdb gedit gettext git gjs gpg grep gzip host hostname idle info init ipcalc ipset iptables jq less locate login logrotate lpr lsof lzip lzma make man markdown mc mount mtr nano ncdu nmap openssl orca p7zip parallel parted passwd patch perl ping pip plink putty pv python3 rsync runc s3fs sed snap socat ssh sshpass strace systemctl systemd telnet terminator terraform time tmux tree ufw unzip vagrant virtualbox vlc wget which whois xxd yad zip"
"7z 7za 7zr acyclic aleph appres ar arch arp as aws base32 base64 basename bitmap blkid bridge browse c44 c89 c99 cancel cat cc chcon chmod chown chpasswd chroot cksum clear cli cluster cmp col column comm compare compose composite convert cp cpan crc32 crontab ctr cut cvt date dcb dconf dd detex df diff dig dir dirname display docker dockerd domainname dot dotty du e2label e4crypt ebb echo edit efix elements env eqn etex ex expand expiry expr factor false find flock fmt fold forge free fuser fusermount gapplication gc gcore GET getent getty gio gpre gprof groupadd groupdel groups gs gsec gunzip halt hd head HEAD hexdump hostnamectl i386 iceauth ico id identify ifconfig import install ip jar java javac join jsonpatch jsonpointer keyring keytool kill last ld link ln locale logger look lp lpc lpf ls lsblk mag md5sum mesg mf mkdir mkfs mkpasswd mktemp modinfo mono more mountpoint mpost mt mtrace mv mysql mysqladmin namei nc net netstat newport nft nice nl nm nohup nop nproc nslookup nstat numfmt obs od open opera ownership pac pager parec parset partprobe paste perf pic pip3 pkill plog pon POST pr precat print printf prlimit pro profiles prove proxy prune ps pslog ptar ptex ptx puttygen pwd rdma readlink reboot red reset resetterm rev rm rmt route rtstat runlevel rview sar scalar scp script see sem seq service setarch setterm sg sh sha256sum shuf shutdown size sleep sort split sql ss sshd stat stream strings strip stty su sum sync sysctl tabs tac tail tbl tc tee tempfile test tex tic tie timeout tipc tload toe top touch tput tr transform troff true truncate trust tset tsort tty tune2fs twill ua ugc ul umount uname unbuffer uncompress uniq unlink uptex uptime useradd usermod users uuidgen vboxmanage vgs vi view VirtualBox vmstat w wall watch wc wg who whoami wish write X X11 x86_64 xargs xgettext xman xwd xz yes zic"
"ant apg attr axel bc busybox cron curl ebtables ed eject eog expect file ftp gcc   gdb gedit gettext git gjs gpg   grep host ipcalc ipset iptables jq   less locate logrotate lpr lsof lzip   lzma make mtr nano ncdu nmap   openssl orca p7zip parallel parted patch   perl plink putty putty-tools pv python3-pip  python3-full  rsync runc s3fs sed socat ssh   sshpass strace telnet terminator time tmux   tree ufw unzip wget whois   xxd yad zip ant curl git ipcalc ipset iptables jq mc nano nmap openssl parallel pv socat ssh sshpass ufw wget lsof putty pv rsync putty-tools expect"
"docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
"ant curl git ipcalc ipset iptables jq mc nano nmap openssl parallel pv socat ssh sshpass ufw wget lsof putty pv rsync putty-tools expect terraform vagrant virtualbox virtualbox-ext-pack net-tools ttyd ca-certificates curl gnupg tmux cron mysql-client net-tools"
)

# Extract unique list while safely leaving hyphens and underscores untouched
ALL_WORDS=$(echo "${RAW_DATA[@]}" | tr ' ' '\n' | sed 's/[(),:=#]//g' | sort -u)
COMMANDS=()

EXCLUDE_LIST="sudo vlc cli mono apt aptget aws code containerd elements evolution keyring newport obs opera resetterm convert dot dotty identify import display composite install -y commands custom installable via available in ubuntu x86_64 acyclic c44 cluster compare crc32 ctr efix forge gc gpre gsec lpf net nop pac parec profiles proxy prune runc stream"

for word in $ALL_WORDS; do
    [[ -z "$word" ]] && continue
    if echo " $EXCLUDE_LIST " | grep -Fq " $word "; then
        continue
    fi
    COMMANDS+=("$word")
done

TOTAL_ITEMS=${#COMMANDS[@]}

if [ "$TOTAL_ITEMS" -eq 0 ]; then
    echo "Error: No Valid Targets Found To Verify."
    exit 1
fi

echo "=================================================="
echo " Total Unique Items Found To Verify: $TOTAL_ITEMS"
echo "=================================================="
echo ""

MISSING_COMMANDS=()
CURRENT_COUNT=0
SCORE=0

draw_progress_bar() {
    local percentage=$1
    local current_score=$2
    local width=40
    local filled=$(( percentage * width / 100 ))
    local empty=$(( width - filled ))
    local bar_filled=$(printf "%${filled}s" | tr ' ' '#')
    local bar_empty=$(printf "%${empty}s" | tr ' ' '-')
    printf "\rAuditing System Score: [%s%s] %d%% Done (Score: %s/100)" "$bar_filled" "$bar_empty" "$percentage" "$current_score"
}

# Main dynamic check engine
for item in "${COMMANDS[@]}"; do
    ((CURRENT_COUNT++))
    FOUND=false

    # 1. Direct Command-Line Execution Check
    if command -v "$item" &>/dev/null; then
        FOUND=true
    
    # 2. Package Management Database Check (For tools like net-tools, python3-pip)
    elif dpkg-query -W -f='${Status}' "$item" 2>/dev/null | grep -q "ok installed"; then
        FOUND=true
        
    # 3. Explicit handling for odd non-binary labels
    elif [ "$item" = "X11" ] && dpkg-query -W -f='${Status}' "x11-common" 2>/dev/null | grep -q "ok installed"; then
        FOUND=true
    fi

    # Scoring metric engine
    if [ "$FOUND" = true ]; then
        SCORE=$(echo "$SCORE + (100 / $TOTAL_ITEMS)" | bc -l)
    else
        MISSING_COMMANDS+=("$item")
    fi
    
    PCT=$(( CURRENT_COUNT * 100 / TOTAL_ITEMS ))
    PRINT_SCORE=$(printf "%.1f" "$SCORE")
    draw_progress_bar "$PCT" "$PRINT_SCORE"
    
    sleep 0.005
done

echo -e "\n\n=================================================="
FINAL_SCORE=$(printf "%.0f" "$SCORE")
echo " Final System Compliance Level: $FINAL_SCORE/100"
echo "=================================================="

PROCEEDTOINSTALL="N"

if [ ${#MISSING_COMMANDS[@]} -ne 0 ]; then
    echo ""
    echo "❌ UNRESOLVED/MISSING DEPENDENCIES:"
    echo "--------------------------------------------------"
    echo "${MISSING_COMMANDS[@]}" | tr ' ' '\n' | column
    echo "--------------------------------------------------"
else
    echo ""
    echo "✨ Perfect! Every Tool & Base Package Successfully Validated."
    PROCEEDTOINSTALL="Y"
fi

if [ "$PROCEEDTOINSTALL" == "Y" ] ; then
	echo ""
	sudo rm -rf /opt/Matsya && sudo mkdir -p /opt/Matsya && sudo chmod -R 777 /opt/Matsya
	
	sudo rm -f /tmp/SANATAN.squashfs
	sudo docker pull minus1by12/sanatan:pranapratishtha-1.0
	TEMPNAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1)
	sudo docker create --name $TEMPNAME minus1by12/sanatan:pranapratishtha-1.0 true
	sudo docker cp $TEMPNAME:/data/SANATAN.squashfs /tmp/
	sudo docker rm $TEMPNAME
	sudo unsquashfs -f -d /opt/Matsya /tmp/SANATAN.squashfs
	sudo rm -f /tmp/SANATAN.squashfs
	
	sudo mkdir -p /opt/Matsya/Repo
	sudo mkdir -p /opt/Matsya/Stack/DockerImages
	sudo mkdir -p /opt/Matsya/Output/Storage/VM

	sudo rm -rf /opt/Matsya/tmp/*
	sudo rm -rf /opt/Matsya/VagVBox/*
	sudo rm -rf /opt/Matsya/Secrets/*
	sudo mkdir -p /opt/Matsya/Secrets/tmp
	sudo rm -rf /opt/Matsya/Output/Pem/*
	sudo rm -rf /opt/Matsya/Output/Scope/*
	sudo rm -rf /opt/Matsya/Output/Vision/*
	sudo rm -rf /opt/Matsya/Output/Terraform/*
	sudo rm -rf /opt/Matsya/Output/Logs/KRISHNA/*
	sudo rm -rf /opt/Matsya/Output/Logs/KURMA/*
	sudo rm -rf /opt/Matsya/Output/Logs/MATSYA/*
	sudo rm -rf /opt/Matsya/Output/Logs/VAMANA/*
	sudo rm -rf /opt/Matsya/BackEnd/certs/*

	sudo rm -f /usr/bin/newport	
	sudo rm -f /usr/bin/sanatanprarambh
	sudo rm -f /usr/bin/sanatanvishram
	sudo rm -f /opt/firefox/firefox
			
	sudo ln -s /opt/Matsya/Scripts/newport.sh /usr/bin/newport
	sudo ln -s /opt/Matsya/sanatan.sh /usr/bin/sanatanprarambh
	sudo ln -s /opt/Matsya/sanatan3.sh /usr/bin/sanatanvishram		
	
	echo "FIRSTRUN" | sudo tee /opt/Matsya/FIRSTRUN
	
	sudo chmod -R 777 /opt/Matsya
		
	sudo mkdir -p /opt/firefox
	sudo ln -s /usr/bin/firefox /opt/firefox/firefox
	
	echo ""
	echo "✨ REBOOT & Login As S.A.N.A.T.A.N User"			
fi

