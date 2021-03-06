#!/bin/bash

#--------------------------------
# Function to install plugins
#--------------------------------

function install {

	echo -e "\t\t + "$2"..."
	git clone $1 &> /dev/null

	if [ $? -ne 0 ]
	then
		echo -e "\t\t\t - installation failed..."
	else
		echo -e "\t\t\t - installation success..."
	fi
}

echo "" 

echo "#-----------------------------------------------------------------------"
echo "# [installation] .vimrc and plugins for girishadurrel's vimrc [BEGIN] "
echo "#-----------------------------------------------------------------------"

echo "" 

#--------------------------------
# check installation dependencies
#--------------------------------

echo -e "\t * checking for vim installation..."

dpkg -s vim &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t + vim not installed.. please install vim "	
	exit 1
else
	echo -e "\t\t + vim installation check, success... "
fi
echo ""

echo -e "\t * checking for git installation..."

dpkg -s git &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t + git not installed.. please install git "	
	exit 1
else
	echo -e "\t\t + git installation check, success... "
fi
echo ""

echo -e "\t * checking for curl installation..."

dpkg -s curl &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t + curl not installed.. please install curl "	
	exit 1
else
	echo -e "\t\t + curl installation check, success... "
fi
echo ""

#-----------------------
# if any .vimrc, backup
#-----------------------

echo -e "\t * installing the .vimrc file... "

echo -e "\t\t + checking for previous .vimrc, if any backing it up (~/.vimrc.bak)... "

mv -f ~/.vimrc ~/.vimrc.bak &> /dev/null

echo -e "\t\t + copying girishadurrel's .vimrc... "

cp .vimrc ~/

echo ""

#----------------------------
# installing pathegon plugin
#----------------------------

echo -e "\t * installing a pathegon, plugin manager for vim... "

# copy pasted from the pathogen github page [https://github.com/tpope/vim-pathogen]

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t + pathegon installation failed..."
	exit 1
else
	echo -e "\t\t + pathegon installation success..."
fi

echo ""

#--------------------
# installing plugins
#--------------------

cd ~/.vim/bundle

echo -e "\t * installing the plugins... "

install https://github.com/scrooloose/nerdtree.git nerdtree
install https://github.com/Lokaltog/vim-easymotion.git easymotion
install https://github.com/scrooloose/nerdcommenter.git nerdcommentor
install https://github.com/scrooloose/syntastic.git syntatic
install https://github.com/kien/ctrlp.vim.git ctrlp
install https://github.com/Yggdroot/indentLine.git indentLine
install https://github.com/vim-scripts/AutoClose.git autoClose

echo "#----------------------------------------------------------------------------"
echo "# [installation] .vimrc and pluggings for girishadurrel's vimrc... [END]"
echo "#----------------------------------------------------------------------------"

echo "" 
