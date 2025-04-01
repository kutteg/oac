namespace: OaC.Qotd
flow:
  name: qotd_install
  workflow:
    - ssh_command:
        do:
          OaC.Qotd.Mod.ssh_command: []
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
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
