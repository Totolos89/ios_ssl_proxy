all:
	rm -f proxy2.c
	cython proxy2.py --embed
	gcc proxy2.c -I/usr/include/python2.7 -L /usr/lib/python2.7/config-x86_64-linux-gnu -lpython2.7 -o proxy2

clean:
	rm -f proxy2 proxy2.c


copy:
	plistutil -i com.nablac0d3.SSLKillSwitchSettings.plist -o com.nablac0d3.SSLKillSwitchSettings.plist
	sshpass -p alpine scp com.nablac0d3.SSLKillSwitchSettings.plist root@192.168.1.69:/private/var/mobile/Library/Preferences/com.nablac0d3.SSLKillSwitchSettings.plist 
