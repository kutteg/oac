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
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      ssh_jumphost_logim:
        x: 100
        'y': 150
      git_clone:
        x: 400
        'y': 150
        navigate:
          5819e2ae-b2d4-a972-760a-91706ab2186f:
            targetId: fc9a6e84-5db1-fd1d-b628-55fd8c505bb0
            port: SUCCESS
    results:
      SUCCESS:
        fc9a6e84-5db1-fd1d-b628-55fd8c505bb0:
          x: 700
          'y': 150
