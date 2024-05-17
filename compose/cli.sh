EXECUTION_ROOT=./execution
EXECUTION_DATA_PATH=$EXECUTION_ROOT/data
PASSWORD=password.txt

case "$1" in
    "new")
        echo "run geth account new -- 🚀"
        geth account new --datadir $EXECUTION_DATA_PATH --password $EXECUTION_ROOT/$PASSWORD
        ;;
    "list")
        echo "run geth account list -- 🚀"
        geth account list --datadir $EXECUTION_DATA_PATH
        ;;
    *)
        echo ".... 🤔"
        ;;
esac