Making Changes and Pushing to the Repository

1. Clone the Repository: `git clone [URL of the repository]`
2. Change into Repository Directory: `cd [name-of-repository]`
  - while in the main branch directory `cd .git` `nano config` # This is where git links to GitHub
  - [remote "origin"] url = repo_link # link and put the remote location URL, save, and exit
  - cd back into the repo directory on the local
4. Create a New Branch (Optional but Recommended): `git checkout -b [new-branch-name]`
5. Make Your Changes
6. Stage the Changes: `git add .`
7. Commit the Changes: `git commit -m "A brief description of the changes"`
8. Pull the Latest Changes from Remote (Optional): `git pull origin main`
9. Push the Changes:
   - For new branch: `git push -u origin [new-branch-name]`
   - For existing branch: `git push`


