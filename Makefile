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

clean:
	rm -fr $(DEST)

install:
	-mv -f $(HOME)/.oh-my-zsh $(HOME)/.oh-my-zsh-backup
	-mv -f $(HOME)/.zshrc $(HOME)/.zshrc-backup
	-mv -f $(HOME)/.zshenv $(HOME)/.zshenv-backup
	-mv -f $(HOME)/.vim $(HOME)/.vim-backup
	-mv -f $(HOME)/.vimrc $(HOME)/.vimrc-backup
	-mv -f $(HOME)/.vimrc.before $(HOME)/.vimrc.before-backup
	-mv -f $(HOME)/.vimrc.after $(HOME)/.vimrc.after-backup
	-mv -f $(HOME)/.toprc $(HOME)/.toprc-backup
	-mv -f $(HOME)/.tmux $(HOME)/.tmux-backup
	-mv -f $(HOME)/.tmux.conf $(HOME)/.tmux.conf-backup

	cp -a $(DEST)/ $(HOME)/

