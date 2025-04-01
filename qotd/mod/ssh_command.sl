namespace: qotd
flow:
  name: ssh_command
  inputs:
    - host: nbksbipfl4e9tim7.myfritz.net
    - port: '2002'
    - command: ls
    - username: pi
    - password:
        default: ********
        sensitive: true
  workflow:
    - ssh_command:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${host}'
            - port: '${port}'
            - command: '${command}'
            - username: '${username}'
            - password:
                value: '${password}'
                sensitive: true
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS