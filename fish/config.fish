set JAVA_8_HOME '/usr/libexec/java_home -v1.8'
set JAVA_APPLE_HOME '/usr/libexec/java_home -v 11.0.4'
set JAVA_HOME $JAVA_APPLE_HOME
function java8 --description 'Switch java version to java8'
    set JAVA_HOME $JAVA_8_HOME
end
function javaApple --description 'Switch java version to Apple JDK'
    set JAVA_HOME $JAVA_APPLE_HOME
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/jbogle/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

