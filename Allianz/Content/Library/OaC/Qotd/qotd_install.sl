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
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      ssh_command:
        x: 100
        'y': 150
      ssh_command_1:
        x: 400
        'y': 150
      ssh_command_2:
        x: 700
        'y': 150
        navigate:
          c408dfab-171d-b11c-1a8c-ed4aa13f83d4:
            targetId: e5b49f90-5b83-6080-f48f-6cc951543ea1
            port: SUCCESS
    results:
      SUCCESS:
        e5b49f90-5b83-6080-f48f-6cc951543ea1:
          x: 1000
          'y': 150
