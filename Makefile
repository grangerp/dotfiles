install: install-development-tools install-pip install-bash install-virtualenvwrapper install-bin install-vcprompt install-git \
	install-tmux install-vimrc install-emacs install-nvim-init

install install-development-tools:
	sudo apt install build-essential 

install-pip:
	sudo pip install pip -U

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

install-bin:
	mkdir -p ~/.bin/
	ln -fs `pwd`/bin/* ~/.bin/

install-bash:
	ln -fs `pwd`/bash/bashrc ~/.bash_profile
	ln -fs ~/.bash_profile ~/.bashrc
	@echo "Old .bash_profile saved as .bash_profile.old"

install-virtualenvwrapper:
	sudo pip install virtualenvwrapper
	mkdir -p ~/.virtualenvs/
	ln -fs `pwd`/virtualenvwrapper/* ~/.virtualenvs/

install-tmux:
	ln -fs `pwd`/tmux/.tmux.conf ~/.tmux.conf

install-vimrc:
	sudo pip install isort
	mkdir -p ~/.vim/bundle/
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	ln -fs `pwd`/vim/.vimrc ~/.vimrc

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

