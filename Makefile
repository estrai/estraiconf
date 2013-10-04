DEST=$(PWD)/out

all:

	rm -fr $(DEST)
	mkdir $(DEST)

	# zsh

	cp -r $(PWD)/zsh/oh-my-zsh $(DEST)/.oh-my-zsh
	cp -r $(PWD)/zsh/zshrc $(DEST)/.zshrc

	cp -r $(PWD)/zsh/zshenv $(DEST)/.zshenv

	mkdir -p $(DEST)/.oh-my-zsh/custom/themes
	cp $(PWD)/zsh/estrai.zsh-theme $(DEST)/.oh-my-zsh/custom/themes/

	# vim
	# janus
	
	cp -r $(PWD)/vim/janus $(DEST)/.vim
	( cd $(DEST)/.vim && rake )

	cp -r $(PWD)/vim/vimrc.before $(DEST)/.vimrc.before

	cp -r $(PWD)/vim/vimrc.after $(DEST)/.vimrc.after

	# top

	cp  $(PWD)/toprc $(DEST)/.toprc

	# tmux

	cp -r $(PWD)/tmux/tmuxrc $(DEST)/.tmux
	cp $(DEST)/.tmux/tmux.conf $(DEST)/.tmux.conf

