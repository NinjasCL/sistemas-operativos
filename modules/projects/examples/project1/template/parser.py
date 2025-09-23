import os

PIPE = "|"
BACKGROUND = "&"
REDIRECT_TO_STDOUT = ">"
REDIRECT_TO_STDIN = "<"
REDIRECT_TO_STDERR = "2>"

ARGUMENT_TYPE_NORMAL = "normal"
ARGUMENT_TYPE_STDOUT = "out"
ARGUMENT_TYPE_STDIN = "in"
ARGUMENT_TYPE_STDERR = "error"

def argument_builder(state, items):
    # Asumimos que el comando no tiene redirección
    type = ARGUMENT_TYPE_NORMAL
    raw = list(map(lambda item: item.strip(), items))
    file = ""
    content = " ".join(raw).strip()
    split = None

    # Detectamos que tipo de redireccion tiene
    # y llenamos el contenido respectivo
    # y su archivo

    if REDIRECT_TO_STDIN in items:
        type = ARGUMENT_TYPE_STDIN
        split = REDIRECT_TO_STDIN
        
    if REDIRECT_TO_STDOUT in items:
        type = ARGUMENT_TYPE_STDOUT
        split = REDIRECT_TO_STDOUT

    if REDIRECT_TO_STDERR in items:
        type = ARGUMENT_TYPE_STDERR
        split = REDIRECT_TO_STDERR
    
    if type != ARGUMENT_TYPE_NORMAL:
        split = content.split(split)
        raw = list(map(lambda item: item.strip(), split[:-1]))
        content = " ".join(raw).strip()
        file = "".join(split[1:]).strip()

        if file.startswith("./") or not file.startswith("/"):
            file = os.path.abspath(os.path.join(state.get("cwd"), file))
    
    result = {
        "raw": raw,
        "type": type,
        "content": content,
        "file": file
    }

    return result


def command_builder(state, item):
    # Creamos un constructor de comandos
    # El nombre del comando es el primer elemento del arreglo
    # Los argumentos deben ser procesados por la funcion apropiada
    name = item[0].strip()
    in_background = item[-1] == BACKGROUND

    # Aseguramos eliminar el & al final si esta presente
    params = item[1:]
    if in_background:
        params = item[1:-1]

    args = argument_builder(state, params)

    # Construimos la variable que almacenara el comando a ejecutar
    run = [name] + args["raw"] 

    result = {
        "raw": item,
        "name": name,
        "run": run,
        "args": args,
        "in_background": in_background
    }

    return result

def parse(state, string):
    # Obtenemos los comandos del pipeline
    items = string.strip().split(PIPE)

    # Eliminamos los espacios en cada comando, le damos una prioridad
    # Y separamos cada comando en sus componentes con espacio
    pipeline = [
        {   
            "sort": index,
            "command": command_builder(state, item.strip().split())
        } for index, item in enumerate(items)
    ]

    # Retornamos el pipeline a ejecutar
    return (state, pipeline)