# Name: Install Adobe flash plugin
# Command: install_flash
# Value: False

install_flash() {
show_func "Installing Adobe flash plugin"
if [[ "$(install_flash_test)" = "Installed" ]]; then
	show_status "Adobe flash plugin already installed"
else
	if [[ "$arch" = "32" ]]; then
		add_repo "adobe-linux-i386.repo"
	elif [[ "$arch" = "64" ]]; then
		add_repo "adobe-linux-x86_64.repo"
	fi
	install_pkg flash-plugin
fi
[[ "$(install_flash_test)" = "Installed" ]]; exit_state
}

install_flash_test() {
ls /usr/lib*/mozilla/plugins/libflashplayer.so > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
	printf "Installed"
else
	printf "Not installed"
fi
}
