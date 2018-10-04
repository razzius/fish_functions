# Defined in /var/folders/7v/b0z6dsqj1fx8k5rf8x121l580000gn/T//fish.ryEdBs/gc.fish @ line 2
function gc
	if [ -z "$argv" ]
    if test (git staged-files | wc -l | tr -d ' ') = 1
      git commit -m "Update "(git staged-files)
    else
      echo "Add a commit message"
    end
	else if [ "$argv" = - ]
    echo 'git checkout -'
		git checkout -
	else
		git commit -m "$argv"
	end
end