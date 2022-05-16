if [[ ${#1}>0 ]];
then
    set -x
    git add .
    git commit -m "$1"
    set +x
    s1=$(git status -sb)
    localBranchName=$(echo $s1 | awk -F "## " '{print $2}' | awk -F "." '{print $1}')
    echo "Local branch name is $localBranchName"
    set -x
    git push origin "$localBranchName"
    set +x
else
    echo "Error, pass a commit message as a parameter"
fi