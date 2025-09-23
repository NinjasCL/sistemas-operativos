from . import exitcmd

import subprocess

ARGUMENT_TYPE_NORMAL = "normal"
ARGUMENT_TYPE_STDOUT = "out"
ARGUMENT_TYPE_STDIN = "in"
ARGUMENT_TYPE_STDERR = "error"

BUILT_IN = {
    "exit": exitcmd.run,
}

# Iniciamos el estado que necesitan los comandos internos
def init(state):
    state = exitcmd.init(state)
    return state


# Funciones que construyen un pipe
# https://docs.python.org/3/library/subprocess.html
# https://realpython.com/python-subprocess/
# https://www.codecademy.com/article/python-subprocess-tutorial-master-run-and-popen-commands-with-examples


# Construye el comando segun el pipeline
def build(state, item, pipeline = None):
    # TODO: Implementar
    pass
