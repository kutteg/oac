namespace: OaC.Qotd
flow:
  name: qotd_install
  workflow:
    - ssh_command:
        do:
          OaC.Qotd.Mod.ssh_command:
            - host: host
            - port: port
            - command: command
            - username: username
            - password:
                value: password
                sensitive: true
        navigate:
          - SUCCESS: ssh_command_1
          - FAILURE: on_failure
    - ssh_command_1:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: ssh_command_2
          - FAILURE: on_failure
    - ssh_command_2:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: ssh_command_3
          - FAILURE: on_failure
    - ssh_command_3:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: ssh_command_4
          - FAILURE: on_failure
    - ssh_command_4:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
results:
    - SUCCESS
    - FAILURE
