function lazycommit() {
    git add .
    git commit -a -m "$1"
    git push
}

function close_session() {
    if [[ `task status:pending count` -ne 0 ]]; then
        echo "⚠️ There are still some tasks pending!"
        task next
    elif [[ ! -d /Volumes/Backup ]]; then
        echo "⚠️ Please mount /Volumes/Backup folder!"
    else
        echo "ℹ️ Backup repositories..."
        cd ~/repositories
        for i in *; do 7za a "/Volumes/Backup/repos/$i.7z" $i -xr'!node_modules' -xr'!build' -xr'!vendor'; done
        cd -
        echo "Everything looks good! 🤟"
    fi
}
