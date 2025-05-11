#!/bin/bash

# 사용자 입력 받기
read -p "GitHub Email: " email
read -p "GitHub Name: " name

# 1. OpenSSH 설치
echo "Installing OpenSSH..."
sudo pacman -S --noconfirm openssh

# 2. SSH 키 생성
echo "Generating SSH key..."
ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N ""

# 3. SSH 에이전트 시작 및 키 추가
echo "Starting ssh-agent..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 4. 공개키 출력
echo "Here is your public SSH key:"
echo "--------------------------------"
cat ~/.ssh/id_ed25519.pub
echo "--------------------------------"
echo "Copy the above key and add it to GitHub: https://github.com/settings/keys"
xdg-open https://github.com/settings/keys

# 5. SSH 연결 테스트
echo "Testing SSH connection to GitHub..."
ssh -T git@github.com

# 6. Git 설정
echo "Setting global Git config..."
git config --global user.email "$email"
git config --global user.name "$name"

echo "Done! Your Git and SSH configuration is complete."
