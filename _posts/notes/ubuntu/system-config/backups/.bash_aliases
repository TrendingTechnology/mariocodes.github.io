##############################################
####            General Aliases           ####
#############################################
alias google="google-chrome-stable --disable-gpu &"

# maven general aliases
alias mavenbuild="mvn clean install -Dmaven.test.skip=true"
alias mavenrefresh="mvn clean install -U -Dmaven.test.skip=true"
alias mavencomplete="mvn clean install"

# move to trash instead of delete something
alias trash="gvfs-trash"
alias trash-ls="gvfs-ls trash://"
alias trash-empty="gvfs-trash --empty"

##############################################
####         Current project aliases      ####
##############################################

# build project.
alias pdevbuild="cd ~/Documents/Projects/develop/projects &&
	  	    mvn clean install -Dmaven.test.skip=true &&
		    cd ~"

alias pft1build="cd ~/Documents/Projects/feature1/projects &&
	  	    mvn clean install -Dmaven.test.skip=true &&
		    cd ~"

alias pft2build="cd ~/Documents/Projects/feature2/projects &&
	  	    mvn clean install -Dmaven.test.skip=true &&
		    cd ~"

alias pft3build="cd ~/Documents/Projects/feature3/projects &&
	  	    mvn clean install -Dmaven.test.skip=true &&
		    cd ~"


# launch all integration-tests and build project.
alias pdevbuildcompl="cd ~/Documents/Projects/develop/projects &&
		    mvn clean install &&
	 	    cd ~"

alias pft1buildcompl="cd ~/Documents/Projects/feature1/projects &&
		    mvn clean install &&
	 	    cd ~"

alias pft2buildcompl="cd ~/Documents/Projects/feature2/projects &&
		    mvn clean install &&
	 	    cd ~"

alias pft3buildcompl="cd ~/Documents/Projects/feature3/projects &&
		    mvn clean install &&
	 	    cd ~"

# update Database per branch.
alias pdevupdatedb="cd ~/project/develop/projects &&
			mvn install -P updateDB &&
			mvn install -P updateTestDB &&
			cd ~"

alias pft1updatedb="cd ~/project/feature1/projects &&
			mvn install -P updateDB &&
			mvn install -P updateTestDB &&
			cd ~"

alias pft2updatedb="cd ~/project/feature2/projects &&
			mvn install -P updateDB &&
			mvn install -P updateTestDB &&
			cd ~"

alias pft3updatedb="cd ~/project/feature3/projects &&
			mvn install -P updateDB &&
			mvn install -P updateTestDB &&
			cd ~"

# Manage databases' connection.
## Standalone
alias pstartmysql="cd ~/Documents/Projects/MySQL &&
			./startmysql;
			cd ~"

alias pstopmysql="cd ~/Documents/Projects/MySQL &&
			./stopmysql;
			cd ~"

alias pstartmongo="sudo ~/Programs/mongo/bin/mongod &"

alias pstopmongo="sudo pkill -f mongo -9 &"

## All at once
alias pstartdbs="pstartmysql;pstartmongo"
alias pstopdbs="pstopmysql;pstopmongo"
