#!/usr/bin/python3

import subprocess
import sys


def run_commands(commands):
    for command in commands:
        process = subprocess.Popen(command, shell=True)
        process.wait()


if __name__ == '__main__':
    install_dependencies = False
    if len(sys.argv) > 1 and sys.argv[1] == '--install':
        install_dependencies = True

    commands = []
    if install_dependencies:
        commands.append('cargo install stylua')
        commands.append('sudo luarocks install luacheck')
        commands.append('sudo luarocks install vusted')

    commands.append('stylua . -f ./stylua.toml')
    commands.append('vusted ./tests')

    run_commands(commands)
