https://medium.com/@jeantimex/how-to-configure-iterm2-and-vim-like-a-pro-on-macos-e303d25d5b5c

https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko

1. brew upgrade (or m1/m2 run arch -arm64 brew upgrade)
2. brew install fzf (arch -arm64 brew install fzf)
3. brew install ripgrep (arch -arm64 brew install ripgrep)
4. brew install bat (arch -arm64 brew install bat) - similar to cat but shows format (helpful when running fzf
5. brew install the_silver_searcher (installs :Ag command in vim which allows to search for text in dir - uses fzf)
6. brew install tmux
7. Increase speedo of keyboard for (jk) scrolling system preferences > keyboard > key repeat rate (set fast) and delay until repeat (set short)
8. download this file (https://github.com/Rigellute/rigel/blob/master/rigel.itermcolors) and go to iterm2 > settings > profiles > colors tab > button right import > select drop down again and click "rigel"
9. set transparency iterm2 > settings > profiles > window > Transparency 16 and check Blug set to 9.
10. brew install htop (arch -arm64 brew install htop)

// install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

// install iTerm2
https://iterm2.com/downloads.html

// install neovim
arch -arm64 brew install neovim

// open vim 
ov (alias in zshrc)
// source vim 
sv (alias in zshrc)

// open zsh 
oz (alias in zshrc)
// source zsh 
sz (alias in zshrc)

install plugins
:PlugInstall
:PlugStatus

// Enable Transparency
:TransparencyEnable

// Disable Transparency
:TransparencyDisable

,b - Open Tree:
,w - Switch betwee tree and file
,s - Save file (and auto format)
,t - new tab
gt - navigate to previous tab
gT - navigate to next tab
,f - open fuzzy search
,sh - open termina shell (similar to ,f but shows preview of file)
,ww - :w (switch between split views)
,q - :q!
,wq - :wq
,wq! - :wq!
,qa - :qa!
,vb - visual block (multi-line select)
,sc - toggle spell check
  once in spell check, to navigate between highlighted words ]s (forward) or [s (backwards)
  on the highlighted word, can type `z=` to see list of recommendations
  can also do 1z= which means take first word from list and replace it 
,rn - toggle relative numbers
,ws - toggle white space
,sn - edit Coc snippets
 * - search for references to the word cursor is on
,gc - see git commits

// fold block and open
visual mode - zf (do not press escape after visual mode selection)
to open, place cursor on folded block and press "zo"

// GoTo code navigation.
gd - go to definition
gy - typescript definition
gi - go to implementation
gr - find all references

//sort lines
visual mode - highlight the lines - :sort

//find and replace all
:%s/TEXT_TO_FIND/TEXT_TO_REPLACE/g

// split files vertically (side by side)
:vsplit (creates split with empty file)
:vsplit (new file name)
:vs is short for :vsplit
,V - vertical split

// split files horizontally within nerdtree (stacked)
i - put cursor on file and click i

0 - (zero) naviaget to begining of line
$ - navigate to end of line
x - remove character cursor is on (can keep pressing x to delete repeatedly)
dd - remove line

// select text and remove
,vb - to entire visual block
make selection
d

// move line(s) up and down
shift+j - move line down
shift+k - move line up
v (visual mode), select lines, shift+j - move block lines down
v (visual mode), select lines, shift+k - move block lines up

// jump to last selected line(s)
gv

// delete entire word cursor is on from any position
diw 

// delete all characters after the cursor for current word
dw

// delete until end of line
d$
shift+d

// navigate to begining of file
gg or [[

// navigate to end of file
shift+G or ]]

// navigate to end of page
ctrl+d

// navigate to begining of page
ctrl+u

// navigate down in page
shift+]

// navigate up in page
shift+[

// search for a word and navigate to all highlighted matches
/SEARCH_TERM
n - navigate forward
N - navigate backward

// on a variable jump to definition
gd - go to definition

// navigate to next function in file
[m
]m

// yank across files
"ay - yank and store in `a` register
"ap - grab contents from `a` register and paste


Introduction
Every time when I got a new computer or reinstalled the macOS, the first thing I would like to do is to set up my terminal and make it look cool. There are several tools I always like to gear up for the terminal including the following:
iTerm2
Oh My Zsh
Powerlevel10k (The coolest theme for Zsh)
Vim Airline (Vim status bar)
NERDTree (A file system tree for Vim)
FZF (fuzzy finder)
There are already a lot of great articles that teach people how to install and configure the above tools, however, in order to set them up correctly, usually I need to refer to at least 5 separate articles and it took me a while to figure out the necessary steps, and most importantly I don’t remember what I did last time. So I decided to put all I have learned together and write them down, this article will show you how to install and configure all the above tools with necessary and concrete steps, and hope it helps.
Ok let’s get started.
Instructions
Step 1. Install iTerm2
Make sure you have Homebrew installed, if not, simply paste the following in your Terminal:
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
During the above installation, you may be asked to install the command line developer tools for xcode-select command, go ahead and install it and then finish the Homebrew installation, once it’s completed, you will be able to use brew command to install iTerm2.
$ brew cask install iterm2
Step 2. Install Oh My Zsh
Oh My Zsh is a framework for managing Zsh configuration and it comes with many helpful plugins, themes etc to make you enjoy shell scripting. Install Oh My Zsh is simple:
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
Step 3. Install and Configure Powerlevel10k Theme
Powerlevel10k is a fast reimplementation of Powerlevel9k which is probably the most popular Powerline theme for Zsh.
Image for postImage for post
Run the following commands to install Powerlevel10k:
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
$ echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
Now launch iTerm2 and let’s configure Powerlevel10k theme using the configuration wizard.
Image for postImage for post
Image for postImage for post
First install the Meslo Nerd Font, type y. Once the font is installed, restart iTerm2 and continue with the configuration. The wizard will then verify if the font is installed properly by asking you whether you can see some symbols correctly including a diamond, a lock, a Debian logo and some other icons, type y if you see them.
Next choose a prompt style:
Image for postImage for post
The Rainbow style is very popular, I usually go with that. After choosing the prompt style, there are several styles for you to choose, including:
Show current time?
Display icons?
Enable transient prompt?
Prompt separators, heads, tails, height, spacing, and flow
Once it’s done, apply the changes to ~/.zshrc.
Now the Powerlevel10k theme is installed and your screen may look like this:
Image for postImage for post
I don’t like the color, let’s fix it, open iTerm2 preferences dialog, go to Profiles > Colors, choose Solarized Dark color preset:
Image for postImage for post
Now your screen should look like the following, the color looks much better, isn’t it?
Image for postImage for post
Image for postImage for post
Well done, we just completed the basic setup for our iTerm2. Let’s move on to configure Vim.
Step 4. Install and Configure Vim Airline
Vim Airline is an awesome Vim plugin that polishes the status bar, it provides a lot of styles.
Image for postImage for post
In order to install Vim Airline, let’s ask a Vim plugin manager to help us, I use Vim Plug, run the following command to install it.
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
Once Vim Plug is installed, edit ~/.vimrc:
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
Save the changes and exit Vim. Now reopen Vim and type in :PlugInstall and hit Enter.
Image for postImage for post
Image for postImage for post
Now both Vim Airline and Vim Airline Themes are installed. If you open a file, you should be able to see the status bar like the following:
Image for postImage for post
The status bar doesn’t look like the one from Vim Airline official website, that’s because we have to configure the fonts, run the following commands to install the missing fonts for powerline theme:
$ git clone https://github.com/powerline/fonts.git --depth=1
$ cd fonts
$ ./install.sh
$ cd ..
$ rm -rf fonts
Finally, edit ~/.vimrc and add the following line:
let g:airline_powerline_fonts = 1
This will automatically populate the g:airline_symbols dictionary with the powerline symbols.
Now our Vim editor should have a better look:
Image for postImage for post
Step 5. Install and Configure FZF
FZF allows you to do fuzzy search for files and folders in the Terminal and Vim, we can use brew to install it.
$ brew install fzf
# To install useful key bindings and fuzzy completion:
$ $(brew --prefix)/opt/fzf/install
Follow the prompts and answer y(yes), once it’s done, the following has been added to ~/.zshrc:
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
Add some useful FZF options in the ~/.zshrc:
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS=‘—height=40% —preview=“cat {}” —preview-window=right:60%:wrap’
Basically it tells FZF to show the preview window when performing the search.
Now when you type infzf and Enter in iTerm2, FZF will search in the current directory:
Image for postImage for post
Use arrow keys to navigate the files, and you will see a preview window on the right.
Another way to use FZF is to type in some command and then **<TAB>, for example, vim **<TAB>:
Image for postImage for post
To use FZF in Vim, add the following line to ~/.vimrc:
set rtp+=/usr/local/opt/fzf
Save it and relaunch Vim, type in :FZF command in Vim, you will now be able to search for the file to edit:
Image for postImage for post
Great, we now completed the setup of FZF!
Step 6. Install and Configure NERDTree
NERDTree allows us to navigate the directory inside Vim editor, to install it, let’s use Vim Plug, add the following in bold in ~/.vimrc:
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
call plug#end()
let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
Run :PlugInstall command in Vim to complete the plugin installation:
Image for postImage for post
Now NERDTree plugin is installed, to see the directory tree, in Vim editor, type in command :NERDTree:
Image for postImage for post
Well done, now you can easily navigate the directory inside Vim!
Step 7. Set color scheme for Vim
To make our Vim look more professional, I choose OneDark theme.
Image for postImage for post
To install the theme for Vim, first run the following command in iTerm2:
$ git clone https://github.com/joshdick/onedark.vim.git ~/onedark
$ cd ~/onedark
    $ mkdir ~/.vim/colors
$ cp colors/onedark.vim ~/.vim/colors/
$ cp autoload/onedark.vim ~/.vim/autoload/
Then edit ~/.vimrcand add the following:
colorscheme onedark
syntax on
set number
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey
Now our Vim should look much prettier :)
Conclusion
As you can see, the whole process involves a lot of referencing, I hope this article can help you set up your own development environment around iTerm2 and Vim.
Happy coding!
References
How to Jazz Up Your Bash Terminal — A Step By Step Guide With Pictures [link]
macOS ohmyzsh + tmux + vim + iTerm2 + Powerlevel9k = Badass terminal [link]
Beautifying your terminal with Zsh, Prezto, & Powerlevel9k [link]
How to Customize your Terminal with ZSH [link]
Solarized [link]
583

7

Vim
Iterm2
Oh My Zsh
Powerlevel10k
Fzf
583 claps

7 responses





Yong Su
WRITTEN BY

Yong Su
Follow
Code Monkey @ Github; Problem Solver @ LeetCode; https://github.com/jeantimex
