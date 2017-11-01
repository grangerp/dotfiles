install: install-development-tools \
	install-gnome \
	install-virtualenvwrapper \
	install-bash  \
	install-bin \
	install-vcprompt \
	install-git \
	install-tmux \
	install-vimrc \
	install-nvim-init\
	install-steam \
	install-rambox

install-development-tools:
	#sudo add-apt-repository ppa:phoerious/keepassxc; 
	#sudo apt update
	sudo apt install build-essential 
	sudo apt install keepassxc python3-pip curl nautilus-dropbox neovim python3-neovim sirikali gocryptfs tmux python3-venv

install-gnome:
	sudo apt install gnome-tweak-tool gnome-session gnome-calendar gnome-maps gnome-weather polari gnome-documents gnome-photos gnome-music
	#To get the GDM3 login screen to use the upstream GNOME color scheme you need to run this command (via Linux Guy):
	#sudo update-alternatives --config gdm3.css

install-steam:
	sudo apt install steam steam-devices

install-virtualenvwrapper:
	sudo apt install virtualenvwrapper
	mkdir -p ~/.virtualenvs/

install-bash:
	ln -fs `pwd`/bash/bashrc ~/.bash_profile
	ln -fs ~/.bash_profile ~/.bashrc
	@echo "Old .bash_profile saved as .bash_profile.old"

install-bin:
	mkdir -p ~/.bin/
	ln -fs `pwd`/bin/* ~/.bin/

install-vcprompt:
	@rm -rf /tmp/vcprompt
	@mkdir -p /tmp/vcprompt
	@cd /tmp/vcprompt && curl -OL https://bitbucket.org/mitsuhiko/vcprompt/get/default.tar.gz && \
	    tar zxf default.tar.gz && cd mitsuhiko-* && make && \
	    echo "Installing vcprompt to /usr/local/bin/vcprompt" && sudo mv vcprompt /usr/local/bin/vcprompt
	@rm -rf /tmp/vcprompt

install-git:
	ln -fs `pwd`/git/gitconfig ~/.gitconfig
	curl -o ~/.git-completion.bash https://github.com/git/git/raw/master/contrib/completion/git-completion.bash -OL

install-tmux:
	ln -fs `pwd`/tmux/.tmux.conf ~/.tmux.conf

install-vimrc:	
	if test -d "~/.vim/bundle" ]; then \
	  mkdir -p ~/.vim/bundle/; git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle; ln -fs `pwd`/vim/.vimrc ~/.vimrc; \
	fi

install-nvim-init:
	mkdir -p ~/.config/nvim/
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -fs `pwd`/nvim/init.vim ~/.config/nvim/init.vim

install-emacs:
	ln -fs `pwd`/emacs/emacs ~/.emacs

install-npm:
	ln -fs `pwd`/npm/.npmrc ~/.npmrc
	mkdir -p "${HOME}/.npm-packages"
	sudo dnf install npm

install-rambox:
	@mkdir -p ~/AppImage	
	#@cd ~/AppImage && curl -o rambox.AppImage https://getrambox.herokuapp.com/download/x64?filetype=AppImage && \
	#    chmod +x rambox.AppImage
