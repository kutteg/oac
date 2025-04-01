namespace: OaC.Qotd
flow:
  name: qotd_install
  workflow:
    - first_command:
        do:
          OaC.Qotd.Mod.ssh_command:
            - host: '1111'
            - port: '2222'
            - command: '3333'
            - username: '4444'
            - password:
                value: '5555'
                sensitive: true
        navigate:
          - SUCCESS: ssh_command_1
          - FAILURE: on_failure
    - second_command:
        do:
          OaC.Qotd.Mod.ssh_command_1: []
            - host: '1111'
            - port: '2222'
            - command: '3333'
            - username: '4444'
            - password:
                value: '5555'
                sensitive: true
        navigate:
          - SUCCESS: ssh_command_2
          - FAILURE: on_failure
    - third_command:
        do:
          OaC.Qotd.Mod.ssh_command_2: []
            - host: '1111'
            - port: '2222'
            - command: '3333'
            - username: '4444'
            - password:
                value: '5555'
                sensitive: true
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
