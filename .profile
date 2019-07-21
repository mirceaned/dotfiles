if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export DEVDB_HOST=devdb.db.cj.com
export DEVDB_USERNAME=spud
export DEVDB_PORT=1521
export DEVDB_SID=devdb

alias dbstart='nohup VBoxHeadless --startvm "Oracle11g32" &> /dev/null &'
alias dbstop='VBoxManage controlvm Oracle11g32 poweroff'

### CREATED BY `setup-machine.sh` ###

export PROJECTS_DIR="$HOME/cj-projects"
export SOFTWARE_HOME="$PROJECTS_DIR/software"
export JAVA_HOME="$SOFTWARE_HOME/java/1.8.0-osx"
export TNS_ADMIN="$SOFTWARE_HOME/sqlplus"
export DYLD_LIBRARY_PATH="$SOFTWARE_HOME/sqlplus/darwin"
export SPARK_HOME="$HOME/work/spark-2.3.1-bin-hadoop2.7"

export CLASSPATH="$SOFTWARE_HOME/bin:$CLASSPATH"

export MAVEN_OPTS="-Xmx8G -Xss8G -XX:ReservedCodeCacheSize=256m"

PATH="$PATH:$JAVA_HOME/bin"
PATH="$PATH:$SOFTWARE_HOME/resin"
PATH="$PATH:$SOFTWARE_HOME/bin"

alias main="cd \"\$PROJECTS_DIR/main\""
alias pt="cd \"\$PROJECTS_DIR/program-terms\""

if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

### END OF `setup-machine.sh` CHANGES ###

alias mci='mvn clean install -T 1C -Ddelta.skip=true -Dqunit.numThreads=8'
alias qb='mvn clean install -T 1C -Ddelta.skip=true -Dcleanup.skip=true -Dqunit.numThreads=8 -DskipTests -Dtablespaces.skip=true -Dgulp.task=min'
alias qqb='mvn install -T 1C -Ddelta.skip=true -Dcleanup.skip=true -Dqunit.numThreads=8 -DskipTests -Dtablespaces.skip=true -Dgulp.task=min'
alias qqqb='mvn install -T 1C -Ddelta.skip=true -Dcleanup.skip=true -Dqunit.numThreads=8 -DskipTests -Dtablespaces.skip=true -Dgulp.task=min -Dmaven.test.skip=true'
alias ll='ls -la'

