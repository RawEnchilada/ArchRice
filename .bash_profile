#export MOZ_USE_XINPUT2=1

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq  1 ]; then
#	exec startx
#fi
exec startx
