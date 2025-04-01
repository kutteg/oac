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
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      ssh_command:
        x: 160
        'y': 240
      ssh_command_1:
        x: 400
        'y': 240
        navigate:
          c2be1648-2b3f-38be-c379-c526bd36ac13:
            targetId: aafd50a9-e1ee-6e42-76aa-b611c87a388f
            port: SUCCESS
    results:
      SUCCESS:
        aafd50a9-e1ee-6e42-76aa-b611c87a388f:
          x: 640
          'y': 240
