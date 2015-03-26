#
# subcommands
#

complete -c hg -n '__fish_use_subcommand' -x -a add --description 'add the specified files on the next commit'
complete -c hg -n '__fish_use_subcommand' -x -a addremove --description 'add all new files, delete all missing files'
complete -c hg -n '__fish_use_subcommand' -x -a annotate --description 'show changeset information by line for each file'
complete -c hg -n '__fish_use_subcommand' -x -a archive --description 'create an unversioned archive of a repository revision'
complete -c hg -n '__fish_use_subcommand' -x -a backout --description 'reverse effect of earlier changeset'
complete -c hg -n '__fish_use_subcommand' -x -a bisect --description 'subdivision search of changesets'
complete -c hg -n '__fish_use_subcommand' -x -a bookmarks --description 'track a line of development with movable markers'
complete -c hg -n '__fish_use_subcommand' -x -a branch --description 'set or show the current branch name'
complete -c hg -n '__fish_use_subcommand' -x -a branches --description 'list repository named branches'
complete -c hg -n '__fish_use_subcommand' -x -a bundle --description 'create a changegroup file'
complete -c hg -n '__fish_use_subcommand' -x -a cat --description 'output the current or given revision of files'
complete -c hg -n '__fish_use_subcommand' -x -a clone --description 'make a copy of an existing repository'
complete -c hg -n '__fish_use_subcommand' -x -a commit --description 'commit the specified files or all outstanding changes'
complete -c hg -n '__fish_use_subcommand' -x -a copy --description 'mark files as copied for the next commit'
complete -c hg -n '__fish_use_subcommand' -x -a diff --description 'diff repository (or selected files)'
complete -c hg -n '__fish_use_subcommand' -x -a export --description 'dump the header and diffs for one or more changesets'
complete -c hg -n '__fish_use_subcommand' -x -a forget --description 'forget the specified files on the next commit'
complete -c hg -n '__fish_use_subcommand' -x -a graft --description 'copy changes from other branches onto the current branch'
complete -c hg -n '__fish_use_subcommand' -x -a grep --description 'search for a pattern in specified files and revisions'
complete -c hg -n '__fish_use_subcommand' -x -a heads --description 'show current repository heads or show branch heads'
complete -c hg -n '__fish_use_subcommand' -x -a help --description 'show help for a given topic or a help overview'
complete -c hg -n '__fish_use_subcommand' -x -a identify --description 'identify the working copy or specified revision'
complete -c hg -n '__fish_use_subcommand' -x -a import --description 'import an ordered set of patches'
complete -c hg -n '__fish_use_subcommand' -x -a incoming --description 'show new changesets found in source'
complete -c hg -n '__fish_use_subcommand' -x -a init --description 'create a new repository in the given directory'
complete -c hg -n '__fish_use_subcommand' -x -a locate --description 'locate files matching specific patterns'
complete -c hg -n '__fish_use_subcommand' -x -a log --description 'show revision history of entire repository or files'
complete -c hg -n '__fish_use_subcommand' -x -a manifest --description 'output the current or given revision of the project manifest'
complete -c hg -n '__fish_use_subcommand' -x -a merge --description 'merge working directory with another revision'
complete -c hg -n '__fish_use_subcommand' -x -a outgoing --description 'show changesets not found in the destination'
complete -c hg -n '__fish_use_subcommand' -x -a parents --description 'show the parents of the working directory or revision'
complete -c hg -n '__fish_use_subcommand' -x -a paths --description 'show aliases for remote repositories'
complete -c hg -n '__fish_use_subcommand' -x -a phase --description 'set or show the current phase name'
complete -c hg -n '__fish_use_subcommand' -x -a pull --description 'pull changes from the specified source'
complete -c hg -n '__fish_use_subcommand' -x -a push --description 'push changes to the specified destination'
complete -c hg -n '__fish_use_subcommand' -x -a qpush --description 'patch manipulation'
complete -c hg -n '__fish_use_subcommand' -x -a recover --description 'roll back an interrupted transaction'
complete -c hg -n '__fish_use_subcommand' -x -a remove --description 'remove the specified files on the next commit'
complete -c hg -n '__fish_use_subcommand' -x -a rename --description 'rename files; equivalent of copy + remove'
complete -c hg -n '__fish_use_subcommand' -x -a resolve --description 'redo merges or set/view the merge status of files'
complete -c hg -n '__fish_use_subcommand' -x -a revert --description 'restore files to their checkout state'
complete -c hg -n '__fish_use_subcommand' -x -a rollback --description 'roll back the last transaction (dangerous)'
complete -c hg -n '__fish_use_subcommand' -x -a root --description 'print the root (top) of the current working directory'
complete -c hg -n '__fish_use_subcommand' -x -a serve --description 'start stand-alone webserver'
complete -c hg -n '__fish_use_subcommand' -x -a showconfig --description 'show combined config settings from all hgrc files'
complete -c hg -n '__fish_use_subcommand' -x -a status --description 'show changed files in the working directory'
complete -c hg -n '__fish_use_subcommand' -x -a summary --description 'summarize working directory state'
complete -c hg -n '__fish_use_subcommand' -x -a tag --description 'add one or more tags for the current or given revision'
complete -c hg -n '__fish_use_subcommand' -x -a tags --description 'list repository tags'
complete -c hg -n '__fish_use_subcommand' -x -a tip --description 'show the tip revision'
complete -c hg -n '__fish_use_subcommand' -x -a unbundle --description 'apply one or more changegroup files'
complete -c hg -n '__fish_use_subcommand' -x -a update --description 'update working directory (or switch revisions)'
complete -c hg -n '__fish_use_subcommand' -x -a verify --description 'verify the integrity of the repository'
complete -c hg -n '__fish_use_subcommand' -x -a version --description 'output version and copyright information'
complete -c hg -n '__fish_use_subcommand' -x -a config --description 'Configuration Files'
complete -c hg -n '__fish_use_subcommand' -x -a dates --description 'Date Formats'
complete -c hg -n '__fish_use_subcommand' -x -a diffs --description 'Diff Formats'
complete -c hg -n '__fish_use_subcommand' -x -a environment --description 'Environment Variables'
complete -c hg -n '__fish_use_subcommand' -x -a extensions --description 'Using Additional Features'
complete -c hg -n '__fish_use_subcommand' -x -a filesets --description 'Specifying File Sets'
complete -c hg -n '__fish_use_subcommand' -x -a glossary --description 'Glossary'
complete -c hg -n '__fish_use_subcommand' -x -a hgignore --description 'Syntax for Mercurial Ignore Files'
complete -c hg -n '__fish_use_subcommand' -x -a hgweb --description 'Configuring hgweb'
complete -c hg -n '__fish_use_subcommand' -x -a merge-tools --description 'Merge Tools'
complete -c hg -n '__fish_use_subcommand' -x -a multirevs --description 'Specifying Multiple Revisions'
complete -c hg -n '__fish_use_subcommand' -x -a patterns --description 'File Name Patterns'
complete -c hg -n '__fish_use_subcommand' -x -a phases --description 'Working with Phases'
complete -c hg -n '__fish_use_subcommand' -x -a revisions --description 'Specifying Single Revisions'
complete -c hg -n '__fish_use_subcommand' -x -a revsets --description 'Specifying Revision Sets'
complete -c hg -n '__fish_use_subcommand' -x -a subrepos --description 'Subrepositories'
complete -c hg -n '__fish_use_subcommand' -x -a templating --description 'Template Usage'
complete -c hg -n '__fish_use_subcommand' -x -a urls --description 'URL Paths'


#
# Completions for the 'add' subcommand
#

complete -c hg -n 'contains \'add\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'add\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'
complete -c hg -n 'contains \'add\' (commandline -poc)' -s S -l subrepos --description 'Recurse into subrepositories'
complete -c hg -n 'contains \'add\' (commandline -poc)' -s n -l dry-run --description 'Do not perform actions, just print output'


#
# Completions for the 'addremove' subcommand
#

complete -c hg -n 'contains \'addremove\' (commandline -poc)' -s s -l similarity -x --description 'Guess renamed files by similarity (0<=s<=100)'
complete -c hg -n 'contains \'addremove\' (commandline -poc)' -s I -l include -x --description '[+]   include names matching the given patterns'
complete -c hg -n 'contains \'addremove\' (commandline -poc)' -s X -l exclude -x --description '[+]   exclude names matching the given patterns'
complete -c hg -n 'contains \'addremove\' (commandline -poc)' -s n -l dry-run --description 'Do not perform actions, just print output'


#
# Completions for the 'annotate' subcommand
#

complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s r -l rev -x --description 'Annotate the specified revision'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -l no-follow --description 'Don\'t follow copies and renames'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s a -l text --description 'Treat all files as text'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s u -l user --description 'List the author (long with -v)'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s f -l file --description 'List the filename'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s d -l date --description 'List the date (short with -q)'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s n -l number --description 'List the revision number (default)'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s c -l changeset --description 'List the changeset'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s l -l line-number --description 'Show line number at the first appearance'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s w -l ignore-all-space --description 'Ignore white space when comparing lines'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s b -l ignore-space-change -x --description 'Changes in the amount of white space'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s B -l ignore-blank-lines --description 'Ignore changes whose lines are all blank'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'annotate\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'


#
# Completions for the 'archive' subcommand
#

complete -c hg -n 'contains \'archive\' (commandline -poc)' -l no-decode --description 'Do not pass files through decoders'
complete -c hg -n 'contains \'archive\' (commandline -poc)' -s p -l prefix -x --description 'Directory prefix for files in archive'
complete -c hg -n 'contains \'archive\' (commandline -poc)' -s r -l rev -x --description 'Revision to distribute'
complete -c hg -n 'contains \'archive\' (commandline -poc)' -s t -l type -x --description 'Type of distribution to create'
complete -c hg -n 'contains \'archive\' (commandline -poc)' -s S -l subrepos --description 'Recurse into subrepositories'
complete -c hg -n 'contains \'archive\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'archive\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'


#
# Completions for the 'backout' subcommand
#

complete -c hg -n 'contains \'backout\' (commandline -poc)' -l merge --description 'Merge with old dirstate parent after backout'
complete -c hg -n 'contains \'backout\' (commandline -poc)' -s r -l rev -x --description 'Revision to backout'
complete -c hg -n 'contains \'backout\' (commandline -poc)' -s t -l tool -x --description 'Specify merge tool'
complete -c hg -n 'contains \'backout\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'backout\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'
complete -c hg -n 'contains \'backout\' (commandline -poc)' -s m -l message -x --description 'Use text as commit message'
complete -c hg -n 'contains \'backout\' (commandline -poc)' -s l -l logfile -x --description 'Read commit message from file'
complete -c hg -n 'contains \'backout\' (commandline -poc)' -s d -l date -x --description 'Record the specified date as commit date'
complete -c hg -n 'contains \'backout\' (commandline -poc)' -s u -l user -x --description 'Record the specified user as committer'


#
# Completions for the 'bisect' subcommand
#

complete -c hg -n 'contains \'bisect\' (commandline -poc)' -s r -l reset --description 'Reset bisect state'
complete -c hg -n 'contains \'bisect\' (commandline -poc)' -s g -l good --description 'Mark changeset good'
complete -c hg -n 'contains \'bisect\' (commandline -poc)' -s b -l bad --description 'Mark changeset bad'
complete -c hg -n 'contains \'bisect\' (commandline -poc)' -s s -l skip --description 'Skip testing changeset'
complete -c hg -n 'contains \'bisect\' (commandline -poc)' -s e -l extend --description 'Extend the bisect range'
complete -c hg -n 'contains \'bisect\' (commandline -poc)' -s c -l command -x --description 'Use command to check changeset state'
complete -c hg -n 'contains \'bisect\' (commandline -poc)' -s U -l noupdate --description 'Do not update to target'


#
# Completions for the 'bookmarks' subcommand
#

complete -c hg -n 'contains \'bookmarks\' (commandline -poc)' -s f -l force --description 'Force'
complete -c hg -n 'contains \'bookmarks\' (commandline -poc)' -s r -l rev -x --description 'Revision'
complete -c hg -n 'contains \'bookmarks\' (commandline -poc)' -s d -l delete --description 'Delete a given bookmark'
complete -c hg -n 'contains \'bookmarks\' (commandline -poc)' -s m -l rename -x --description 'Rename a given bookmark'
complete -c hg -n 'contains \'bookmarks\' (commandline -poc)' -s i -l inactive --description 'Mark a bookmark inactive'


#
# Completions for the 'branch' subcommand
#

complete -c hg -n 'contains \'branch\' (commandline -poc)' -s f -l force -x --description 'Branch name even if it shadows an existing branch'
complete -c hg -n 'contains \'branch\' (commandline -poc)' -s C -l clean -x --description 'Branch name to parent branch name'


#
# Completions for the 'branches' subcommand
#

complete -c hg -n 'contains \'branches\' (commandline -poc)' -s a -l active -x --description 'Only branches that have unmerged heads'
complete -c hg -n 'contains \'branches\' (commandline -poc)' -s c -l closed -x --description 'Normal and closed branches'


#
# Completions for the 'bundle' subcommand
#

complete -c hg -n 'contains \'bundle\' (commandline -poc)' -s f -l force --description 'Run even when the destination is unrelated'
complete -c hg -n 'contains \'bundle\' (commandline -poc)' -s r -l rev -x --description '[+]'
complete -c hg -n 'contains \'bundle\' (commandline -poc)' -s b -l branch -x --description '[+] a specific branch you would like to bundle'
complete -c hg -n 'contains \'bundle\' (commandline -poc)' -l base -x --description '[+]'
complete -c hg -n 'contains \'bundle\' (commandline -poc)' -s a -l all --description 'Bundle all changesets in the repository'
complete -c hg -n 'contains \'bundle\' (commandline -poc)' -s t -l type -x --description 'Bundle compression type to use (default: bzip2)'
complete -c hg -n 'contains \'bundle\' (commandline -poc)' -s e -l ssh -x --description 'Specify ssh command to use'
complete -c hg -n 'contains \'bundle\' (commandline -poc)' -l remotecmd -x --description 'Specify hg command to run on the remote side'
complete -c hg -n 'contains \'bundle\' (commandline -poc)' -l insecure --description 'Do not verify server certificate (ignoring web.cacerts'


#
# Completions for the 'cat' subcommand
#

complete -c hg -n 'contains \'cat\' (commandline -poc)' -s o -l output -x --description 'Print output to file with formatted name'
complete -c hg -n 'contains \'cat\' (commandline -poc)' -s r -l rev -x --description 'Print the given revision'
complete -c hg -n 'contains \'cat\' (commandline -poc)' -l decode --description 'Apply any matching decode filter'
complete -c hg -n 'contains \'cat\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'cat\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'


#
# Completions for the 'clone' subcommand
#

complete -c hg -n 'contains \'clone\' (commandline -poc)' -s U -l noupdate --description 'The clone will include an empty working copy (only a'
complete -c hg -n 'contains \'clone\' (commandline -poc)' -s u -l updaterev -x --description 'Revision, tag or branch to check out'
complete -c hg -n 'contains \'clone\' (commandline -poc)' -s r -l rev -x --description '[+]'
complete -c hg -n 'contains \'clone\' (commandline -poc)' -s b -l branch -x --description '[+] clone only the specified branch'
complete -c hg -n 'contains \'clone\' (commandline -poc)' -l pull --description 'Use pull protocol to copy metadata'
complete -c hg -n 'contains \'clone\' (commandline -poc)' -l uncompressed --description 'Use uncompressed transfer (fast over LAN)'
complete -c hg -n 'contains \'clone\' (commandline -poc)' -s e -l ssh -x --description 'Specify ssh command to use'
complete -c hg -n 'contains \'clone\' (commandline -poc)' -l remotecmd -x --description 'Specify hg command to run on the remote side'
complete -c hg -n 'contains \'clone\' (commandline -poc)' -l insecure --description 'Do not verify server certificate (ignoring web.cacerts'


#
# Completions for the 'commit' subcommand
#

complete -c hg -n 'contains \'commit\' (commandline -poc)' -l amend -x --description 'Can be used to amend the parent of the working directory'
complete -c hg -n 'contains \'commit\' (commandline -poc)' -s A -l addremove --description 'Mark new/missing files as added/removed before'
complete -c hg -n 'contains \'commit\' (commandline -poc)' -l close-branch --description 'Mark a branch as closed, hiding it from the branch'
complete -c hg -n 'contains \'commit\' (commandline -poc)' -l amend --description 'Amend the parent of the working dir'
complete -c hg -n 'contains \'commit\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'commit\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'
complete -c hg -n 'contains \'commit\' (commandline -poc)' -s m -l message -x --description 'Use text as commit message'
complete -c hg -n 'contains \'commit\' (commandline -poc)' -s l -l logfile -x --description 'Read commit message from file'
complete -c hg -n 'contains \'commit\' (commandline -poc)' -s d -l date -x --description 'Record the specified date as commit date'
complete -c hg -n 'contains \'commit\' (commandline -poc)' -s u -l user -x --description 'Record the specified user as committer'
complete -c hg -n 'contains \'commit\' (commandline -poc)' -s S -l subrepos --description 'Recurse into subrepositories'


#
# Completions for the 'copy' subcommand
#

complete -c hg -n 'contains \'copy\' (commandline -poc)' -s A -l after --description 'Record a copy that has already occurred'
complete -c hg -n 'contains \'copy\' (commandline -poc)' -s f -l force --description 'Forcibly copy over an existing managed file'
complete -c hg -n 'contains \'copy\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'copy\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'
complete -c hg -n 'contains \'copy\' (commandline -poc)' -s n -l dry-run --description 'Do not perform actions, just print output'


#
# Completions for the 'diff' subcommand
#

complete -c hg -n 'contains \'diff\' (commandline -poc)' -s r -l rev -x --description '[+]'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -s c -l change -x --description 'Change made by revision'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -s a -l text --description 'Treat all files as text'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -s g -l git --description 'Use git extended diff format'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -l nodates --description 'Omit dates from diff headers'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -s p -l show-function --description 'Show which function each change is in'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -l reverse --description 'Produce a diff that undoes the changes'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -s w -l ignore-all-space --description 'Ignore white space when comparing lines'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -s b -l ignore-space-change -x --description 'Changes in the amount of white space'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -s B -l ignore-blank-lines --description 'Ignore changes whose lines are all blank'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -s U -l unified -x --description 'Number of lines of context to show'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -l stat --description 'Output diffstat-style summary of changes'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'
complete -c hg -n 'contains \'diff\' (commandline -poc)' -s S -l subrepos --description 'Recurse into subrepositories'


#
# Completions for the 'export' subcommand
#

complete -c hg -n 'contains \'export\' (commandline -poc)' -s o -l output -x --description 'Print output to file with formatted name'
complete -c hg -n 'contains \'export\' (commandline -poc)' -l switch-parent -x --description 'Against the second parent'
complete -c hg -n 'contains \'export\' (commandline -poc)' -s r -l rev -x --description '[+]   revisions to export'
complete -c hg -n 'contains \'export\' (commandline -poc)' -s a -l text --description 'Treat all files as text'
complete -c hg -n 'contains \'export\' (commandline -poc)' -s g -l git --description 'Use git extended diff format'
complete -c hg -n 'contains \'export\' (commandline -poc)' -l nodates --description 'Omit dates from diff headers'


#
# Completions for the 'forget' subcommand
#

complete -c hg -n 'contains \'forget\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'forget\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'


#
# Completions for the 'graft' subcommand
#

complete -c hg -n 'contains \'graft\' (commandline -poc)' -s c -l continue --description 'Resume interrupted graft'
complete -c hg -n 'contains \'graft\' (commandline -poc)' -s e -l edit --description 'Invoke editor on commit messages'
complete -c hg -n 'contains \'graft\' (commandline -poc)' -s D -l currentdate -x --description 'The current date as commit date'
complete -c hg -n 'contains \'graft\' (commandline -poc)' -s U -l currentuser -x --description 'The current user as committer'
complete -c hg -n 'contains \'graft\' (commandline -poc)' -s d -l date -x --description 'Record the specified date as commit date'
complete -c hg -n 'contains \'graft\' (commandline -poc)' -s u -l user -x --description 'Record the specified user as committer'
complete -c hg -n 'contains \'graft\' (commandline -poc)' -s t -l tool -x --description 'Specify merge tool'
complete -c hg -n 'contains \'graft\' (commandline -poc)' -s n -l dry-run --description 'Do not perform actions, just print output'


#
# Completions for the 'grep' subcommand
#

complete -c hg -n 'contains \'grep\' (commandline -poc)' -s 0 -l print0 --description 'End fields with NUL'
complete -c hg -n 'contains \'grep\' (commandline -poc)' -l all --description 'Print all revisions that match'
complete -c hg -n 'contains \'grep\' (commandline -poc)' -s a -l text --description 'Treat all files as text'
complete -c hg -n 'contains \'grep\' (commandline -poc)' -s f -l follow --description 'Follow changeset history, or file history across'
complete -c hg -n 'contains \'grep\' (commandline -poc)' -s i -l ignore-case --description 'Ignore case when matching'
complete -c hg -n 'contains \'grep\' (commandline -poc)' -s l -l files-with-matches --description 'Print only filenames and revisions that match'
complete -c hg -n 'contains \'grep\' (commandline -poc)' -s n -l line-number --description 'Print matching line numbers'
complete -c hg -n 'contains \'grep\' (commandline -poc)' -s r -l rev -x --description '[+]'
complete -c hg -n 'contains \'grep\' (commandline -poc)' -s u -l user --description 'List the author (long with -v)'
complete -c hg -n 'contains \'grep\' (commandline -poc)' -s d -l date --description 'List the date (short with -q)'
complete -c hg -n 'contains \'grep\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'grep\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'


#
# Completions for the 'heads' subcommand
#

complete -c hg -n 'contains \'heads\' (commandline -poc)' -s r -l rev -x --description 'Show only heads which are descendants of STARTREV'
complete -c hg -n 'contains \'heads\' (commandline -poc)' -s t -l topo --description 'Show topological heads only'
complete -c hg -n 'contains \'heads\' (commandline -poc)' -s c -l closed --description 'Show normal and closed branch heads'
complete -c hg -n 'contains \'heads\' (commandline -poc)' -l style -x --description 'Display using template map file'
complete -c hg -n 'contains \'heads\' (commandline -poc)' -l template -x --description 'Display with template'


#
# Completions for the 'help' subcommand
#

complete -c hg -n 'contains \'help\' (commandline -poc)' -s e -l extension -x --description 'Only help for extensions'
complete -c hg -n 'contains \'help\' (commandline -poc)' -s c -l command --description 'Show only help for commands'


#
# Completions for the 'identify' subcommand
#

complete -c hg -n 'contains \'identify\' (commandline -poc)' -s r -l rev -x --description 'Identify the specified revision'
complete -c hg -n 'contains \'identify\' (commandline -poc)' -s n -l num --description 'Show local revision number'
complete -c hg -n 'contains \'identify\' (commandline -poc)' -s i -l id --description 'Show global revision id'
complete -c hg -n 'contains \'identify\' (commandline -poc)' -s b -l branch --description 'Show branch'
complete -c hg -n 'contains \'identify\' (commandline -poc)' -s t -l tags --description 'Show tags'
complete -c hg -n 'contains \'identify\' (commandline -poc)' -s B -l bookmarks --description 'Show bookmarks'
complete -c hg -n 'contains \'identify\' (commandline -poc)' -s e -l ssh -x --description 'Specify ssh command to use'
complete -c hg -n 'contains \'identify\' (commandline -poc)' -l remotecmd -x --description 'Specify hg command to run on the remote side'
complete -c hg -n 'contains \'identify\' (commandline -poc)' -l insecure --description 'Do not verify server certificate (ignoring web.cacerts'


#
# Completions for the 'import' subcommand
#

complete -c hg -n 'contains \'import\' (commandline -poc)' -l exact -x --description 'Specified, import will set the working directory to the'
complete -c hg -n 'contains \'import\' (commandline -poc)' -l bypass -x --description 'Apply and commit patches directly to the repository, not'
complete -c hg -n 'contains \'import\' (commandline -poc)' -s p -l strip -x --description 'Directory strip option for patch. This has the'
complete -c hg -n 'contains \'import\' (commandline -poc)' -s e -l edit --description 'Invoke editor on commit messages'
complete -c hg -n 'contains \'import\' (commandline -poc)' -s f -l force --description 'Skip check for outstanding uncommitted changes'
complete -c hg -n 'contains \'import\' (commandline -poc)' -l no-commit --description 'Don\'t commit, just update the working directory'
complete -c hg -n 'contains \'import\' (commandline -poc)' -l bypass --description 'Apply patch without touching the working directory'
complete -c hg -n 'contains \'import\' (commandline -poc)' -l exact --description 'Apply patch to the nodes from which it was'
complete -c hg -n 'contains \'import\' (commandline -poc)' -l import-branch --description 'Use any branch information in patch (implied by'
complete -c hg -n 'contains \'import\' (commandline -poc)' -s m -l message -x --description 'Use text as commit message'
complete -c hg -n 'contains \'import\' (commandline -poc)' -s l -l logfile -x --description 'Read commit message from file'
complete -c hg -n 'contains \'import\' (commandline -poc)' -s d -l date -x --description 'Record the specified date as commit date'
complete -c hg -n 'contains \'import\' (commandline -poc)' -s u -l user -x --description 'Record the specified user as committer'
complete -c hg -n 'contains \'import\' (commandline -poc)' -s s -l similarity -x --description 'Guess renamed files by similarity (0<=s<=100)'


#
# Completions for the 'incoming' subcommand
#

complete -c hg -n 'contains \'incoming\' (commandline -poc)' -s f -l force --description 'Run even if remote repository is unrelated'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -s n -l newest-first --description 'Show newest record first'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -l bundle -x --description 'File to store the bundles into'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -s r -l rev -x --description '[+]'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -s B -l bookmarks --description 'Compare bookmarks'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -s b -l branch -x --description '[+] a specific branch you would like to pull'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -s p -l patch --description 'Show patch'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -s g -l git --description 'Use git extended diff format'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -s l -l limit -x --description 'Limit number of changes displayed'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -s M -l no-merges --description 'Do not show merges'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -l stat --description 'Output diffstat-style summary of changes'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -l style -x --description 'Display using template map file'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -l template -x --description 'Display with template'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -s e -l ssh -x --description 'Specify ssh command to use'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -l remotecmd -x --description 'Specify hg command to run on the remote side'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -l insecure --description 'Do not verify server certificate (ignoring web.cacerts'
complete -c hg -n 'contains \'incoming\' (commandline -poc)' -s S -l subrepos --description 'Recurse into subrepositories'


#
# Completions for the 'init' subcommand
#

complete -c hg -n 'contains \'init\' (commandline -poc)' -s e -l ssh -x --description 'Specify ssh command to use'
complete -c hg -n 'contains \'init\' (commandline -poc)' -l remotecmd -x --description 'Specify hg command to run on the remote side'
complete -c hg -n 'contains \'init\' (commandline -poc)' -l insecure --description 'Do not verify server certificate (ignoring web.cacerts'


#
# Completions for the 'locate' subcommand
#

complete -c hg -n 'contains \'locate\' (commandline -poc)' -s r -l rev -x --description 'Search the repository as it is in REV'
complete -c hg -n 'contains \'locate\' (commandline -poc)' -s 0 -l print0 --description 'End filenames with NUL, for use with xargs'
complete -c hg -n 'contains \'locate\' (commandline -poc)' -s f -l fullpath --description 'Print complete paths from the filesystem root'
complete -c hg -n 'contains \'locate\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'locate\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'


#
# Completions for the 'log' subcommand
#

complete -c hg -n 'contains \'log\' (commandline -poc)' -l follow -x --description 'A filename will only show ancestors or'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s f -l follow --description 'Follow changeset history, or file history across'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s d -l date -x --description 'Show revisions matching date spec'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s C -l copies --description 'Show copied files'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s k -l keyword -x --description '[+]    do case-insensitive search for a given text'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s r -l rev -x --description '[+]'
complete -c hg -n 'contains \'log\' (commandline -poc)' -l removed --description 'Include revisions where files were removed'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s u -l user -x --description '[+]'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s b -l branch -x --description '[+]   show changesets within the given named branch'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s P -l prune -x --description '[+]'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s p -l patch --description 'Show patch'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s g -l git --description 'Use git extended diff format'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s l -l limit -x --description 'Limit number of changes displayed'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s M -l no-merges --description 'Do not show merges'
complete -c hg -n 'contains \'log\' (commandline -poc)' -l stat --description 'Output diffstat-style summary of changes'
complete -c hg -n 'contains \'log\' (commandline -poc)' -l style -x --description 'Display using template map file'
complete -c hg -n 'contains \'log\' (commandline -poc)' -l template -x --description 'Display with template'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'log\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'


#
# Completions for the 'manifest' subcommand
#

complete -c hg -n 'contains \'manifest\' (commandline -poc)' -s r -l rev -x --description 'Revision to display'
complete -c hg -n 'contains \'manifest\' (commandline -poc)' -l all --description 'List files from all revisions'


#
# Completions for the 'merge' subcommand
#

complete -c hg -n 'contains \'merge\' (commandline -poc)' -s f -l force --description 'Force a merge with outstanding changes'
complete -c hg -n 'contains \'merge\' (commandline -poc)' -s r -l rev -x --description 'Revision to merge'
complete -c hg -n 'contains \'merge\' (commandline -poc)' -s P -l preview --description 'Review revisions to merge (no merge is performed)'
complete -c hg -n 'contains \'merge\' (commandline -poc)' -s t -l tool -x --description 'Specify merge tool'


#
# Completions for the 'outgoing' subcommand
#

complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -s f -l force --description 'Run even when the destination is unrelated'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -s r -l rev -x --description '[+]'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -s n -l newest-first --description 'Show newest record first'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -s B -l bookmarks --description 'Compare bookmarks'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -s b -l branch -x --description '[+] a specific branch you would like to push'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -s p -l patch --description 'Show patch'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -s g -l git --description 'Use git extended diff format'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -s l -l limit -x --description 'Limit number of changes displayed'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -s M -l no-merges --description 'Do not show merges'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -l stat --description 'Output diffstat-style summary of changes'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -l style -x --description 'Display using template map file'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -l template -x --description 'Display with template'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -s e -l ssh -x --description 'Specify ssh command to use'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -l remotecmd -x --description 'Specify hg command to run on the remote side'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -l insecure --description 'Do not verify server certificate (ignoring web.cacerts'
complete -c hg -n 'contains \'outgoing\' (commandline -poc)' -s S -l subrepos --description 'Recurse into subrepositories'


#
# Completions for the 'parents' subcommand
#

complete -c hg -n 'contains \'parents\' (commandline -poc)' -s r -l rev -x --description 'Show parents of the specified revision'
complete -c hg -n 'contains \'parents\' (commandline -poc)' -l style -x --description 'Display using template map file'
complete -c hg -n 'contains \'parents\' (commandline -poc)' -l template -x --description 'Display with template'


#
# Completions for the 'paths' subcommand
#



#
# Completions for the 'phase' subcommand
#

complete -c hg -n 'contains \'phase\' (commandline -poc)' -s p -l public --description 'Set changeset phase to public'
complete -c hg -n 'contains \'phase\' (commandline -poc)' -s d -l draft --description 'Set changeset phase to draft'
complete -c hg -n 'contains \'phase\' (commandline -poc)' -s s -l secret --description 'Set changeset phase to secret'
complete -c hg -n 'contains \'phase\' (commandline -poc)' -s f -l force --description 'Allow to move boundary backward'
complete -c hg -n 'contains \'phase\' (commandline -poc)' -s r -l rev -x --description '[+] target revision'


#
# Completions for the 'pull' subcommand
#

complete -c hg -n 'contains \'pull\' (commandline -poc)' -s u -l update --description 'Update to new branch head if changesets were'
complete -c hg -n 'contains \'pull\' (commandline -poc)' -s f -l force --description 'Run even when remote repository is unrelated'
complete -c hg -n 'contains \'pull\' (commandline -poc)' -s r -l rev -x --description '[+]'
complete -c hg -n 'contains \'pull\' (commandline -poc)' -s B -l bookmark -x --description '[+] bookmark to pull'
complete -c hg -n 'contains \'pull\' (commandline -poc)' -s b -l branch -x --description '[+]'
complete -c hg -n 'contains \'pull\' (commandline -poc)' -s e -l ssh -x --description 'Specify ssh command to use'
complete -c hg -n 'contains \'pull\' (commandline -poc)' -l remotecmd -x --description 'Specify hg command to run on the remote side'
complete -c hg -n 'contains \'pull\' (commandline -poc)' -l insecure --description 'Do not verify server certificate (ignoring'


#
# Completions for the 'push' subcommand
#

complete -c hg -n 'contains \'push\' (commandline -poc)' -l new-branch -x --description 'You want to allow push to create a new named branch'
complete -c hg -n 'contains \'push\' (commandline -poc)' -s f -l force --description 'Force push'
complete -c hg -n 'contains \'push\' (commandline -poc)' -s r -l rev -x --description '[+]'
complete -c hg -n 'contains \'push\' (commandline -poc)' -s B -l bookmark -x --description '[+] bookmark to push'
complete -c hg -n 'contains \'push\' (commandline -poc)' -s b -l branch -x --description '[+]'
complete -c hg -n 'contains \'push\' (commandline -poc)' -l new-branch --description 'Allow pushing a new branch'
complete -c hg -n 'contains \'push\' (commandline -poc)' -s e -l ssh -x --description 'Specify ssh command to use'
complete -c hg -n 'contains \'push\' (commandline -poc)' -l remotecmd -x --description 'Specify hg command to run on the remote side'
complete -c hg -n 'contains \'push\' (commandline -poc)' -l insecure --description 'Do not verify server certificate (ignoring'


#
# Completions for the 'qpush' subcommand
#
complete -c hg -n 'contains \'qpush\' (commandline -poc)' -l move -x --description 'move selected patch to top of stack'



#
# Completions for the 'recover' subcommand
#



#
# Completions for the 'remove' subcommand
#

complete -c hg -n 'contains \'remove\' (commandline -poc)' -s A -l after --description 'Record delete for missing files'
complete -c hg -n 'contains \'remove\' (commandline -poc)' -s f -l force --description 'Remove (and delete) file even if added or modified'
complete -c hg -n 'contains \'remove\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'remove\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'


#
# Completions for the 'rename' subcommand
#

complete -c hg -n 'contains \'rename\' (commandline -poc)' -s A -l after --description 'Record a rename that has already occurred'
complete -c hg -n 'contains \'rename\' (commandline -poc)' -s f -l force --description 'Forcibly copy over an existing managed file'
complete -c hg -n 'contains \'rename\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'rename\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'
complete -c hg -n 'contains \'rename\' (commandline -poc)' -s n -l dry-run --description 'Do not perform actions, just print output'


#
# Completions for the 'resolve' subcommand
#

complete -c hg -n 'contains \'resolve\' (commandline -poc)' -s a -l all --description 'Select all unresolved files'
complete -c hg -n 'contains \'resolve\' (commandline -poc)' -s l -l list --description 'List state of files needing merge'
complete -c hg -n 'contains \'resolve\' (commandline -poc)' -s m -l mark --description 'Mark files as resolved'
complete -c hg -n 'contains \'resolve\' (commandline -poc)' -s u -l unmark --description 'Mark files as unresolved'
complete -c hg -n 'contains \'resolve\' (commandline -poc)' -s n -l no-status --description 'Hide status prefix'
complete -c hg -n 'contains \'resolve\' (commandline -poc)' -s t -l tool -x --description 'Specify merge tool'
complete -c hg -n 'contains \'resolve\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'resolve\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'


#
# Completions for the 'revert' subcommand
#

complete -c hg -n 'contains \'revert\' (commandline -poc)' -s a -l all --description 'Revert all changes when no arguments given'
complete -c hg -n 'contains \'revert\' (commandline -poc)' -s d -l date -x --description 'Tipmost revision matching date'
complete -c hg -n 'contains \'revert\' (commandline -poc)' -s r -l rev -x --description 'Revert to the specified revision'
complete -c hg -n 'contains \'revert\' (commandline -poc)' -s C -l no-backup --description 'Do not save backup copies of files'
complete -c hg -n 'contains \'revert\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'revert\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'
complete -c hg -n 'contains \'revert\' (commandline -poc)' -s n -l dry-run --description 'Do not perform actions, just print output'


#
# Completions for the 'rollback' subcommand
#

complete -c hg -n 'contains \'rollback\' (commandline -poc)' -s n -l dry-run -x --description 'Not perform actions, just print output'
complete -c hg -n 'contains \'rollback\' (commandline -poc)' -s f -l force --description 'Ignore safety measures'


#
# Completions for the 'root' subcommand
#



#
# Completions for the 'serve' subcommand
#

complete -c hg -n 'contains \'serve\' (commandline -poc)' -s A -l accesslog -x --description 'Name of access log file to write to'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -s d -l daemon --description 'Run server in background'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -l daemon-pipefds -x --description 'Used internally by daemon mode'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -s E -l errorlog -x --description 'Name of error log file to write to'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -s p -l port -x --description 'Port to listen on (default: 8000)'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -s a -l address -x --description 'Address to listen on (default: all interfaces)'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -l prefix -x --description 'Prefix path to serve from (default: server root)'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -s n -l name -x --description 'Name to show in web pages (default: working'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -l web-conf -x --description 'Name of the hgweb config file (see "hg help hgweb")'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -l pid-file -x --description 'Name of file to write process ID to'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -l stdio --description 'For remote clients'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -l cmdserver -x --description 'For remote clients'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -s t -l templates -x --description 'Web templates to use'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -l style -x --description 'Template style to use'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -s 6 -l ipv6 --description 'Use IPv6 in addition to IPv4'
complete -c hg -n 'contains \'serve\' (commandline -poc)' -l certificate -x --description 'SSL certificate file'


#
# Completions for the 'showconfig' subcommand
#

complete -c hg -n 'contains \'showconfig\' (commandline -poc)' -s u -l untrusted -x --description 'Untrusted configuration options'


#
# Completions for the 'status' subcommand
#

complete -c hg -n 'contains \'status\' (commandline -poc)' -s A -l all --description 'Show status of all files'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s m -l modified --description 'Show only modified files'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s a -l added --description 'Show only added files'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s r -l removed --description 'Show only removed files'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s d -l deleted --description 'Show only deleted (but tracked) files'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s c -l clean --description 'Show only files without changes'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s u -l unknown --description 'Show only unknown (not tracked) files'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s i -l ignored --description 'Show only ignored files'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s n -l no-status --description 'Hide status prefix'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s C -l copies --description 'Show source of copied files'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s 0 -l print0 --description 'End filenames with NUL, for use with xargs'
complete -c hg -n 'contains \'status\' (commandline -poc)' -l rev -x --description '[+]'
complete -c hg -n 'contains \'status\' (commandline -poc)' -l change -x --description 'List the changed files of a revision'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s I -l include -x --description '[+] include names matching the given patterns'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s X -l exclude -x --description '[+] exclude names matching the given patterns'
complete -c hg -n 'contains \'status\' (commandline -poc)' -s S -l subrepos --description 'Recurse into subrepositories'


#
# Completions for the 'summary' subcommand
#

complete -c hg -n 'contains \'summary\' (commandline -poc)' -l remote -x --description 'For push and pull'


#
# Completions for the 'tag' subcommand
#

complete -c hg -n 'contains \'tag\' (commandline -poc)' -s f -l force --description 'Force tag'
complete -c hg -n 'contains \'tag\' (commandline -poc)' -s l -l local --description 'Make the tag local'
complete -c hg -n 'contains \'tag\' (commandline -poc)' -s r -l rev -x --description 'Revision to tag'
complete -c hg -n 'contains \'tag\' (commandline -poc)' -l remove --description 'Remove a tag'
complete -c hg -n 'contains \'tag\' (commandline -poc)' -s e -l edit --description 'Edit commit message'
complete -c hg -n 'contains \'tag\' (commandline -poc)' -s m -l message -x --description 'Use <text> as commit message'
complete -c hg -n 'contains \'tag\' (commandline -poc)' -s d -l date -x --description 'Record the specified date as commit date'
complete -c hg -n 'contains \'tag\' (commandline -poc)' -s u -l user -x --description 'Record the specified user as committer'


#
# Completions for the 'tags' subcommand
#



#
# Completions for the 'tip' subcommand
#

complete -c hg -n 'contains \'tip\' (commandline -poc)' -s p -l patch --description 'Show patch'
complete -c hg -n 'contains \'tip\' (commandline -poc)' -s g -l git --description 'Use git extended diff format'
complete -c hg -n 'contains \'tip\' (commandline -poc)' -l style -x --description 'Display using template map file'
complete -c hg -n 'contains \'tip\' (commandline -poc)' -l template -x --description 'Display with template'


#
# Completions for the 'unbundle' subcommand
#

complete -c hg -n 'contains \'unbundle\' (commandline -poc)' -s u -l update -x --description 'To new branch head if changesets were unbundled'


#
# Completions for the 'update' subcommand
#

complete -c hg -n 'contains \'update\' (commandline -poc)' -s C -l clean --description 'Discard uncommitted changes (no backup)'
complete -c hg -n 'contains \'update\' (commandline -poc)' -s c -l check --description 'Update across branches if no uncommitted changes'
complete -c hg -n 'contains \'update\' (commandline -poc)' -s d -l date -x --description 'Tipmost revision matching date'
complete -c hg -n 'contains \'update\' (commandline -poc)' -s r -l rev -x --description 'Revision'


#
# Completions for the 'verify' subcommand
#



#
# Completions for the 'version' subcommand
#



#
# Completions for the 'config' subcommand
#

complete -c hg -n 'contains \'config\' (commandline -poc)' -l ---BEGIN --description 'CERTIFICATE-----'
complete -c hg -n 'contains \'config\' (commandline -poc)' -l ---END --description 'CERTIFICATE-----'
complete -c hg -n 'contains \'config\' (commandline -poc)' -l ---BEGIN --description 'CERTIFICATE-----'
complete -c hg -n 'contains \'config\' (commandline -poc)' -l ---END --description 'CERTIFICATE-----'


#
# Completions for the 'dates' subcommand
#



#
# Completions for the 'diffs' subcommand
#



#
# Completions for the 'environment' subcommand
#



#
# Completions for the 'extensions' subcommand
#



#
# Completions for the 'filesets' subcommand
#



#
# Completions for the 'glossary' subcommand
#

#
# Completions for the 'hgignore' subcommand
#



#
# Completions for the 'hgweb' subcommand
#



#
# Completions for the 'merge-tools' subcommand
#



#
# Completions for the 'multirevs' subcommand
#



#
# Completions for the 'patterns' subcommand
#



#
# Completions for the 'phases' subcommand
#



#
# Completions for the 'revisions' subcommand
#



#
# Completions for the 'revsets' subcommand
#



#
# Completions for the 'subrepos' subcommand
#



#
# Completions for the 'templating' subcommand
#

complete -c hg -n 'contains \'templating\' (commandline -poc)' -l template -x --description 'Or select an existing template-style (--style)'
complete -c hg -n 'contains \'templating\' (commandline -poc)' -l copied -x --description 'Is set'


#
# Completions for the 'urls' subcommand
#




