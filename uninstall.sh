# shellcheck disable=SC2148
# shellcheck disable=SC1091
. script/common.sh >&/dev/null
. script/clashctl.sh >&/dev/null

_valid_env

clashoff >&/dev/null

systemctl --user disable "$BIN_KERNEL_NAME" >&/dev/null
rm -f "$HOME/.config/systemd/user/${BIN_KERNEL_NAME}.service"
systemctl --user daemon-reload

rm -rf "$CLASH_BASE_DIR"
rm -rf "$RESOURCES_BIN_DIR"
(crontab -l 2>/dev/null | grep -v 'clashupdate') | crontab - 2>/dev/null
_set_rc unset

_okcat '✨' '已卸载，相关配置已清除'
_quit
