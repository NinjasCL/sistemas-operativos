import commands

# Establece el estado inicial
def init():
    state = {}

    # Iniciamos los comandos internos
    state = commands.init(state)

    return state

# Construye el pipeline a partir de los comandos del parser
def build(state, items):

    # Almacenamos el pipeline
    pipeline = None

    # TODO: Implementar
    for item in items:
        pass

# Ejecutamos el pipeline
def run(state, pipeline):

    # TODO: Implementar
    if pipeline:
      pass

    return state
