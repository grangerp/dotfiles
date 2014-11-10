install: install-bash install-virtualenvwrapper install-pythonrc \
		 install-subl install-bin install-vcprompt install-git \
		 install-hg install-tmux install-vimrc

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

install-hg:
	ln -fs `pwd`/hg/hgrc ~/.hgrc

install-bin:
	mkdir -p ~/bin/
	ln -fs `pwd`/bin/* ~/bin/

install-bash:
	ln -fs `pwd`/bash/bashrc ~/.bash_profile
	ln -fs ~/.bash_profile ~/.bashrc
	@echo "Old .bash_profile saved as .bash_profile.old"

install-virtualenvwrapper:
	mkdir -p ~/.virtualenvs/
	ln -fs `pwd`/virtualenvwrapper/* ~/.virtualenvs/

install-tmux:
	ln -fs `pwd`/tmux/.tmux.conf ~/.tmux.conf

install-pythonrc:
	ln -fs `pwd`/python/pythonrc.py ~/.pythonrc.py

install-vimrc:
	mkdir -p ~/.vim/bundle/
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	ln -fs `pwd`/vim/.vimrc ~/.vimrc

install-subl:
ifeq ($(shell uname),Darwin)
	ln -fs `pwd`/sublimetext3/Packages/User/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
	ln -fs "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
endif
