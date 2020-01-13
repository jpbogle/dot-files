export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_APPLE_HOME=$(/usr/libexec/java_home -v11)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java9='export JAVA_HOME=$JAVA_APPLE_HOME'

#default javaApple
export JAVA_HOME=$JAVA_APPLE_HOME

export ANT_OPTS=-Xmx2048m;                # Helps avoid ant out-of-memory errors
export MAVEN_OPTS=-Xmx4g;                 # Helps avoid Maven out-of-memory errors

#Add jingle scripts directory to path for easier execution on the command line  
export PATH=$HOME/jingle/scripts:$HOME/jingle/Jingle/tools/run:$HOME/jingle/Jingle/tools/iTunes:$PATH;

# use this to specify your remote user for scripts such as mic and updateCaches.sh
export REMOTE_USER="jbogle"

ulimit -n 65536
ulimit -u 2500
