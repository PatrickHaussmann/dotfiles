# Extract a variety of compressed file types
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1    ;;
             *.tar.gz)    tar xzf $1    ;;
             *.bz2)       bunzip2 $1    ;;
             *.rar)       unrar e $1    ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1     ;;
             *.tbz2)      tar xjf $1    ;;
             *.tgz)       tar xzf $1    ;;
             *.zip)       unzip $1      ;;
             *.Z)         uncompress $1 ;;
             *.7z)        7z x $1       ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Repeat command n times, eg: repeat 5 echo hi
function repeat()
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do
        eval "$@";
    done
}

# Compile tex file containing svg
pptex () { # Pretty Print laTEX
    pdflatex --halt-on-error -output-directory="out" \
        $1 1> /dev/null
    [[ $? = 0 ]] || echo 'grep Error out/${$1/tex/log}'
}

function picrename() {
     MY_PATH=$(readlink -nf $1)
     fdfind '.' -e jpeg "$MY_PATH" -x mv {} {.}.jpg
     exiftool -P "-filename<FileModifyDate" "-filename<DateTimeOriginal" "-filename<CreateDate" -d "%Y%m%d-%H%M%S%%-c.%%le" -ext jpg -ext png -ext nef -ext mov -ext mp4 -ext lrv -r "$MY_PATH"
     fdfind '.' -e lrv "$MY_PATH" -x mv {} {.}.lrv.mp4
}

