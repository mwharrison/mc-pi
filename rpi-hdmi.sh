#!/bin/sh

#Enable and disable HDMI

hdmi_status ()
{
            vcgencmd display_power | grep "display_power=0" >/dev/null
}

case $1 in
            on)
                        vcgencmd display_power 1 | grep "display_power=1" >/dev/null
                        echo "Display and HDMI have been turned on by user."
            ;;
            off)
                        vcgencmd display_power 0 | grep "display_power=0" >/dev/null
                        echo "Display and HDMI have been turned off by user."
            ;;
            status)
if hdmi_status
then
echo "The HDMI port is OFF"
else
echo "The HDMI port is ON"
fi

            ;;
*)
echo "Usage: $0 on|off|status" >&2
exit 2
            ;;
esac

exit 0
