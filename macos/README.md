# MacOS dotfiles

Bootstrap MacOS configuration

```bash
sh install.sh -af

# Fix a Docker issue that affects Lazydocker configuration
sudo ln -s "$HOME/.docker/run/docker.sock" /var/run/docker.sock
```
