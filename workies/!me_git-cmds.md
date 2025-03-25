# Git Commands with Examples

Git is a version control system that helps developers manage changes to their codebase. Here is a list of common Git commands along with examples of how to use them.

## 1. git init
Initializes a new Git repository.
  git init

## 2. git clone
Clones an existing repository.
  git clone https://github.com/user/repo.git

## 3. git status
Shows the status of changes as untracked, modified, or staged.
  git status

## 4. git add
Adds changes to the staging area.
  # Add a specific file
    git add filename

  # Add all changes
    git add .

## 5. git commit
Commits the staged changes to the repository.
  # Commit with a message
  git commit -m "Commit message"

## 6. git diff
Shows the differences between the working directory and the staging area.
  git diff

## 7. git log
Shows the commit history.
  git log

## 8. git branch
Lists, creates, or deletes branches.
  # List branches
    git branch

  # Create a new branch
    git branch new-branch

  # Delete a branch
    git branch -d branch-name

## 9. git checkout
Switches branches or restores working tree files.
  # Switch to a branch
  git checkout branch-name

  # Create and switch to a new branch
  git checkout -b new-branch

## 10. git merge
Merges changes from one branch into another.
  # Merge a branch into the current branch
  git merge branch-name

## 11. git pull
Fetches and integrates changes from a remote repository.
  git pull origin branch-name

## 12. git push
Uploads local changes to a remote repository.
  git push origin branch-name

## 13. git remote
Manages remote repositories.
  # Add a remote repository
    git remote add origin https://github.com/user/repo.git

  # List remote repositories
    git remote -v

  # Remove a remote repository
    git remote remove origin

## 14. git fetch
Downloads objects and refs from another repository.
  git fetch origin

## 15. git rebase
Reapplies commits on top of another base tip.
  git rebase branch-name

## 16. git stash
Temporarily stores changes that are not ready to be committed.
  # Stash changes
    git stash

  # Apply stashed changes
    git stash apply

  # List stashed changes
    git stash list

## 17. git tag
Creates, lists, or deletes tags.
  # Create a new tag
    git tag v1.0.0

  # List tags
    git tag

  # Delete a tag
    git tag -d v1.0.0

## 18. git rm
Removes files from the working directory and the index.
  # Remove a specific file
    git rm filename

  # Remove a file from the working directory but keep it in the index
    git rm --cached filename

## 19. git mv
Moves or renames a file, a directory, or a symlink.
  git mv old-filename new-filename

## 20. git reset
Resets the current HEAD to a specified state.
  # Unstage a file
    git reset filename

  # Reset to a previous commit
    git reset --hard commit-sha

## 21. git clean
Removes untracked files from the working directory.
  # Remove untracked files
    git clean -f

  # Remove untracked directories
    git clean -fd

## 22. git cherry-pick
Applies the changes introduced by some existing commits.
  git cherry-pick commit-sha

## 23. git bisect
Uses binary search to find the commit that introduced a bug.
  # Start bisection
    git bisect start

  # Mark the current commit as bad
    git bisect bad

  # Mark the current commit as good
    git bisect good

## 24. git archive
Creates an archive of files from a named tree.
  git archive --format=zip --output=archive.zip HEAD

## 25. git blame
Shows what revision and author last modified each line of a file.
  git blame filename

## 26. git submodule
Initializes, updates, or inspects submodules.
  # Add a submodule
    git submodule add https://github.com/user/repo.git

  # Initialize submodules
    git submodule init

  # Update submodules
    git submodule update

## 27. git config
Gets and sets repository or global options.
  # Set the user name
    git config --global user.name "Your Name"

  # Set the user email
    git config --global user.email "your.email@example.com"

  # List all settings
    git config --list

## 28. git show
Displays various types of objects.
  # Show a specific commit
    git show commit-sha

## 29. git describe
Describes a commit using the most recent tag reachable from it.
  git describe --tags

## 30. git shortlog
Summarizes git log output.
  git shortlog

## 31. git add, commit with message and push
Here is a full example of committing changes with a message and then pushing those changes to the main branch of the remote repository:

  # Add LICENSE file
  Copy LICENSE file to root
  git add LICENSE
  git commit -a -m "Add License file"

  # Commit changes with a message
  Add info at end on README.md
  git commit -a -m "Updated README with License file information"

  # Push changes to the main branch of the remote repository
  git push origin main

## 32. Create Branch and Push Commits
  ((git push origin master
  remote rejected] master -> master (TF402455: Pushes to this branch are not permitted; you must use a pull request to update this branch.)))
  Create a New Branch:
    git checkout -b feature/add-license-update-readme
  Push the New Branch:
    git push origin feature/add-license-update-readme
  Create Pull Request    
    Go to your Azure DevOps repository in your web browser.
    Navigate to the "Pull Requests" section.
    Click on "New Pull Request."
    Select "feature/add-license-update-readme" as the source branch and "master" as the target branch.
    Add a title and description for your pull request.
    Click "Create" to open the pull request.


## 33. Disable TLS verification explicitly using:
  git config --global http.sslVerify false

  Or, if you want this to apply only to the current repo (safer than global settings):
  git config http.sslVerify false
  

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

>>>>> Sync Local Clone after Rename of Code Repo

### Using Git commands:
Open the terminal in VS Code:

Click on Terminal in the top menu and select New Terminal.
Check the current remote URL:
  git remote -v
You’ll see something like this:
  origin  https://dev.azure.com/orgname/asd%20cv%2002/_git/repo01 (fetch)
  origin  https://dev.azure.com/orgname/asd%20cv%2002/_git/repo01 (push)

  origin  https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_git/repo01 (fetch)
  origin  https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_git/repo01 (push)

Update the remote URL to the new repo name:
  git remote set-url origin https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_git/global-its-ceops-zz-ado-to-github

  git remote set-url origin https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_git/global-its-ceops-zz-ado-to-github

Verify the remote URL is updated:
  git remote -v
  It should now show:
  origin  https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_git/global-its-ceops-zz-ado-to-github (fetch)
  origin  https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_git/global-its-ceops-zz-ado-to-github (push)


Pull the latest changes from the main branch:
  git fetch origin
  git checkout main
  git pull origin main

Confirm the changes are synced: Check your files in the Explorer panel of VS Code or run:
  git log --oneline

### Using VS Code GUI:
Open the repo in VS Code.

Open Source Control:
  Click the Source Control icon in the Activity Bar on the side (or press Ctrl+Shift+G).

Check remote settings:
  Click on the "..." (More actions) at the top of the Source Control view.
  Choose Remote > Manage Remotes and check the current URL.

Update the remote:
  If the URL still points to the old repo (repo01):
    Click the pencil icon to .
    Enter the new URL:
      https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_git/global-its-ceops-zz-ado-to-github
    Save it.

Pull changes from the main branch:
  Make sure you're on the main branch (shown in the bottom left corner of VS Code).
  If not, switch branches by clicking the branch name and selecting main.
  Click Sync Changes (the circular arrow icon) or run:
  git pull

Confirm updates:
  Check the file changes in the Explorer tab or use the Source Control tab.


>>> add a pre-pull check to ensure you don’t lose any uncommitted work. avoid any "local changes would be overwritten by merge" errors.

Check for uncommitted changes:

git status
If you see "nothing to commit, working tree clean", you're good to pull.
If you see modified files or untracked files, you need to either commit or stash them before pulling.
Option A: Commit the changes (if they’re ready):

git add .
git commit -m "WIP: saving changes before pulling from main"
Option B: Stash the changes (if you want to review them later):

git stash
Pull the latest changes:

git fetch origin
git checkout main
git pull origin main
(If you stashed) Apply the stashed changes back:

git stash pop
🚀 Using VS Code GUI:
Check for uncommitted changes:

Open the Source Control tab (Ctrl+Shift+G).
Look for any files listed under Changes.
If changes are present:

Click the + icon next to each file to stage the changes.
Add a commit message and hit Commit.
OR, if you want to stash instead:

Click the "..." (More actions).
Select Stash > Stash Changes.
Pull from the main branch:

Ensure you're on the main branch.
Click the Sync Changes button (circular arrow icon) or use the "..." menu to select Pull.
(If you stashed) Restore stashed changes:

Go back to "..." > Stash > Apply Stashed Changes.


>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PS C:\Users\hsidhu2\OneDrive - KPMG\ITSGlobal\CE-Tier3\CE_ADO\ado-to-github> git remote -v
fatal: not a git repository (or any of the parent directories): .git
PS C:\Users\hsidhu2\OneDrive - KPMG\ITSGlobal\CE-Tier3\CE_ADO\ado-to-github> cd .\zz-ado-to-github\
PS C:\Users\hsidhu2\OneDrive - KPMG\ITSGlobal\CE-Tier3\CE_ADO\ado-to-github\zz-ado-to-github> git remote -v
origin  https://go-infrastructure.visualstudio.com/Go%20OP%20Cloud%20Enterprise%20Operations/_git/zz-ado-to-github (fetch)
origin  https://go-infrastructure.visualstudio.com/Go%20OP%20Cloud%20Enterprise%20Operations/_git/zz-ado-to-github (push)
PS Cgit remote set-url origin https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_git/global-its-ceops-zz-ado-to-github
PS C:\Users\hsidhu2\OneDrive - KPMG\ITSGlobal\CE-Tier3\CE_ADO\ado-to-github\zz-ado-to-github> git remote -v
origin  https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_git/global-its-ceops-zz-ado-to-github (fetch)
origin  https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_git/global-its-ceops-zz-ado-to-github (push) 
PS C:\Users\hsidhu2\OneDrive - KPMG\ITSGlobal\CE-Tier3\CE_ADO\ado-to-github\zz-ado-to-github> git fetch origin
warning: ----------------- SECURITY WARNING ----------------
warning: | TLS certificate verification has been disabled! |
warning: ---------------------------------------------------
warning: HTTPS connections may not be secure. See https://aka.ms/gcm/tlsverify for more information.
warning: ----------------- SECURITY WARNING ----------------
warning: | TLS certificate verification has been disabled! |
warning: ---------------------------------------------------
warning: HTTPS connections may not be secure. See https://aka.ms/gcm/tlsverify for more information.
PS C:\Users\hsidhu2\OneDrive - KPMG\ITSGlobal\CE-Tier3\CE_ADO\ado-to-github\zz-ado-to-github> git pull origin main
warning: ----------------- SECURITY WARNING ----------------
warning: | TLS certificate verification has been disabled! |
warning: ---------------------------------------------------
warning: HTTPS connections may not be secure. See https://aka.ms/gcm/tlsverify for more information.
warning: ----------------- SECURITY WARNING ----------------
warning: | TLS certificate verification has been disabled! |
warning: ---------------------------------------------------
warning: HTTPS connections may not be secure. See https://aka.ms/gcm/tlsverify for more information.
From https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_git/global-its-ceops-zz-ado-to-github
 * branch            main       -> FETCH_HEAD
Already up to date.
PS C:\Users\hsidhu2\OneDrive - KPMG\ITSGlobal\CE-Tier3\CE_ADO\ado-to-github\zz-ado-to-github> git log --oneline   
6ef3af0 (HEAD -> main, origin/main, origin/HEAD) corrected error line 221 - added cc
97b3821 changed pipeline to run manual
0c52515 updated README with the repo used for testing
ce4491d added files and folders
4204b0e Added README.md
