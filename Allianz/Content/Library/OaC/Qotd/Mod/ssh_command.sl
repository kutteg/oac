########################################################################################################################
#!!
#! @input host: Hostname or IP address.
#! @input port: Port number for running the command.
#!              Default: '22'
#!              Optional
#! @input command: Command to execute.
#! @input username: Username to connect as.
#! @input password: Password of user.
#!                  Optional
#!!#
########################################################################################################################
namespace: OaC.Qotd.Mod
flow:
  name: ssh_command
  inputs:
    - host: localhost
    - port: '22'
    - command: ls
    - username: azureuser
    - password:
        default: xxx
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
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      ssh_command:
        x: 360
        'y': 320
        navigate:
          b81ada0b-625e-4c03-e375-27566ca635e4:
            targetId: 314f8234-b2c2-39e1-b816-2b076d39af66
            port: SUCCESS
    results:
      SUCCESS:
        314f8234-b2c2-39e1-b816-2b076d39af66:
          x: 800
          'y': 320
