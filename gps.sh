#!/bin/bash
case $1 in
    1)
        if [ -z $2 ];then
            echo "normal launch"
            roslaunch gps_agent_pkg pr2_gazebo.launch
        elif [ $2 = "-m" ];then
            echo "launch modified version"
            roslaunch gps_agent_pkg pr2_gazebo_modified.launch
        fi
        ;;
    2)
        if [ -z $2 ];then
            echo "run training"
            python /data/gps/python/gps/gps_main.py \
            pr2_example
        elif [ $2 = "-t" ];then
            echo "target setup"
            python /data/gps/python/gps/gps_main.py \
            pr2_example -t
        fi
        ;;
    3)
        echo "keyboard control"
        roslaunch pr2_teleop_general pr2_teleop_general_keyboard.launch
        ;;
    *)
        echo -e "\033[31merror\033[0m"
        exit
esac

echo -e "\033[32mfinish\033[0m"