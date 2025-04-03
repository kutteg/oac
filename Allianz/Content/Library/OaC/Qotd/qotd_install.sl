results:
  - SUCCESS
  - FAILURE
namespace: OaC.Qotd
flow:
  name: qotd_install
  workflow:
    - ssh_jumphost_logim:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: git_clone
          - FAILURE: on_failure
    - git_clone:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: azure_login
          - FAILURE: on_failure
    - azure_login:
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
      git_clone:
        x: 400
        'y': 160
      ssh_jumphost_logim:
        x: 160
        'y': 160
      azure_login:
        x: 640
        'y': 160
        navigate:
          066977e7-15e4-c53a-ae8f-bd2307c73e0c:
            targetId: c688ba64-0105-0f43-c448-4171406717d2
            port: SUCCESS
    results:
      SUCCESS:
        c688ba64-0105-0f43-c448-4171406717d2:
          x: 840
          'y': 160
