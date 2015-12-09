#!/bin/bash
#
# chkconfig: 345 99 28
# description: Starts/Stops Cubes
#
# Cubes start/stop/status script
#
#Location of CUBES_HOME (bin files)
export CUBES_HOME=/app/cubes

#CUBES_HOME is the default user of tomcat
export CUBES_USER=middleware


cubes_pid() {
        echo `ps -ef | grep 'slicer serve' | grep -v grep | tr -s " "|cut -d" " -f3`
        #ps aux|grep 'slicer serve'|grep -v grep|awk  '{print $2}'|xargs kill -9
}

start() {
  pid=$(cubes_pid)
  if [ -n "$pid" ]
  then
    echo -e "\e[00;31mCubes is already running (pid: $pid)\e[00m"
  else
    # Start cubes
    echo -e "\e[00;32mStarting cubes\e[00m"
    #ulimit -n 100000
    #umask 007
    #/bin/su -p -s /bin/sh middleware
        if [ `user_exists $CUBES_USER` = "1" ]
        then
                su $CUBES_USER -c $CUBES_HOME/bin/start.sh
        else
                sh $CUBES_HOME/bin/start.sh
        fi
        status
  fi
  return 0
}

status(){
          pid=$(cubes_pid)
          if [ -n "$pid" ]; then echo -e "\e[00;32mCubes is running with pid: $pid\e[00m"
          else echo -e "\e[00;31mCubes is not running\e[00m"
          fi
}

stop() {
  pid=$(cubes_pid)
  if [ -n "$pid" ]
  then
    echo -e "\e[00;31mStoping cubes\e[00m"
    #/bin/su -p -s /bin/sh cubes
    su $CUBES_USER -c $CUBES_HOME/bin/stop.sh
  else
    echo -e "\e[00;31mCubes is not running\e[00m"
  fi

  return 0
}

user_exists(){
        if id -u $1 >/dev/null 2>&1; then
        echo "1"
        else
                echo "0"
        fi
}

case $1 in

        start)
          start
        ;;

        stop)
          stop
        ;;

        restart)
          stop
          start
        ;;

        status)
                status

        ;;
esac
exit 0
