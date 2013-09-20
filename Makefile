all:

	# zsh

	rm -f $(HOME)/.oh-my-zsh
	rm -f $(HOME)/.zshrc
	ln -s $(PWD)/zsh/oh-my-zsh $(HOME)/.oh-my-zsh
	ln -s $(PWD)/zsh/zshrc $(HOME)/.zshrc

	rm -f $(HOME)/.zshenv
	ln -s $(PWD)/zsh/zshenv $(HOME)/.zshenv

	mkdir -p $(HOME)/.oh-my-zsh/custom/themes
	cp $(PWD)/zsh/estrai.zsh-theme $(HOME)/.oh-my-zsh/custom/themes/

	# vim

	rm -f $(HOME)/.vimrc

	# janus
	rm -fr $(HOME)/.vim
	ln -s $(PWD)/vim/janus $(HOME)/.vim
	( cd $(HOME)/.vim && rake )

	rm -f $(HOME)/.vimrc.before
	ln -s $(PWD)/vim/vimrc.before $(HOME)/.vimrc.before

	rm -f $(HOME)/.vimrc.after
	ln -s $(PWD)/vim/vimrc.after $(HOME)/.vimrc.after



