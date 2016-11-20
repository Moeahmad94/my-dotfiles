########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".CFUserTextEncoding
.DS_Store
.Rapp.history
.ScreamingFrogSEOSpider
.Xauthority
.bash_history
.bash_profile
.bash_profile.macports-saved_2015-03-01_at_05:21:15
.bash_profile.pysave
.bash_sessions
.bashrc
.cgdb
.config
.fontconfig
.gitconfig
.idlerc
.vim
.viminfo
.vimrc
.zsh-update
.zsh_history
.zshrc
.zshrc.pre-oh-my-zsh
ssh_config”
# list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

source ~/.bashrc
source ~/.vimrc