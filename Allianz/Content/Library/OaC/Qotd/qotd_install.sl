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
        navigate:
          61fcb6c2-0fae-109f-b3c0-4878c8515dbb:
            targetId: 2a617b68-5355-09d1-cc7d-396cd4ce7137
            port: SUCCESS
    results:
      SUCCESS:
        2a617b68-5355-09d1-cc7d-396cd4ce7137:
          x: 360
          'y': 160
