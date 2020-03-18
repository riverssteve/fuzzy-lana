export GOBIN="$HOME/code/go/bin"
export GOPATH="$HOME/code/go"
export GO111MODULE=on

if [ -d /usr/local/go ] ; then
    path=( $path /usr/local/go/bin "$GOBIN" )
else
    echo "No go directory found in /usr/local/go"
fi
