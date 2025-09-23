#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import parser
import pipeline

def main(state):
    try:
        stdin = input("$ ➜ ")
    except KeyboardInterrupt:
        sys.exit(0)

    # Obtenemos los comandos dentro del pipeline
    state, commands = parser.parse(state, stdin)
    
    # Se construye y ejecuta el pipeline
    state, pipes = pipeline.build(state, commands)
    state = pipeline.run(state, pipes)
    
    # Volvemos a ejecutar todo de nuevo y solicitar otro pipeline
    # Mantenemos el estado durante toda la ejecución de la shell
    main(state)

if __name__ == "__main__":
    print("Minishell v1.0.0")
    main(pipeline.init())