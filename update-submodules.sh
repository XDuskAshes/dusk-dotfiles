#!/bin/bash

# nvim
cd nvim
NV_OLD_COMMIT=$(git rev-parse HEAD)
git pull origin main
NV_NEW_COMMIT=$(git rev-parse HEAD)

if [ "$NV_OLD_COMMIT" == "$NV_NEW_COMMIT" ]; then
    echo "Skipping nvim: already latest"
    echo "Value of NV_OLD_COMMIT: $NV_OLD_COMMIT"
    echo "Value of NV_NEW_COMMIT: $NV_NEW_COMMIT"
    cd ..
else
    cd ..
    git add nvim
    git commit -m "[submodule] Update nvim" -m "Scripted commit sync (update-submodules.sh) for nvim:" -m "    Old commit: ${NV_OLD_COMMIT}" -m "    New commit: ${NV_NEW_COMMIT}" -m "Done automatically with update-submodules.sh on $(date)"
fi

# Push all submodule commits
git push -u origin main
