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
    - aks_create:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: acr_register
          - FAILURE: on_failure
    - acr_register:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: image_deploy
          - FAILURE: on_failure
    - image_deploy:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: app_details_get
          - FAILURE: on_failure
    - azure_login:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: aks_create
          - FAILURE: on_failure
    - app_details_get:
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
        x: 80
        'y': 160
      git_clone:
        x: 280
        'y': 160
      acr_register:
        x: 880
        'y': 160
      aks_create:
        x: 680
        'y': 160
      image_deploy:
        x: 880
        'y': 360
      azure_login:
        x: 480
        'y': 160
      app_details_get:
        x: 680
        'y': 360
        navigate:
          3f206c6b-4df1-d83e-976c-112feeeb0b00:
            targetId: 84aea917-2962-dcd3-50f4-8a2dff37f86a
            port: SUCCESS
    results:
      SUCCESS:
        84aea917-2962-dcd3-50f4-8a2dff37f86a:
          x: 480
          'y': 360
