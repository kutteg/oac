namespace: OaC.Qotd
flow:
  name: qotd_install
  workflow:
    - ssh_command:
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
          05d14c41-45ce-bffe-a167-c562e243e182:
            targetId: bdecb05c-8c3d-c1fd-4529-f181547e718e
            port: SUCCESS
    results:
      SUCCESS:
        bdecb05c-8c3d-c1fd-4529-f181547e718e:
          x: 1000
          'y': 150
