# play-ansible

use ansible build consistency dev environment.

# 使用方式

- clone 项目到本地
- 执行 `bash ./install.sh`
- 执行 `ansible-playbook multipass.yml`

# tips

如果修改默认 shell 未生效, 可手动执行 `sudo chsh -s "$(which zsh)" "$(whoami)"`

# 幂等性
