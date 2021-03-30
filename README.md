# nvim-config
neovim configration file


### install

```
mkdir -p ~/.config
git clone https://github.com/kernelai/nvim-config.git ~/.config/nvim

```
安装 vim-go
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
安装python-pip
```
yum install -y python-pip
```
安装node
```
curl -sL install-node.now.sh/lts | bash
```
安装 provider
```
pip install neovim
npm install -g neovim
```
#### 安装ccls
对于macos ：
```
brew install ccls
```
对于centos 7.6以上，先安装snap
```
yum install snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
snap install ccls --classic
```
