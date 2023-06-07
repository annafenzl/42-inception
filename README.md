Read about PID 1 and the best practices for writing Dockerfiles.

connecting to VM via virtual studio code:
>> ssh -p 2223 afenzl@localhost

accessing the shared folder:
>>sudo mount -t vboxsf inception shared
(apperently you can automate this by adding it to /etc/fstab)
(or sudo nano /etc/systemd/system/mount-sharedfolders.service)
{
	[Unit]
	Description=Mount VirtualBox Shared Folders
	After=network.target

	[Service]
	Type=oneshot
	ExecStart=/usr/bin/mount -t vboxsf -o uid=1000,gid=1000 inception home/afenzl/Shared


	[Install]
	WantedBy=default.target
}

find out how to access the domain:
nano /etc/hosts --> adding <IP_address>    <domain_name>
getting ip ip addr show --> 10.0.2.15(accessing it from inside the VM)

DONE:
ssh connection
install docker
shared folders
access domain
Volumes
how to test them
get wordpress website

TO DO:
test them