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
        x: 200
        'y': 280
      ssh_command_1:
        x: 480
        'y': 280
        navigate:
          7379012b-b92f-11f9-e565-876f5c84f58b:
            targetId: b4b2b981-dabc-7ca2-148b-1d763801d1df
            port: SUCCESS
    results:
      SUCCESS:
        b4b2b981-dabc-7ca2-148b-1d763801d1df:
          x: 800
          'y': 280
