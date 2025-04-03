namespace: OaC.Qotd.Mod
flow:
  name: test
  workflow:
    - ssh_command:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: localhost
            - command: ls
            - username: user
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      ssh_command:
        x: 320
        'y': 200
        navigate:
          bea1b0fa-40be-f7a0-95a4-3900c4e044b3:
            targetId: 720d74dd-8dcf-323d-5dfd-42ed02080a2a
            port: SUCCESS
    results:
      SUCCESS:
        720d74dd-8dcf-323d-5dfd-42ed02080a2a:
          x: 560
          'y': 200
