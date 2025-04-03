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
