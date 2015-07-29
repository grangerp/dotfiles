install: install-development-tools install-pip install-powerline install-bash install-virtualenvwrapper install-bin install-vcprompt install-git \
	install-tmux install-tmuxinator install-vimrc

install install-development-tools:
	sudo dnf group install "Development Tools"

install-pip:
	sudo pip install pip -U

install-powerline:
	pip install --user powerline-status

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
	sudo dnf install tmux tmux-powerline
	ln -fs `pwd`/tmux/.tmux.conf ~/.tmux.conf

install-tmuxinator:
	sudo dnf install gem rubygems rubygem-bundler ruby-devel
	sudo gem install tmuxinator
	mkdir -p ~/.tmuxinator/
	ln -fs `pwd`/tmuxinator/* ~/.tmuxinator/

install-vimrc:
	sudo pip install isort
	mkdir -p ~/.vim/bundle/
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	ln -fs `pwd`/vim/.vimrc ~/.vimrc

